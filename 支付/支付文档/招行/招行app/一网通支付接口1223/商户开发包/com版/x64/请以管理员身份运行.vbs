sub cp(nm)
    Set f = fso.GetFile(nm)
    f.Copy wd & nm
end sub

set WshShell = WScript.CreateObject("WScript.Shell")
wd = WshShell.ExpandEnvironmentStrings("%WinDir%")
set fso = WScript.CreateObject("Scripting.FileSystemObject")

wd = wd & "\System32\"
cp "cmbchina.dll"
cp "firmclient.dll"
WshShell.exec "regsvr32 " & wd & "cmbchina.dll"
