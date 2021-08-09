@Echo off
:: ~~~ Data Backup Script ~~~

:: ~~~ To Do List ~~~




:: ~~~ Script Starts Here

Echo =======================================================
Echo ------------------ Data Backup Script -----------------
Echo =======================================================
Echo.
Echo This script will backup user data to an external device.
Echo.
Echo The directory this script exists in will be the backup directory.
Echo.
Echo Listed below are the directories that will be backed up.
Echo.
Echo Contacts
Echo Desktop
Echo Documents
Echo Downloads
Echo Favorites
Echo Links
Echo Music
Echo Pictures
Echo Searches
Echo Videos
Echo.
Echo ~ AppData\Local ~
Echo.
Echo Google
Echo Mozilla
Echo.
Echo ~ AppData\Roaming ~
Echo.
Echo Google
Echo Mozilla
Echo Microsoft\Document Building Blocks
Echo Microsoft\Crypto
Echo Microsoft\Proof
Echo Microsoft\Protect
Echo Microsoft\Signatures
Echo Microsoft\Stationery
Echo Microsoft\SystemCertificates
Echo Microsoft\UProof
Echo.
Echo Press Enter to Continue the Script...
pause>nul

:: ~~~ Check for Administrative Rights ~~~

openfiles>nul 2>&1
if %errorlevel% EQU 0 goto scriptbegin

Echo.
Echo This script does not have Administrative Rights.
Echo Please rerun this script as an Administrator.
Echo.
Echo Press Enter to close the script...
pause>nul
exit


:scriptbegin

Set /P drivetarget=Please designate the target Drive Letter:

Echo Displaying list of User Profiles on target...
Echo.

cd /d %drivetarget%:\Users
dir

Set /P selectuser=Please input the username you would like to backup.:

Echo The script will backup data for the following directory
Echo %drivetarget%:\Users\%selectuser%\
Echo.
Set /P confirmsu=Is this correct? [Y/N]:

IF /I "%confirmsu%" EQU "N" call scriptbegin

:setvalues

:: ~~~ Variable Registry ~~~

:: ~ Directories ~
Set Contacts=%drivetarget%:\Users\%selectuser%\Contacts
Set Desktop=%drivetarget%:\Users\%selectuser%\Desktop
Set Documents=%drivetarget%:\Users\%selectuser%\Documents
Set Downloads=%drivetarget%:\Users\%selectuser%\Downloads
Set Favorites=%drivetarget%:\Users\%selectuser%\Favorites
Set Links=%drivetarget%:\Users\%selectuser%\Links
Set Music=%drivetarget%:\Users\%selectuser%\Music
Set Pictures=%drivetarget%:\Users\%selectuser%\Pictures
Set Searches=%drivetarget%:\Users\%selectuser%\Searches
Set Videos=%drivetarget%:\Users\%selectuser%\Videos

:: ~ Appdata Directories ~

:: Local
Set ADLGoogle=%drivetarget%:\Users\%selectuser%\AppData\Local\Google
Set ADLFirefox=%drivetarget%:\Users\%selectuser%\AppData\Local\Mozilla

:: Roaming
Set ADRGoogle=%drivetarget%:\Users\%selectuser%\AppData\Roaming\Google
Set ADRFirefox=%drivetarget%:\Users\%selectuser%\AppData\Roaming\Mozilla
Set ADRMDBB=%drivetarget%:\Users\%selectuser%\AppData\Roaming\Microsoft\"Document Building Blocks"
Set ADRMCrypto=%drivetarget%:\Users\%selectuser%\AppData\Roaming\Microsoft\Crypto
Set ADRMProof=%drivetarget%:\Users\%selectuser%\AppData\Roaming\Microsoft\Proof
Set ADRMProtect=%drivetarget%:\Users\%selectuser%\AppData\Roaming\Microsoft\Protect
Set ADRMSignatures=%drivetarget%:\Users\%selectuser%\AppData\Roaming\Microsoft\Signatures
Set ADRMStationery=%drivetarget%:\Users\%selectuser%\AppData\Roaming\Microsoft\Stationery
Set ADRMSysCert=%drivetarget%:\Users\%selectuser%\AppData\Roaming\Microsoft\SystemCertificates
Set ARMUProof=%drivetarget%:\Users\%selectuser%\AppData\Roaming\Microsoft\UProof


:Xcopybegin

Echo Backing up User Data for %selectuser%...

:: ~~~ Backup Data in %drivetarget%:\Users\[username]\ ~~~

Echo Backing up Contacts...
mkdir %~dp0\BackupData\%selectuser%\Contacts
Xcopy %Contacts% %~dp0\BackupData\%selectuser%\Contacts /s /e /h

Echo Backup up Desktop...
mkdir %~dp0\BackupData\%selectuser%\Desktop
Xcopy %Desktop% %~dp0\BackupData\%selectuser%\Desktop /s /e /h

Echo Backing up Documents...
mkdir %~dp0\BackupData\%selectuser%\Documents
Xcopy %Documents% %~dp0\BackupData\%selectuser%\Documents /s /e /h

