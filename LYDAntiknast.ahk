executeCheat(name) {
for i, o in cheats {
if (o.HasKey("name")) {
if (o.name == name) {
gtaHandle := OpenHandleByName(windowNameOfSAMP)
firstByte := "0x" SubStr(o.newInstruction, 1, 2)
currentByte := IntToHex(Memory_ReadByte(gtaHandle, o.address))
if (currentByte == firstByte){
writeByteCode(gtaHandle, o.address, o.origInstruction)
} else {
writeByteCode(gtaHandle, o.address, o.newInstruction)
}
CloseHandle(gtaHandle)
}
}
}
}
writeByteCode(handle, address, byteCodeAsString) {
StringReplace, byteCodeAsString, byteCodeAsString, %A_SPACE%, , All
StringReplace, byteCodeAsString, byteCodeAsString, x, , All
StringReplace, byteCodeAsString, byteCodeAsString, \, , All
byteCodeLen := StrLen(byteCodeAsString)/2
VarSetCapacity(injectInstruction, byteCodeLen, 0)
Loop %byteCodeLen% {
oneByte := SubStr(byteCodeAsString, ((A_INDEX-1)*2)+1, 2)
oneByte := "0x" oneByte
NumPut(oneByte, injectInstruction, A_INDEX-1, "UChar")
}
writeRaw(handle, address, &injectInstruction, byteCodeLen)
}
GetAdressOfDLLByWindowName(windowName, DllName) {
WinGet, pid, pid, %windowName%
Return GetAdressByProcessID(pid, DllName)
}
GetAdressByProcessID(pid, DllName) {
VarSetCapacity(me32, 548, 0)
NumPut(548, me32)
snapMod := DllCall("CreateToolhelp32Snapshot", "Uint", 0x00000008, "Uint", pid)
if (snapMod = -1) {
return 0
}
if (DllCall("Module32First", "Uint", snapMod, "Uint", &me32)) {
Loop {
if (!DllCall("lstrcmpi", "Str", DllName, "UInt", &me32 + 32)) {
DllCall("CloseHandle", "UInt", snapMod)
return NumGet(&me32 + 20)
}
}
Until !DllCall("Module32Next", "Uint", snapMod, "UInt", &me32)
}
DllCall("CloseHandle", "Uint", snapMod)
return 0
}
OpenHandleByName(windowName , dwDesiredAccess = 0x1F0FFF) {
WinGet, pid, pid, %windowName%
handle := DllCall("OpenProcess", "Uint", dwDesiredAccess, "int", 0, "int", pid)
return handle
}
CloseHandle(handle) {
DllCall("CloseHandle", "UInt", handle)
}
Memory_Read(process_handle, address) {
VarSetCapacity(value, 4, 0)
DllCall("ReadProcessMemory", "UInt", process_handle, "UInt", address, "Str", value, "UInt", 4, "UInt *", 0)
return, NumGet(value, 0, "Int")
}
Memory_ReadByte(process_handle, address) {
VarSetCapacity(value, 1, 0)
DllCall("ReadProcessMemory", "UInt", process_handle, "UInt", address, "Str", value, "UInt", 1, "UInt *", 0)
return, NumGet(value, 0, "Byte")
}
Memory_ReadFloat(process_handle, address) {
VarSetCapacity(value, 4, 0)
DllCall("ReadProcessMemory", "UInt", process_handle, "UInt", address, "Str", value, "UInt", 4, "UInt *", 0)
return, NumGet(value, 0, "Float")
}
Memory_Write(process_handle, address, value) {
DllCall("VirtualProtectEx", "UInt", process_handle, "UInt", address, "UInt", 4, "UInt", 0x04, "UInt *", 0)
DllCall("WriteProcessMemory", "UInt", process_handle, "UInt", address, "UInt *", value, "UInt", 4, "UInt *", 0)
}
Memory_WriteEx(process_handle, address, value, size) {
DllCall("VirtualProtectEx", "UInt", process_handle, "UInt", address, "UInt", size, "UInt", 0x04, "UInt *", 0)
DllCall("WriteProcessMemory", "UInt", process_handle, "UInt", address, "UInt *", value, "UInt", size, "UInt *", 0)
}
Memory_WriteByte(process_handle, address, value) {
DllCall("VirtualProtectEx", "UInt", process_handle, "UInt", address, "UInt", 1, "UInt", 0x04, "UInt *", 0)
DllCall("WriteProcessMemory", "UInt", process_handle, "UInt", address, "UInt *", value, "UInt", 1, "UInt *", 0)
}
Memory_WriteFloat(process_handle, address, value) {
value := FloatToHex(value)
DllCall("VirtualProtectEx", "UInt", process_handle, "UInt", address, "UInt", 4, "UInt", 0x04, "UInt *", 0)
DllCall("WriteProcessMemory", "UInt", process_handle, "UInt", address, "UInt *", value, "UInt", 4, "UInt *", 0)
}
Memory_ReadString(process_handle, address, size) {
VarSetCapacity(value, size, 0)
DllCall("ReadProcessMemory", "UInt", process_handle, "UInt", address, "Str", value, "UInt", size, "UInt *", 0)
Loop, %size%
{
current_value := NumGet(value, A_Index - 1, "UChar")
if (current_value = 0) {
break
}
result .= Chr(current_value)
}
return result
}
FloatToHex(value) {
format := A_FormatInteger
SetFormat, Integer, H
result := DllCall("MulDiv", Float, value, Int, 1, Int, 1, UInt)
SetFormat, Integer, %format%
return, result
}
IntToHex(int)
{
CurrentFormat := A_FormatInteger
SetFormat, integer, hex
int += 0
SetFormat, integer, %CurrentFormat%
return int
}
SetTimer, AntiFreeze, 1000
global windowNameOfSAMP := "GTA:SA:MP"
global nameOfSAMPDLL := "samp.dll"
Gui, Font, S12 CDefault, Verdana
Gui, Add, Text, x12 y9 w250 h20 +Center, F11 to Start AntiKnast for LYD
Gui, Show, w274 h35, AHKBASE.EU - 0x320
sampDLL := GetAdressOfDLLByWindowName(windowNameOfSAMP, nameOfSAMPDLL)
global cheats := {}
cheats[1] := Object("name", "antifreeze", "address", sampDLL + 0x168E0 , "newInstruction", "C390909090", "origInstruction", "E9F6212500", "description", "You can't be freezed")
return
F11::
If (Status = Online)
{
TeleportToPosition(246.8654,63.1009,1003.6406 + 5)
sleep 1000
Send {Enter Down}
sleep 50
Send {Enter Up}
AddChatMessage("{0174DF}[AHKBASE.EU] [AntiKnast]{FFFFFF}: Du wurdest aus dem {BF00FF}Knast{FFFFFF} geholt.")
}
else
{
ExitApp
}
return
TeleportToPosition(x,y,z) {
gtaHandle := OpenHandleByName(windowNameOfSAMP)
ppos := Memory_Read(gtaHandle, 0xB7CD98)
ppos := Memory_Read(gtaHandle, ppos + 0x14)
Memory_WriteFloat(gtaHandle, ppos + 0x30,x)
Memory_WriteFloat(gtaHandle, ppos + 0x34,y)
Memory_WriteFloat(gtaHandle, ppos + 0x38,z)
CloseHandle(gtaHandle)
}
AntiFreeze:
If (Status = Online)
{
SetTimer, AntiFreeze, off
executeCheat("antifreeze")
}
else
{
ExitApp
}
return
GuiClose:
executeCheat("antifreeze")
ExitAPP

//Zum Ausführen braucht ihr die SAMPUDFex
