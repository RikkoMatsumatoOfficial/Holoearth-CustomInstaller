; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Holoearth"
#define MyAppVersion "1.0"
#define MyAppPublisher "RepackByRikkoMatsumato"
#define MyAppExeName "Launcher.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{18C5E7B8-18AC-42F3-9719-551947FF66DB}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName=E:\Games\{#MyAppName}
UninstallDisplayIcon={app}\{#MyAppExeName}
; "ArchitecturesAllowed=x64compatible" specifies that Setup cannot run
; on anything but x64 and Windows 11 on Arm.
ArchitecturesAllowed=x64compatible
; "ArchitecturesInstallIn64BitMode=x64compatible" requests that the
; install be done in "64-bit mode" on x64 or Windows 11 on Arm,
; meaning it should use the native 64-bit Program Files directory and
; the 64-bit view of the registry.
ArchitecturesInstallIn64BitMode=x64compatible
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=C:\Users\ikop\Documents\BSD3Cl.txt
; Uncomment the following line to run in non administrative install mode (install for current user only).
;PrivilegesRequired=lowest
OutputBaseFilename=holoearthsetup
SetupIconFile=C:\Users\ikop\Documents\holoearthicon.ico
SolidCompression=yes
WizardStyle=modern
AlwaysRestart=yes
InfoBeforeFile=C:\PerfLogs\InformationBEFOREInstallation.txt
WizardSmallImageFile=holoEARTH_SmallImage.bmp
[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "korean"; MessagesFile: "compiler:Languages\Korean.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"

[Code]
function BASS_Init(device: Integer; freq, flags: DWORD; win: hwnd; CLSID: Integer): Boolean;
external 'BASS_Init@files:bass.dll stdcall';
 
function BASS_StreamCreateFile(mem: BOOL; f: PAnsiChar; offset1: DWORD; offset2: DWORD; length1: DWORD; length2: DWORD; flags: DWORD): DWORD;
external 'BASS_StreamCreateFile@files:bass.dll stdcall';
 
function BASS_Start(): Boolean;
external 'BASS_Start@files:bass.dll stdcall';
 
function BASS_ChannelPlay(handle: DWORD; restart: BOOL): Boolean;
external 'BASS_ChannelPlay@files:bass.dll stdcall';

function BASS_Stop(): Boolean;
external 'BASS_Stop@files:bass.dll stdcall';
 
function BASS_Free(): Boolean;
external 'BASS_Free@files:bass.dll stdcall';
const
  BASS_SAMPLE_LOOP = 4;
var
  mp3Handle: HWND;
  mp3Name: string;
procedure InitializeWizard();
begin
    ExtractTemporaryFile('TheEmineniceOfShadowMOG.mp3');
    ExtractTemporaryFile('dotnet-sdk-8.0.406-win-x64.exe');
    ExtractTemporaryFile('NDP48-x86-x64-AllOS-ENU.exe');
    ExtractTemporaryFile('VisualCppRedist_AIO_x86_x64.exe');
    ExtractTemporaryFile('dxwebsetup.exe');
    mp3Name := ExpandConstant('{tmp}\TheEmineniceOfShadowMOG.mp3');
    BASS_Init(-1, 48000, 0, 0, 0);
    mp3Handle := BASS_StreamCreateFile(FALSE, PAnsiChar(mp3Name), 0, 0, 0, 0, BASS_SAMPLE_LOOP);
    BASS_Start();
    BASS_ChannelPlay(mp3Handle, False);
end;
procedure DeinitializeSetup();
begin
  BASS_Free();
  BASS_Stop();
end;

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "TheEmineniceOfShadowMOG.mp3"; DestDir: "{tmp}"; Flags: dontcopy ignoreversion deleteafterinstall
Source: "dotnet-sdk-8.0.406-win-x64.exe"; DestDir: "{tmp}"; Flags: dontcopy ignoreversion deleteafterinstall
Source: "NDP48-x86-x64-AllOS-ENU.exe"; DestDir: "{tmp}"; Flags: dontcopy ignoreversion deleteafterinstall
Source: "VisualCppRedist_AIO_x86_x64.exe"; DestDir: "{tmp}"; Flags: dontcopy ignoreversion deleteafterinstall
Source: "dxwebsetup.exe"; DestDir: "{tmp}"; Flags: dontcopy ignoreversion deleteafterinstall
Source: "C:\Include_DLLInnoSetup\bass.dll"; DestDir: {tmp}; Flags: dontcopy ignoreversion deleteafterinstall
Source: "E:\COVER corp\Holoearth Launcher\{#MyAppExeName}"; DestDir: "{app}"; Flags: dontcopy ignoreversion
Source: "E:\COVER corp\Holoearth Launcher\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{tmp}\VisualCppRedist_AIO_x86_x64.exe"; Parameters: "/aiA /gm2"; StatusMsg: "Installing Visual C++ Runtime All-in-One..."
Filename: "{tmp}\dotnet-sdk-8.0.406-win-x64.exe"; Parameters: ""; StatusMsg: "Installing .NET SDK 8.0..."
Filename: "{tmp}\NDP48-x86-x64-AllOS-ENU.exe"; Parameters: ""; StatusMsg: "Installing .NET Framework 4.8..."
Filename: "{tmp}\dxwebsetup.exe"; Parameters: ""; StatusMsg: "Installing DirectX"
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