Echo Backing up Downloads...
mkdir %~dp0\BackupData\%selectuser%\Downloads
Xcopy %Downloads% %~dp0\BackupData\%selectuser%\Downloads /s /e /h

Echo Backing up Favorites...
mkdir %~dp0\BackupData\%selectuser%\Favorites
Xcopy %Favorites% %~dp0\BackupData\%selectuser%\Favorites /s /e /h

Echo Backing up Links...
mkdir %~dp0\BackupData\%selectuser%\Links
Xcopy %Links% %~dp0\BackupData\%selectuser%\Links /s /e /h

Echo Backing up Music...
mkdir %~dp0\BackupData\%selectuser%\Music
Xcopy %Music% %~dp0\BackupData\%selectuser%\Music /s /e /h

Echo Backing up Pictures...
mkdir %~dp0\BackupData\%selectuser%\Pictures
Xcopy %Pictures% %~dp0\BackupData\%selectuser%\Pictures /s /e /h

Echo Backing up Searches...
mkdir %~dp0\BackupData\%selectuser%\Searches
Xcopy %Searches% %~dp0\BackupData\%selectuser%\Searches /s /e /h

Echo Backing up Videos...
mkdir %~dp0\BackupData\%selectuser%\Videos
Xcopy %Videos% %~dp0\BackupData\%selectuser%\Videos /s /e /h

:: ~~~ Backup Data in AppData\Local\ ~~~

Echo Backing up AppData\Local\Google...
mkdir %~dp0\BackupData\%selectuser%\AppData\Local\Google
Xcopy %ADLGoogle% %~dp0\BackupData\%selectuser%\AppData\Local\Google /s /e /h

Echo Backing up AppData\Local\Mozilla...
mkdir %~dp0\BackupData\%selectuser%\AppData\Local\Mozilla
Xcopy %ADLFirefox% %~dp0\BackupData\%selectuser%\AppData\Local\Mozilla /s /e /h

:: ~~~ Backup Data in AppData\Roaming ~~~

Echo Backing up Appdata\Roaming\Google...
mkdir %~dp0\BackupData\%selectuser%\AppData\Roaming\Google
Xcopy %ADRGoogle% %~dp0\BackupData\%selectuser%\AppData\Roaming\Google /s /e /h

Echo Backing up AppData\Roaming\Mozilla...
mkdir %~dp0\BackupData\%selectuser%\AppData\Roaming\Mozilla
Xcopy %ADRFirefox% %~dp0\BackupData\%selectuser%\AppData\Roaming\Mozilla /s /e /h

:: ~~~ Backup Data in AppData\Roaming\Microsoft ~~~

Echo Backing up Microsoft Office User Data...

mkdir %~dp0\BackupData\%selectuser%\AppData\Roaming\Microsoft\"Document Building Blocks"
Xcopy %ADRMDBB% %~dp0\BackupData\%selectuser%\AppData\Roaming\Microsoft\"Document Building Blocks" /s /e /h
mkdir %~dp0\BackupData\%selectuser%\AppData\Roaming\Microsoft\Crypto
Xcopy %ADRMCrypto% %~dp0\BackupData\%selectuser%\AppData\Roaming\Microsoft\Crypto /s /e /h
mkdir %~dp0\BackupData\%selectuser%\AppData\Roaming\Microsoft\Proof
Xcopy %ADRMProof% %~dp0\BackupData\%selectuser%\AppData\Roaming\Microsoft\Proof /s /e /h
mkdir %~dp0\BackupData\%selectuser%\AppData\Roaming\Microsoft\Protect
Xcopy %ADRMProtect% %~dp0\BackupData\%selectuser%\AppData\Roaming\Microsoft\Protect /s /e /h
mkdir %~dp0\BackupData\%selectuser%\AppData\Roaming\Microsoft\Signatures
Xcopy %ADRMSignatures% %~dp0\BackupData\%selectuser%\AppData\Roaming\Microsoft\Signatures /s /e /h
mkdir %~dp0\BackupData\%selectuser%\AppData\Roaming\Microsoft\Stationery
Xcopy %ADRMStationery% %~dp0\BackupData\%selectuser%\AppData\Roaming\Microsoft\Stationery /s /e /h
mkdir %~dp0\BackupData\%selectuser%\AppData\Roaming\Microsoft\SystemCertificates
Xcopy %ADRMSysCert% %~dp0\BackupData\%selectuser%\AppData\Roaming\Microsoft\SystemCertificates /s /e /h
mkdir %~dp0\BackupData\%selectuser%\AppData\Roaming\Microsoft\UProof
Xcopy %ARMUProof% %~dp0\BackupData\%selectuser%\AppData\Roaming\Microsoft\UProof /s /e /h

Echo.
Echo BACKUP COMPLETE
Echo.

Set /P otheruser=Would you like to backup another user profile? [Y/N]:

If /I "%otheruser%" EQU "Y" goto scriptbegin

Echo.
Echo Operation has Completed.
Echo.
Echo Press Enter to Close the Script...
pause>nul
exit


