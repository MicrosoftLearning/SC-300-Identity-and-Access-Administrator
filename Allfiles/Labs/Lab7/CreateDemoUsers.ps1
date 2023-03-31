# %ForceElevation% = Yes
#Requires -RunAsAdministrator

[CmdletBinding()]
    Param
    (        	
	    [Parameter(Mandatory=$False)]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({(Test-Connection -ComputerName "$_" -Count 4 -Quiet) -and (Test-WSMAN -ComputerName "$_")})]	
        [String]$Server = "$($Env:Computername).$($Env:UserDnsDomain.ToLower())"
    )

#Clear The Screen
    Clear-Host

#Define Default Action Preferences
    $Global:DebugPreference = "SilentlyContinue"
    $Global:ErrorActionPreference = "Continue"
    $Global:VerbosePreference = "SilentlyContinue"
    $Global:WarningPreference = "Continue"
    $Global:ConfirmPreference = "None"
	
#Define ASCII Characters    
    $Equals = [Char]61
    $Space = [Char]32
    $SingleQuote = [Char]39
    $DoubleQuote = [Char]34
    $NewLine = "`n"

#Load WMI Classes
    $Bios = Get-WmiObject -Namespace "root\CIMv2" -Class "Win32_Bios" -Property * | Select *
    $ComputerSystem = Get-WmiObject -Namespace "root\CIMv2" -Class "Win32_ComputerSystem" -Property * | Select *
    $ComputerSystemProduct = Get-WmiObject -Namespace "root\CIMv2" -Class "Win32_ComputerSystemProduct" -Property * | Select *
    $LogicalDisk = Get-WmiObject -Namespace "root\CIMv2" -Class "Win32_LogicalDisk" -Property * | Select *
    $OperatingSystem = Get-WmiObject -Namespace "root\CIMv2" -Class "Win32_OperatingSystem" -Property * | Select *

#Retrieve property values
	$Make = $ComputerSystem.Manufacturer
    If ($Make -like "*Lenovo*") {$Model = $ComputerSystemProduct.Version} Else {$Model = $ComputerSystem.Model}
    $OSArchitecture = $($OperatingSystem.OSArchitecture).Replace("-bit", "").Replace("32", "86").Insert(0,"x").ToUpper()
    Try {$OSCaption = "{1} {2} {3}" -f $($OperatingSystem.Caption).Split(" ").Trim()} Catch {$OSCaption = "WindowsPE"}
    $OSVersion = [Version]$OperatingSystem.Version
    $OSVersionNumber = [Decimal]("{0}.{1}" -f $($OperatingSystem.Version).Split(".").Trim())
    $PSVersion = [Version]$PSVersionTable.PSVersion
    $OpticalDiskDriveLetter = $LogicalDisk | Where-Object {$_.DriveType -eq 5} | Select -First 1 -ExpandProperty DeviceID
    $SerialNumber = $Bios.SerialNumber.ToUpper()
    Try {([System.__ComObject]$TSEnvironment = New-Object -ComObject "Microsoft.SMS.TSEnvironment");($IsRunningTaskSequence = $True)} Catch {$IsRunningTaskSequence = $False}

#Set Path Variables  
    $ScriptDir = ($MyInvocation.MyCommand.Definition | Split-Path -Parent | Out-String).TrimEnd("\").Trim()
    $ScriptName = [System.IO.Path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Name)

#Define Functions
	#Encode a plain text string to a Base64 string
		Function ConvertTo-Base64 
	        { 
                [CmdletBinding(SupportsShouldProcess=$False)]
                    Param
                        (     
                            [Parameter(Mandatory=$True)]
                            [ValidateNotNullOrEmpty()]
                            [String]$String                        
                        )	            

                            $EncodedString = [System.Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($String))
	                        Write-Verbose -Message "$($NewLine)`"$($String)`" has been converted to the following Base64 encoded string `"$($EncodedString)`"$($NewLine)"
                    
                    Return $EncodedString
	        }	
		
    #Decode a Base64 string to a plain text string
	    Function ConvertFrom-Base64 
	        {  
                [CmdletBinding(SupportsShouldProcess=$False)]
                    Param
                        (     
                            [Parameter(Mandatory=$True)]
                            [ValidateNotNullOrEmpty()]
                            [ValidatePattern('^(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=|[A-Za-z0-9+/]{4})$')]
                            [String]$String                        
                        )
                
                        $DecodedString = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($String))
	                    Write-Verbose -Message "$($NewLine)`"$($String)`" has been converted from the following Base64 encoded string `"$($DecodedString)`"$($NewLine)"
                    
                    Return $DecodedString
	        }

