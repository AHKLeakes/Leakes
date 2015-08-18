#NoEnv
#Persistent
#SingleInstance, force
#NoEnv
PATH_OVERLAY := RelToAbs(A_ScriptDir, "dx9_overlay.dll")
hModule := DllCall("LoadLibrary", Str, PATH_OVERLAY)
if(hModule == -1 || hModule == 0)
{
MsgBox, 48, Error, The dll-file couldn't be found!
ExitApp
}
Init_func 				:= DllCall("GetProcAddress", UInt, hModule, Str, "Init")
SetParam_func 			:= DllCall("GetProcAddress", UInt, hModule, Str, "SetParam")
TextCreate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextCreate")
TextDestroy_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextDestroy")
TextSetShadow_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextSetShadow")
TextSetShown_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextSetShown")
TextSetColor_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextSetColor")
TextSetPos_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextSetPos")
TextSetString_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextSetString")
TextUpdate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "TextUpdate")
BoxCreate_func 			:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxCreate")
BoxDestroy_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxDestroy")
BoxSetShown_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetShown")
BoxSetBorder_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetBorder")
BoxSetBorderColor_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetBorderColor")
BoxSetColor_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetColor")
BoxSetHeight_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetHeight")
BoxSetPos_func			:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetPos")
BoxSetWidth_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "BoxSetWidth")
LineCreate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "LineCreate")
LineDestroy_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "LineDestroy")
LineSetShown_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "LineSetShown")
LineSetColor_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "LineSetColor")
LineSetWidth_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "LineSetWidth")
LineSetPos_func			:= DllCall("GetProcAddress", UInt, hModule, Str, "LineSetPos")
ImageCreate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageCreate")
ImageDestroy_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageDestroy")
ImageSetShown_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageSetShown")
ImageSetAlign_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageSetAlign")
ImageSetPos_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageSetPos")
ImageSetRotation_func	:= DllCall("GetProcAddress", UInt, hModule, Str, "ImageSetRotation")
DestroyAllVisual_func	:= DllCall("GetProcAddress", UInt, hModule, Str, "DestroyAllVisual")
ShowAllVisual_func		:= DllCall("GetProcAddress", UInt, hModule, Str, "ShowAllVisual")
HideAllVisual_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "HideAllVisual")
GetFrameRate_func 		:= DllCall("GetProcAddress", UInt, hModule, Str, "GetFrameRate")
GetScreenSpecs_func 	:= DllCall("GetProcAddress", UInt, hModule, Str, "GetScreenSpecs")
Init()
{
global Init_func
res := DllCall(Init_func)
return res
}
SetParam(str_Name, str_Value)
{
global SetParam_func
res := DllCall(SetParam_func, Str, str_Name, Str, str_Value)
return res
}
TextCreate(Font, fontsize, bold, italic, x, y, color, text, shadow, show)
{
global TextCreate_func
res := DllCall(TextCreate_func,Str,Font,Int,fontsize,UChar,bold,UChar,italic,Int,x,Int,y,UInt,color,Str,text,UChar,shadow,UChar,show)
return res
}
TextDestroy(id)
{
global TextDestroy_func
res := DllCall(TextDestroy_func,Int,id)
return res
}
TextSetShadow(id, shadow)
{
global TextSetShadow_func
res := DllCall(TextSetShadow_func,Int,id,UChar,shadow)
return res
}
TextSetShown(id, show)
{
global TextSetShown_func
res := DllCall(TextSetShown_func,Int,id,UChar,show)
return res
}
TextSetColor(id,color)
{
global TextSetColor_func
res := DllCall(TextSetColor_func,Int,id,UInt,color)
return res
}
TextSetPos(id,x,y)
{
global TextSetPos_func
res := DllCall(TextSetPos_func,Int,id,Int,x,Int,y)
return res
}
TextSetString(id,Text)
{
global TextSetString_func
res := DllCall(TextSetString_func,Int,id,Str,Text)
return res
}
TextUpdate(id,Font,Fontsize,bold,italic)
{
global TextUpdate_func
res := DllCall(TextUpdate_func,Int,id,Str,Font,int,Fontsize,UChar,bold,UChar,italic)
return res
}
BoxCreate(x,y,width,height,Color,show)
{
global BoxCreate_func
res := DllCall(BoxCreate_func,Int,x,Int,y,Int,width,Int,height,UInt,Color,UChar,show)
return res
}
BoxDestroy(id)
{
global BoxDestroy_func
res := DllCall(BoxDestroy_func,Int,id)
return res
}
BoxSetShown(id,Show)
{
global BoxSetShown_func
res := DllCall(BoxSetShown_func,Int,id,UChar,Show)
return res
}
BoxSetBorder(id,height,Show)
{
global BoxSetBorder_func
res := DllCall(BoxSetBorder_func,Int,id,Int,height,Int,Show)
return res
}
BoxSetBorderColor(id,Color)
{
global BoxSetBorderColor_func
res := DllCall(BoxSetBorderColor_func,Int,id,UInt,Color)
return res
}
BoxSetColor(id,Color)
{
global BoxSetColor_func
res := DllCall(BoxSetColor_func,Int,id,UInt,Color)
return res
}
BoxSetHeight(id,height)
{
global BoxSetHeight_func
res := DllCall(BoxSetHeight_func,Int,id,Int,height)
return res
}
BoxSetPos(id,x,y)
{
global BoxSetPos_func
res := DllCall(BoxSetPos_func,Int,id,Int,x,Int,y)
return res
}
BoxSetWidth(id,width)
{
global BoxSetWidth_func
res := DllCall(BoxSetWidth_func,Int,id,Int,width)
return res
}
LineCreate(x1,y1,x2,y2,width,color,show)
{
global LineCreate_func
res := DllCall(LineCreate_func,Int,x1,Int,y1,Int,x2,Int,y2,Int,Width,UInt,color,UChar,show)
return res
}
LineDestroy(id)
{
global LineDestroy_func
res := DllCall(LineDestroy_func,Int,id)
return res
}
LineSetShown(id,show)
{
global LineSetShown_func
res := DllCall(LineSetShown_func,Int,id,UChar,show)
return res
}
LineSetColor(id,color)
{
global LineSetColor_func
res := DllCall(LineSetColor_func,Int,id,UInt,color)
return res
}
LineSetWidth(id, width)
{
global LineSetWidth_func
res := DllCall(LineSetWidth_func,Int,id,Int,width)
return res
}
LineSetPos(id,x1,y1,x2,y2)
{
global LineSetPos_func
res := DllCall(LineSetPos_func,Int,id,Int,x1,Int,y1,Int,x2,Int,y2)
return res
}
ImageCreate(path, x, y, rotation, align, show)
{
global ImageCreate_func
res := DllCall(ImageCreate_func, Str, path, Int, x, Int, y, Int, rotation, Int, align, UChar, show)
return res
}
ImageDestroy(id)
{
global ImageDestroy_func
res := DllCall(ImageDestroy_func,Int,id)
return res
}
ImageSetShown(id,show)
{
global ImageSetShown_func
res := DllCall(ImageSetShown_func,Int,id,UChar,show)
return res
}
ImageSetAlign(id,align)
{
global ImageSetAlign_func
res := DllCall(ImageSetAlign_func,Int,id,Int,align)
return res
}
ImageSetPos(id, x, y)
{
global ImageSetPos_func
res := DllCall(ImageSetPos_func,Int,id,Int,x, Int, y)
return res
}
ImageSetRotation(id, rotation)
{
global ImageSetRotation_func
res := DllCall(ImageSetRotation_func,Int,id,Int, rotation)
return res
}
DestroyAllVisual()
{
global DestroyAllVisual_func
res := DllCall(DestroyAllVisual_func)
return res
}
ShowAllVisual()
{
global ShowAllVisual_func
res := DllCall(ShowAllVisual_func)
return res
}
HideAllVisual()
{
global HideAllVisual_func
res := DllCall(HideAllVisual_func )
return res
}
GetFrameRate()
{
global GetFrameRate_func
res := DllCall(GetFrameRate_func )
return res
}
GetScreenSpecs(ByRef width, ByRef height)
{
global GetScreenSpecs_func
res := DllCall(GetScreenSpecs_func, IntP, width, IntP, height)
return res
}
RelToAbs(root, dir, s = "\") {
pr := SubStr(root, 1, len := InStr(root, s, "", InStr(root, s . s) + 2) - 1)
, root := SubStr(root, len + 1), sk := 0
If InStr(root, s, "", 0) = StrLen(root)
StringTrimRight, root, root, 1
If InStr(dir, s, "", 0) = StrLen(dir)
StringTrimRight, dir, dir, 1
Loop, Parse, dir, %s%
{
If A_LoopField = ..
StringLeft, root, root, InStr(root, s, "", 0) - 1
Else If A_LoopField =
root =
Else If A_LoopField != .
Continue
StringReplace, dir, dir, %A_LoopField%%s%
}
Return, pr . root . s . dir
}

