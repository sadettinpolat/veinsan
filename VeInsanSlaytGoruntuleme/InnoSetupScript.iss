; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
AppName=Ve �nsan Slayt G�r�nt�leme Arac�
AppVerName=Ve �nsan Slayt G�r�nt�leme Arac� 2.0
AppPublisher=Sadettin POLAT
AppPublisherURL=http://veinsan.googlecode.com/
AppSupportURL=http://veinsan.googlecode.com/
AppUpdatesURL=http://veinsan.googlecode.com/
DefaultDirName={pf}\Sadettin POLAT\Ve �nsan Slayt G�r�nt�leme Arac�
DefaultGroupName=Ve �nsan Slayt G�r�nt�leme Arac�
AllowNoIcons=yes
LicenseFile=Readme.txt
Compression=lzma
SolidCompression=yes

[Tasks]
Name: desktopicon; Description: {cm:CreateDesktopIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: quicklaunchicon; Description: {cm:CreateQuickLaunchIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked

[Files]
Source: visga.exe; DestDir: {app}; Flags: ignoreversion
Source: Readme.txt; DestDir: {app}; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[INI]
Filename: {app}\visga.url; Section: InternetShortcut; Key: URL; String: http://veinsan.googlecode.com/

[Icons]
Name: {group}\Ve �nsan Slayt G�r�nt�leme Arac�; Filename: {app}\visga.exe
Name: {group}\{cm:ProgramOnTheWeb,Ve �nsan Slayt G�r�nt�leme Arac�}; Filename: {app}\visga.url
Name: {group}\{cm:UninstallProgram,Ve �nsan Slayt G�r�nt�leme Arac�}; Filename: {uninstallexe}
Name: {userdesktop}\Ve �nsan Slayt G�r�nt�leme Arac�; Filename: {app}\visga.exe; Tasks: desktopicon
Name: {userappdata}\Microsoft\Internet Explorer\Quick Launch\Ve �nsan Slayt G�r�nt�leme Arac�; Filename: {app}\visga.exe; Tasks: quicklaunchicon

[Run]
Filename: {app}\visga.exe; Description: {cm:LaunchProgram,Ve �nsan Slayt G�r�nt�leme Arac�}; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: {app}\visga.url