#Start logging script output
    Start-Transcript -Path "$Temp\$ScriptName.log" -Force

#Write information to the screen
    Write-Host "$($NewLine)"
    Write-Host "User = $($ComputerSystem.UserName)" -BackgroundColor Black -ForegroundColor Cyan
    Write-Host "Target Server = $($Server)" -BackgroundColor Black -ForegroundColor Cyan
    Write-Host "Manufacturer = $($Make)" -BackgroundColor Black -ForegroundColor Cyan
    Write-Host "Model = $($Model)" -BackgroundColor Black -ForegroundColor Cyan
    Write-Host "Operating System Architecture = $($OSArchitecture)" -BackgroundColor Black -ForegroundColor Cyan
    Write-Host "Operating System Caption = $($OSCaption)" -BackgroundColor Black -ForegroundColor Cyan
    Write-Host "Operating System Version = $($OperatingSystem.Version)" -BackgroundColor Black -ForegroundColor Cyan
    Write-Host "Powershell Version = $($PSVersion)" -BackgroundColor Black -ForegroundColor Cyan
    Write-Host "Script Directory = $($ScriptDir)" -BackgroundColor Black -ForegroundColor Cyan
    Write-Host "Script Name = $($ScriptName).ps1" -BackgroundColor Black -ForegroundColor Cyan
    Write-Host "Running Task Sequence = $($IsRunningTaskSequence)" -BackgroundColor Black -ForegroundColor Cyan
    Write-Host "$($NewLine)"
		
#Perform the following actions based on if a task sequence is running or not (This is a good place to set variables)
    If ($IsRunningTaskSequence -eq $True)
        {

        }
    ElseIf ($IsRunningTaskSequence -eq $False)
        {

        }