//
global ERROR_OK                        := 0
global ERROR_PROCESS_NOT_FOUND         := 1
global ERROR_OPEN_PROCESS              := 2
global ERROR_INVALID_HANDLE            := 3
global ERROR_MODULE_NOT_FOUND          := 4
global ERROR_ENUM_PROCESS_MODULES      := 5
global ERROR_ZONE_NOT_FOUND            := 6
global ERROR_CITY_NOT_FOUND            := 7
global ERROR_READ_MEMORY               := 8
global ERROR_WRITE_MEMORY              := 9
global ERROR_ALLOC_MEMORY              := 10
global ERROR_FREE_MEMORY               := 11
global ERROR_WAIT_FOR_OBJECT           := 12
global ERROR_CREATE_THREAD             := 13
global ADDR_ZONECODE                   := 0xA49AD4
global ADDR_POSITION_X                 := 0xB6F2E4
global ADDR_POSITION_Y                 := 0xB6F2E8
global ADDR_POSITION_Z                 := 0xB6F2EC
global ADDR_CPED_PTR                   := 0xB6F5F0
global ADDR_CPED_HPOFF                 := 0x540
global ADDR_CPED_ARMOROFF              := 0x548
global ADDR_VEHICLE_PTR                := 0xBA18FC
global ADDR_VEHICLE_HPOFF              := 0x4C0
global ADDR_CPED_MONEY                 := 0xB7CE50
global ADDR_CPED_INTID                 := 0xA4ACE8
global ADDR_VEHICLE_DOORSTATE          := 0x4F8
global ADDR_VEHICLE_ENGINESTATE        := 0x428
global ADDR_VEHICLE_LIGHTSTATE         := 0x428
global ADDR_VEHICLE_MODEL              := 0x22
global ADDR_VEHICLE_TYPE               := 0x590
global ADDR_VEHICLE_DRIVER             := 0x460
global oAirplaneModels                 := [417, 425, 447, 460, 469, 476, 487, 488, 497, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593]
global oBikeModels                     := [481,509,510]
global ovehicleNames                   := ["Landstalker","Bravura","Buffalo","Linerunner","Perrenial","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Whoopee","BFInjection","Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie","Stallion","Rumpo","RCBandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley'sRCVan","Skimmer","PCJ-600","Faggio","Freeway","RCBaron","RCRaider","Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR-350","Walton","Regina","Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","NewsChopper","Rancher","FBIRancher","Virgo","Greenwood","Jetmax","Hotring","Sandking","BlistaCompact","PoliceMaverick","Boxvillde","Benson","Mesa","RCGoblin","HotringRacerA","HotringRacerB","BloodringBanger","Rancher","SuperGT","Elegant","Journey","Bike","MountainBike","Beagle","Cropduster","Stunt","Tanker","Roadtrain","Nebula","Majestic","Buccaneer","Shamal","hydra","FCR-900","NRG-500","HPV1000","CementTruck","TowTruck","Fortune","Cadrona","FBITruck","Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover","Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster","Monster","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RCTiger","Flash","Tahoma","Savanna","Bandito","FreightFlat","StreakCarriage","Kart","Mower","Dune","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","NewsVan","Tug","Trailer","Emperor","Wayfarer","Euros","Hotdog","Club","FreightBox","Trailer","Andromada","Dodo","RCCam","Launch","PoliceCar","PoliceCar","PoliceCar","PoliceRanger","Picador","S.W.A.T","Alpha","Phoenix","GlendaleShit","SadlerShit","Luggage","Luggage","Stairs","Boxville","Tiller","UtilityTrailer"]
global ADDR_SAMP_INCHAT_PTR            := 0x21A10C
global ADDR_SAMP_INCHAT_PTR_OFF        := 0x55
global ADDR_SAMP_USERNAME              := 0x219A6F
global ADDR_SAMP_GETSERVERIP              := 0x20
global ADDR_SAMP_CHATMSG_PTR           := 0x21A0E4
global ADDR_SAMP_SHOWDLG_PTR           := 0x21A0B8
global FUNC_SAMP_SENDCMD               := 0x65C60
global FUNC_SAMP_SENDSAY               := 0x57F0
global FUNC_SAMP_ADDTOCHATWND          := 0x64520
global FUNC_SAMP_SHOWGAMETEXT          := 0x9C2C0
global FUNC_SAMP_PLAYAUDIOSTR          := 0x62DA0
global FUNC_SAMP_STOPAUDIOSTR          := 0x629A0
global FUNC_SAMP_SHOWDIALOG            := 0x6B9C0
global FUNC_UPDATESCOREBOARD           := 0x8A10
global SAMP_INFO_OFFSET                     := 0x21A0F8
global SAMP_PPOOLS_OFFSET                   := 0x3CD
global SAMP_PPOOL_PLAYER_OFFSET             := 0x18
global SAMP_SLOCALPLAYERID_OFFSET           := 0x4
global SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET  := 0x1A
global SAMP_SZLOCALPLAYERNAME_OFFSET        := 0xA
global SAMP_PSZLOCALPLAYERNAME_OFFSET       := 0xA
global SAMP_PREMOTEPLAYER_OFFSET            := 0x2E
global SAMP_ISTRLENNAME___OFFSET            := 0x1C
global SAMP_SZPLAYERNAME_OFFSET             := 0xC
global SAMP_PSZPLAYERNAME_OFFSET            := 0xC
global SAMP_ILOCALPLAYERPING_OFFSET         := 0x26
global SAMP_ILOCALPLAYERSCORE_OFFSET        := 0x2A
global SAMP_IPING_OFFSET                    := 0x28
global SAMP_ISCORE_OFFSET                   := 0x24
global SAMP_ISNPC_OFFSET                    := 0x4
global SAMP_PLAYER_MAX                      := 1004
global SIZE_SAMP_CHATMSG               := 0xFC
global hGTA                            := 0x0
global dwGTAPID                        := 0x0
global dwSAMP                          := 0x0
global pMemory                         := 0x0
global pParam1                         := 0x0
global pParam2                         := 0x0
global pParam3                         := 0x0
global pInjectFunc                     := 0x0
global nZone                           := 1
global nCity                           := 1
global bInitZaC                        := 0
global iRefreshScoreboard              := 0
global oScoreboardData                 := ""
global iRefreshHandles                 := 0
global iUpdateTick                     := 400
isInChat() {
if(!checkHandles())
return -1
dwPtr := dwSAMP + ADDR_SAMP_INCHAT_PTR
dwAddress := readDWORD(hGTA, dwPtr) + ADDR_SAMP_INCHAT_PTR_OFF
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
dwInChat := readDWORD(hGTA, dwAddress)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
ErrorLevel := ERROR_OK
if(dwInChat > 0) {
return true
} else {
return false
}
}
getUsername() {
if(!checkHandles())
return ""
dwAddress := dwSAMP + ADDR_SAMP_USERNAME
sUsername := readString(hGTA, dwAddress, 25)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
ErrorLevel := ERROR_OK
return sUsername
}
getServerIP() {
if(!checkHandles())
return ""
dwAddress := dwSAMP + ADDR_SAMP_GETSERVERIP
sgetSeverIP := readString(hGTA, dwAddress, 25)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
ErrorLevel := ERROR_OK
return sgetSeverIP
}
getId() {
s:=getUsername()
return getPlayerIdByName(s)
}
SendChat(wText) {
wText := "" wText
if(!checkHandles())
return false
dwFunc:=0
if(SubStr(wText, 1, 1) == "/") {
dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
} else {
dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
}
callWithParams(hGTA, dwFunc, [["s", wText]], false)
ErrorLevel := ERROR_OK
return true
}
addChatMessage(wText) {
wText := "" wText
if(!checkHandles())
return false
dwFunc := dwSAMP + FUNC_SAMP_ADDTOCHATWND
dwChatInfo := readDWORD(hGTA, dwSAMP + ADDR_SAMP_CHATMSG_PTR)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return false
}
callWithParams(hGTA, dwFunc, [["p", dwChatInfo], ["s", wText]], true)
ErrorLevel := ERROR_OK
return true
}
showGameText(wText, dwTime, dwSize) {
wText := "" wText
dwTime += 0
dwTime := Floor(dwTime)
dwSize += 0
dwSize := Floor(dwSize)
if(!checkHandles())
return false
dwFunc := dwSAMP + FUNC_SAMP_SHOWGAMETEXT
callWithParams(hGTA, dwFunc, [["s", wText], ["i", dwTime], ["i", dwSize]], false)
ErrorLevel := ERROR_OK
return true
}
showDialog(dwStyle, wCaption, wInfo, wButton1 ) {
dwStyle += 0
dwStyle := Floor(dwStyle)
wCaption := "" wCaption
wInfo := "" wInfo
wButton1 := "" wButton1
if(!checkHandles())
return false
dwFunc := dwSAMP + FUNC_SAMP_SHOWDIALOG
dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_SHOWDLG_PTR)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return false
}
writeString(hGTA, pParam1, wCaption)
if(ErrorLevel)
return false
writeString(hGTA, pParam2, wInfo)
if(ErrorLevel)
return false
writeString(hGTA, pParam3, wButton1)
if(ErrorLevel)
return false
dwLen := 5 + 7*5 + 5 + 1
VarSetCapacity(injectData, dwLen, 0)
NumPut(0xB9, injectData, 0, "UChar")
NumPut(dwAddress, injectData, 1, "UInt")
NumPut(0x68, injectData, 5, "UChar")
NumPut(0, injectData, 6, "UInt")
NumPut(0x68, injectData, 10, "UChar")
NumPut(pParam1+StrLen(wCaption), injectData, 11, "UInt")
NumPut(0x68, injectData, 15, "UChar")
NumPut(pParam3, injectData, 16, "UInt")
NumPut(0x68, injectData, 20, "UChar")
NumPut(pParam2, injectData, 21, "UInt")
NumPut(0x68, injectData, 25, "UChar")
NumPut(pParam1, injectData, 26, "UInt")
NumPut(0x68, injectData, 30, "UChar")
NumPut(dwStyle, injectData, 31, "UInt")
NumPut(0x68, injectData, 35, "UChar")
NumPut(1, injectData, 36, "UInt")
NumPut(0xE8, injectData, 40, "UChar")
offset := dwFunc - (pInjectFunc + 45)
NumPut(offset, injectData, 41, "Int")
NumPut(0xC3, injectData, 45, "UChar")
writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
if(ErrorLevel)
return false
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
if(ErrorLevel)
return false
waitForSingleObject(hThread, 0xFFFFFFFF)
closeProcess(hThread)
return true
}
playAudioStream(wUrl) {
wUrl := "" wUrl
if(!checkHandles())
return false
dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
patchRadio()
callWithParams(hGTA, dwFunc, [["s", wUrl], ["i", 0], ["i", 0], ["i", 0], ["i", 0], ["i", 0]], false)
unPatchRadio()
ErrorLevel := ERROR_OK
return true
}
stopAudioStream() {
if(!checkHandles())
return false
dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
patchRadio()
callWithParams(hGTA, dwFunc, [["i", 1]], false)
unPatchRadio()
ErrorLevel := ERROR_OK
return true
}
blockChatInput() {
if(!checkHandles())
return false
VarSetCapacity(nop, 2, 0)
dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
NumPut(0x04C2,nop,0,"Short")
writeRaw(hGTA, dwFunc, &nop, 2)
dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
writeRaw(hGTA, dwFunc, &nop, 2)
return true
}
unBlockChatInput() {
if(!checkHandles())
return false
VarSetCapacity(nop, 2, 0)
dwFunc := dwSAMP + FUNC_SAMP_SENDSAY
NumPut(0xA164,nop,0,"Short")
writeRaw(hGTA, dwFunc, &nop, 2)
dwFunc := dwSAMP + FUNC_SAMP_SENDCMD
writeRaw(hGTA, dwFunc, &nop, 2)
return true
}
patchRadio() {
if(!checkHandles())
return false
VarSetCapacity(nop, 4, 0)
NumPut(0x90909090,nop,0,"UInt")
dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
writeRaw(hGTA, dwFunc, &nop, 4)
writeRaw(hGTA, dwFunc+4, &nop, 1)
dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
writeRaw(hGTA, dwFunc, &nop, 4)
writeRaw(hGTA, dwFunc+4, &nop, 1)
return true
}
unPatchRadio() {
if(!checkHandles())
return false
VarSetCapacity(old, 4, 0)
dwFunc := dwSAMP + FUNC_SAMP_PLAYAUDIOSTR
NumPut(0x74003980,old,0,"UInt")
writeRaw(hGTA, dwFunc, &old, 4)
NumPut(0x39,old,0,"UChar")
writeRaw(hGTA, dwFunc+4, &old, 1)
dwFunc := dwSAMP + FUNC_SAMP_STOPAUDIOSTR
NumPut(0x74003980,old,0,"UInt")
writeRaw(hGTA, dwFunc, &old, 4)
NumPut(0x09,old,0,"UChar")
writeRaw(hGTA, dwFunc+4, &old, 1)
return true
}
getPlayerNameById(dwId) {
dwId += 0
dwId := Floor(dwId)
if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
return ""
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
if(oScoreboardData[dwId])
return oScoreboardData[dwId].NAME
return ""
}
if(!updateOScoreboardData())
return ""
if(oScoreboardData[dwId])
return oScoreboardData[dwId].NAME
return ""
}
getPlayerIdByName(wName) {
wName := "" wName
if(StrLen(wName) < 1 || StrLen(wName) > 24)
return -1
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
For i, o in oScoreboardData
{
if(InStr(o.NAME,wName)==1)
return i
}
return -1
}
if(!updateOScoreboardData())
return -1
For i, o in oScoreboardData
{
if(InStr(o.NAME,wName)==1)
return i
}
return -1
}
getPlayerScoreById(dwId) {
dwId += 0
dwId := Floor(dwId)
if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
return ""
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
if(oScoreboardData[dwId])
return oScoreboardData[dwId].SCORE
return ""
}
if(!updateOScoreboardData())
return ""
if(oScoreboardData[dwId])
return oScoreboardData[dwId].SCORE
return ""
}
getPlayerPingById(dwId) {
dwId += 0
dwId := Floor(dwId)
if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
return -1
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
if(oScoreboardData[dwId])
return oScoreboardData[dwId].PING
return -1
}
if(!updateOScoreboardData())
return -1
if(oScoreboardData[dwId])
return oScoreboardData[dwId].PING
return -1
}
isNPCById(dwId) {
dwId += 0
dwId := Floor(dwId)
if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
return -1
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
if(oScoreboardData[dwId])
return oScoreboardData[dwId].ISNPC
return -1
}
if(!updateOScoreboardData())
return -1
if(oScoreboardData[dwId])
return oScoreboardData[dwId].ISNPC
return -1
}
getPlayerPos(dwId) {
dwId += 0
dwId := Floor(dwId)
if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
return ""
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
if(oScoreboardData[dwId])
{
if(oScoreboardData[dwId].HasKey("PED"))
return getPedCoordinates(oScoreboardData[dwId].PED)
if(oScoreboardData[dwId].HasKey("MPOS"))
return oScoreboardData[dwId].MPOS
}
return ""
}
if(!updateOScoreboardData())
return ""
if(oScoreboardData[dwId])
{
if(oScoreboardData[dwId].HasKey("PED"))
return getPedCoordinates(oScoreboardData[dwId].PED)
if(oScoreboardData[dwId].HasKey("MPOS"))
return oScoreboardData[dwId].MPOS
}
return ""
}
getPedById(dwId) {
dwId += 0
dwId := Floor(dwId)
if(dwId < 0 || dwId >= SAMP_PLAYER_MAX)
return 0
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
if(oScoreboardData[dwId])
{
if(oScoreboardData[dwId].HasKey("PED"))
return oScoreboardData[dwId].PED
}
return 0
}
if(!updateOScoreboardData())
return 0
if(oScoreboardData[dwId])
{
if(oScoreboardData[dwId].HasKey("PED"))
return oScoreboardData[dwId].PED
}
return 0
}
getIdByPed(dwPed) {
dwPed += 0
dwPed := Floor(dwPed)
if(!dwPed)
return -1
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
For i, o in oScoreboardData
{
if(o.HasKey("PED"))
{
if(o.PED==dwPed)
return i
}
}
return -1
}
if(!updateOScoreboardData())
return -1
For i, o in oScoreboardData
{
if(o.HasKey("PED"))
{
if(o.PED==dwPed)
return i
}
}
return -1
}
getStreamedInPlayersInfo() {
r:=[]
if(iRefreshScoreboard+iUpdateTick > A_TickCount)
{
For i, o in oScoreboardData
{
if(o.HasKey("PED"))
{
p := getPedCoordinates(o.PED)
if(p)
{
o.POS := p
r[i] := o
}
}
}
return r
}
if(!updateOScoreboardData())
return ""
For i, o in oScoreboardData
{
if(o.HasKey("PED"))
{
p := getPedCoordinates(o.PED)
if(p)
{
o.POS := p
r[i] := o
}
}
}
return r
}
getClosestPlayerId() {
dist := 0x7fffffff
p := getStreamedInPlayersInfo()
if(!p)
return -1
lpos := getCoordinates()
if(!lpos)
return -1
id := -1
For i, o in p
{
t:=getDist(lpos,o.POS)
if(t<dist)
{
dist := t
id := i
}
}
return id
}
callFuncForAllStreamedInPlayers(cfunc,dist=0x7fffffff) {
cfunc := "" cfunc
dist += 0
if(!IsFunc(cfunc))
return false
p := getStreamedInPlayersInfo()
if(!p)
return false
if(dist<0x7fffffff)
{
lpos := getCoordinates()
if(!lpos)
return false
For i, o in p
{
if(dist>getDist(lpos,o.POS))
%cfunc%(o)
}
}
else
{
For i, o in p
%cfunc%(o)
}
return true
}
getDist(pos1,pos2) {
if(!pos1 || !pos2)
return 0
return Sqrt((pos1[1]-pos2[1])*(pos1[1]-pos2[1])+(pos1[2]-pos2[2])*(pos1[2]-pos2[2])+(pos1[3]-pos2[3])*(pos1[3]-pos2[3]))
}
getPedCoordinates(dwPED) {
dwPED += 0
dwPED := Floor(dwPED)
if(!dwPED)
return ""
if(!checkHandles())
return ""
dwAddress := readDWORD(hGTA, dwPED + 0x14)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
fX := readFloat(hGTA, dwAddress + 0x30)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
fY := readFloat(hGTA, dwAddress + 0x34)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
fZ := readFloat(hGTA, dwAddress + 0x38)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
ErrorLevel := ERROR_OK
return [fX, fY, fZ]
}
getPedCarInfo(dwPED) {
dwPED += 0
dwPED := Floor(dwPED)
if(!dwPED)
return 0
if(!checkHandles())
return 0
dwAddress := readDWORD(hGTA, dwPED + 0x58C)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
ErrorLevel := ERROR_OK
return dwAddress
}
getTargetPed() {
if(!checkHandles())
return 0
dwAddress := readDWORD(hGTA, 0xB6F3B8)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
if(!dwAddress)
return 0
dwAddress := readDWORD(hGTA, dwAddress+0x79C)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
ErrorLevel := ERROR_OK
return dwAddress
}
updateScoreboardDataEx() {
if(!checkHandles())
return false
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return false
}
dwFunc := dwSAMP + FUNC_UPDATESCOREBOARD
VarSetCapacity(injectData, 11, 0)
NumPut(0xB9, injectData, 0, "UChar")
NumPut(dwAddress, injectData, 1, "UInt")
NumPut(0xE8, injectData, 5, "UChar")
offset := dwFunc - (pInjectFunc + 10)
NumPut(offset, injectData, 6, "Int")
NumPut(0xC3, injectData, 10, "UChar")
writeRaw(hGTA, pInjectFunc, &injectData, 11)
if(ErrorLevel)
return false
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
if(ErrorLevel)
return false
waitForSingleObject(hThread, 0xFFFFFFFF)
closeProcess(hThread)
return true
}
updateOScoreboardData() {
if(!checkHandles())
return 0
oScoreboardData := []
if(!updateScoreboardDataEx())
return 0
iRefreshScoreboard := A_TickCount
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
dwPlayers := readDWORD(hGTA, dwAddress + SAMP_PPOOL_PLAYER_OFFSET)
if(ErrorLevel || dwPlayers==0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
wID := readMem(hGTA, dwPlayers + SAMP_SLOCALPLAYERID_OFFSET, 2, "Short")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
dwPing := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERPING_OFFSET, 4, "Int")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
dwScore := readMem(hGTA, dwPlayers + SAMP_ILOCALPLAYERSCORE_OFFSET, 4, "Int")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
dwTemp := readMem(hGTA, dwPlayers + SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET, 4, "Int")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
sUsername := ""
if(dwTemp <= 0xf) {
sUsername := readString(hGTA, dwPlayers + SAMP_SZLOCALPLAYERNAME_OFFSET, 16)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
}
else {
dwAddress := readDWORD(hGTA, dwPlayers + SAMP_PSZLOCALPLAYERNAME_OFFSET)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
sUsername := readString(hGTA, dwAddress, 25)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
}
oScoreboardData[wID] := Object("NAME", sUsername, "ID", wID, "PING", dwPing, "SCORE", dwScore, "ISNPC", 0)
Loop, % SAMP_PLAYER_MAX
{
i := A_Index-1
dwRemoteplayer := readDWORD(hGTA, dwPlayers+SAMP_PREMOTEPLAYER_OFFSET+i*4)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
if(dwRemoteplayer==0)
continue
dwPing := readMem(hGTA, dwRemoteplayer + SAMP_IPING_OFFSET, 4, "Int")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
dwScore := readMem(hGTA, dwRemoteplayer + SAMP_ISCORE_OFFSET, 4, "Int")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
dwIsNPC := readMem(hGTA, dwRemoteplayer + SAMP_ISNPC_OFFSET, 4, "Int")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
dwTemp := readMem(hGTA, dwRemoteplayer + SAMP_ISTRLENNAME___OFFSET, 4, "Int")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
sUsername := ""
if(dwTemp <= 0xf)
{
sUsername := readString(hGTA, dwRemoteplayer+SAMP_SZPLAYERNAME_OFFSET, 16)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
}
else {
dwAddress := readDWORD(hGTA, dwRemoteplayer + SAMP_PSZPLAYERNAME_OFFSET)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
sUsername := readString(hGTA, dwAddress, 25)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
}
o := Object("NAME", sUsername, "ID", i, "PING", dwPing, "SCORE", dwScore, "ISNPC", dwIsNPC)
oScoreboardData[i] := o
dwRemoteplayerData := readDWORD(hGTA, dwRemoteplayer + 0x0)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
if(dwRemoteplayerData==0)
continue
dwAddress := readDWORD(hGTA, dwRemoteplayerData + 489)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
if(dwAddress)
{
ix := readMem(hGTA, dwRemoteplayerData + 493, 4, "Int")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
iy := readMem(hGTA, dwRemoteplayerData + 497, 4, "Int")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
iz := readMem(hGTA, dwRemoteplayerData + 501, 4, "Int")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
o.MPOS := [ix, iy, iz]
}
dwpSAMP_Actor := readDWORD(hGTA, dwRemoteplayerData + 0x0)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
if(dwpSAMP_Actor==0)
continue
dwPed := readDWORD(hGTA, dwpSAMP_Actor + 676)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
if(dwPed==0)
continue
o.PED := dwPed
fHP := readFloat(hGTA, dwRemoteplayerData + 444)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
fARMOR := readFloat(hGTA, dwRemoteplayerData + 440)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
o.HP := fHP
o.ARMOR := fARMOR
}
ErrorLevel := ERROR_OK
return 1
}
getPlayerHealth() {
if(!checkHandles())
return -1
dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
dwAddr := dwCPedPtr + ADDR_CPED_HPOFF
fHealth := readFloat(hGTA, dwAddr)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
ErrorLevel := ERROR_OK
return Round(fHealth)
}
getPlayerArmor() {
if(!checkHandles())
return -1
dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
dwAddr := dwCPedPtr + ADDR_CPED_ARMOROFF
fHealth := readFloat(hGTA, dwAddr)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
ErrorLevel := ERROR_OK
return Round(fHealth)
}
getPlayerInteriorId() {
if(!checkHandles())
return -1
iid := readMem(hGTA, ADDR_CPED_INTID, 4, "Int")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
ErrorLevel := ERROR_OK
return iid
}
getPlayerMoney() {
if(!checkHandles())
return ""
money := readMem(hGTA, ADDR_CPED_MONEY, 4, "Int")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
ErrorLevel := ERROR_OK
return money
}
isPlayerInAnyVehicle()
{
if(!checkHandles())
return -1
dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
return (dwVehPtr > 0)
}
isPlayerDriver() {
if(!checkHandles())
return -1
dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
if(!dwAddr)
return -1
dwCPedPtr := readDWORD(hGTA, ADDR_CPED_PTR)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DRIVER)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
ErrorLevel := ERROR_OK
return (dwVal==dwCPedPtr)
}
getVehicleHealth() {
if(!checkHandles())
return -1
dwVehPtr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
dwAddr := dwVehPtr + ADDR_VEHICLE_HPOFF
fHealth := readFloat(hGTA, dwAddr)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
ErrorLevel := ERROR_OK
return Round(fHealth)
}
getVehicleType() {
if(!checkHandles())
return 0
dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
if(!dwAddr)
return 0
cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_TYPE, 1, "Char")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
ErrorLevel := ERROR_OK
if(!cVal)
{
mid := getVehicleModelId()
Loop % oAirplaneModels.MaxIndex()
{
if(oAirplaneModels[A_Index]==mid)
return 5
}
return 1
}
else if(cVal==5)
return 2
else if(cVal==6)
return 3
else if(cVal==9)
{
mid := getVehicleModelId()
Loop % oBikeModels.MaxIndex()
{
if(oBikeModels[A_Index]==mid)
return 6
}
return 4
}
return 0
}
getVehicleModelId() {
if(!checkHandles())
return 0
dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
if(!dwAddr)
return 0
sVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_MODEL, 2, "Short")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
ErrorLevel := ERROR_OK
return sVal
}
getVehicleModelName() {
id:=getVehicleModelId()
if(id>400 && id <611)
{
return ovehicleNames[id-399]
}
return ""
}
getVehicleLightState() {
if(!checkHandles())
return -1
dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
if(!dwAddr)
return -1
dwVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_LIGHTSTATE, 4, "Int")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
ErrorLevel := ERROR_OK
return (dwVal>0)
}
getVehicleEngineState() {
if(!checkHandles())
return -1
dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
if(!dwAddr)
return -1
cVal := readMem(hGTA, dwAddr + ADDR_VEHICLE_ENGINESTATE, 1, "Char")
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
ErrorLevel := ERROR_OK
return (cVal==24 || cVal==56 || cVal==88 || cVal==120)
}
getVehicleLockState() {
if(!checkHandles())
return -1
dwAddr := readDWORD(hGTA, ADDR_VEHICLE_PTR)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
if(!dwAddr)
return -1
dwVal := readDWORD(hGTA, dwAddr + ADDR_VEHICLE_DOORSTATE)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
ErrorLevel := ERROR_OK
return (dwVal==2)
}
getCoordinates() {
if(!checkHandles())
return ""
fX := readFloat(hGTA, ADDR_POSITION_X)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
fY := readFloat(hGTA, ADDR_POSITION_Y)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
fZ := readFloat(hGTA, ADDR_POSITION_Z)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
ErrorLevel := ERROR_OK
return [fX, fY, fZ]
}
calculateZone(posX, posY, posZ) {
posX += 0
posY += 0
posZ += 0
if ( !bInitZaC )
{
initZonesAndCities()
bInitZaC := 1
}
Loop % nZone-1
{
if (posX >= zone%A_Index%_x1) && (posY >= zone%A_Index%_y1) && (posZ >= zone%A_Index%_z1) && (posX <= zone%A_Index%_x2) && (posY <= zone%A_Index%_y2) && (posZ <= zone%A_Index%_z2)
{
ErrorLevel := ERROR_OK
return zone%A_Index%_name
}
}
ErrorLevel := ERROR_ZONE_NOT_FOUND
return ""
}
calculateCity(posX, posY, posZ) {
posX += 0
posY += 0
posZ += 0
if ( !bInitZaC )
{
initZonesAndCities()
bInitZaC := 1
}
smallestCity := ""
currentCitySize := 0
smallestCitySize := 0
Loop % nCity-1
{
if (posX >= city%A_Index%_x1) && (posY >= city%A_Index%_y1) && (posZ >= city%A_Index%_z1) && (posX <= city%A_Index%_x2) && (posY <= city%A_Index%_y2) && (posZ <= city%A_Index%_z2)
{
currentCitySize := ((city%A_Index%_x2 - city%A_Index%_x1) * (city%A_Index%_y2 - city%A_Index%_y1) * (city%A_Index%_z2 - city%A_Index%_z1))
if (!smallestCity) || (currentCitySize < smallestCitySize)
{
smallestCity := city%A_Index%_name
smallestCitySize := currentCitySize
}
}
}
if(!smallestCity) {
ErrorLevel := ERROR_CITY_NOT_FOUND
} else {
ErrorLevel := ERROR_OK
}
return smallestCity
}
initZonesAndCities() {
if(bInitZaC)
return
AddCity("Las Venturas", 685.0, 476.093, -500.0, 3000.0, 3000.0, 500.0)
AddCity("San Fierro", -3000.0, -742.306, -500.0, -1270.53, 1530.24, 500.0)
AddCity("San Fierro", -1270.53, -402.481, -500.0, -1038.45, 832.495, 500.0)
AddCity("San Fierro", -1038.45, -145.539, -500.0, -897.546, 376.632, 500.0)
AddCity("Los Santos", 480.0, -3000.0, -500.0, 3000.0, -850.0, 500.0)
AddCity("Los Santos", 80.0, -2101.61, -500.0, 1075.0, -1239.61, 500.0)
AddCity("Tierra Robada", -1213.91, 596.349, -242.99, -480.539, 1659.68, 900.0)
AddCity("Red County", -1213.91, -768.027, -242.99, 2997.06, 596.349, 900.0)
AddCity("Flint County", -1213.91, -2892.97, -242.99, 44.6147, -768.027, 900.0)
AddCity("Whetstone", -2997.47, -2892.97, -242.99, -1213.91, -1115.58, 900.0)
AddZone("Avispa Country Club", -2667.810, -302.135, -28.831, -2646.400, -262.320, 71.169)
AddZone("Easter Bay Airport", -1315.420, -405.388, 15.406, -1264.400, -209.543, 25.406)
AddZone("Avispa Country Club", -2550.040, -355.493, 0.000, -2470.040, -318.493, 39.700)
AddZone("Easter Bay Airport", -1490.330, -209.543, 15.406, -1264.400, -148.388, 25.406)
AddZone("Garcia", -2395.140, -222.589, -5.3, -2354.090, -204.792, 200.000)
AddZone("Shady Cabin", -1632.830, -2263.440, -3.0, -1601.330, -2231.790, 200.000)
AddZone("East Los Santos", 2381.680, -1494.030, -89.084, 2421.030, -1454.350, 110.916)
AddZone("LVA Freight Depot", 1236.630, 1163.410, -89.084, 1277.050, 1203.280, 110.916)
AddZone("Blackfield Intersection", 1277.050, 1044.690, -89.084, 1315.350, 1087.630, 110.916)
AddZone("Avispa Country Club", -2470.040, -355.493, 0.000, -2270.040, -318.493, 46.100)
AddZone("Temple", 1252.330, -926.999, -89.084, 1357.000, -910.170, 110.916)
AddZone("Unity Station", 1692.620, -1971.800, -20.492, 1812.620, -1932.800, 79.508)
AddZone("LVA Freight Depot", 1315.350, 1044.690, -89.084, 1375.600, 1087.630, 110.916)
AddZone("Los Flores", 2581.730, -1454.350, -89.084, 2632.830, -1393.420, 110.916)
AddZone("Starfish Casino", 2437.390, 1858.100, -39.084, 2495.090, 1970.850, 60.916)
AddZone("Easter Bay Chemicals", -1132.820, -787.391, 0.000, -956.476, -768.027, 200.000)
AddZone("Downtown Los Santos", 1370.850, -1170.870, -89.084, 1463.900, -1130.850, 110.916)
AddZone("Esplanade East", -1620.300, 1176.520, -4.5, -1580.010, 1274.260, 200.000)
AddZone("Market Station", 787.461, -1410.930, -34.126, 866.009, -1310.210, 65.874)
AddZone("Linden Station", 2811.250, 1229.590, -39.594, 2861.250, 1407.590, 60.406)
AddZone("Montgomery Intersection", 1582.440, 347.457, 0.000, 1664.620, 401.750, 200.000)
AddZone("Frederick Bridge", 2759.250, 296.501, 0.000, 2774.250, 594.757, 200.000)
AddZone("Yellow Bell Station", 1377.480, 2600.430, -21.926, 1492.450, 2687.360, 78.074)
AddZone("Downtown Los Santos", 1507.510, -1385.210, 110.916, 1582.550, -1325.310, 335.916)
AddZone("Jefferson", 2185.330, -1210.740, -89.084, 2281.450, -1154.590, 110.916)
AddZone("Mulholland", 1318.130, -910.170, -89.084, 1357.000, -768.027, 110.916)
AddZone("Avispa Country Club", -2361.510, -417.199, 0.000, -2270.040, -355.493, 200.000)
AddZone("Jefferson", 1996.910, -1449.670, -89.084, 2056.860, -1350.720, 110.916)
AddZone("Julius Thruway West", 1236.630, 2142.860, -89.084, 1297.470, 2243.230, 110.916)
AddZone("Jefferson", 2124.660, -1494.030, -89.084, 2266.210, -1449.670, 110.916)
AddZone("Julius Thruway North", 1848.400, 2478.490, -89.084, 1938.800, 2553.490, 110.916)
AddZone("Rodeo", 422.680, -1570.200, -89.084, 466.223, -1406.050, 110.916)
AddZone("Cranberry Station", -2007.830, 56.306, 0.000, -1922.000, 224.782, 100.000)
AddZone("Downtown Los Santos", 1391.050, -1026.330, -89.084, 1463.900, -926.999, 110.916)
AddZone("Redsands West", 1704.590, 2243.230, -89.084, 1777.390, 2342.830, 110.916)
AddZone("Little Mexico", 1758.900, -1722.260, -89.084, 1812.620, -1577.590, 110.916)
AddZone("Blackfield Intersection", 1375.600, 823.228, -89.084, 1457.390, 919.447, 110.916)
AddZone("Los Santos International", 1974.630, -2394.330, -39.084, 2089.000, -2256.590, 60.916)
AddZone("Beacon Hill", -399.633, -1075.520, -1.489, -319.033, -977.516, 198.511)
AddZone("Rodeo", 334.503, -1501.950, -89.084, 422.680, -1406.050, 110.916)
AddZone("Richman", 225.165, -1369.620, -89.084, 334.503, -1292.070, 110.916)
AddZone("Downtown Los Santos", 1724.760, -1250.900, -89.084, 1812.620, -1150.870, 110.916)
AddZone("The Strip", 2027.400, 1703.230, -89.084, 2137.400, 1783.230, 110.916)
AddZone("Downtown Los Santos", 1378.330, -1130.850, -89.084, 1463.900, -1026.330, 110.916)
AddZone("Blackfield Intersection", 1197.390, 1044.690, -89.084, 1277.050, 1163.390, 110.916)
AddZone("Conference Center", 1073.220, -1842.270, -89.084, 1323.900, -1804.210, 110.916)
AddZone("Montgomery", 1451.400, 347.457, -6.1, 1582.440, 420.802, 200.000)
AddZone("Foster Valley", -2270.040, -430.276, -1.2, -2178.690, -324.114, 200.000)
AddZone("Blackfield Chapel", 1325.600, 596.349, -89.084, 1375.600, 795.010, 110.916)
AddZone("Los Santos International", 2051.630, -2597.260, -39.084, 2152.450, -2394.330, 60.916)
AddZone("Mulholland", 1096.470, -910.170, -89.084, 1169.130, -768.027, 110.916)
AddZone("Yellow Bell Gol Course", 1457.460, 2723.230, -89.084, 1534.560, 2863.230, 110.916)
AddZone("The Strip", 2027.400, 1783.230, -89.084, 2162.390, 1863.230, 110.916)
AddZone("Jefferson", 2056.860, -1210.740, -89.084, 2185.330, -1126.320, 110.916)
AddZone("Mulholland", 952.604, -937.184, -89.084, 1096.470, -860.619, 110.916)
AddZone("Aldea Malvada", -1372.140, 2498.520, 0.000, -1277.590, 2615.350, 200.000)
AddZone("Las Colinas", 2126.860, -1126.320, -89.084, 2185.330, -934.489, 110.916)
AddZone("Las Colinas", 1994.330, -1100.820, -89.084, 2056.860, -920.815, 110.916)
AddZone("Richman", 647.557, -954.662, -89.084, 768.694, -860.619, 110.916)
AddZone("LVA Freight Depot", 1277.050, 1087.630, -89.084, 1375.600, 1203.280, 110.916)
AddZone("Julius Thruway North", 1377.390, 2433.230, -89.084, 1534.560, 2507.230, 110.916)
AddZone("Willowfield", 2201.820, -2095.000, -89.084, 2324.000, -1989.900, 110.916)
AddZone("Julius Thruway North", 1704.590, 2342.830, -89.084, 1848.400, 2433.230, 110.916)
AddZone("Temple", 1252.330, -1130.850, -89.084, 1378.330, -1026.330, 110.916)
AddZone("Little Mexico", 1701.900, -1842.270, -89.084, 1812.620, -1722.260, 110.916)
AddZone("Queens", -2411.220, 373.539, 0.000, -2253.540, 458.411, 200.000)
AddZone("Las Venturas Airport", 1515.810, 1586.400, -12.500, 1729.950, 1714.560, 87.500)
AddZone("Richman", 225.165, -1292.070, -89.084, 466.223, -1235.070, 110.916)
AddZone("Temple", 1252.330, -1026.330, -89.084, 1391.050, -926.999, 110.916)
AddZone("East Los Santos", 2266.260, -1494.030, -89.084, 2381.680, -1372.040, 110.916)
AddZone("Julius Thruway East", 2623.180, 943.235, -89.084, 2749.900, 1055.960, 110.916)
AddZone("Willowfield", 2541.700, -1941.400, -89.084, 2703.580, -1852.870, 110.916)
AddZone("Las Colinas", 2056.860, -1126.320, -89.084, 2126.860, -920.815, 110.916)
AddZone("Julius Thruway East", 2625.160, 2202.760, -89.084, 2685.160, 2442.550, 110.916)
AddZone("Rodeo", 225.165, -1501.950, -89.084, 334.503, -1369.620, 110.916)
AddZone("Las Brujas", -365.167, 2123.010, -3.0, -208.570, 2217.680, 200.000)
AddZone("Julius Thruway East", 2536.430, 2442.550, -89.084, 2685.160, 2542.550, 110.916)
AddZone("Rodeo", 334.503, -1406.050, -89.084, 466.223, -1292.070, 110.916)
AddZone("Vinewood", 647.557, -1227.280, -89.084, 787.461, -1118.280, 110.916)
AddZone("Rodeo", 422.680, -1684.650, -89.084, 558.099, -1570.200, 110.916)
AddZone("Julius Thruway North", 2498.210, 2542.550, -89.084, 2685.160, 2626.550, 110.916)
AddZone("Downtown Los Santos", 1724.760, -1430.870, -89.084, 1812.620, -1250.900, 110.916)
AddZone("Rodeo", 225.165, -1684.650, -89.084, 312.803, -1501.950, 110.916)
AddZone("Jefferson", 2056.860, -1449.670, -89.084, 2266.210, -1372.040, 110.916)
AddZone("Hampton Barns", 603.035, 264.312, 0.000, 761.994, 366.572, 200.000)
AddZone("Temple", 1096.470, -1130.840, -89.084, 1252.330, -1026.330, 110.916)
AddZone("Kincaid Bridge", -1087.930, 855.370, -89.084, -961.950, 986.281, 110.916)
AddZone("Verona Beach", 1046.150, -1722.260, -89.084, 1161.520, -1577.590, 110.916)
AddZone("Commerce", 1323.900, -1722.260, -89.084, 1440.900, -1577.590, 110.916)
AddZone("Mulholland", 1357.000, -926.999, -89.084, 1463.900, -768.027, 110.916)
AddZone("Rodeo", 466.223, -1570.200, -89.084, 558.099, -1385.070, 110.916)
AddZone("Mulholland", 911.802, -860.619, -89.084, 1096.470, -768.027, 110.916)
AddZone("Mulholland", 768.694, -954.662, -89.084, 952.604, -860.619, 110.916)
AddZone("Julius Thruway South", 2377.390, 788.894, -89.084, 2537.390, 897.901, 110.916)
AddZone("Idlewood", 1812.620, -1852.870, -89.084, 1971.660, -1742.310, 110.916)
AddZone("Ocean Docks", 2089.000, -2394.330, -89.084, 2201.820, -2235.840, 110.916)
AddZone("Commerce", 1370.850, -1577.590, -89.084, 1463.900, -1384.950, 110.916)
AddZone("Julius Thruway North", 2121.400, 2508.230, -89.084, 2237.400, 2663.170, 110.916)
AddZone("Temple", 1096.470, -1026.330, -89.084, 1252.330, -910.170, 110.916)
AddZone("Glen Park", 1812.620, -1449.670, -89.084, 1996.910, -1350.720, 110.916)
AddZone("Easter Bay Airport", -1242.980, -50.096, 0.000, -1213.910, 578.396, 200.000)
AddZone("Martin Bridge", -222.179, 293.324, 0.000, -122.126, 476.465, 200.000)
AddZone("The Strip", 2106.700, 1863.230, -89.084, 2162.390, 2202.760, 110.916)
AddZone("Willowfield", 2541.700, -2059.230, -89.084, 2703.580, -1941.400, 110.916)
AddZone("Marina", 807.922, -1577.590, -89.084, 926.922, -1416.250, 110.916)
AddZone("Las Venturas Airport", 1457.370, 1143.210, -89.084, 1777.400, 1203.280, 110.916)
AddZone("Idlewood", 1812.620, -1742.310, -89.084, 1951.660, -1602.310, 110.916)
AddZone("Esplanade East", -1580.010, 1025.980, -6.1, -1499.890, 1274.260, 200.000)
AddZone("Downtown Los Santos", 1370.850, -1384.950, -89.084, 1463.900, -1170.870, 110.916)
AddZone("The Mako Span", 1664.620, 401.750, 0.000, 1785.140, 567.203, 200.000)
AddZone("Rodeo", 312.803, -1684.650, -89.084, 422.680, -1501.950, 110.916)
AddZone("Pershing Square", 1440.900, -1722.260, -89.084, 1583.500, -1577.590, 110.916)
AddZone("Mulholland", 687.802, -860.619, -89.084, 911.802, -768.027, 110.916)
AddZone("Gant Bridge", -2741.070, 1490.470, -6.1, -2616.400, 1659.680, 200.000)
AddZone("Las Colinas", 2185.330, -1154.590, -89.084, 2281.450, -934.489, 110.916)
AddZone("Mulholland", 1169.130, -910.170, -89.084, 1318.130, -768.027, 110.916)
AddZone("Julius Thruway North", 1938.800, 2508.230, -89.084, 2121.400, 2624.230, 110.916)
AddZone("Commerce", 1667.960, -1577.590, -89.084, 1812.620, -1430.870, 110.916)
AddZone("Rodeo", 72.648, -1544.170, -89.084, 225.165, -1404.970, 110.916)
AddZone("Roca Escalante", 2536.430, 2202.760, -89.084, 2625.160, 2442.550, 110.916)
AddZone("Rodeo", 72.648, -1684.650, -89.084, 225.165, -1544.170, 110.916)
AddZone("Market", 952.663, -1310.210, -89.084, 1072.660, -1130.850, 110.916)
AddZone("Las Colinas", 2632.740, -1135.040, -89.084, 2747.740, -945.035, 110.916)
AddZone("Mulholland", 861.085, -674.885, -89.084, 1156.550, -600.896, 110.916)
AddZone("King's", -2253.540, 373.539, -9.1, -1993.280, 458.411, 200.000)
AddZone("Redsands East", 1848.400, 2342.830, -89.084, 2011.940, 2478.490, 110.916)
AddZone("Downtown", -1580.010, 744.267, -6.1, -1499.890, 1025.980, 200.000)
AddZone("Conference Center", 1046.150, -1804.210, -89.084, 1323.900, -1722.260, 110.916)
AddZone("Richman", 647.557, -1118.280, -89.084, 787.461, -954.662, 110.916)
AddZone("Ocean Flats", -2994.490, 277.411, -9.1, -2867.850, 458.411, 200.000)
AddZone("Greenglass College", 964.391, 930.890, -89.084, 1166.530, 1044.690, 110.916)
AddZone("Glen Park", 1812.620, -1100.820, -89.084, 1994.330, -973.380, 110.916)
AddZone("LVA Freight Depot", 1375.600, 919.447, -89.084, 1457.370, 1203.280, 110.916)
AddZone("Regular Tom", -405.770, 1712.860, -3.0, -276.719, 1892.750, 200.000)
AddZone("Verona Beach", 1161.520, -1722.260, -89.084, 1323.900, -1577.590, 110.916)
AddZone("East Los Santos", 2281.450, -1372.040, -89.084, 2381.680, -1135.040, 110.916)
AddZone("Caligula's Palace", 2137.400, 1703.230, -89.084, 2437.390, 1783.230, 110.916)
AddZone("Idlewood", 1951.660, -1742.310, -89.084, 2124.660, -1602.310, 110.916)
AddZone("Pilgrim", 2624.400, 1383.230, -89.084, 2685.160, 1783.230, 110.916)
AddZone("Idlewood", 2124.660, -1742.310, -89.084, 2222.560, -1494.030, 110.916)
AddZone("Queens", -2533.040, 458.411, 0.000, -2329.310, 578.396, 200.000)
AddZone("Downtown", -1871.720, 1176.420, -4.5, -1620.300, 1274.260, 200.000)
AddZone("Commerce", 1583.500, -1722.260, -89.084, 1758.900, -1577.590, 110.916)
AddZone("East Los Santos", 2381.680, -1454.350, -89.084, 2462.130, -1135.040, 110.916)
AddZone("Marina", 647.712, -1577.590, -89.084, 807.922, -1416.250, 110.916)
AddZone("Richman", 72.648, -1404.970, -89.084, 225.165, -1235.070, 110.916)
AddZone("Vinewood", 647.712, -1416.250, -89.084, 787.461, -1227.280, 110.916)
AddZone("East Los Santos", 2222.560, -1628.530, -89.084, 2421.030, -1494.030, 110.916)
AddZone("Rodeo", 558.099, -1684.650, -89.084, 647.522, -1384.930, 110.916)
AddZone("Easter Tunnel", -1709.710, -833.034, -1.5, -1446.010, -730.118, 200.000)
AddZone("Rodeo", 466.223, -1385.070, -89.084, 647.522, -1235.070, 110.916)
AddZone("Redsands East", 1817.390, 2202.760, -89.084, 2011.940, 2342.830, 110.916)
AddZone("The Clown's Pocket", 2162.390, 1783.230, -89.084, 2437.390, 1883.230, 110.916)
AddZone("Idlewood", 1971.660, -1852.870, -89.084, 2222.560, -1742.310, 110.916)
AddZone("Montgomery Intersection", 1546.650, 208.164, 0.000, 1745.830, 347.457, 200.000)
AddZone("Willowfield", 2089.000, -2235.840, -89.084, 2201.820, -1989.900, 110.916)
AddZone("Temple", 952.663, -1130.840, -89.084, 1096.470, -937.184, 110.916)
AddZone("Prickle Pine", 1848.400, 2553.490, -89.084, 1938.800, 2863.230, 110.916)
AddZone("Los Santos International", 1400.970, -2669.260, -39.084, 2189.820, -2597.260, 60.916)
AddZone("Garver Bridge", -1213.910, 950.022, -89.084, -1087.930, 1178.930, 110.916)
AddZone("Garver Bridge", -1339.890, 828.129, -89.084, -1213.910, 1057.040, 110.916)
AddZone("Kincaid Bridge", -1339.890, 599.218, -89.084, -1213.910, 828.129, 110.916)
AddZone("Kincaid Bridge", -1213.910, 721.111, -89.084, -1087.930, 950.022, 110.916)
AddZone("Verona Beach", 930.221, -2006.780, -89.084, 1073.220, -1804.210, 110.916)
AddZone("Verdant Bluffs", 1073.220, -2006.780, -89.084, 1249.620, -1842.270, 110.916)
AddZone("Vinewood", 787.461, -1130.840, -89.084, 952.604, -954.662, 110.916)
AddZone("Vinewood", 787.461, -1310.210, -89.084, 952.663, -1130.840, 110.916)
AddZone("Commerce", 1463.900, -1577.590, -89.084, 1667.960, -1430.870, 110.916)
AddZone("Market", 787.461, -1416.250, -89.084, 1072.660, -1310.210, 110.916)
AddZone("Rockshore West", 2377.390, 596.349, -89.084, 2537.390, 788.894, 110.916)
AddZone("Julius Thruway North", 2237.400, 2542.550, -89.084, 2498.210, 2663.170, 110.916)
AddZone("East Beach", 2632.830, -1668.130, -89.084, 2747.740, -1393.420, 110.916)
AddZone("Fallow Bridge", 434.341, 366.572, 0.000, 603.035, 555.680, 200.000)
AddZone("Willowfield", 2089.000, -1989.900, -89.084, 2324.000, -1852.870, 110.916)
AddZone("Chinatown", -2274.170, 578.396, -7.6, -2078.670, 744.170, 200.000)
AddZone("El Castillo del Diablo", -208.570, 2337.180, 0.000, 8.430, 2487.180, 200.000)
AddZone("Ocean Docks", 2324.000, -2145.100, -89.084, 2703.580, -2059.230, 110.916)
AddZone("Easter Bay Chemicals", -1132.820, -768.027, 0.000, -956.476, -578.118, 200.000)
AddZone("The Visage", 1817.390, 1703.230, -89.084, 2027.400, 1863.230, 110.916)
AddZone("Ocean Flats", -2994.490, -430.276, -1.2, -2831.890, -222.589, 200.000)
AddZone("Richman", 321.356, -860.619, -89.084, 687.802, -768.027, 110.916)
AddZone("Green Palms", 176.581, 1305.450, -3.0, 338.658, 1520.720, 200.000)
AddZone("Richman", 321.356, -768.027, -89.084, 700.794, -674.885, 110.916)
AddZone("Starfish Casino", 2162.390, 1883.230, -89.084, 2437.390, 2012.180, 110.916)
AddZone("East Beach", 2747.740, -1668.130, -89.084, 2959.350, -1498.620, 110.916)
AddZone("Jefferson", 2056.860, -1372.040, -89.084, 2281.450, -1210.740, 110.916)
AddZone("Downtown Los Santos", 1463.900, -1290.870, -89.084, 1724.760, -1150.870, 110.916)
AddZone("Downtown Los Santos", 1463.900, -1430.870, -89.084, 1724.760, -1290.870, 110.916)
AddZone("Garver Bridge", -1499.890, 696.442, -179.615, -1339.890, 925.353, 20.385)
AddZone("Julius Thruway South", 1457.390, 823.228, -89.084, 2377.390, 863.229, 110.916)
AddZone("East Los Santos", 2421.030, -1628.530, -89.084, 2632.830, -1454.350, 110.916)
AddZone("Greenglass College", 964.391, 1044.690, -89.084, 1197.390, 1203.220, 110.916)
AddZone("Las Colinas", 2747.740, -1120.040, -89.084, 2959.350, -945.035, 110.916)
AddZone("Mulholland", 737.573, -768.027, -89.084, 1142.290, -674.885, 110.916)
AddZone("Ocean Docks", 2201.820, -2730.880, -89.084, 2324.000, -2418.330, 110.916)
AddZone("East Los Santos", 2462.130, -1454.350, -89.084, 2581.730, -1135.040, 110.916)
AddZone("Ganton", 2222.560, -1722.330, -89.084, 2632.830, -1628.530, 110.916)
AddZone("Avispa Country Club", -2831.890, -430.276, -6.1, -2646.400, -222.589, 200.000)
AddZone("Willowfield", 1970.620, -2179.250, -89.084, 2089.000, -1852.870, 110.916)
AddZone("Esplanade North", -1982.320, 1274.260, -4.5, -1524.240, 1358.900, 200.000)
AddZone("The High Roller", 1817.390, 1283.230, -89.084, 2027.390, 1469.230, 110.916)
AddZone("Ocean Docks", 2201.820, -2418.330, -89.084, 2324.000, -2095.000, 110.916)
AddZone("Last Dime Motel", 1823.080, 596.349, -89.084, 1997.220, 823.228, 110.916)
AddZone("Bayside Marina", -2353.170, 2275.790, 0.000, -2153.170, 2475.790, 200.000)
AddZone("King's", -2329.310, 458.411, -7.6, -1993.280, 578.396, 200.000)
AddZone("El Corona", 1692.620, -2179.250, -89.084, 1812.620, -1842.270, 110.916)
AddZone("Blackfield Chapel", 1375.600, 596.349, -89.084, 1558.090, 823.228, 110.916)
AddZone("The Pink Swan", 1817.390, 1083.230, -89.084, 2027.390, 1283.230, 110.916)
AddZone("Julius Thruway West", 1197.390, 1163.390, -89.084, 1236.630, 2243.230, 110.916)
AddZone("Los Flores", 2581.730, -1393.420, -89.084, 2747.740, -1135.040, 110.916)
AddZone("The Visage", 1817.390, 1863.230, -89.084, 2106.700, 2011.830, 110.916)
AddZone("Prickle Pine", 1938.800, 2624.230, -89.084, 2121.400, 2861.550, 110.916)
AddZone("Verona Beach", 851.449, -1804.210, -89.084, 1046.150, -1577.590, 110.916)
AddZone("Robada Intersection", -1119.010, 1178.930, -89.084, -862.025, 1351.450, 110.916)
AddZone("Linden Side", 2749.900, 943.235, -89.084, 2923.390, 1198.990, 110.916)
AddZone("Ocean Docks", 2703.580, -2302.330, -89.084, 2959.350, -2126.900, 110.916)
AddZone("Willowfield", 2324.000, -2059.230, -89.084, 2541.700, -1852.870, 110.916)
AddZone("King's", -2411.220, 265.243, -9.1, -1993.280, 373.539, 200.000)
AddZone("Commerce", 1323.900, -1842.270, -89.084, 1701.900, -1722.260, 110.916)
AddZone("Mulholland", 1269.130, -768.027, -89.084, 1414.070, -452.425, 110.916)
AddZone("Marina", 647.712, -1804.210, -89.084, 851.449, -1577.590, 110.916)
AddZone("Battery Point", -2741.070, 1268.410, -4.5, -2533.040, 1490.470, 200.000)
AddZone("The Four Dragons Casino", 1817.390, 863.232, -89.084, 2027.390, 1083.230, 110.916)
AddZone("Blackfield", 964.391, 1203.220, -89.084, 1197.390, 1403.220, 110.916)
AddZone("Julius Thruway North", 1534.560, 2433.230, -89.084, 1848.400, 2583.230, 110.916)
AddZone("Yellow Bell Gol Course", 1117.400, 2723.230, -89.084, 1457.460, 2863.230, 110.916)
AddZone("Idlewood", 1812.620, -1602.310, -89.084, 2124.660, -1449.670, 110.916)
AddZone("Redsands West", 1297.470, 2142.860, -89.084, 1777.390, 2243.230, 110.916)
AddZone("Doherty", -2270.040, -324.114, -1.2, -1794.920, -222.589, 200.000)
AddZone("Hilltop Farm", 967.383, -450.390, -3.0, 1176.780, -217.900, 200.000)
AddZone("Las Barrancas", -926.130, 1398.730, -3.0, -719.234, 1634.690, 200.000)
AddZone("Pirates in Men's Pants", 1817.390, 1469.230, -89.084, 2027.400, 1703.230, 110.916)
AddZone("City Hall", -2867.850, 277.411, -9.1, -2593.440, 458.411, 200.000)
AddZone("Avispa Country Club", -2646.400, -355.493, 0.000, -2270.040, -222.589, 200.000)
AddZone("The Strip", 2027.400, 863.229, -89.084, 2087.390, 1703.230, 110.916)
AddZone("Hashbury", -2593.440, -222.589, -1.0, -2411.220, 54.722, 200.000)
AddZone("Los Santos International", 1852.000, -2394.330, -89.084, 2089.000, -2179.250, 110.916)
AddZone("Whitewood Estates", 1098.310, 1726.220, -89.084, 1197.390, 2243.230, 110.916)
AddZone("Sherman Reservoir", -789.737, 1659.680, -89.084, -599.505, 1929.410, 110.916)
AddZone("El Corona", 1812.620, -2179.250, -89.084, 1970.620, -1852.870, 110.916)
AddZone("Downtown", -1700.010, 744.267, -6.1, -1580.010, 1176.520, 200.000)
AddZone("Foster Valley", -2178.690, -1250.970, 0.000, -1794.920, -1115.580, 200.000)
AddZone("Las Payasadas", -354.332, 2580.360, 2.0, -133.625, 2816.820, 200.000)
AddZone("Valle Ocultado", -936.668, 2611.440, 2.0, -715.961, 2847.900, 200.000)
AddZone("Blackfield Intersection", 1166.530, 795.010, -89.084, 1375.600, 1044.690, 110.916)
AddZone("Ganton", 2222.560, -1852.870, -89.084, 2632.830, -1722.330, 110.916)
AddZone("Easter Bay Airport", -1213.910, -730.118, 0.000, -1132.820, -50.096, 200.000)
AddZone("Redsands East", 1817.390, 2011.830, -89.084, 2106.700, 2202.760, 110.916)
AddZone("Esplanade East", -1499.890, 578.396, -79.615, -1339.890, 1274.260, 20.385)
AddZone("Caligula's Palace", 2087.390, 1543.230, -89.084, 2437.390, 1703.230, 110.916)
AddZone("Royal Casino", 2087.390, 1383.230, -89.084, 2437.390, 1543.230, 110.916)
AddZone("Richman", 72.648, -1235.070, -89.084, 321.356, -1008.150, 110.916)
AddZone("Starfish Casino", 2437.390, 1783.230, -89.084, 2685.160, 2012.180, 110.916)
AddZone("Mulholland", 1281.130, -452.425, -89.084, 1641.130, -290.913, 110.916)
AddZone("Downtown", -1982.320, 744.170, -6.1, -1871.720, 1274.260, 200.000)
AddZone("Hankypanky Point", 2576.920, 62.158, 0.000, 2759.250, 385.503, 200.000)
AddZone("K.A.C.C. Military Fuels", 2498.210, 2626.550, -89.084, 2749.900, 2861.550, 110.916)
AddZone("Harry Gold Parkway", 1777.390, 863.232, -89.084, 1817.390, 2342.830, 110.916)
AddZone("Bayside Tunnel", -2290.190, 2548.290, -89.084, -1950.190, 2723.290, 110.916)
AddZone("Ocean Docks", 2324.000, -2302.330, -89.084, 2703.580, -2145.100, 110.916)
AddZone("Richman", 321.356, -1044.070, -89.084, 647.557, -860.619, 110.916)
AddZone("Randolph Industrial Estate", 1558.090, 596.349, -89.084, 1823.080, 823.235, 110.916)
AddZone("East Beach", 2632.830, -1852.870, -89.084, 2959.350, -1668.130, 110.916)
AddZone("Flint Water", -314.426, -753.874, -89.084, -106.339, -463.073, 110.916)
AddZone("Blueberry", 19.607, -404.136, 3.8, 349.607, -220.137, 200.000)
AddZone("Linden Station", 2749.900, 1198.990, -89.084, 2923.390, 1548.990, 110.916)
AddZone("Glen Park", 1812.620, -1350.720, -89.084, 2056.860, -1100.820, 110.916)
AddZone("Downtown", -1993.280, 265.243, -9.1, -1794.920, 578.396, 200.000)
AddZone("Redsands West", 1377.390, 2243.230, -89.084, 1704.590, 2433.230, 110.916)
AddZone("Richman", 321.356, -1235.070, -89.084, 647.522, -1044.070, 110.916)
AddZone("Gant Bridge", -2741.450, 1659.680, -6.1, -2616.400, 2175.150, 200.000)
AddZone("Lil' Probe Inn", -90.218, 1286.850, -3.0, 153.859, 1554.120, 200.000)
AddZone("Flint Intersection", -187.700, -1596.760, -89.084, 17.063, -1276.600, 110.916)
AddZone("Las Colinas", 2281.450, -1135.040, -89.084, 2632.740, -945.035, 110.916)
AddZone("Sobell Rail Yards", 2749.900, 1548.990, -89.084, 2923.390, 1937.250, 110.916)
AddZone("The Emerald Isle", 2011.940, 2202.760, -89.084, 2237.400, 2508.230, 110.916)
AddZone("El Castillo del Diablo", -208.570, 2123.010, -7.6, 114.033, 2337.180, 200.000)
AddZone("Santa Flora", -2741.070, 458.411, -7.6, -2533.040, 793.411, 200.000)
AddZone("Playa del Seville", 2703.580, -2126.900, -89.084, 2959.350, -1852.870, 110.916)
AddZone("Market", 926.922, -1577.590, -89.084, 1370.850, -1416.250, 110.916)
AddZone("Queens", -2593.440, 54.722, 0.000, -2411.220, 458.411, 200.000)
AddZone("Pilson Intersection", 1098.390, 2243.230, -89.084, 1377.390, 2507.230, 110.916)
AddZone("Spinybed", 2121.400, 2663.170, -89.084, 2498.210, 2861.550, 110.916)
AddZone("Pilgrim", 2437.390, 1383.230, -89.084, 2624.400, 1783.230, 110.916)
AddZone("Blackfield", 964.391, 1403.220, -89.084, 1197.390, 1726.220, 110.916)
AddZone("'The Big Ear'", -410.020, 1403.340, -3.0, -137.969, 1681.230, 200.000)
AddZone("Dillimore", 580.794, -674.885, -9.5, 861.085, -404.790, 200.000)
AddZone("El Quebrados", -1645.230, 2498.520, 0.000, -1372.140, 2777.850, 200.000)
AddZone("Esplanade North", -2533.040, 1358.900, -4.5, -1996.660, 1501.210, 200.000)
AddZone("Easter Bay Airport", -1499.890, -50.096, -1.0, -1242.980, 249.904, 200.000)
AddZone("Fisher's Lagoon", 1916.990, -233.323, -100.000, 2131.720, 13.800, 200.000)
AddZone("Mulholland", 1414.070, -768.027, -89.084, 1667.610, -452.425, 110.916)
AddZone("East Beach", 2747.740, -1498.620, -89.084, 2959.350, -1120.040, 110.916)
AddZone("San Andreas Sound", 2450.390, 385.503, -100.000, 2759.250, 562.349, 200.000)
AddZone("Shady Creeks", -2030.120, -2174.890, -6.1, -1820.640, -1771.660, 200.000)
AddZone("Market", 1072.660, -1416.250, -89.084, 1370.850, -1130.850, 110.916)
AddZone("Rockshore West", 1997.220, 596.349, -89.084, 2377.390, 823.228, 110.916)
AddZone("Prickle Pine", 1534.560, 2583.230, -89.084, 1848.400, 2863.230, 110.916)
AddZone("Easter Basin", -1794.920, -50.096, -1.04, -1499.890, 249.904, 200.000)
AddZone("Leafy Hollow", -1166.970, -1856.030, 0.000, -815.624, -1602.070, 200.000)
AddZone("LVA Freight Depot", 1457.390, 863.229, -89.084, 1777.400, 1143.210, 110.916)
AddZone("Prickle Pine", 1117.400, 2507.230, -89.084, 1534.560, 2723.230, 110.916)
AddZone("Blueberry", 104.534, -220.137, 2.3, 349.607, 152.236, 200.000)
AddZone("El Castillo del Diablo", -464.515, 2217.680, 0.000, -208.570, 2580.360, 200.000)
AddZone("Downtown", -2078.670, 578.396, -7.6, -1499.890, 744.267, 200.000)
AddZone("Rockshore East", 2537.390, 676.549, -89.084, 2902.350, 943.235, 110.916)
AddZone("San Fierro Bay", -2616.400, 1501.210, -3.0, -1996.660, 1659.680, 200.000)
AddZone("Paradiso", -2741.070, 793.411, -6.1, -2533.040, 1268.410, 200.000)
AddZone("The Camel's Toe", 2087.390, 1203.230, -89.084, 2640.400, 1383.230, 110.916)
AddZone("Old Venturas Strip", 2162.390, 2012.180, -89.084, 2685.160, 2202.760, 110.916)
AddZone("Juniper Hill", -2533.040, 578.396, -7.6, -2274.170, 968.369, 200.000)
AddZone("Juniper Hollow", -2533.040, 968.369, -6.1, -2274.170, 1358.900, 200.000)
AddZone("Roca Escalante", 2237.400, 2202.760, -89.084, 2536.430, 2542.550, 110.916)
AddZone("Julius Thruway East", 2685.160, 1055.960, -89.084, 2749.900, 2626.550, 110.916)
AddZone("Verona Beach", 647.712, -2173.290, -89.084, 930.221, -1804.210, 110.916)
AddZone("Foster Valley", -2178.690, -599.884, -1.2, -1794.920, -324.114, 200.000)
AddZone("Arco del Oeste", -901.129, 2221.860, 0.000, -592.090, 2571.970, 200.000)
AddZone("Fallen Tree", -792.254, -698.555, -5.3, -452.404, -380.043, 200.000)
AddZone("The Farm", -1209.670, -1317.100, 114.981, -908.161, -787.391, 251.981)
AddZone("The Sherman Dam", -968.772, 1929.410, -3.0, -481.126, 2155.260, 200.000)
AddZone("Esplanade North", -1996.660, 1358.900, -4.5, -1524.240, 1592.510, 200.000)
AddZone("Financial", -1871.720, 744.170, -6.1, -1701.300, 1176.420, 300.000)
AddZone("Garcia", -2411.220, -222.589, -1.14, -2173.040, 265.243, 200.000)
AddZone("Montgomery", 1119.510, 119.526, -3.0, 1451.400, 493.323, 200.000)
AddZone("Creek", 2749.900, 1937.250, -89.084, 2921.620, 2669.790, 110.916)
AddZone("Los Santos International", 1249.620, -2394.330, -89.084, 1852.000, -2179.250, 110.916)
AddZone("Santa Maria Beach", 72.648, -2173.290, -89.084, 342.648, -1684.650, 110.916)
AddZone("Mulholland Intersection", 1463.900, -1150.870, -89.084, 1812.620, -768.027, 110.916)
AddZone("Angel Pine", -2324.940, -2584.290, -6.1, -1964.220, -2212.110, 200.000)
AddZone("Verdant Meadows", 37.032, 2337.180, -3.0, 435.988, 2677.900, 200.000)
AddZone("Octane Springs", 338.658, 1228.510, 0.000, 664.308, 1655.050, 200.000)
AddZone("Come-A-Lot", 2087.390, 943.235, -89.084, 2623.180, 1203.230, 110.916)
AddZone("Redsands West", 1236.630, 1883.110, -89.084, 1777.390, 2142.860, 110.916)
AddZone("Santa Maria Beach", 342.648, -2173.290, -89.084, 647.712, -1684.650, 110.916)
AddZone("Verdant Bluffs", 1249.620, -2179.250, -89.084, 1692.620, -1842.270, 110.916)
AddZone("Las Venturas Airport", 1236.630, 1203.280, -89.084, 1457.370, 1883.110, 110.916)
AddZone("Flint Range", -594.191, -1648.550, 0.000, -187.700, -1276.600, 200.000)
AddZone("Verdant Bluffs", 930.221, -2488.420, -89.084, 1249.620, -2006.780, 110.916)
AddZone("Palomino Creek", 2160.220, -149.004, 0.000, 2576.920, 228.322, 200.000)
AddZone("Ocean Docks", 2373.770, -2697.090, -89.084, 2809.220, -2330.460, 110.916)
AddZone("Easter Bay Airport", -1213.910, -50.096, -4.5, -947.980, 578.396, 200.000)
AddZone("Whitewood Estates", 883.308, 1726.220, -89.084, 1098.310, 2507.230, 110.916)
AddZone("Calton Heights", -2274.170, 744.170, -6.1, -1982.320, 1358.900, 200.000)
AddZone("Easter Basin", -1794.920, 249.904, -9.1, -1242.980, 578.396, 200.000)
AddZone("Los Santos Inlet", -321.744, -2224.430, -89.084, 44.615, -1724.430, 110.916)
AddZone("Doherty", -2173.040, -222.589, -1.0, -1794.920, 265.243, 200.000)
AddZone("Mount Chiliad", -2178.690, -2189.910, -47.917, -2030.120, -1771.660, 576.083)
AddZone("Fort Carson", -376.233, 826.326, -3.0, 123.717, 1220.440, 200.000)
AddZone("Foster Valley", -2178.690, -1115.580, 0.000, -1794.920, -599.884, 200.000)
AddZone("Ocean Flats", -2994.490, -222.589, -1.0, -2593.440, 277.411, 200.000)
AddZone("Fern Ridge", 508.189, -139.259, 0.000, 1306.660, 119.526, 200.000)
AddZone("Bayside", -2741.070, 2175.150, 0.000, -2353.170, 2722.790, 200.000)
AddZone("Las Venturas Airport", 1457.370, 1203.280, -89.084, 1777.390, 1883.110, 110.916)
AddZone("Blueberry Acres", -319.676, -220.137, 0.000, 104.534, 293.324, 200.000)
AddZone("Palisades", -2994.490, 458.411, -6.1, -2741.070, 1339.610, 200.000)
AddZone("North Rock", 2285.370, -768.027, 0.000, 2770.590, -269.740, 200.000)
AddZone("Hunter Quarry", 337.244, 710.840, -115.239, 860.554, 1031.710, 203.761)
AddZone("Los Santos International", 1382.730, -2730.880, -89.084, 2201.820, -2394.330, 110.916)
AddZone("Missionary Hill", -2994.490, -811.276, 0.000, -2178.690, -430.276, 200.000)
AddZone("San Fierro Bay", -2616.400, 1659.680, -3.0, -1996.660, 2175.150, 200.000)
AddZone("Restricted Area", -91.586, 1655.050, -50.000, 421.234, 2123.010, 250.000)
AddZone("Mount Chiliad", -2997.470, -1115.580, -47.917, -2178.690, -971.913, 576.083)
AddZone("Mount Chiliad", -2178.690, -1771.660, -47.917, -1936.120, -1250.970, 576.083)
AddZone("Easter Bay Airport", -1794.920, -730.118, -3.0, -1213.910, -50.096, 200.000)
AddZone("The Panopticon", -947.980, -304.320, -1.1, -319.676, 327.071, 200.000)
AddZone("Shady Creeks", -1820.640, -2643.680, -8.0, -1226.780, -1771.660, 200.000)
AddZone("Back o Beyond", -1166.970, -2641.190, 0.000, -321.744, -1856.030, 200.000)
AddZone("Mount Chiliad", -2994.490, -2189.910, -47.917, -2178.690, -1115.580, 576.083)
AddZone("Tierra Robada", -1213.910, 596.349, -242.990, -480.539, 1659.680, 900.000)
AddZone("Flint County", -1213.910, -2892.970, -242.990, 44.615, -768.027, 900.000)
AddZone("Whetstone", -2997.470, -2892.970, -242.990, -1213.910, -1115.580, 900.000)
AddZone("Bone County", -480.539, 596.349, -242.990, 869.461, 2993.870, 900.000)
AddZone("Tierra Robada", -2997.470, 1659.680, -242.990, -480.539, 2993.870, 900.000)
AddZone("San Fierro", -2997.470, -1115.580, -242.990, -1213.910, 1659.680, 900.000)
AddZone("Las Venturas", 869.461, 596.349, -242.990, 2997.060, 2993.870, 900.000)
AddZone("Red County", -1213.910, -768.027, -242.990, 2997.060, 596.349, 900.000)
AddZone("Los Santos", 44.615, -2892.970, -242.990, 2997.060, -768.027, 900.000)
}
AddZone(sName, x1, y1, z1, x2, y2, z2) {
global
zone%nZone%_name := sName
zone%nZone%_x1 := x1
zone%nZone%_y1 := y1
zone%nZone%_z1 := z1
zone%nZone%_x2 := x2
zone%nZone%_y2 := y2
zone%nZone%_z2 := z2
nZone := nZone + 1
}
AddCity(sName, x1, y1, z1, x2, y2, z2) {
global
city%nCity%_name := sName
city%nCity%_x1 := x1
city%nCity%_y1 := y1
city%nCity%_z1 := z1
city%nCity%_x2 := x2
city%nCity%_y2 := y2
city%nCity%_z2 := z2
nCity := nCity + 1
}
checkHandles() {
if(iRefreshHandles+500>A_TickCount)
return true
iRefreshHandles:=A_TickCount
if(!refreshGTA() || !refreshSAMP() || !refreshMemory()) {
return false
} else {
return true
}
return true
}
refreshGTA() {
newPID := getPID("GTA:SA:MP")
if(!newPID) {
if(hGTA) {
virtualFreeEx(hGTA, pMemory, 0, 0x8000)
closeProcess(hGTA)
hGTA := 0x0
}
dwGTAPID := 0
hGTA := 0x0
dwSAMP := 0x0
pMemory := 0x0
return false
}
if(!hGTA || (dwGTAPID != newPID)) {
hGTA := openProcess(newPID)
if(ErrorLevel) {
dwGTAPID := 0
hGTA := 0x0
dwSAMP := 0x0
pMemory := 0x0
return false
}
dwGTAPID := newPID
dwSAMP := 0x0
pMemory := 0x0
return true
}
return true
}
refreshSAMP() {
if(dwSAMP)
return true
dwSAMP := getModuleBaseAddress("samp.dll", hGTA)
if(!dwSAMP)
return false
return true
}
refreshMemory() {
if(!pMemory) {
pMemory     := virtualAllocEx(hGTA, 4096, 0x1000 | 0x2000, 0x40)
if(ErrorLevel) {
pMemory := 0x0
return false
}
pParam1     := pMemory
pParam2     := pMemory + 1024
pParam3     := pMemory + 2048
pInjectFunc := pMemory + 3072
}
return true
}
getPID(szWindow) {
local dwPID := 0
WinGet, dwPID, PID, %szWindow%
return dwPID
}
openProcess(dwPID, dwRights = 0x1F0FFF) {
hProcess := DllCall("OpenProcess"
, "UInt", dwRights
, "int",  0
, "UInt", dwPID
, "Uint")
if(hProcess == 0) {
ErrorLevel := ERROR_OPEN_PROCESS
return 0
}
ErrorLevel := ERROR_OK
return hProcess
}
closeProcess(hProcess) {
if(hProcess == 0) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
dwRet := DllCall(    "CloseHandle"
, "Uint", hProcess
, "UInt")
ErrorLevel := ERROR_OK
}
getModuleBaseAddress(sModule, hProcess) {
if(!sModule) {
ErrorLevel := ERROR_MODULE_NOT_FOUND
return 0
}
if(!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
dwSize = 1024*4
VarSetCapacity(hMods, dwSize)
VarSetCapacity(cbNeeded, 4)
dwRet := DllCall(    "Psapi.dll\EnumProcessModules"
, "UInt", hProcess
, "UInt", &hMods
, "UInt", dwSize
, "UInt*", cbNeeded
, "UInt")
if(dwRet == 0) {
ErrorLevel := ERROR_ENUM_PROCESS_MODULES
return 0
}
dwMods := cbNeeded / 4
i := 0
VarSetCapacity(hModule, 4)
VarSetCapacity(sCurModule, 260)
while(i < dwMods) {
hModule := NumGet(hMods, i*4)
DllCall("Psapi.dll\GetModuleFileNameEx"
, "UInt", hProcess
, "UInt", hModule
, "Str", sCurModule
, "UInt", 260)
SplitPath, sCurModule, sFilename
if(sModule == sFilename) {
ErrorLevel := ERROR_OK
return hModule
}
i := i + 1
}
ErrorLevel := ERROR_MODULE_NOT_FOUND
return 0
}
readString(hProcess, dwAddress, dwLen) {
if(!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
VarSetCapacity(sRead, dwLen)
dwRet := DllCall(    "ReadProcessMemory"
, "UInt", hProcess
, "UInt", dwAddress
, "Str", sRead
, "UInt", dwLen
, "UInt*", 0
, "UInt")
if(dwRet == 0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
ErrorLevel := ERROR_OK
if A_IsUnicode
return __ansiToUnicode(sRead)
return sRead
}
readFloat(hProcess, dwAddress) {
if(!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
VarSetCapacity(dwRead, 4)
dwRet := DllCall(    "ReadProcessMemory"
, "UInt",  hProcess
, "UInt",  dwAddress
, "Str",   dwRead
, "UInt",  4
, "UInt*", 0
, "UInt")
if(dwRet == 0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
ErrorLevel := ERROR_OK
return NumGet(dwRead, 0, "Float")
}
readDWORD(hProcess, dwAddress) {
if(!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
VarSetCapacity(dwRead, 4)
dwRet := DllCall(    "ReadProcessMemory"
, "UInt",  hProcess
, "UInt",  dwAddress
, "Str",   dwRead
, "UInt",  4
, "UInt*", 0)
if(dwRet == 0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
ErrorLevel := ERROR_OK
return NumGet(dwRead, 0, "UInt")
}
readMem(hProcess, dwAddress, dwLen=4, type="UInt") {
if(!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
VarSetCapacity(dwRead, dwLen)
dwRet := DllCall(    "ReadProcessMemory"
, "UInt",  hProcess
, "UInt",  dwAddress
, "Str",   dwRead
, "UInt",  dwLen
, "UInt*", 0)
if(dwRet == 0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
ErrorLevel := ERROR_OK
return NumGet(dwRead, 0, type)
}
writeString(hProcess, dwAddress, wString) {
if(!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return false
}
sString := wString
if A_IsUnicode
sString := __unicodeToAnsi(wString)
dwRet := DllCall(    "WriteProcessMemory"
, "UInt", hProcess
, "UInt", dwAddress
, "Str", sString
, "UInt", StrLen(wString) + 1
, "UInt", 0
, "UInt")
if(dwRet == 0) {
ErrorLEvel := ERROR_WRITE_MEMORY
return false
}
ErrorLevel := ERROR_OK
return true
}
writeRaw(hProcess, dwAddress, pBuffer, dwLen) {
if(!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return false
}
dwRet := DllCall(    "WriteProcessMemory"
, "UInt", hProcess
, "UInt", dwAddress
, "UInt", pBuffer
, "UInt", dwLen
, "UInt", 0
, "UInt")
if(dwRet == 0) {
ErrorLEvel := ERROR_WRITE_MEMORY
return false
}
ErrorLevel := ERROR_OK
return true
}
callWithParams(hProcess, dwFunc, aParams, bCleanupStack = true) {
if(!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return false
}
validParams := 0
i := aParams.MaxIndex()
dwLen := i * 5    + 5    + 1
if(bCleanupStack)
dwLen += 3
VarSetCapacity(injectData, i * 5    + 5       + 3       + 1, 0)
i_ := 1
while(i > 0) {
if(aParams[i][1] != "") {
dwMemAddress := 0x0
if(aParams[i][1] == "p") {
dwMemAddress := aParams[i][2]
} else if(aParams[i][1] == "s") {
if(i_>3)
return false
dwMemAddress := pParam%i_%
writeString(hProcess, dwMemAddress, aParams[i][2])
if(ErrorLevel)
return false
i_ += 1
} else if(aParams[i][1] == "i") {
dwMemAddress := aParams[i][2]
} else {
return false
}
NumPut(0x68, injectData, validParams * 5, "UChar")
NumPut(dwMemAddress, injectData, validParams * 5 + 1, "UInt")
validParams += 1
}
i -= 1
}
offset := dwFunc - ( pInjectFunc + validParams * 5 + 5 )
NumPut(0xE8, injectData, validParams * 5, "UChar")
NumPut(offset, injectData, validParams * 5 + 1, "Int")
if(bCleanupStack) {
NumPut(0xC483, injectData, validParams * 5 + 5, "UShort")
NumPut(validParams*4, injectData, validParams * 5 + 7, "UChar")
NumPut(0xC3, injectData, validParams * 5 + 8, "UChar")
} else {
NumPut(0xC3, injectData, validParams * 5 + 5, "UChar")
}
writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
if(ErrorLevel)
return false
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
if(ErrorLevel)
return false
waitForSingleObject(hThread, 0xFFFFFFFF)
closeProcess(hThread)
return true
}
virtualAllocEx(hProcess, dwSize, flAllocationType, flProtect) {
if(!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
dwRet := DllCall(    "VirtualAllocEx"
, "UInt", hProcess
, "UInt", 0
, "UInt", dwSize
, "UInt", flAllocationType
, "UInt", flProtect
, "UInt")
if(dwRet == 0) {
ErrorLEvel := ERROR_ALLOC_MEMORY
return 0
}
ErrorLevel := ERROR_OK
return dwRet
}
virtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType) {
if(!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
dwRet := DllCall(    "VirtualFreeEx"
, "UInt", hProcess
, "UInt", lpAddress
, "UInt", dwSize
, "UInt", dwFreeType
, "UInt")
if(dwRet == 0) {
ErrorLEvel := ERROR_FREE_MEMORY
return 0
}
ErrorLevel := ERROR_OK
return dwRet
}
createRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId) {
if(!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
dwRet := DllCall(    "CreateRemoteThread"
, "UInt", hProcess
, "UInt", lpThreadAttributes
, "UInt", dwStackSize
, "UInt", lpStartAddress
, "UInt", lpParameter
, "UInt", dwCreationFlags
, "UInt", lpThreadId
, "UInt")
if(dwRet == 0) {
ErrorLEvel := ERROR_ALLOC_MEMORY
return 0
}
ErrorLevel := ERROR_OK
return dwRet
}
waitForSingleObject(hThread, dwMilliseconds) {
if(!hThread) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
dwRet := DllCall(    "WaitForSingleObject"
, "UInt", hThread
, "UInt", dwMilliseconds
, "UInt")
if(dwRet == 0xFFFFFFFF) {
ErrorLEvel := ERROR_WAIT_FOR_OBJECT
return 0
}
ErrorLevel := ERROR_OK
return dwRet
}
__ansiToUnicode(sString, nLen = 0) {
If !nLen
{
nLen := DllCall("MultiByteToWideChar"
, "Uint", 0
, "Uint", 0
, "Uint", &sString
, "int",  -1
, "Uint", 0
, "int",  0)
}
VarSetCapacity(wString, nLen * 2)
DllCall("MultiByteToWideChar"
, "Uint", 0
, "Uint", 0
, "Uint", &sString
, "int",  -1
, "Uint", &wString
, "int",  nLen)
return wString
}
__unicodeToAnsi(wString, nLen = 0) {
pString := wString + 1 > 65536 ? wString : &wString
If !nLen
{
nLen := DllCall("WideCharToMultiByte"
, "Uint", 0
, "Uint", 0
, "Uint", pString
, "int",  -1
, "Uint", 0
, "int",  0
, "Uint", 0
, "Uint", 0)
}
VarSetCapacity(sString, nLen)
DllCall("WideCharToMultiByte"
, "Uint", 0
, "Uint", 0
, "Uint", pString
, "int",  -1
, "str",  sString
, "int",  nLen
, "Uint", 0
, "Uint", 0)
return sString
}
restartGameEx() {
if(!checkHandles())
return -1
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
dwFunc := dwSAMP + 0xA060
VarSetCapacity(injectData, 11, 0)
NumPut(0xB9, injectData, 0, "UChar")
NumPut(dwAddress, injectData, 1, "UInt")
NumPut(0xE8, injectData, 5, "UChar")
offset := dwFunc - (pInjectFunc + 10)
NumPut(offset, injectData, 6, "Int")
NumPut(0xC3, injectData, 10, "UChar")
writeRaw(hGTA, pInjectFunc, &injectData, 11)
if(ErrorLevel)
return false
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
if(ErrorLevel)
return false
waitForSingleObject(hThread, 0xFFFFFFFF)
return true
}
disconnectEx() {
if(!checkHandles())
return 0
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
dwAddress := readDWORD(hGTA, dwAddress + 0x3c9)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
ecx := dwAddress
dwAddress := readDWORD(hGTA, dwAddress)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
VarSetCapacity(injectData, 24, 0)
NumPut(0xB9, injectData, 0, "UChar")
NumPut(ecx, injectData, 1, "UInt")
NumPut(0xB8, injectData, 5, "UChar")
NumPut(dwAddress, injectData, 6, "UInt")
NumPut(0x68, injectData, 10, "UChar")
NumPut(0, injectData, 11, "UInt")
NumPut(0x68, injectData, 15, "UChar")
NumPut(500, injectData, 16, "UInt")
NumPut(0x50FF, injectData, 20, "UShort")
NumPut(0x08, injectData, 22, "UChar")
NumPut(0xC3, injectData, 23, "UChar")
writeRaw(hGTA, pInjectFunc, &injectData, 24)
if(ErrorLevel)
return false
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
if(ErrorLevel)
return false
waitForSingleObject(hThread, 0xFFFFFFFF)
return true
}
setrestart()
{
VarSetCapacity(old, 4, 0)
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
NumPut(9,old,0,"Int")
writeRaw(hGTA, dwAddress + 957, &old, 4)
}
restart()
{
restartGameEx()
disconnectEx()
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: The Game is Restarting ...")
Sleep 1000
setrestart()
}
sendDeath() {
if(!checkHandles())
return -1
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
dwAddress := readDWORD(hGTA, dwAddress + SAMP_PPOOLS_OFFSET)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
dwPlayers := readDWORD(hGTA, dwAddress + SAMP_PPOOL_PLAYER_OFFSET)
if(ErrorLevel || dwPlayers==0) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
dwAddress := readDWORD(hGTA, dwPlayers + 34)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
dwFunc := dwSAMP + 0x55E0
VarSetCapacity(injectData, 13, 0)
NumPut(0xB9, injectData, 0, "UChar")
NumPut(dwAddress, injectData, 1, "UInt")
NumPut(0x51, injectData, 5, "UChar")
NumPut(0xE8, injectData, 6, "UChar")
offset := dwFunc - (pInjectFunc + 11)
NumPut(offset, injectData, 7, "Int")
NumPut(0x59, injectData, 11, "UChar")
NumPut(0xC3, injectData, 12, "UChar")
writeRaw(hGTA, pInjectFunc, &injectData, 13)
if(ErrorLevel)
return false
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
if(ErrorLevel)
return false
waitForSingleObject(hThread, 0xFFFFFFFF)
return true
}
setmarkers()
{
if(!checkHandles())
return false
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return false
}
psett := readDWORD(hGTA, dwAddress + 965)
if(ErrorLevel || psett==0) {
ErrorLevel := ERROR_READ_MEMORY
return false
}
tobin(bla, "01")
writeRaw(hGTA, psett+48, &bla, 1)
if(ErrorLevel)
return false
str := "5589E55383EC04C745F800000000817DF8EB0300007F2C8B45F88D0C85000000008B5D088B45F88D1485000000008B45088B04020DFF0000008904198D45F8FF00EBCB83C4045B5DC20400"
tobin(injectData, str)
writeRaw(hGTA, pInjectFunc, &injectData, strlen(str)/2)
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, dwSAMP+0x216378, 0, 0)
if(ErrorLevel)
return false
waitForSingleObject(hThread, 0xFFFFFFFF)
return true
}
tobin(byref addr, str)
{
if(!RegExMatch(str,"^([a-fA-F0-9][a-fA-F0-9])*$"))
{
msgbox % "fail tobin"
return
}
i:=Strlen(str)/2
VarSetCapacity(addr, i)
dataddr := &addr
x:=""
loop,parse,str
{
if(A_Index & 1)
x := A_Loopfield
else
{
DllCall("RtlFillMemory"
, "UInt", dataddr
, "UInt", 1
, "UChar", "0x" x A_Loopfield)
dataddr++
}
}
}

//
#NoEnv
imp_server := "http://datenbank.safebeit.me/improv3d.php"
imp_pin := 6379
imp_read(table, a, b) {
global imp_server
query := imp_server "?action=read&table=" table "&a=" a "&b=" b imp_secure()
return imp_query(query)
}
imp_read_where(table, a, b, c) {
global imp_server
query := imp_server "?action=read_where&table=" table "&where=" a "&is=" b "&column=" c imp_secure()
return imp_query(query)
}
imp_read_where_not(table, a, b, c) {
global imp_server
query := imp_server "?action=read_where_not&table=" table "&where=" a "&is=" b "&column=" c imp_secure()
return imp_query(query)
}
imp_read_where_greater(table, a, b, c) {
global imp_server
query := imp_server "?action=read_where_greater&table=" table "&where=" a "&is=" b "&column=" c imp_secure()
return imp_query(query)
}
imp_read_where_less(table, a, b, c) {
global imp_server
query := imp_server "?action=read_where_less&table=" table "&where=" a "&is=" b "&column=" c imp_secure()
return imp_query(query)
}
imp_write(table, a, b, c) {
global imp_server
query := imp_server "?action=write&table=" table "&a=" a "&b=" b "&c=" c imp_secure()
return imp_query(query)
}
imp_compare(table, a, b, c) {
global imp_server
query := imp_server "?action=compare&table=" table "&a=" a "&b=" b "&c=" c imp_secure()
return imp_query(query)
}
imp_create_row(table, a) {
global imp_server
query := imp_server "?action=create_row&table=" table "&a=" a imp_secure()
return imp_query(query)
}
imp_delete_row(table, a) {
global imp_server
query := imp_server "?action=delete_row&table=" table "&row=" a imp_secure()
return imp_query(query)
}
imp_create_table(table, a) {
global imp_server
query := imp_server "?action=create_table&name=" table "&columns=" a imp_secure()
return imp_query(query)
}
imp_delete_table(table) {
global imp_server
query := imp_server "?action=delete_table&name=" table imp_secure()
return imp_query(query)
}
imp_list_columns(table) {
global imp_server
query := imp_server "?action=list_columns&table=" table imp_secure()
return imp_query(query)
}
imp_list_rows(table) {
global imp_server
query := imp_server "?action=list_rows&table=" table imp_secure()
return imp_query(query)
}
imp_add_column(table, a) {
global imp_server
query := imp_server "?action=add_column&table=" table "&column=" a imp_secure()
return imp_query(query)
}
imp_delete_column(table, a) {
global imp_server
query := imp_server "?action=delete_column&table=" table "&column=" a imp_secure()
return imp_query(query)
}
imp_rename_column(table, a, b) {
global imp_server
query := imp_server "?action=rename_column&table=" table "&column=" a "&newname=" b imp_secure()
return imp_query(query)
}
imp_row_exist(table, a) {
global imp_server
query := imp_server "?action=row_exist&table=" table "&row=" a imp_secure()
return imp_query(query)
}
imp_exec(a) {
global imp_server
query := imp_server "?action=exec&query=" a imp_secure()
return imp_query(query)
}
imp_hash(a, b = "md5") {
global imp_server
query := imp_server "?action=hash&str=" a "&algo=" b imp_secure()
return imp_query(query)
}
imp_mail(a, c, b = "E-Mail") {
global imp_server
query := imp_server "?action=mail&to=" a "&subject=" b "&message=" c imp_secure()
return imp_query(query)
}
imp_table_exist(table) {
global imp_server
query := imp_server "?action=table_exist&name=" table imp_secure()
return imp_query(query)
}
imp_count_rows(table) {
global imp_server
query := imp_server "?action=count_rows&table=" table imp_secure()
return imp_query(query)
}
imp_get_row(table, a) {
global imp_server
query := imp_server "?table=" table "&action=get_row&row=" a imp_secure()
return imp_query(query)
}
imp_set_column(table, a, b, c) {
global imp_server
query := imp_server "?table=" table "&action=set_column&column=" a "&type=" b "&len=" c imp_secure()
return imp_query(query)
}
imp_check_table(table) {
global imp_server
query := imp_server "?table=" table "&action=check_table" imp_secure()
return imp_query(query)
}
imp_file_write(file, content = "", mode = "end") {
global imp_server
query := imp_server "?action=file_write&file=" file "&content=" content "&mode=" mode imp_secure()
return imp_query(query)
}
imp_file_read(file) {
global imp_server
query := imp_server "?action=file_read&file=" file imp_secure()
return imp_query(query)
}
imp_file_delete(file) {
global imp_server
query := imp_server "?action=file_delete&file=" file imp_secure()
return imp_query(query)
}
imp_file_rename(file, name) {
global imp_server
query := imp_server "?action=file_rename&file=" file "&name=" name imp_secure()
return imp_query(query)
}
imp_file_exists(file) {
global imp_server
query := imp_server "?action=file_exists&file=" file imp_secure()
return imp_query(query)
}
imp_file_copy(file, dest) {
global imp_server
query := imp_server "?action=file_copy&file=" file "&dest=" dest imp_secure()
return imp_query(query)
}
imp_file_size(file, unit = "b") {
global imp_server
query := imp_server "?action=file_get_size&file=" file "&unit=" unit imp_secure()
return imp_query(query)
}
imp_query(a) {
urlDownloadToFile, %a%, %A_Temp%/response.tmp
FileRead, response, %A_Temp%/response.tmp
FileDelete, %A_Temp%/response.tmp
if(response)
{
regex = <!--imp_return="(.*)"-->
response := RegExMatch(response, regex, match)
return match1
}
else
return 0
}
imp_secure() {
global imp_pin
if(imp_pin > 0)
return "&key=" round(A_Hour * imp_pin, 4)
}

//
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
IniRead, DonatorKey, Config.ini, Key, DonatorKey
Gui, Key:Add, GroupBox, x12 y30 w180 h50 , Donator Key:
Gui, Key:Add, Edit, x22 y50 w160 h20 vDonatorKey, %DonatorKey%
Gui, Key:Add, Button, x12 y90 w180 h20 gCheckKey , Start
Gui, Key:Font, s10, Verdana
Gui, Key:Add, Text, x12 y8 w180 h20 +Center, Safebeit - License System
Gui, Key:Show, w204 h117, Safebeit
return
CheckKey:
Gui, Key:Submit,NoHide
IniWrite, %DonatorKey%, Config.ini, Key, DonatorKey
donator := imp_read("donators",  "" DonatorKey "", "computer_name")
if ( A_ComputerName !=  donator )
{
MsgBox, 16, !!Authorization Failed!!, Unknown Hardware ID!`nSafebeit closes shortly., 3
Premium = 0
ExitApp
}
else
{
MsgBox, 4144, !!Authorization Successful!!, Database entry found.`nSafebeit start in 3 seconds..., 3
Premium = 1
Gui, Key:Hide
}
IniRead, WindowName, Config.ini, WinName, WindowName
Gui, Home:Add, Text, x22 y80 w80 h20 , Window Name:
Gui, Home:Add, Edit, x102 y80 w170 h20 vWindowName , %WindowName%
Gui, Home:Add, Button, x102 y110 w170 h20 gSave , Save
Gui, Home:Add, GroupBox, x12 y59 w270 h85 , Configurations
Gui, Home:Add, Text, x12 y40 w90 h20 , Private Version
Gui, Home:Add, Text, x252 y40 w30 h20 , 0.1.5
Gui, Home:Add, Text, x182 y40 w70 h20 , [0.3.7] (R1)
Gui, Home:Font, s15, Verdana
Gui, Home:Add, Text, x12 y10 w270 h30 +Center, Safebeit
Gui, Home:Show, w294 h155, Safebeit
IniRead, FW_Menu_Y, Config.ini, Overlay, FW_Menu_Y, 90
Loop,
{
If ( WinActive("" WindowName "") )
DestroyAllVisual()
Break
Sleep 500
ExitApp
}
Init()
DestroyAllVisual()
FW_Init()
Leiste_Oben_Overlay = -1
AttachonPlayerHackStatus = 0
SetTimer, LeisteOben, 100
SetTimer, MinusHPShow, 200
SetTimer, MinusARShow, 200
SetParam("use_window", "1")
SetParam("window", "" WindowName "")
global windowNameOfSAMP := "" WindowName ""
global nameOfSAMPDLL := "samp.dll"
global UserInRange := ""
global SAMP_TARGETINFOGAMETEXTID		:= 1
global SAMP_TARGETINFOGAMETEXTDURATION 	:= 0
global SAMP_SHOWUSERINOVERLAYFORRANGEOF	:= 500
global SAMP_SLAPHEIGHT 					:= 8
sampDLL := GetAdressOfDLLByWindowName(windowNameOfSAMP, nameOfSAMPDLL)
global cheats := {}
cheats[1] := Object("name", "name", "address", sampDLL + 0x70F1A , "newInstruction", "9090909090", "origInstruction", "E8B1AD0300", "description", "You can see names through walls")
cheats[2] := Object("name", "hp", "address", sampDLL + 0x6FE0A , "newInstruction", "9090909090", "origInstruction", "E8C1BE0300", "description", "You can see hp through walls")
cheats[3] := Object("name", "namer", "address", sampDLL + 0x70E24 , "newInstruction", "909090909090", "origInstruction", "0F8A71010000", "description", "You can see names to streaming range")
cheats[4] := Object("name", "hpr", "address", sampDLL + 0x6FD14 , "newInstruction", "909090909090", "origInstruction", "0F8A50010000", "description", "You can see hp to streaming range")
cheats[5] := Object("name", "norecoil", "address", 0x740450 , "newInstruction", "90909090909090909090", "origInstruction", "D80D3C8B8500D84C241C", "description", "No Recoil")
cheats[6] := Object("name", "antibikefall", "address", 0x4BA3B9 , "newInstruction", "E9A703000090", "origInstruction", "0F84A6030000", "description", "You can't fall from a bike")
cheats[7] := Object("name", "nocareject", "address", sampDLL + 0x146E0 , "newInstruction", "C390909090", "origInstruction", "E9D7722700", "description", "You can't be ejected from a car")
cheats[8] := Object("name", "antifreeze", "address", sampDLL + 0x168E0 , "newInstruction", "C390909090", "origInstruction", "E9F6212500", "description", "You can't be freezed")
cheats[9] := Object("name", "starteveryengine", "address", sampDLL + 0xB1CB4 , "newInstruction", "C7415001000000C20400", "origInstruction", "894150C20400CCCCCCCC", "description", "All engines are started")
cheats[10] := Object("name", "disableanims", "address", sampDLL + 0x16FA0 , "newInstruction", "C3", "origInstruction", "55", "description", "You can't do any animation")
return
:?:/re::
restart()
return
MinusHPShow:
If(GetPlayerHealth() != Healthalt)
{
HP_Schaden := Healthalt - GetPlayerHealth()
Healthalt := GetPlayerHealth()
If(HP_Schaden > 1 and HP_Schaden < 200)
{
ShowGameText("~r~-~w~" HP_Schaden "~b~HP", 500, 4)
}
}
return
MinusARShow:
If(GetPlayerArmor() != Armoralt)
{
AR_Schaden := Armoralt - GetPlayerArmor()
Armoralt := GetPlayerArmor()
If(AR_Schaden > 1 and AR_Schaden < 200)
{
ShowGameText("~r~-~w~" AR_Schaden "~b~AR", 500, 4)
}
}
return
LeisteOben:
If(Leiste_Oben_Overlay == -1)
{
SetParam("use_window", "1")
SetParam("window", "" WindowName "")
Leiste_Oben_Overlay_Box_1 := BoxCreate(0,573,800,30,0x99000000, true)
Leiste_Oben_Overlay_Box_2 := BoxCreate(0,588,800,1,0xFF000000, true)
Leiste_Oben_Overlay_Box_3 := BoxCreate(0,573,800,1.5,0xFFFFFFFF, true)
Leiste_Oben_Overlay_HP := TextCreate("Arial", 4, true, false, 1, 588, 0xFFFFFFFF, "", true, true)
Leiste_Oben_Overlay_FPS := TextCreate("Arial", 5, true, false, 727, 590, 0xFFEC6262, "", true, true)
Leiste_Oben_Overlay := TextCreate("Arial", 5, true, false, 40, 590, 0xFFFFFFFF, "", true, true)
Leiste_Oben_Overlay_1 := TextCreate("Arial", 4, true, false, 5, 574, 0xFFFFFFFF, "", true, true)
Leiste_Oben_Overlay_2 := TextCreate("Arial", 5, true, false, 750, 590, 0xFFEC6262, "", true, true)
Leiste_Oben_Overlay_3 := TextCreate("Arial", 6, true, false, 3, 562, 0xFFFFFFFF, "", true, true)
}
else
{
coords := getCoordinates()
varName := getUsername()
varID := getPlayerIdByName(varName)
FormatTime, Time
updateOScoreboardData()
updateScoreboardDataEx()
TextSetString(Leiste_Oben_Overlay_HP, " Armor: " Player_Armor "`nHealth: " GetPlayerHealth() " ")
TextSetString(Leiste_Oben_Overlay, "<< Vehicle: {EC62C0}" Vehicle_Health "{FFFFFF} >>   << Location: {7BEC62}"calculateCity(coords[1], coords[2], coords[3])", "calculateZone(coords[1], coords[2], coords[3])"{FFFFFF} >>        [ {EC62A7}"coords[1]", "coords[2]", "coords[3]"{FFFFFF} ]   |- {B45F04}0x320{FFFFFF} ")
TextSetString(Leiste_Oben_Overlay_1, "Private Version  |      [" GODMODEFarbe "G0DM0DE{FFFFFF}]   [" PulseHealthFarbe "PulseHealth{FFFFFF}]   [" GravityFarbe "Gravity{FFFFFF}]   [" MegaJumpFarbe "Mega Jump{FFFFFF}]   [" InfinityrunFarbe "Infinity Run{FFFFFF}]   [" DriveOnWaterFarbe "Drive On Water{FFFFFF}]   [" PerfectHandlingFarbe "Perfect Handling{FFFFFF}]   [" InfinityNitroFarbe "Infinity Nitro{FFFFFF}]   [" NoReload_Inf_Ammo_Farbe "NoReload/Inf. Ammo{FFFFFF}]   [" OnlyWheelsFarbe "Only Wheels{FFFFFF}]   [" HighBikeJumpFarbe "High Bike Jump{FFFFFF}]`n                                [" AntiFreezeFarbe "Anti Freeze{FFFFFF}]   [" NoAnimsFarbe "No Anims{FFFFFF}]   [" NoCarEjectFarbe "No Car Eject{FFFFFF}]   [" AllEnginesOnFarbe "All Engines On{FFFFFF}]   [" NoSpreadFarbe "No Spread{FFFFFF}]   [" NametagFarbe "Nametag{FFFFFF}]   [" antibikefallofFarbe "Anti Bike Fall Of{FFFFFF}]   [" LagcsFarbe "Lag.cs{FFFFFF}]   [" AttachonPlayerFarbe "Attach on Player{FFFFFF}]")
TextSetString(Leiste_Oben_Overlay_FPS, "FPS: "GetFrameRate()" ")
TextSetString(Leiste_Oben_Overlay_2, "| " getPlayerPingById(varID) " |   AHKBASE.EU ")
TextSetString(Leiste_Oben_Overlay_3, "Safebeit 0.3.7 [R1]    |    "  Time " ")
if ( GetPlayerArmor() > 1 )
Player_Armor := GetPlayerArmor()
else
Player_Armor := "{0xB51D1D}No Armor{0xFFFFFF}"
if ( isPlayerInAnyVehicle() )
Vehicle_Health := getVehicleHealth()
else
Vehicle_Health := "{0xB51D1D}No Vehicle found!{0xFFFFFF}"
}
return
:?:/spamstop::
SetTimer, Spambot, off
AddChatMessage("{0174DF}[Safebeit] [Spambot]{FFFFFF}: Der Spambot wurde {BF00FF}ausgeschlatet{FFFFFF}.")
return
:?:/spam::
Suspend, permit
SendInput /spam{SPACE}
input,spammessage,V I M,{enter}
SetTimer, Spambot, 1000
AddChatMessage("{0174DF}[Safebeit] [Spambot]{FFFFFF}: Der Text: {BF00FF}" spammessage "{FFFFFF} wird nun gespamt.")
return
Spambot:
++ spamcount
SendChat("<< " spamcount " >> : " spammessage "")
return
NumpadAdd::
SetVehicleSpeedMultiplier(+ 2)
return
Numpad5::
SetVehicleSpeedZ(0.5)
return
NumpadSub::
myPos := getCoordinates()
scale := 20
gtaHandle := OpenHandleByName(windowNameOfSAMP)
cped := Memory_Read(gtaHandle, 0xB6F5F0 )
rotation := Memory_ReadFloat(gtaHandle, cped + 0x55C )
CloseHandle(gtaHandle)
myPos[1] += sin(-rotation) * scale
myPos[2] +=  cos(-rotation) * scale
myPos[3] +=  1
TeleportToPosition(myPos[1], myPos[2], myPos[3])
return
F11::
Insert::
FW_Menu("N", "Safebeit", "{FE2E64}[Player Hacks],- Health Hack,- Armor Hack,- Mega Jump,- Infinity Run,- Anti Freeze,- No Anims,- Teleport,{F7D358}[Vehicle Hacks],- Vehicle Health,- Teleport Vehicle,- Drive on Water,- Perfect Handling,- Infinity Nitro,- Only Wheels,- High Bike Jump,- No Car Eject,- All Engines On,- Anti Bike Fall Of,{2E64FE}[Weapon Hacks],- No Spread,- NoReload&Unl. Ammo,{FF00FF}[Server Hacks],- Gravity Hack,- Money Hack,- Nametag Hack,{81F781}[Rage Hacks], >> G0DM0DE :D,- PulseHealth,- Lag.cs in .exe || WHUUT ?")
return
FW_Menu_Label_Safebeit_1:
FW_Menu("N", "Player Hacks", "Ist nur eine Kategorie...`nMenÃ¼ neu Ã¶ffnen!")
return
FW_Menu_Label_Safebeit_9:
FW_Menu("N", "Vehicle Hacks", "Ist nur eine Kategorie...`nMenÃ¼ neu Ã¶ffnen!")
return
FW_Menu_Label_Safebeit_20:
FW_Menu("N", "Weapon Hacks", "Ist nur eine Kategorie...`nMenÃ¼ neu Ã¶ffnen!")
return
FW_Menu_Label_Safebeit_23:
FW_Menu("N", "Server Hacks", "Ist nur eine Kategorie...`nMenÃ¼ neu Ã¶ffnen!")
return
FW_Menu_Label_Safebeit_27:
FW_Menu("N", "Rage Hacks", "Ist nur eine Kategorie...`nMenÃ¼ neu Ã¶ffnen!")
return
FW_Menu_Label_Safebeit_2:
FW_Menu("N", "Health", "error")
FW_Menu("N", "Health", "+100,+75,+50,+25,-25,-50,-75,-100")
return
FW_Menu_Label_Safebeit_3:
FW_Menu("N", "Armor", "error")
FW_Menu("N", "Armor", "+100,+75,+50,+25,-25,-50,-75,-100")
return
FW_Menu_Label_Safebeit_4:
FW_Menu("N", "Mega_Jump", "error")
FW_Menu("N", "Mega_Jump", "ON,OFF")
return
FW_Menu_Label_Safebeit_5:
FW_Menu("N", "Infinity_run", "error")
FW_Menu("N", "Infinity_run", "ON,OFF")
return
FW_Menu_Label_Safebeit_6:
FW_Menu("N", "Anti_Freeze", "error")
FW_Menu("N", "Anti_Freeze", "ON,OFF")
return
FW_Menu_Label_Safebeit_7:
FW_Menu("N", "No_Anims", "error")
FW_Menu("N", "No_Anims", "ON,OFF")
return
FW_Menu_Label_Safebeit_8:
FW_Menu("N", "Teleport", "error")
FW_Menu("N", "Teleport", "Teleport to nearest Player,Attach on Player,Teleport to Mappoint")
return
FW_Menu_Label_Safebeit_10:
FW_Menu("N", "Vehicle_Health", "error")
FW_Menu("N", "Vehicle_Health", "100%,75%,50%,25%,-25%,-50%,-75%,-100%")
return
FW_Menu_Label_Safebeit_11:
FW_Menu("N", "Vehicle_Teleport", "error")
FW_Menu("N", "Vehicle_Teleport", "Teleport last Vehicle")
return
FW_Menu_Label_Safebeit_12:
FW_Menu("N", "Drive_On_Water", "error")
FW_Menu("N", "Drive_On_Water", "ON,OFF")
return
FW_Menu_Label_Safebeit_13:
FW_Menu("N", "Perfect_Handling", "error")
FW_Menu("N", "Perfect_Handling", "ON,OFF")
return
FW_Menu_Label_Safebeit_14:
FW_Menu("N", "Infinity_Nitro", "error")
FW_Menu("N", "Infinity_Nitro", "ON,OFF")
return
FW_Menu_Label_Safebeit_15:
FW_Menu("N", "Only_Wheels", "error")
FW_Menu("N", "Only_Wheels", "ON,OFF")
return
FW_Menu_Label_Safebeit_16:
FW_Menu("N", "High_Bike_Jump", "error")
FW_Menu("N", "High_Bike_Jump", "ON,OFF")
return
FW_Menu_Label_Safebeit_17:
FW_Menu("N", "No_Car_Eject", "error")
FW_Menu("N", "No_Car_Eject", "ON,OFF")
return
FW_Menu_Label_Safebeit_18:
FW_Menu("N", "All_Engines_On", "error")
FW_Menu("N", "All_Engines_On", "ON,OFF")
return
FW_Menu_Label_Safebeit_19:
FW_Menu("N", "anti_bike_fall_of", "error")
FW_Menu("N", "anti_bike_fall_of", "ON,OFF")
return
FW_Menu_Label_Safebeit_21:
FW_Menu("N", "No_Spread", "error")
FW_Menu("N", "No_Spread", "ON,OFF")
return
FW_Menu_Label_Safebeit_22:
FW_Menu("N", "NoReload_Inf_Ammo", "error")
FW_Menu("N", "NoReload_Inf_Ammo", "ON,OFF")
return
FW_Menu_Label_Safebeit_24:
FW_Menu("N", "Gravity", "error")
FW_Menu("N", "Gravity", "Normal,Low Gravity,High Gravity")
return
FW_Menu_Label_Safebeit_25:
FW_Menu("N", "Money_Hack", "error")
FW_Menu("N", "Money_Hack", "999.999.999$,50.000.000$,1.000.000$,500.000$,100.000$,1.000$")
return
FW_Menu_Label_Safebeit_26:
FW_Menu("N", "Nametag", "error")
FW_Menu("N", "Nametag", "ON,OFF")
return
FW_Menu_Label_Safebeit_28:
FW_Menu("N", "GODMODE", "error")
FW_Menu("N", "GODMODE", "ON,OFF")
return
FW_Menu_Label_Safebeit_29:
FW_Menu("N", "PulseHealth", "error")
FW_Menu("N", "PulseHealth", "ON,OFF")
FW_Menu_Label_Safebeit_30:
FW_Menu("N", "Lag_cs", "error")
FW_Menu("N", "Lag_cs", "ON,OFF")
return
FW_Menu_Label_Lag_cs_1:
if(premium = 1)
{
LagcsFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Lag_cs wurde {3ADF00}Aktiviert{FFFFFF}.")
SetTimer, Lagcs, 250
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Lag_cs_2:
if(premium = 1)
{
LagcsFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Lag_cs wurde {FE2E64}Deaktiviert{FFFFFF}.")
SetTimer, Lagcs, 1000
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
lagcs:
LagExe(1)
sleep 1000
LagExe(0)
sleep 1000
return
Numpad9::
executeCheat("nodmgbyweapon")
return
FW_Menu_Label_Teleport_1:
if(premium = 1)
{
dist := 0x7fffffff
p := getStreamedInPlayersInfo()
if(!p || p == "") {
return
}
lpos := getCoordinates()
if(!lpos) {
return
}
id := -1
for i, o in p
{
t := getDist(lpos,o.POS)
if(t<dist && isNPCById(i) == 0)
{
dist := t
coordsOfnearestPlayer := o.POS
id := i
}
}
if (!coordsOfnearestPlayer[1] || !coordsOfnearestPlayer[2] || !coordsOfnearestPlayer[3]) {
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Kein Spieler in Streaming nÃ¤he!")
return
}
if (coordsOfnearestPlayer[1] == 0 || coordsOfnearestPlayer[2] == 0 || coordsOfnearestPlayer[3] == 0) {
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Kein Spieler in Streaming nÃ¤he!")
return
}
TeleportToPosition(coordsOfnearestPlayer[1],coordsOfnearestPlayer[2] + 1,coordsOfnearestPlayer[3])
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Du wurdest zu {BF00FF}" getPlayerNameById(id) "{FFFFFF} Teleportiert.")
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Teleport_2:
if(premium = 1)
{
if(AttachonPlayerHackStatus = 0)
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Attach_on_Player wurde {3ADF00}Aktiviert{FFFFFF}.")
AttachonPlayerFarbe := "{01DF01}"
SetTimer, AttachonPlayer, 1
AttachonPlayerHackStatus = 1
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Attach_on_Player wurde {FE2E64}Deaktiviert{FFFFFF}.")
AttachonPlayerFarbe := "{FFFFFF}"
SetTimer, AttachonPlayer, off
AttachonPlayerHackStatus = 0
}
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
AttachonPlayer:
dist := 0x7fffffff
p := getStreamedInPlayersInfo()
if(!p || p == "") {
return
}
lpos := getCoordinates()
if(!lpos) {
return
}
id := -1
for i, o in p
{
t := getDist(lpos,o.POS)
if(t<dist && isNPCById(i) == 0)
{
dist := t
coordsOfnearestPlayer := o.POS
id := i
}
}
if (!coordsOfnearestPlayer[1] || !coordsOfnearestPlayer[2] || !coordsOfnearestPlayer[3]) {
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Kein Spieler in Streaming nÃ¤he!")
return
}
if (coordsOfnearestPlayer[1] == 0 || coordsOfnearestPlayer[2] == 0 || coordsOfnearestPlayer[3] == 0) {
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Kein Spieler in Streaming nÃ¤he!")
return
}
TeleportToPosition(coordsOfnearestPlayer[1] + 3,coordsOfnearestPlayer[2],coordsOfnearestPlayer[3])
return
FW_Menu_Label_Teleport_3:
if(premium = 1)
{
gtaHandle := OpenHandleByName(windowNameOfSAMP)
mapX := Memory_ReadFloat(gtaHandle, 0xBA67B8 )
mapY := Memory_ReadFloat(gtaHandle, 0xBA67BC )
if (mapX == 0 || mapY == 0) {
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Fehler! {BF00FF}Standart{FFFFFF} Position.")
return
}
CloseHandle(gtaHandle)
TeleportToPosition(mapX, mapY, 400)
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Du wurdest zu {BF00FF}" mapX "  " mapY "{FFFFFF} Teleportiert.")
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_anti_bike_fall_of_1:
if(premium = 1)
{
antibikefallofFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Anti_Bike_Fall_Of wurde {3ADF00}Aktiviert{FFFFFF}.")
executeCheat("antibikefall")
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_anti_bike_fall_of_2:
if(premium = 1)
{
antibikefallofFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Anti_Bike_Fall_Of wurde {FE2E64}Deaktiviert{FFFFFF}.")
executeCheat("antibikefall")
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Anti_Freeze_1:
if(premium = 1)
{
AntiFreezeFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Anti_Freeze wurde {3ADF00}Aktiviert{FFFFFF}.")
executeCheat("antifreeze")
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Anti_Freeze_2:
if(premium = 1)
{
AntiFreezeFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Anti_Freeze wurde {FE2E64}Deaktiviert{FFFFFF}.")
executeCheat("antifreeze")
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_No_Anims_1:
if(premium = 1)
{
NoAnimsFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: No_Anims wurde {3ADF00}Aktiviert{FFFFFF}.")
executeCheat("disableanims")
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_No_Anims_2:
if(premium = 1)
{
NoAnimsFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: No_Anims wurde {FE2E64}Deaktiviert{FFFFFF}.")
executeCheat("disableanims")
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_No_Car_Eject_1:
if(premium = 1)
{
NoCarEjectFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: No_Car_Eject wurde {3ADF00}Aktiviert{FFFFFF}.")
executeCheat("nocareject")
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_No_Car_Eject_2:
if(premium = 1)
{
NoCarEjectFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: No_Car_Eject wurde {FE2E64}Deaktiviert{FFFFFF}.")
executeCheat("nocareject")
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_All_Engines_On_1:
if(premium = 1)
{
AllEnginesOnFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: All_Engines_On wurde {3ADF00}Aktiviert{FFFFFF}.")
executeCheat("starteveryengine")
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_All_Engines_On_2:
if(premium = 1)
{
AllEnginesOnFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: All_Engines_On wurde {FE2E64}Deaktiviert{FFFFFF}.")
executeCheat("starteveryengine")
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_No_Spread_1:
if(premium = 1)
{
NoSpreadFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: No_Spread wurde {3ADF00}Aktiviert{FFFFFF}.")
executeCheat("norecoil")
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_No_Spread_2:
if(premium = 1)
{
NoSpreadFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: No_Spread wurde {FE2E64}Deaktiviert{FFFFFF}.")
executeCheat("norecoil")
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Nametag_1:
if(premium = 1)
{
NametagFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Nametag wurde {3ADF00}Aktiviert{FFFFFF}.")
executeCheat("hp")
executeCheat("name")
executeCheat("hpr")
executeCheat("namer")
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Nametag_2:
if(premium = 1)
{
NametagFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Nametag wurde {FE2E64}Deaktiviert{FFFFFF}.")
executeCheat("hp")
executeCheat("name")
executeCheat("hpr")
executeCheat("namer")
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Only_Wheels_1:
OnlyWheelsFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Only_Wheels wurde {3ADF00}Aktiviert{FFFFFF}.")
OnlyWheels(1)
return
FW_Menu_Label_Only_Wheels_2:
OnlyWheelsFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Only_Wheels wurde {FE2E64}Deaktiviert{FFFFFF}.")
OnlyWheels(0)
return
FW_Menu_Label_High_Bike_Jump_1:
if(premium = 1)
{
HighBikeJumpFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: High_Bike_Jump wurde {3ADF00}Aktiviert{FFFFFF}.")
HighBikeJump(1)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_High_Bike_Jump_2:
if(premium = 1)
{
HighBikeJumpFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: High_Bike_Jump wurde {FE2E64}Deaktiviert{FFFFFF}.")
HighBikeJump(0)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Mega_Jump_1:
MegaJumpFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: MegaJump wurde {3ADF00}Aktiviert{FFFFFF}.")
MegaJump(1)
return
FW_Menu_Label_Mega_Jump_2:
MegaJumpFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: MegaJump wurde {FE2E64}Deaktiviert{FFFFFF}.")
MegaJump(0)
return
FW_Menu_Label_Infinity_run_1:
InfinityrunFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Infinity_run wurde {3ADF00}Aktiviert{FFFFFF}.")
Infinityrun(1)
return
FW_Menu_Label_Infinity_run_2:
InfinityrunFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Infinity_run wurde {FE2E64}Deaktiviert{FFFFFF}.")
Infinityrun(0)
return
FW_Menu_Label_Vehicle_Teleport_1:
if(premium = 1)
{
coords := GetCoordinates()
TeleportVehicle(coords[1], coords[2], coords[3])
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Drive_On_Water_1:
if(premium = 1)
{
DriveOnWaterFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Drive_On_Water wurde {3ADF00}Aktiviert{FFFFFF}.")
DriveOnWater(1)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Drive_On_Water_2:
if(premium = 1)
{
DriveOnWaterFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Drive_On_Water wurde {FE2E64}Deaktiviert{FFFFFF}.")
DriveOnWater(0)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Perfect_Handling_1:
if(premium = 1)
{
PerfectHandlingFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Perfect_Handling wurde {3ADF00}Aktiviert{FFFFFF}.")
PerfectHandling(1)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Perfect_Handling_2:
if(premium = 1)
{
PerfectHandlingFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Perfect_Handling wurde {FE2E64}Deaktiviert{FFFFFF}.")
PerfectHandling(0)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Infinity_Nitro_1:
if(premium = 1)
{
InfinityNitroFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Infinity_Nitro wurde {3ADF00}Aktiviert{FFFFFF}.")
InfinityNitro(1)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Infinity_Nitro_2:
if(premium = 1)
{
InfinityNitroFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Infinity_Nitro wurde {FE2E64}Deaktiviert{FFFFFF}.")
InfinityNitro(0)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_NoReload_Inf_Ammo_1:
if(premium = 1)
{
NoReload_Inf_Ammo_Farbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: NoReload_InfinityAmmo wurde {3ADF00}Aktiviert{FFFFFF}.")
InfinityAmmo(1)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_NoReload_Inf_Ammo_2:
if(premium = 1)
{
NoReload_Inf_Ammo_Farbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: NoReload_InfinityAmmo wurde {FE2E64}Deaktiviert{FFFFFF}.")
InfinityAmmo(0)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_PulseHealth_1:
if(premium = 1)
{
PulseHealthFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PulseHealth wurde {3ADF00}Aktiviert{FFFFFF}.")
SetTimer, PulseHealth, 1800
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
PulseHealth:
SetPlayerHealth(90)
SetPlayerArmor(10)
sleep 100
SetPlayerHealth(80)
SetPlayerArmor(20)
sleep 100
SetPlayerHealth(70)
SetPlayerArmor(30)
sleep 100
SetPlayerHealth(60)
SetPlayerArmor(40)
sleep 100
SetPlayerHealth(50)
SetPlayerArmor(50)
sleep 100
SetPlayerHealth(40)
SetPlayerArmor(60)
sleep 100
SetPlayerHealth(30)
SetPlayerArmor(70)
sleep 100
SetPlayerHealth(20)
SetPlayerArmor(80)
sleep 100
SetPlayerHealth(10)
SetPlayerArmor(90)
sleep 100
SetPlayerHealth(20)
SetPlayerArmor(80)
sleep 100
SetPlayerHealth(30)
SetPlayerArmor(70)
sleep 100
SetPlayerHealth(40)
SetPlayerArmor(60)
sleep 100
SetPlayerHealth(50)
SetPlayerArmor(50)
sleep 100
SetPlayerHealth(60)
SetPlayerArmor(40)
sleep 100
SetPlayerHealth(70)
SetPlayerArmor(30)
sleep 100
SetPlayerHealth(80)
SetPlayerArmor(20)
sleep 100
SetPlayerHealth(90)
SetPlayerArmor(10)
sleep 100
SetPlayerHealth(100)
sleep 100
return
FW_Menu_Label_PulseHealth_2:
if(premium = 1)
{
PuleHealthFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PulseHealth wurde {FE2E64}Deaktiviert{FFFFFF}.")
SetTimer, PulseHealth, off
SetPlayerHealth(100)
SetPlayerArmor(0)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_GODMODE_1:
if(premium = 1)
{
GODMODEFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: G0DM0DE wurde {3ADF00}Aktiviert{FFFFFF}.")
SetTimer, GODMODE, 250
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
GODMODE:
SetPlayerHealth(99999999)
SetVehicleHealth(99999999)
return
FW_Menu_Label_GODMODE_2:
if(premium = 1)
{
GODMODEFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: G0DM0DE wurde {FE2E64}Deaktiviert{FFFFFF}.")
SetTimer, GODMODE, off
SetPlayerHealth(100)
SetVehicleHealth(1000)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Gravity_1:
GravityFarbe := "{FFFFFF}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Gravity wurde auf {BF00FF}Standart{FFFFFF} gesetzt.")
SetGravity(0.008)
return
FW_Menu_Label_Gravity_2:
GravityFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Gravity wurde auf {BF00FF}Low{FFFFFF} gesetzt.")
SetGravity(0.001)
return
FW_Menu_Label_Gravity_3:
GravityFarbe := "{01DF01}"
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Gravity wurde auf {BF00FF}High{FFFFFF} gesetzt.")
SetGravity(0.016)
return
FW_Menu_Label_Money_Hack_1:
if(premium = 1)
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Geld wurde auf {BF00FF}999.999.999${FFFFFF} gesetzt.")
SetMoney(+ 999999999)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Money_Hack_2:
if(premium = 1)
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Geld wurde auf {BF00FF}50.000.000${FFFFFF} gesetzt.")
SetMoney(+ 50000000)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Money_Hack_3:
if(premium = 1)
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Geld wurde auf {BF00FF}1.000.000${FFFFFF} gesetzt.")
SetMoney(+ 1000000)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Money_Hack_4:
if(premium = 1)
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Geld wurde auf {BF00FF}500.000${FFFFFF} gesetzt.")
SetMoney(+ 500.000)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Money_Hack_5:
if(premium = 1)
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Geld wurde auf {BF00FF}100.000${FFFFFF} gesetzt.")
SetMoney(+ 100000)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Money_Hack_6:
if(premium = 1)
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Geld wurde auf {BF00FF}1.000${FFFFFF} gesetzt.")
SetMoney(+ 1000)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Vehicle_Health_1:
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: VehicleHealth wurde auf {BF00FF}+ 100%{FFFFFF} gesetzt.")
SetVehicleHealth(getVehicleHealth() + 1000)
return
FW_Menu_Label_Vehicle_Health_2:
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: VehicleHealth wurde auf {BF00FF}+ 75%{FFFFFF} gesetzt.")
SetVehicleHealth(getVehicleHealth() + 750)
return
FW_Menu_Label_Vehicle_Health_3:
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: VehicleHealth wurde auf {BF00FF}+ 50%{FFFFFF} gesetzt.")
SetVehicleHealth(getVehicleHealth() + 500)
return
FW_Menu_Label_Vehicle_Health_4:
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: VehicleHealth wurde auf {BF00FF}+ 25%{FFFFFF} gesetzt.")
SetVehicleHealth(getVehicleHealth() + 250)
return
FW_Menu_Label_Vehicle_Health_5:
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: VehicleHealth wurde auf {BF00FF}- 25%{FFFFFF} gesetzt.")
SetVehicleHealth(getVehicleHealth() - 250)
return
FW_Menu_Label_Vehicle_Health_6:
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: VehicleHealth wurde auf {BF00FF}- 50%{FFFFFF} gesetzt.")
SetVehicleHealth(getVehicleHealth() - 500)
return
FW_Menu_Label_Vehicle_Health_7:
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: VehicleHealth wurde auf {BF00FF}- 75%{FFFFFF} gesetzt.")
SetVehicleHealth(getVehicleHealth() - 750)
return
FW_Menu_Label_Vehicle_Health_8:
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: VehicleHealth wurde auf {BF00FF}- 100%{FFFFFF} gesetzt.")
SetVehicleHealth(getVehicleHealth() - 1000)
return
FW_Menu_Label_Armor_1:
if(premium = 1)
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerArmor wurde auf {BF00FF}+ 100{FFFFFF} gesetzt.")
SetPlayerArmor(GetPlayerArmor() + 100)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Armor_2:
if(premium = 1)
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerArmor wurde auf {BF00FF}+ 75{FFFFFF} gesetzt.")
SetPlayerArmor(GetPlayerArmor() + 75)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Armor_3:
if(premium = 1)
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerArmor wurde auf {BF00FF}+ 50{FFFFFF} gesetzt.")
SetPlayerArmor(GetPlayerArmor() + 50)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Armor_4:
if(premium = 1)
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerArmor wurde auf {BF00FF}+ 25{FFFFFF} gesetzt.")
SetPlayerArmor(GetPlayerArmor() + 25)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerArmor wurde auf {BF00FF}+ 25{FFFFFF} gesetzt.")
SetPlayerArmor(GetPlayerArmor() + 25)
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Dies kannst du jede 3 Sekunden da du kein {BF00FF}Premium{FFFFFF} nutzer bist..")
sleep 3000
}
return
FW_Menu_Label_Armor_5:
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerArmor wurde auf {BF00FF}- 25{FFFFFF} gesetzt.")
SetPlayerArmor(GetPlayerArmor() - 25)
return
FW_Menu_Label_Armor_6:
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerArmor wurde auf {BF00FF}- 50{FFFFFF} gesetzt.")
SetPlayerArmor(GetPlayerArmor() - 50)
return
FW_Menu_Label_Armor_7:
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerArmor wurde auf {BF00FF}- 75{FFFFFF} gesetzt.")
SetPlayerArmor(GetPlayerArmor() - 75)
return
FW_Menu_Label_Armor_8:
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerArmor wurde auf {BF00FF}- 100{FFFFFF} gesetzt.")
SetPlayerArmor(GetPlayerArmor() - 100)
return
FW_Menu_Label_Health_1:
if(premium = 1)
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerHealth wurde auf {BF00FF}+ 100{FFFFFF} gesetzt.")
SetPlayerHealth(GetPlayerHealth() + 100)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Health_2:
if(premium = 1)
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerHealth wurde auf {BF00FF}+ 75{FFFFFF} gesetzt.")
SetPlayerHealth(GetPlayerHealth() + 75)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Health_3:
if(premium = 1)
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerHealth wurde auf {BF00FF}+ 50{FFFFFF} gesetzt.")
SetPlayerHealth(GetPlayerHealth() + 50)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Diese Funktion ist nur fÃ¼r {BF00FF}Premium{FFFFFF} nutzer verfÃ¼gbar.")
}
return
FW_Menu_Label_Health_4:
if(premium = 1)
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerHealth wurde auf {BF00FF}+ 25{FFFFFF} gesetzt.")
SetPlayerHealth(GetPlayerHealth() + 25)
}
else
{
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerHealth wurde auf {BF00FF}+ 25{FFFFFF} gesetzt.")
SetPlayerHealth(GetPlayerHealth() + 25)
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: Dies kannst du jede 3 Sekunden da du kein {BF00FF}Premium{FFFFFF} nutzer bist..")
sleep 3000
}
return
FW_Menu_Label_Health_5:
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerHealth wurde auf {BF00FF}- 25{FFFFFF} gesetzt.")
SetPlayerHealth(GetPlayerHealth() - 25)
return
FW_Menu_Label_Health_6:
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerHealth wurde auf {BF00FF}- 50{FFFFFF} gesetzt.")
SetPlayerHealth(GetPlayerHealth() - 50)
return
FW_Menu_Label_Health_7:
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerHealth wurde auf {BF00FF}- 75{FFFFFF} gesetzt.")
SetPlayerHealth(GetPlayerHealth() - 75)
return
FW_Menu_Label_Health_8:
AddChatMessage("{0174DF}[Safebeit]{FFFFFF}: PlayerHealth wurde auf {BF00FF}- 100{FFFFFF} gesetzt.")
SetPlayerHealth(GetPlayerHealth() - 100)
return
FW_Menu_Up:
If ( FW_Menu_Item = 1 )
return
TextUpdate(FW_Menu_Item_%FW_Menu_Item%, "Calibri", 8, false, false)
FW_Menu_Item--
TextUpdate(FW_Menu_Item_%FW_Menu_Item%, "Calibri", 9, true, false)
FW_Menu_Item_Current := FW_Menu_Item_Text_%FW_Menu_Item%
return
FW_Menu_Down:
If ( FW_Menu_Item = FW_Menu_Item_Count )
return
TextUpdate(FW_Menu_Item_%FW_Menu_Item%, "Calibri", 8, false, false)
FW_Menu_Item++
TextUpdate(FW_Menu_Item_%FW_Menu_Item%, "Calibri", 9, true, false)
FW_Menu_Item_Current := FW_Menu_Item_Text_%FW_Menu_Item%
return
FW_Menu_Enter:
Goto, FW_Menu_Label_%FW_Menu_Current%_%FW_Menu_Item%
return
FW_Init()
{
global
FW_Menu_Box := BoxCreate(0, FW_Menu_Y - 5, 0, FW_Menu_Height, 0xB4000000, false)
FW_Menu_Box_Info := BoxCreate(0, 0, 0, 14, 0x00000000, false)
FW_Infobox_Box := BoxCreate(25, 350, 80, 20, 0xB4000000, false)
FW_Infobox_Text := TextCreate("Calibri", 9, false, false, 30, 353, 0xFFFFFFFF, "error", false, false)
Loop, 30
FW_Menu_Item_%A_Index% := TextCreate("Calibri", 8, false, false, 10, FW_Menu_Y + ( A_Index - 1 ) * 15, 0xFFFFFFFF, "error", false, false)
TextUpdate(FW_Menu_Item_1, "Calibri", 9, true, false)
FW_Menu_Text_Name := TextCreate("Calibri", 7, false, false, 0, 0, 0xFFFFFFFF, "Private Version", false, false)
FW_Menu_Text_Menu := TextCreate("Calibri", 8, false, false, 0, 0, 0xFFFFFFFF, "Main", false, false)
FW_Menu_Inited = 1
return
}
FW_Menu(type, menu, list)
{
global
If ( ! FW_Menu )
{
FW_Menu_Type := type
FW_Menu_Current := menu
TextSetString(FW_Menu_Text_Menu, menu)
StringSplit, FW_Menu_Item_Text_, list, % ","
FW_Menu_Item_Count := FW_Menu_Item_Text_0
TextUpdate(FW_Menu_Item_%FW_Menu_Item%, "Calibri", 8, false, false)
FW_Menu_Item = 1
TextUpdate(FW_Menu_Item_%FW_Menu_Item%, "Calibri", 9, true, false)
FW_Menu_Item_Current := FW_Menu_Item_Text_%FW_Menu_Item%
FW_Menu_Item_Current := FW_Menu_Item_Text_1
If ( FW_Menu_Item_Count < 30 )
Heightmultiplier := FW_Menu_Item_Count
Else
Heightmultiplier := 30
FW_Menu_Height := Heightmultiplier * 15 + 10
BoxSetHeight(FW_Menu_Box, FW_Menu_Height)
BoxSetPos(FW_Menu_Box_Info, 0, FW_Menu_Y + FW_Menu_Height - 4)
BoxSetShown(FW_Menu_Box, true)
Loop, 10
{
FW_Menu_Width := A_Index * 15 - ( A_Index ** 1.1 )
BoxSetWidth(FW_Menu_Box, FW_Menu_Width)
Sleep(10, "P")
}
BoxSetWidth(FW_Menu_Box_Info, FW_Menu_Width)
TextSetPos(FW_Menu_Text_Name, FW_Menu_Width - 45, FW_Menu_Y + FW_Menu_Height)
TextSetPos(FW_Menu_Text_Menu, 10, FW_Menu_Y + FW_Menu_Height - 4)
Loop, %FW_Menu_Item_Count%
{
StringLen, Length, FW_Menu_Item_Text_%A_Index%
StringTrimRight, FW_Menu_Item_Text_Display_%A_Index%, FW_Menu_Item_Text_%A_Index%, Length - 30
TextSetString(FW_Menu_Item_%A_Index%, FW_Menu_Item_Text_Display_%A_Index%)
TextSetShown(FW_Menu_Item_%A_Index%, true)
}
Hotkey, Up, FW_Menu_Up, On
Hotkey, Down, FW_Menu_Down, On
Hotkey, Enter, FW_Menu_Enter, On
BoxSetShown(FW_Menu_Box_Info, true)
BoxSetColor(FW_Menu_Box_Info, 0x32000000)
Sleep(50, "P")
BoxSetColor(FW_Menu_Box_Info, 0x64000000)
Sleep(50, "P")
BoxSetColor(FW_Menu_Box_Info, 0x96000000)
Sleep(50, "P")
BoxSetColor(FW_Menu_Box_Info, 0xC8000000)
Sleep(50, "P")
BoxSetColor(FW_Menu_Box_Info, 0xFF000000)
TextSetShown(FW_Menu_Text_Name, true)
TextSetShown(FW_Menu_Text_Menu, true)
FW_Menu = 1
}
Else
{
Loop, %FW_Menu_Item_Count%
TextSetShown(FW_Menu_Item_%A_Index%, false)
TextSetShown(FW_Menu_Text_Name, false)
TextSetShown(FW_Menu_Text_Menu, false)
BoxSetShown(FW_Menu_Box_Info, false)
Index = 10
Loop, 9
{
Index--
BoxSetWidth(FW_Menu_Box, Index * 15 - ( A_Index ** 1.1 ))
Sleep(10, "P")
}
BoxSetShown(FW_Menu_Box, false)
Hotkey, Up, FW_Menu_Up, Off
Hotkey, Down, FW_Menu_Down, Off
Hotkey, Enter, FW_Menu_Enter, Off
FW_Menu = 0
}
return
}
LagExe(var)
{
global
HWNDCheck()
return WriteMemoryPointer(hwnd, 0x96916D, var, "byte", 4)
}
GiveJet(var)
{
global
HWNDCheck()
return WriteMemory(hwnd, 0x439600, var, "byte", 4)
}
SetMoney(var)
{
global
HWNDCheck()
return WriteMemory(hwnd, 0xB7CE50, var, "byte", 4)
}
OnlyWheels(var)
{
global
HWNDCheck()
return WriteMemory(hwnd, 0x96914B, var, "byte", 4)
}
HighBikeJump(var)
{
global
HWNDCheck()
return WriteMemory(hwnd, 0x969161, var, "byte", 4)
}
PerfectHandling(var)
{
global
HWNDCheck()
return WriteMemory(hwnd, 0x96914C, var, "byte", 4)
}
DriveOnWater(var)
{
global
HWNDCheck()
return WriteMemory(hwnd, 0x969152, var, "byte", 4)
}
InfinityNitro(var)
{
global
HWNDCheck()
return WriteMemory(hwnd, 0x969165, var, "byte", 4)
}
InfinityAmmo(var)
{
global
HWNDCheck()
return WriteMemory(hwnd, 0x969178, var, "byte", 4)
}
MegaJump(var)
{
global
HWNDCheck()
return WriteMemory(hwnd, 0x96916C, var, "byte", 4)
}
Infinityrun(var)
{
global
HWNDCheck()
return WriteMemory(hwnd, 0xB7CEE4, var, "byte", 4)
}
SetPlayerHealth(var)
{
global
HWNDCheck()
return WriteMemoryPointer(hwnd, 0xB6F5F0, var, "float", 4, 0x540)
}
SetPlayerMaxHealth(var)
{
global
HWNDCheck()
return WriteMemoryPointer(hwnd, 0xB6F5F0, var, "float", 4, 0x544)
}
SetPlayerArmor(var)
{
global
HWNDCheck()
return WriteMemoryPointer(hwnd, 0xB6F5F0, var, "float", 4, 0x548)
}
SetVehicleHealth(var)
{
global
HWNDCheck()
return WriteMemoryPointer(hwnd, 0xBA18FC, var, "float", 4, 0x4C0)
}
SetHandlingMassPos(var)
{
global
HWNDCheck()
cvar := ReadMemoryPointer(hwnd, 0xC2B9DC, "float", 4, 0x1C)3
return WriteMemoryPointer(hwnd, 0xC2B9DC, cvar + var, "float", 4, 0x1C)
}
SetGravity(var)
{
global
HWNDCheck()
return WriteMemory(hwnd, 0x863984, var, "float", 4)
}
GetGravity()
{
global
HWNDCheck()
return ReadMemory(hwnd, 0x863984, "float", 4)
}
SetGameSpeed(var)
{
global
HWNDCheck()
return WriteMemory(hwnd, 0xB7015C, var, "int", 4)
}
GetGameSpeed()
{
global
HWNDCheck()
return ReadMemory(hwnd, 0xB7CB64, "float", 4)
}
GetLastVehiclePos(byref X, byref Y, byref Z)
{
global
HWNDCheck()
X := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x14, 0x30)
Y := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x14, 0x34)
Z := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x14, 0x38)
If ( X && Y && Z )
return 1
Else
return -1
}
GetEnemyPos(byref X, byref Y, byref Z)
{
global
HWNDCheck()
X := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x764, 0x14, 0x30)
Y := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x764, 0x14, 0x34)
Z := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x764, 0x14, 0x38)
If ( X && Y && Z )
return 1
Else
return -1
}
GetEnemyHealth()
{
global
HWNDCheck()
return ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x764, 0x14, 0x540)
}
GetEnemyArmor()
{
global
HWNDCheck()
return ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x764, 0x14, 0x548)
}
GetLastVehicleHealth()
{
global
HWNDCheck()
return ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x4C0)
}
SetVehicleSpeedX(var)
{
global
HWNDCheck()
return WriteMemoryPointer(hwnd, 0xB6F5F0, var, "float", 4, 0x58C, 0x44)
}
SetVehicleSpeedY(var)
{
global
HWNDCheck()
return WriteMemoryPointer(hwnd, 0xB6F5F0, var, "float", 4, 0x58C, 0x48)
}
SetVehicleSpeedZ(var)
{
global
HWNDCheck()
return WriteMemoryPointer(hwnd, 0xB6F5F0, var, "float", 4, 0x58C, 0x4C)
}
GetVehicleSpeedMatrix(byref X, byref Y, byref Z)
{
global
HWNDCheck()
X := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x44)
Y := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x48)
Z := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x4C)
return 1
}
SetNearestVehicleSpeedX(var)
{
global
HWNDCheck()
return WriteMemoryPointer(hwnd, 0xB6F5F0, var, "float", 4, 0x47C, 0x120, 0x44)
}
SetNearestVehicleSpeedY(var)
{
global
HWNDCheck()
return WriteMemoryPointer(hwnd, 0xB6F5F0, var, "float", 4, 0x47C, 0x120, 0x48)
}
SetNearestVehicleSpeedZ(var)
{
global
HWNDCheck()
return WriteMemoryPointer(hwnd, 0xB6F5F0, var, "float", 4, 0x47C, 0x120, 0x4C)
}
SetNearestVehicleSpeedMultiplier(var)
{
global
HWNDCheck()
WriteMemoryPointer(hwnd, 0xB6F5F0, ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x44) * var, "float", 4, 0x47C, 0x120, 0x44)
WriteMemoryPointer(hwnd, 0xB6F5F0, ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x48) * var, "float", 4, 0x47C, 0x120, 0x48)
WriteMemoryPointer(hwnd, 0xB6F5F0, ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x4C) * var, "float", 4, 0x47C, 0x120, 0x4C)
return 1
}
SetVehicleSpeedMultiplier(var)
{
global
HWNDCheck()
WriteMemoryPointer(hwnd, 0xB6F5F0, ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x44) * var, "float", 4, 0x58C, 0x44)
WriteMemoryPointer(hwnd, 0xB6F5F0, ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x48) * var, "float", 4, 0x58C, 0x48)
WriteMemoryPointer(hwnd, 0xB6F5F0, ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x4C) * var, "float", 4, 0x58C, 0x4C)
return 1
}
SetVehicleSpeedRelativ(speed)
{
global
HWNDCheck()
If ( IsPlayerInAnyVehicle() )
return 0
GetLastVehiclePos(Pos_X, Pos_Y, Pos_Z)
SetVehicleSpeedX(((Pos_X - Player_X) / 10) * speed)
SetVehicleSpeedY(((Pos_Y - Player_Y) / 10) * speed)
SetVehicleSpeedZ(((Pos_Z - Player_Z) / 10) * speed)
return 1
}
SetVehicleSpeedEnemy(speed)
{
global
HWNDCheck()
If ( ! Enemy_X || ! Enemy_Y || ! Enemy_Z )
return 0
GetLastVehiclePos(Pos_X, Pos_Y, Pos_Z)
SetVehicleSpeedX(((Enemy_X - Pos_X) / 10) * speed)
SetVehicleSpeedY(((Enemy_Y - Pos_Y) / 10) * speed)
SetVehicleSpeedZ(((Enemy_Z - Pos_Z) / 10) * speed)
return 1
}
SetNearestVehicleSpeedEnemy(speed)
{
global
HWNDCheck()
If ( ! Enemy_X || ! Enemy_Y || ! Enemy_Z )
return 0
GetNearestVehiclePosition(Pos_X, Pos_Y, Pos_Z)
SetNearestVehicleSpeedX(((Enemy_X - Pos_X) / 10) * speed)
SetNearestVehicleSpeedY(((Enemy_Y - Pos_Y) / 10) * speed)
SetNearestVehicleSpeedZ(((Enemy_Z - Pos_Z) / 10) * speed)
return 1
}
GetNearestVehicleHealth()
{
global
HWNDCheck()
return ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x4C0)
}
SetNearestVehicleHealth(var)
{
global
HWNDCheck()
return WriteMemoryPointer(hwnd, 0xB6F5F0, var, "float", 4, 0x47C, 0x120, 0x4C0)
}
GetNearestVehiclePosition(byref x, byref y, byref z)
{
global
HWNDCheck()
x := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x14, 0x30)
y := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x14, 0x34)
z := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x14, 0x38)
If ( x && y && z )
return 1
Else
return 0
}
GetNearestVehicleDistance()
{
global
GetNearestVehiclePosition(Vehicle_Nearest_X, Vehicle_Nearest_Y, Vehicle_Nearest_Z)
If ( Vehicle_Nearest_X )
Vehicle_Nearest_Distance := Round(Sqrt((Player_X - Vehicle_Nearest_X) ** 2 + (Player_Y - Vehicle_Nearest_Y) ** 2 + (Player_Z - Vehicle_Nearest_Z) ** 2), 2)
Else
Vehicle_Nearest_Distance = 0
return %Vehicle_Nearest_Distance%
}
GetDeathDistance()
{
global
Player_Death_Distance := Round(Sqrt((Player_X - Player_Death_X) ** 2 + (Player_Y - Player_Death_Y) ** 2 + (Player_Z - Player_Death_Z) ** 2), 2)
return %Player_Death_Distance%
}
GetVehicleDistance()
{
global
GetNearestVehiclePosition(Vehicle_X, Vehicle_Y, Vehicle_Z)
If ( Vehicle_X )
Vehicle_Distance := Round(Sqrt((Player_X - Vehicle_X) ** 2 + (Player_Y - Vehicle_Y) ** 2 + (Player_Z - Vehicle_Z) ** 2), 2)
Else
Vehicle_Distance = 0
return %Vehicle_Distance%
}
SetNearestVehicleRelativePosition(x, y, z)
{
global
HWNDCheck()
GetNearestVehiclePosition(Vehicle_Nearest_X, Vehicle_Nearest_Y, Vehicle_Nearest_Z)
SetNearestVehiclePosition(Vehicle_Nearest_X + x, Vehicle_Nearest_Y + y, Vehicle_Nearest_Z + z)
return 1
}
TeleportToPosition(x,y,z) {
gtaHandle := OpenHandleByName(windowNameOfSAMP)
ppos := Memory_Read(gtaHandle, 0xB7CD98)
ppos := Memory_Read(gtaHandle, ppos + 0x14)
Memory_WriteFloat(gtaHandle, ppos + 0x30,x)
Memory_WriteFloat(gtaHandle, ppos + 0x34,y)
Memory_WriteFloat(gtaHandle, ppos + 0x38,z)
CloseHandle(gtaHandle)
}
SetNearestVehiclePosition(x, y, z)
{
global
If ( ! x || ! y || ! z )
return 0
HWNDCheck()
Vehicle_X := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x14, 0x30)
Vehicle_Y := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x14, 0x34)
Vehicle_Z := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x14, 0x38)
Detachables_1_X := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x724)
Detachables_1_Y := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x728)
Detachables_1_Z := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x72C)
Detachables_2_X := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x750)
Detachables_2_Y := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x754)
Detachables_2_Z := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x758)
Detachables_3_X := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x77C)
Detachables_3_Y := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x780)
Detachables_3_Z := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x784)
Detachables_4_X := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x7A8)
Detachables_4_Y := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x7AC)
Detachables_4_Z := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x47C, 0x120, 0x7B0)
Detachables_1_X_Distance := Detachables_1_X - Vehicle_X
Detachables_1_Y_Distance := Detachables_1_Y - Vehicle_Y
Detachables_1_Z_Distance := Detachables_1_Z - Vehicle_Z
Detachables_2_X_Distance := Detachables_2_X - Vehicle_X
Detachables_2_Y_Distance := Detachables_2_Y - Vehicle_Y
Detachables_2_Z_Distance := Detachables_2_Z - Vehicle_Z
Detachables_3_X_Distance := Detachables_3_X - Vehicle_X
Detachables_3_Y_Distance := Detachables_3_Y - Vehicle_Y
Detachables_3_Z_Distance := Detachables_3_Z - Vehicle_Z
Detachables_4_X_Distance := Detachables_4_X - Vehicle_X
Detachables_4_Y_Distance := Detachables_4_Y - Vehicle_Y
Detachables_4_Z_Distance := Detachables_4_Z - Vehicle_Z
WriteMemoryPointer(hwnd, 0xB6F5F0, x, "float", 4, 0x47C, 0x120, 0x14, 0x30)
WriteMemoryPointer(hwnd, 0xB6F5F0, y, "float", 4, 0x47C, 0x120, 0x14, 0x34)
WriteMemoryPointer(hwnd, 0xB6F5F0, z, "float", 4, 0x47C, 0x120, 0x14, 0x38)
WriteMemoryPointer(hwnd, 0xB6F5F0, x + Detachables_1_X_Distance, "float", 4, 0x47C, 0x120, 0x724)
WriteMemoryPointer(hwnd, 0xB6F5F0, y + Detachables_1_Y_Distance, "float", 4, 0x47C, 0x120, 0x728)
WriteMemoryPointer(hwnd, 0xB6F5F0, z + Detachables_1_Z_Distance, "float", 4, 0x47C, 0x120, 0x72C)
WriteMemoryPointer(hwnd, 0xB6F5F0, x + Detachables_2_X_Distance, "float", 4, 0x47C, 0x120, 0x750)
WriteMemoryPointer(hwnd, 0xB6F5F0, y + Detachables_2_Y_Distance, "float", 4, 0x47C, 0x120, 0x754)
WriteMemoryPointer(hwnd, 0xB6F5F0, z + Detachables_2_Z_Distance, "float", 4, 0x47C, 0x120, 0x758)
WriteMemoryPointer(hwnd, 0xB6F5F0, x + Detachables_3_X_Distance, "float", 4, 0x47C, 0x120, 0x77C)
WriteMemoryPointer(hwnd, 0xB6F5F0, y + Detachables_3_Y_Distance, "float", 4, 0x47C, 0x120, 0x780)
WriteMemoryPointer(hwnd, 0xB6F5F0, z + Detachables_3_Z_Distance, "float", 4, 0x47C, 0x120, 0x784)
WriteMemoryPointer(hwnd, 0xB6F5F0, x + Detachables_4_X_Distance, "float", 4, 0x47C, 0x120, 0x7A8)
WriteMemoryPointer(hwnd, 0xB6F5F0, y + Detachables_4_Y_Distance, "float", 4, 0x47C, 0x120, 0x7AC)
WriteMemoryPointer(hwnd, 0xB6F5F0, z + Detachables_4_Z_Distance, "float", 4, 0x47C, 0x120, 0x7B0)
return 1
}
TeleportVehicleRelativ(x, y, z)
{
global
GetLastVehiclePos(vx, vy, vz)
return TeleportVehicle(vx + x, vy + y, vz + z)
}
TeleportVehicle(x, y, z)
{
global
If ( ! x || ! y || ! z )
return 0
HWNDCheck()
Vehicle_X := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x14, 0x30)
Vehicle_Y := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x14, 0x34)
Vehicle_Z := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x14, 0x38)
Detachables_1_X := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x724)
Detachables_1_Y := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x728)
Detachables_1_Z := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x72C)
Detachables_2_X := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x750)
Detachables_2_Y := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x754)
Detachables_2_Z := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x758)
Detachables_3_X := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x77C)
Detachables_3_Y := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x780)
Detachables_3_Z := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x784)
Detachables_4_X := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x7A8)
Detachables_4_Y := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x7AC)
Detachables_4_Z := ReadMemoryPointer(hwnd, 0xB6F5F0, "float", 4, 0x58C, 0x7B0)
Detachables_1_X_Distance := Detachables_1_X - Vehicle_X
Detachables_1_Y_Distance := Detachables_1_Y - Vehicle_Y
Detachables_1_Z_Distance := Detachables_1_Z - Vehicle_Z
Detachables_2_X_Distance := Detachables_2_X - Vehicle_X
Detachables_2_Y_Distance := Detachables_2_Y - Vehicle_Y
Detachables_2_Z_Distance := Detachables_2_Z - Vehicle_Z
Detachables_3_X_Distance := Detachables_3_X - Vehicle_X
Detachables_3_Y_Distance := Detachables_3_Y - Vehicle_Y
Detachables_3_Z_Distance := Detachables_3_Z - Vehicle_Z
Detachables_4_X_Distance := Detachables_4_X - Vehicle_X
Detachables_4_Y_Distance := Detachables_4_Y - Vehicle_Y
Detachables_4_Z_Distance := Detachables_4_Z - Vehicle_Z
WriteMemoryPointer(hwnd, 0xB6F5F0, x, "float", 4, 0x58C, 0x14, 0x30)
WriteMemoryPointer(hwnd, 0xB6F5F0, y, "float", 4, 0x58C, 0x14, 0x34)
WriteMemoryPointer(hwnd, 0xB6F5F0, z, "float", 4, 0x58C, 0x14, 0x38)
WriteMemoryPointer(hwnd, 0xB6F5F0, x + Detachables_1_X_Distance, "float", 4, 0x58C, 0x724)
WriteMemoryPointer(hwnd, 0xB6F5F0, y + Detachables_1_Y_Distance, "float", 4, 0x58C, 0x728)
WriteMemoryPointer(hwnd, 0xB6F5F0, z + Detachables_1_Z_Distance, "float", 4, 0x58C, 0x72C)
WriteMemoryPointer(hwnd, 0xB6F5F0, x + Detachables_2_X_Distance, "float", 4, 0x58C, 0x750)
WriteMemoryPointer(hwnd, 0xB6F5F0, y + Detachables_2_Y_Distance, "float", 4, 0x58C, 0x754)
WriteMemoryPointer(hwnd, 0xB6F5F0, z + Detachables_2_Z_Distance, "float", 4, 0x58C, 0x758)
WriteMemoryPointer(hwnd, 0xB6F5F0, x + Detachables_3_X_Distance, "float", 4, 0x58C, 0x77C)
WriteMemoryPointer(hwnd, 0xB6F5F0, y + Detachables_3_Y_Distance, "float", 4, 0x58C, 0x780)
WriteMemoryPointer(hwnd, 0xB6F5F0, z + Detachables_3_Z_Distance, "float", 4, 0x58C, 0x784)
WriteMemoryPointer(hwnd, 0xB6F5F0, x + Detachables_4_X_Distance, "float", 4, 0x58C, 0x7A8)
WriteMemoryPointer(hwnd, 0xB6F5F0, y + Detachables_4_Y_Distance, "float", 4, 0x58C, 0x7AC)
WriteMemoryPointer(hwnd, 0xB6F5F0, z + Detachables_4_Z_Distance, "float", 4, 0x58C, 0x7B0)
return 1
}
Hex(var)
{
OldFormat := A_FormatInteger
SetFormat, Integer, Hex
var += 0
SetFormat, Integer, %OldFormat%
return var
}
HWNDCheck()
{
global
If ( ! hwnd )
hwnd := OpenMemoryfromTitle("" WindowName "")
return
}
OpenMemoryfromProcess(process,right=0x1F0FFF)
{
Process,Exist,%process%
PID = %ErrorLevel%
HWND := DllCall("OpenProcess","Uint",right,"int",0,"int",PID)
return HWND
}
OpenMemoryfromTitle(title,right=0x1F0FFF)
{
WinGet,PID,PID,%title%
HWND := DllCall("OpenProcess","Uint",right,"int",0,"int",PID)
return HWND
}
CloseMemory(hwnd)
{
return DllCall("CloseHandle", "int", hwnd)
}
WriteMemory(hwnd,address,writevalue,datatype="int",length=4,offset=0)
{
global
VarSetCapacity(finalvalue,length, 0)
NumPut(writevalue,finalvalue,0,datatype)
return DllCall("WriteProcessMemory","Uint",hwnd,"Uint",address+offset,"Uint",&finalvalue,"Uint",length,"Uint",0)
}
ReadMemory(hwnd,address,datatype="int",length=4,offset=0)
{
VarSetCapacity(readvalue,length, 0)
DllCall("ReadProcessMemory","Uint",hwnd,"Uint",address+offset,"Str",readvalue,"Uint",length,"Uint *",0)
finalvalue := NumGet(readvalue,0,datatype)
return finalvalue
}
ReadMemoryPointer(hProcess, baseAddress, dataTyp="int", length=4, offset1=-1, offset2=-1, offset3=-1, offset4=-1, offset5=-1, offset6=-1, offset7=-1, offset8=-1)
{
Loop,8
{
if(offset%A_Index% != -1)
baseAddress := ReadMemory(hProcess, baseAddress, "int", 4) + offset%A_Index%
}
return ReadMemory(hProcess, baseAddress, dataTyp, length)
}
WriteMemoryPointer(hProcess, baseAddress, writeValue=0, dataTyp="int", length=4, offset1=-1, offset2=-1, offset3=-1, offset4=-1, offset5=-1, offset6=-1, offset7=-1, offset8=-1)
{
global
Loop,8
{
if(offset%A_Index% != -1)
baseAddress := ReadMemory(hProcess, baseAddress, "int", 4) + offset%A_Index%
}
return WriteMemory(hProcess, baseAddress, writeValue, dataTyp, length)
}
SetPrivileg(privileg = "SeDebugPrivilege")
{
success := DllCall("advapi32.dll\LookupPrivilegeValueA","uint",0,"str",privileg,"int64*",luid_SeDebugPrivilege)
if (success = 1) && (ErrorLevel = 0)
{
returnval = 0
}
else
{
returnval = %ErrorLevel%
}
return %returnval%
}
Suspendprocess(hwnd)
{
return DllCall("ntdll\NtSuspendProcess","uint",hwnd)
}
Resumeprocess(hwnd)
{
return DllCall("ntdll\NtResumeProcess","uint",hwnd)
}
Save:
Gui, Home:Submit,NoHide
IniWrite, %WindowName%, Config.ini, WinName, WindowName
sleep 200
reload
return
sleep(period := 1, Mode := "")
{
static Frequency, MinSetResolution, PID
if (Mode = "P")
{
pBatchLines := A_BatchLines
SetBatchLines, -1
if !Frequency
DllCall("QueryPerformanceFrequency", "Int64*", Frequency)
DllCall("QueryPerformanceCounter", "Int64*", Start)
Finish := Start + ( Frequency * (period/1000))
loop
DllCall("QueryPerformanceCounter", "Int64*", Current)
until (Current >= Finish)
SetBatchLines, %pBatchLines%
}
else if (Mode = "HP" || Mode = "HS" )
{
if !Frequency
DllCall("QueryPerformanceFrequency", "Int64*", Frequency)
DllCall("QueryPerformanceCounter", "Int64*", Start)
Finish := Start + ( Frequency * (period/1000))
if (A_BatchLines = -1)
sleep % period - 15
else sleep, % period - 25
DllCall("QueryPerformanceCounter", "Int64*", Current)
if (Current < Finish)
{
period := (Finish - Current)*1000 / Frequency
if (Mode = "HP")
sleep(period, "P")
else sleep(period, "S")
}
}
else if (Mode = "S")
{
if !MinSetResolution
{
error := DllCall("winmm\timeGetDevCaps", Int64P, TimeCaps, UInt,8)
if ( error || Errorlevel)
{
DLLcallErrorlevel := Errorlevel
sleep, %period%
return error ? error : DLLcallErrorlevel
}
MinSetResolution := TimeCaps & 0xFFFFFFFF
DllCall("Winmm.dll\timeBeginPeriod", UInt, MinSetResolution)
}
DllCall("Sleep", UInt, period)
}
else if (Mode = "Off" && MinSetResolution)
{
DllCall("Winmm.dll\timeEndPeriod", UInt, MinSetResolution)
MinSetResolution := False
}
else
{
if (period > 20)
sleep, %period%
else sleep(period, "P")
}
return
}
HomeGuiClose:
DestroyAllVisual()
ExitApp
