Function X86orX64()
    On Error Resume Next
    strComputer = "."
    Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
    Set colItems = objWMIService.ExecQuery("Select * from Win32_ComputerSystem",,48)
    
    For Each objItem in colItems
        If InStr(objItem.SystemType, "86") <> 0 Then
            X86orX64 = "system32"
        ElseIf InStr(objItem.SystemType, "64") <> 0 Then
            X86orX64 = "syswow64"
        Else
            X86orX64 = objItem.SystemType
        End If
    Next
    
End Function

sub cp(nm)
    Set f = fso.GetFile(nm)
    f.Copy wd & nm
end sub

set WshShell = WScript.CreateObject("WScript.Shell")
wd = WshShell.ExpandEnvironmentStrings("%WinDir%")
set fso = WScript.CreateObject("Scripting.FileSystemObject")

wd = wd & "\" & X86orX64() & "\"
cp "cmbchina.dll"
cp "firmclient.dll"
cp "dcom_cmb.exe"
WshShell.exec "regsvr32 " & wd & "cmbchina.dll"
WshShell.exec wd & "dcom_cmb.exe /RegServer"