#Perform the following actions
    Import-Module -Name 'ActiveDirectory' -Force -NoClobber -ErrorAction Stop
    
    $Domain = Get-ADDomain -Server $Server
    
    $DomainDN = $Domain.DistinguishedName
    
    $Forest = $Domain.Forest

    $NetBiosNadme = $Domain.NetBiosName
    
    $ParentOUName = "Demo Accounts"
    
    If ((Get-ADOrganizationalUnit -Filter "Name -eq `"$ParentOUName`"" -Server $Server -ErrorAction SilentlyContinue))
        {
            Get-ADOrganizationalUnit -Filter "Name -eq `"$ParentOUName`"" -SearchScope SubTree -Server $Server | Set-ADObject -ProtectedFromAccidentalDeletion:$False -Server $Server -PassThru | Remove-ADOrganizationalUnit -Confirm:$True -Server $Server -Recursive -Verbose
            Write-Host ""
        }
    Else
        {
            Set-ADDefaultDomainPasswordPolicy $Forest -ComplexityEnabled $False -MaxPasswordAge "1000" -PasswordHistoryCount 0 -MinPasswordAge 0 -Server $Server
            
            New-ADOrganizationalUnit -Name $ParentOUName -Path $DomainDN -Verbose -Server $Server -ErrorAction Stop

            $ParentOU = Get-ADOrganizationalUnit -Filter "Name -eq `"$ParentOUName`"" -Server $Server

            $UserOU = New-ADOrganizationalUnit -Name "Users" -Path $ParentOU.DistinguishedName -Verbose -PassThru -Server $Server -ErrorAction Stop
            $GroupOU = New-ADOrganizationalUnit -Name "Groups" -Path $ParentOU.DistinguishedName -Verbose -PassThru -Server $Server -ErrorAction Stop
            $ServiceAccountOU = New-ADOrganizationalUnit -Name "Service Accounts" -Path $ParentOU.DistinguishedName -Verbose -PassThru -Server $Server -ErrorAction Stop
            $ServiceGroupOU = New-ADOrganizationalUnit -Name "Service Groups" -Path $ParentOU.DistinguishedName -Verbose -PassThru -Server $Server -ErrorAction Stop

            $UserCount = 1000 #Up to 2500 can be created
    
            $InitialPassword = "Password1" #Initial Password for all users
    
            $Company = "Contoso Computing, LLC."
    
            $Content = Import-CSV -Path "$($ScriptDir)\$($ScriptName).csv" -ErrorAction Stop | Get-Random -Count $UserCount | Sort-Object -Property State
    
            $Departments =  (
                              @{"Name" = "Accounting"; Positions = ("Manager", "Accountant", "Data Entry")},
                              @{"Name" = "Human Resources"; Positions = ("Manager", "Administrator", "Officer", "Coordinator")},
                              @{"Name" = "Sales"; Positions = ("Manager", "Representative", "Consultant", "Senior Vice President")},
                              @{"Name" = "Marketing"; Positions = ("Manager", "Coordinator", "Assistant", "Specialist")},
                              @{"Name" = "Engineering"; Positions = ("Manager", "Engineer", "Scientist")},
                              @{"Name" = "Consulting"; Positions = ("Manager", "Consultant")},
                              @{"Name" = "Information Technology"; Positions = ("Manager", "Engineer", "Technician")},
                              @{"Name" = "Planning"; Positions = ("Manager", "Engineer")},
                              @{"Name" = "Contracts"; Positions = ("Manager", "Coordinator", "Clerk")},
                              @{"Name" = "Purchasing"; Positions = ("Manager", "Coordinator", "Clerk", "Purchaser", "Senior Vice President")}
                            )
    
            $Users = $Content | Select-Object `
                @{Name="Name";Expression={"$($_.Surname), $($_.GivenName)"}},`
                @{Name="Description";Expression={"User account for $($_.GivenName) $($_.MiddleInitial). $($_.Surname)"}},`
                @{Name="SamAccountName"; Expression={"$($_.GivenName.ToCharArray()[0])$($_.MiddleInitial)$($_.Surname)"}},`
                @{Name="UserPrincipalName"; Expression={"$($_.GivenName.ToCharArray()[0])$($_.MiddleInitial)$($_.Surname)@$($Forest)"}},`
                @{Name="GivenName"; Expression={$_.GivenName}},`
                @{Name="Initials"; Expression={$_.MiddleInitial}},`
                @{Name="Surname"; Expression={$_.Surname}},`
                @{Name="DisplayName"; Expression={"$($_.GivenName) $($_.MiddleInitial). $($_.Surname)"}},`
                @{Name="City"; Expression={$_.City}},`
                @{Name="StreetAddress"; Expression={$_.StreetAddress}},`
                @{Name="State"; Expression={$_.State}},`
                @{Name="Country"; Expression={$_.Country}},`
                @{Name="PostalCode"; Expression={$_.ZipCode}},`
                @{Name="EmailAddress"; Expression={"$($_.GivenName.ToCharArray()[0])$($_.MiddleInitial)$($_.Surname)@$($Forest)"}},`
                @{Name="AccountPassword"; Expression={ (ConvertTo-SecureString -String $InitialPassword -AsPlainText -Force)}},`
                @{Name="OfficePhone"; Expression={$_.TelephoneNumber}},`
                @{Name="Company"; Expression={$Company}},`
                @{Name="Department"; Expression={$Departments[(Get-Random -Maximum $Departments.Count)].Item("Name") | Get-Random -Count 1}},`
                @{Name="Title"; Expression={$Departments[(Get-Random -Maximum $Departments.Count)].Item("Positions") | Get-Random -Count 1}},`
                @{Name="EmployeeID"; Expression={"$($_.Country)-$((Get-Random -Minimum 0 -Maximum 99999).ToString('000000'))"}},`
                @{Name="BirthDate"; Expression={$_.Birthday}},`
                @{Name="Gender"; Expression={"$($_.Gender.SubString(0,1).ToUpper())$($_.Gender.Substring(1).ToLower())"}},`
                @{Name="Enabled"; Expression={$True}},`
                @{Name="PasswordNeverExpires"; Expression={$True}}
         
            ForEach ($Department In $Departments.Name)
                {
                    $CreateADGroup = New-ADGroup -Name "$Department" -SamAccountName "$Department" -GroupCategory Security -GroupScope Global -Path $GroupOU.DistinguishedName -Description "Security Group for all $Department users" -Verbose -OtherAttributes @{"Mail"="$($Department.Replace(' ',''))@$($Forest)"} -Server $Server -PassThru
                    If ($Department -eq "Information Technology") {Add-ADGroupMember -Identity "Domain Admins" -Members $Department -Verbose -Server $Server}
                    If ($Department -ne "Information Technology") {Add-ADGroupMember -Identity "Domain Users" -Members $Department -Verbose -Server $Server}
                }

            Write-Host ""
    
            ForEach ($User In $Users)
                {
                    If (!(Get-ADOrganizationalUnit -Filter "Name -eq `"$($User.Country)`"" -SearchBase $UserOU.DistinguishedName -Server $Server -ErrorAction SilentlyContinue))
                        {
                            $CountryOU = New-ADOrganizationalUnit -Name $User.Country -Path $UserOU.DistinguishedName -Country $User.Country -Verbose -Server $Server -PassThru
                            Write-Host ""
                        }
                    Else
                        {
                            $CountryOU = Get-ADOrganizationalUnit -Filter "Name -eq `"$($User.Country)`"" -Server $Server
                        }
   
                    If (!(Get-ADOrganizationalUnit -Filter "Name -eq `"$($User.State)`"" -SearchBase $CountryOU.DistinguishedName -Server $Server -ErrorAction SilentlyContinue))
                        {
                            $StateOU = New-ADOrganizationalUnit -Name $User.State -Path $CountryOU.DistinguishedName -State $User.State -Country $User.Country -Verbose -Server $Server -PassThru
                            Write-Host ""
                        }
                    Else
                        {
                            $StateOU = Get-ADOrganizationalUnit -Filter "Name -eq `"$($User.State)`"" -Server $Server
                        }
               
                    $DestinationOU = Get-ADOrganizationalUnit -Filter "Name -eq `"$($User.State)`"" -SearchBase $CountryOU.DistinguishedName -Server $Server
    
                    $CreateADUser = $User | Select-Object -Property @{Name="Path"; Expression={$DestinationOU.DistinguishedName}}, * | New-ADUser -Verbose -Server $Server -PassThru
            
                    $AddADUserToGroup = Add-ADGroupMember -Identity $User.Department -Members $User.SamAccountName -Server $Server -Verbose

                    Write-Host ""
                }
            
            ForEach ($Department In $Departments.Name)
                {
                    $DepartmentManager = Get-ADUser -Filter {(Title -eq "Manager") -and (Department -eq $Department)} -Server $Server | Sort-Object | Select-Object -First 1
                    $SetDepartmentManager = Get-ADUser -Filter {(Department -eq $Department)} | Set-ADUser -Manager $DepartmentManager -Verbose
                }

            Write-Host ""
        }

#Stop logging script output 
    $($NewLine)
    Write-Warning -Message "Run `'$($ScriptName).ps1`' twice if nothing happens initially. This is due to the OU deletion confirmation prompt."
    Stop-Transcript
