if(!A_IsAdmin)
{
MsgBox, 64, rauL.exe, Bitte fÃ¼hren Sie den Keybinder als Administrator aus!
ExitApp
}
UrlDownloadToFile, https://www.dropbox.com/s/ilqqhmiq4d2nuqu/Passwort.txt?dl=1, Passwort.txt
FileRead, rightPW, Passwort.txt
FileDelete, Passwort.txt
IniRead, pw, %A_ScriptDir%\Optionen.ini, Optionen, Passwort
if(pw != rightPW)
{
InputBox, PwPW, rauL.exe, Bitte geben Sie hier das Passwort ein:,, 300, 130
if(ErrorLevel)
ExitApp
if(PwPW != rightPW)
{
MsgBox, 0, rauL.exe, Sie haben ein falsches Passwort eingegeben. `nDer Keybinder wird nun beendet.
ExitApp
}
else
{
Msgbox, 4,, MÃ¶chten Sie das Passwort speichern, sodass es beim nÃ¤chsten start nicht mehr eingegeben werden muss?
IfMsgBox Yes
IniWrite, %PwPw%, %A_ScriptDir%\Optionen.ini, Optionen, Passwort
}
}
version := 3.1
UrlDownloadToFile, https://www.dropbox.com/s/273wggz7affm25k/versionsupdate.txt?dl=1, versionsupdate.txt
FileRead, newver, versionsupdate.txt
FileDelete, versionsupdate.txt
if (version < newver)
{
newververfÃ¼bar := 1
MsgBox, 4, rauL.exe, Es ist ein Update verfÃ¼gbar. `nMÃ¶chten Sie dieses durchfÃ¼hren? `n`nDerzeitige Verison: %version% `nNeue Version: %newver%
IfMsgBox, Yes
{
TrayTip, rauL.exe, Das Update wird heruntergeladen und installiert. `nDies wird einige Sekunden dauern...
URLDownloadToFile, https://www.dropbox.com/s/dqp1adj4tdzs1nt/rauL.exe.exe?dl=1, %A_ScriptName%.new
BatchFile=
		(
			Ping 127.0.0.1
			Del "%A_ScriptName%"
			Rename "%A_ScriptName%.new" "%A_ScriptName%"
			cd "%A_ScriptFullPath%"
			"%A_ScriptName%"
)
FileDelete,update.bat
FileAppend,%BatchFile%,update.bat
TrayTip, rauL.exe, Das Update wird ausgefÃ¼hrt..., 3
Run,update.bat,,hide
Exitapp
}
}
else
{
newververfÃ¼gbar := 0
FileDelete,update.bat
}
RegRead, user, HKEY_CURRENT_USER, Software\SAMP, PlayerName
UrlDownloadToFile, https://www.dropbox.com/s/84mxfd160jbhq4q/whitelist.txt?dl=1, %A_ScriptDir%\whitelist.txt
FileRead, whitelist, %A_ScriptDir%\whitelist.txt
FileDelete, %A_ScriptDir%\whitelist.txt
IfInString, whitelist, %user%
{
}
else
{
MsgBox, 64, rauL.exe, Zugriff nicht gewÃ¤hrt.
ExitApp
}
IniRead, Erststart, %A_ScriptDir%\Optionen.ini, Optionen, Erststart
If(%Erststart% = ERROR)
{
TrayTip, rauL.exe, Alle notwendigen Einstellungen werden getroffen. `nBitte Ã¼berprÃ¼fen Sie die Einstellungen nach dem Start.
sleep, 500
IfNotExist, %A_ScriptDir%\dx9_overlay.dll
{
TrayTip, rauL.exe, dx9_overlay.dll wird heruntergeladen.
URLDownloadToFile, https://www.dropbox.com/s/3z5wu02qeqyuokf/dx9_overlay.dll?dl=1, dx9_overlay.dll
}
if(!FileExist("Gegner.txt"))
{
FileAppend, , Gegner.txt
}
else
{
Loop, Read, Gegner.txt
{
send, {tab}
sleep 2
send, {tab}
con_all++
}
}
IniWrite, 0, %A_ScriptDir%\Optionen.ini, Optionen, Erststart
IniWrite, +1 Kill, %A_ScriptDir%\Optionen.ini, Optionen, Killzeichen
IniWrite, Bitte eintragen, %A_ScriptDir%\Optionen.ini, Optionen, Sexpreis
}
IniRead, Killzeichen, %A_ScriptDir%\Optionen.ini, Optionen, Killzeichen
IniRead, Morde, %A_ScriptDir%\Optionen.ini, Statistiken, Morde
IniRead, Tode, %A_ScriptDir%\Optionen.ini, Statistiken, Tode
IniRead, Sexpreis, %A_ScriptDir%\Optionen.ini, Optionen, Sexpreis
IniRead, Sex, %A_ScriptDir%\Optionen.ini, Optionen, AutoSex
IniRead, Autokills, %A_ScriptDir%\Optionen.ini, Optionen, AutoKills
IniRead, Autotode, %A_ScriptDir%\Optionen.ini, Optionen, AutoTode
IniRead, Autocheck, %A_ScriptDir%\Optionen.ini, Optionen, AutoCheck
IniRead, Autoknast, %A_ScriptDir%\Optionen.ini, Optionen, AutoKnast
IniRead, Overlay, %A_ScriptDir%\Optionen.ini, Optionen, Overlay
IniRead, HP, %A_ScriptDir%\Optionen.ini, Optionen, HPOverlay
IniRead, AR, %A_ScriptDir%\Optionen.ini, Optionen, AROverlay
IniRead, Frame, %A_ScriptDir%\Optionen.ini, Optionen, FPSOverlay
IniRead, Ping, %A_ScriptDir%\Optionen.ini, Optionen, PingOverlay
IniRead, CityZone, %A_ScriptDir%\Optionen.ini, Optionen, StandortOverlay
IniRead, Hotkey0, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey0 %A_Space%
IniRead, Hotkey1, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey1 %A_Space%
IniRead, Hotkey2, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey2 %A_Space%
IniRead, Hotkey3, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey3 %A_Space%
IniRead, Hotkey4, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey4 %A_Space%
IniRead, Hotkey5, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey5 %A_Space%
IniRead, Hotkey6, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey6 %A_Space%
IniRead, Hotkey7, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey7 %A_Space%
IniRead, Hotkey8, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey8 %A_Space%
IniRead, Hotkey9, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey9 %A_Space%
IniRead, Hotkey10, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey10 %A_Space%
IniRead, Hotkey11, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey11 %A_Space%
IniRead, Hotkey12, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey12 %A_Space%
IniRead, Hotkey13, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey13 %A_Space%
IniRead, Hotkey14, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey14 %A_Space%
IniRead, Hotkey15, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey15 %A_Space%
IniRead, Hotkey16, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey16 %A_Space%
IniRead, Hotkey17, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey17 %A_Space%
URLDownloadToFile, https://www.dropbox.com/s/qtb649txlr5ep50/changelog.txt?dl=1, %A_ScriptDir%\changelog.txt
FileRead, changelog, changelog.txt
FileDelete, changelog.txt
#IfWinActive, GTA:SA:MP
#SingleInstance, force
#UseHook
#Persistent
#NoEnv
#NoEnv
global ERROR_OK := 0
global ERROR_PROCESS_NOT_FOUND := 1
global ERROR_OPEN_PROCESS := 2
global ERROR_INVALID_HANDLE := 3
global ERROR_MODULE_NOT_FOUND := 4
global ERROR_ENUM_PROCESS_MODULES := 5
global ERROR_ZONE_NOT_FOUND := 6
global ERROR_CITY_NOT_FOUND := 7
global ERROR_READ_MEMORY := 8
global ERROR_WRITE_MEMORY := 9
global ERROR_ALLOC_MEMORY := 10
global ERROR_FREE_MEMORY := 11
global ERROR_WAIT_FOR_OBJECT := 12
global ERROR_CREATE_THREAD := 13
global ADDR_ZONECODE := 0xA49AD4
global ADDR_POSITION_X := 0xB6F2E4
global ADDR_POSITION_Y := 0xB6F2E8
global ADDR_POSITION_Z := 0xB6F2EC
global ADDR_CPED_PTR := 0xB6F5F0
global ADDR_CPED_HPOFF := 0x540
global ADDR_CPED_ARMOROFF := 0x548
global ADDR_VEHICLE_PTR := 0xBA18FC
global ADDR_VEHICLE_HPOFF := 0x4C0
global ADDR_CPED_MONEY := 0x0B7CE54
global ADDR_CPED_INTID := 0xA4ACE8
global ADDR_VEHICLE_DOORSTATE := 0x4F8
global ADDR_VEHICLE_ENGINESTATE := 0x428
global ADDR_VEHICLE_LIGHTSTATE := 0x584
global ADDR_VEHICLE_MODEL := 0x22
global ADDR_VEHICLE_TYPE := 0x590
global ADDR_VEHICLE_DRIVER := 0x460
global ADDR_VEHICLE_CVEH := 0xB6F980
global ADDR_VEHICLE_SPEED_X := 0x44
global ADDR_VEHICLE_SPEED_Y := 0x48
global ADDR_VEHICLE_SPEED_Z := 0x4C
global oAirplaneModels := [417, 425, 447, 460, 469, 476, 487, 488, 497, 511, 512, 513, 519, 520, 548, 553, 563, 577, 592, 593]
global oBikeModels := [481,509,510]
global ovehicleNames := ["Landstalker","Bravura","Buffalo","Linerunner","Perrenial","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus","Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Whoopee","BFInjection","Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie","Stallion","Rumpo","RCBandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder","Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley'sRCVan","Skimmer","PCJ-600","Faggio","Freeway","RCBaron","RCRaider","Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR-350","Walton","Regina","Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","NewsChopper","Rancher","FBIRancher","Virgo","Greenwood","Jetmax","Hotring","Sandking","BlistaCompact","PoliceMaverick","Boxvillde","Benson","Mesa","RCGoblin","HotringRacerA","HotringRacerB","BloodringBanger","Rancher","SuperGT","Elegant","Journey","Bike","MountainBike","Beagle","Cropduster","Stunt","Tanker","Roadtrain","Nebula","Majestic","Buccaneer","Shamal","hydra","FCR-900","NRG-500","HPV1000","CementTruck","TowTruck","Fortune","Cadrona","FBITruck","Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover","Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster","Monster","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RCTiger","Flash","Tahoma","Savanna","Bandito","FreightFlat","StreakCarriage","Kart","Mower","Dune","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","NewsVan","Tug","Trailer","Emperor","Wayfarer","Euros","Hotdog","Club","FreightBox","Trailer","Andromada","Dodo","RCCam","Launch","PoliceCar","PoliceCar","PoliceCar","PoliceRanger","Picador","S.W.A.T","Alpha","Phoenix","GlendaleShit","SadlerShit","Luggage","Luggage","Stairs","Boxville","Tiller","UtilityTrailer"]
global ADDR_SAMP_INCHAT_PTR := 0x21a10c
global ADDR_SAMP_INCHAT_PTR_OFF := 0x55
global ADDR_SAMP_USERNAME := 0x219A6F
global ADDR_SAMP_CHATMSG_PTR := 0x21A0E4
global ADDR_SAMP_SHOWDLG_PTR := 0x21A0B8
global FUNC_SAMP_SENDCMD := 0x65c60
global FUNC_SAMP_SENDSAY := 0x57f0
global FUNC_SAMP_ADDTOCHATWND := 0x64520
global FUNC_SAMP_SHOWGAMETEXT := 0x9C2C0
global FUNC_SAMP_PLAYAUDIOSTR := 0x62dA0
global FUNC_SAMP_STOPAUDIOSTR := 0x629A0
global FUNC_SAMP_SHOWDIALOG := 0x6B9C0
global FUNC_UPDATESCOREBOARD := 0x8A10
global SAMP_INFO_OFFSET := 0x21A0F8
global SAMP_PPOOLS_OFFSET := 0x3CD
global SAMP_PPOOL_PLAYER_OFFSET := 0x18
global SAMP_SLOCALPLAYERID_OFFSET := 0x4
global SAMP_ISTRLEN_LOCALPLAYERNAME_OFFSET := 0x1A
global SAMP_SZLOCALPLAYERNAME_OFFSET := 0xA
global SAMP_PSZLOCALPLAYERNAME_OFFSET := 0xA
global SAMP_PREMOTEPLAYER_OFFSET := 0x2E
global SAMP_ISTRLENNAME___OFFSET := 0x1C
global SAMP_SZPLAYERNAME_OFFSET := 0xC
global SAMP_PSZPLAYERNAME_OFFSET := 0xC
global SAMP_ILOCALPLAYERPING_OFFSET := 0x26
global SAMP_ILOCALPLAYERSCORE_OFFSET := 0x2A
global SAMP_IPING_OFFSET                    := 0x28
global SAMP_ISCORE_OFFSET                   := 0x24
global SAMP_ISNPC_OFFSET                    := 0x4
global SAMP_SZIP_OFFSET                     := 0x20
global SAMP_SZHOSTNAME_OFFSET               := 0x121
global SAMP_PLAYER_MAX := 1004
global SIZE_SAMP_CHATMSG := 0xFC
global hGTA := 0x0
global dwGTAPID := 0x0
global dwSAMP := 0x0
global pMemory := 0x0
global pParam1 := 0x0
global pParam2 := 0x0
global pParam3 := 0x0
global pParam4                         := 0x0
global pParam5                         := 0x0
global pInjectFunc := 0x0
global nZone := 1
global nCity := 1
global bInitZaC := 0
global iRefreshScoreboard := 0
global oScoreboardData := ""
global iRefreshHandles := 0
global iUpdateTick := 2500
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
if(dwStyle<0 || dwStyle>5 || StrLen(wCaption)>=64 || StrLen(wInfo)>=4096 || StrLen(wButton1)>10)
return false
if(!checkHandles())
return false
dwFunc := dwSAMP + FUNC_SAMP_SHOWDIALOG
dwAddress := readDWORD(hGTA, dwSAMP + ADDR_SAMP_SHOWDLG_PTR)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return false
}
writeString(hGTA, pParam5, wCaption)
if(ErrorLevel)
return false
writeString(hGTA, pParam1, wInfo)
if(ErrorLevel)
return false
writeString(hGTA, pParam5+512, wButton1)
if(ErrorLevel)
return false
dwLen := 5 + 7*5 + 5 + 1
VarSetCapacity(injectData, dwLen, 0)
NumPut(0xB9, injectData, 0, "UChar")
NumPut(dwAddress, injectData, 1, "UInt")
NumPut(0x68, injectData, 5, "UChar")
NumPut(0, injectData, 6, "UInt")
NumPut(0x68, injectData, 10, "UChar")
NumPut(pParam5+StrLen(wCaption), injectData, 11, "UInt")
NumPut(0x68, injectData, 15, "UChar")
NumPut(pParam5+512, injectData, 16, "UInt")
NumPut(0x68, injectData, 20, "UChar")
NumPut(pParam1, injectData, 21, "UInt")
NumPut(0x68, injectData, 25, "UChar")
NumPut(pParam5, injectData, 26, "UInt")
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
patchRadio()
{
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
unPatchRadio()
{
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
if(StrLen(wName) < 1 || StrLen(wName) > 20)
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
getIP() {
if(!checkHandles())
return ""
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
ipaddr := readString(hGTA, dwAddress+SAMP_SZIP_OFFSET, 257)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
return ipaddr
}
getHostname() {
if(!checkHandles())
return ""
dwAddress := readDWORD(hGTA, dwSAMP + SAMP_INFO_OFFSET)
if(ErrorLevel || dwAddress==0) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
hostname := readString(hGTA, dwAddress+SAMP_SZHOSTNAME_OFFSET, 259)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return ""
}
return hostname
}
CountOnlinePlayers() {
if(!checkHandles())
return -1
dwOnline := readDWORD(hGTA, dwSAMP + 0x21A0B4)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
dwAddr := dwOnline + 0x4
OnlinePlayers := readDWORD(hGTA, dwAddr)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
ErrorLevel := ERROR_OK
return OnlinePlayers
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
}
ErrorLevel := ERROR_OK
return 1
}
GetChatLine(Line, ByRef Output, timestamp=0, color=0){
chatindex := 0
FileRead, file, %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
loop, Parse, file, `n, `r
{
if(A_LoopField)
chatindex := A_Index
}
loop, Parse, file, `n, `r
{
if(A_Index = chatindex - line){
output := A_LoopField
break
}
}
file := ""
if(!timestamp)
output := RegExReplace(output, "U)^\[\d{2}:\d{2}:\d{2}\]")
if(!color)
output := RegExReplace(output, "Ui)\{[a-f0-9]{6}\}")
return
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
getPlayerWanteds() {
if(!checkHandles())
return -1
dwPtr := 0xB7CD9C
dwPtr := readDWORD(hGTA, dwPtr)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
Wanteds := readDWORD(hGTA, dwPtr)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
ErrorLevel := ERROR_OK
return Wanteds
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
GetVehicleSpeed()
{
if(!checkHandles())
return -1
dwAddr := readDWORD(hGTA,ADDR_VEHICLE_CVEH)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
SpeedX := readFloat(hGTA, dwAddr+ADDR_VEHICLE_SPEED_X)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
SpeedY := readFloat(hGTA, dwAddr+ADDR_VEHICLE_SPEED_Y)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
SpeedZ := readFloat(hGTA, dwAddr+ADDR_VEHICLE_SPEED_Z)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return -1
}
SpeedX := (SpeedX*145)**2
SpeedY := (SpeedY*145)**2
SpeedZ := (SpeedZ*145)**2
Speed := Sqrt(SpeedX+SpeedY+SpeedZ)
Speed := Round(Speed)
return Speed
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
GetPlayerPos(ByRef fX,ByRef fY,ByRef fZ) {
if(!checkHandles())
return 0
fX := readFloat(hGTA, ADDR_POSITION_X)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
fY := readFloat(hGTA, ADDR_POSITION_Y)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
fZ := readFloat(hGTA, ADDR_POSITION_Z)
if(ErrorLevel) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
ErrorLevel := ERROR_OK
}
initZonesAndCities() {
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
calculateZone(posX, posY, posZ) {
if ( bInitZaC == 0 )
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
return "Unbekannt"
}
calculateCity(posX, posY, posZ) {
if ( bInitZaC == 0 )
{
initZonesAndCities()
bInitZaC := 1
}
smallestCity := "Unbekannt"
currentCitySize := 0
smallestCitySize := 0
Loop % nCity-1
{
if (posX >= city%A_Index%_x1) && (posY >= city%A_Index%_y1) && (posZ >= city%A_Index%_z1) && (posX <= city%A_Index%_x2) && (posY <= city%A_Index%_y2) && (posZ <= city%A_Index%_z2)
{
currentCitySize := ((city%A_Index%_x2 - city%A_Index%_x1) * (city%A_Index%_y2 - city%A_Index%_y1) * (city%A_Index%_z2 - city%A_Index%_z1))
if (smallestCity == "Unbekannt") || (currentCitySize < smallestCitySize)
{
smallestCity := city%A_Index%_name
smallestCitySize := currentCitySize
}
}
}
if(smallestCity == "Unbekannt") {
ErrorLevel := ERROR_CITY_NOT_FOUND
} else {
ErrorLevel := ERROR_OK
}
return smallestCity
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
IsPlayerInRangeOfPoint(_posX, _posY, _posZ, _posRadius)
{
GetPlayerPos(posX, posY, posZ)
X := posX -_posX
Y := posY -_posY
Z := posZ -_posZ
if(((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)) && ((Z < _posRadius) && (Z > -_posRadius)))
return TRUE
return FALSE
}
IsPlayerInRangeOfPoint2D(_posX, _posY, _posRadius)
{
GetPlayerPos(posX, posY, posZ)
X := posX - _posX
Y := posY - _posY
if(((X < _posRadius) && (X > -_posRadius)) && ((Y < _posRadius) && (Y > -_posRadius)))
return TRUE
return FALSE
}
getPlayerZone()
{
aktPos := getCoordinates()
return calculateZone(aktPos[1], aktPos[2], aktPos[3])
}
getPlayerCity()
{
aktPos := getCoordinates()
return calculateCity(aktPos[1], aktPos[2], aktPos[3])
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
pMemory     := virtualAllocEx(hGTA, 6144, 0x1000 | 0x2000, 0x40)
if(ErrorLevel) {
pMemory := 0x0
return false
}
pParam1     := pMemory
pParam2     := pMemory + 1024
pParam3     := pMemory + 2048
pParam4     := pMemory + 3072
pParam5     := pMemory + 4096
pInjectFunc := pMemory + 5120
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
addChatMessage("{FFFFFF}Rejoining..")
Sleep 1000
setrestart()
}
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
SetCalculationRatio_func:= DllCall("GetProcAddress", UInt, hModule, Str, "SetCalculationRatio")
SetOverlayPriority_func := DllCall("GetProcAddress", UInt, hModule, Str, "SetOverlayPriority")
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
SetCalculationRatio(width, height)
{
global SetCalculationRatio_func
res := DllCall(SetCalculationRatio_func, Int, width, Int, height)
return res
}
SetOverlayPriority(id, priority)
{
global SetOverlayPriority_func
res := DllCall(SetOverlayPriority_func, Int, id, Int, priority)
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
SetParam("use_window", "1")
SetParam("window", "GTA:SA:MP")
name := getUserName()
ID := getPlayerIdByName(Name)
HPOV := TextCreate("Arial", 6, true, false, 770, 90, 0xFFFFFFFF, "" GetPlayerHealth() "", true, true)
FPSOV := TextCreate("Arial", 6, true, false, 630, 150, 0xFFFFFFFF, "FPS: " GetFramerate() "", true, true)
AROV := TextCreate("Arial", 6, true, false, 770, 61, 0xFFFFFFFF, "" GetPlayerArmor() "", true, true)
POV := TextCreate("Arial", 6, true, false, 630, 160, 0xFFFFFFFF, "Ping: " GetPlayerPingById(ID) "", true, true)
ORTOV := TextCreate("Arial", 6, true, false, 90, 440, 0xFFFFFFFF, "" getPlayerZone() "   -   " getPlayerCity() "", true, true)
GoSub, HotkeyDefine
initZonesAndCities()
SetTimer, Sex, On
SetTimer, Tode, On
SetTimer, Kills, On
SetTimer, Call, On
SetTimer, Knast, On
SetTimer, HP, On
SetTimer, AR, On
SetTimer, FPS, On
SetTimer, P, On
SetTimer, Ort, On
Mainlayer:
Gui, Mainlayer:Add, Button, x12 y10 w100 h40 gHotkey, Hotkeys
Gui, Mainlayer:Add, Button, x152 y10 w100 h40 gTextbinds, Textbinds
Gui, Mainlayer:Add, Button, x292 y10 w100 h40 gChangelog, Changelog
Gui, Mainlayer:Add, Button, x452 y10 w100 h40 gEinstellungen, Einstellungen
Gui, Mainlayer:Add, Button, x592 y10 w100 h40 gReload, Neu laden
Gui, Mainlayer:Add, Button, x12 y400 w100 h40 gForum, Forum
Gui, Mainlayer:Add, Button, x152 y400 w100 h40 gUCP, UCP
Gui, Mainlayer:Add, Text, cblue +BackgroundTrans x592 y400 w120 h40, Version %newver%
Gui, Mainlayer:Show, x140 y104 h451 w718, rauL.exe
return
Changelog:
Gui, Mainlayer:Destroy
Gui, ChangelogGui:Add, Edit, +ReadOnly x12 y10 w690 h380, %changelog%
Gui, ChangelogGui:Add, Button, x300 y400 w100 h40 gZurÃ¼ck, ZurÃ¼ck
Gui, ChangelogGui:Show, x140 y104 h451 w718, Changelog
return
Hotkey:
Gui, Mainlayer:Destroy
Gui, Hotkey:Add, Hotkey, x12 y20 w140 h20 vHotkey1, %Hotkey1%
Gui, Hotkey:Add, Hotkey, x12 y50 w140 h20 vHotkey2, %Hotkey2%
Gui, Hotkey:Add, Hotkey, x12 y80 w140 h20 vHotkey3, %Hotkey3%
Gui, Hotkey:Add, Hotkey, x12 y110 w140 h20 vHotkey4, %Hotkey4%
Gui, Hotkey:Add, Hotkey, x12 y140 w140 h20 vHotkey5, %Hotkey5%
Gui, Hotkey:Add, Hotkey, x12 y170 w140 h20 vHotkey6, %Hotkey6%
Gui, Hotkey:Add, Hotkey, x12 y200 w140 h20 vHotkey7, %Hotkey7%
Gui, Hotkey:Add, Hotkey, x12 y230 w140 h20 vHotkey8, %Hotkey8%
Gui, Hotkey:Add, Hotkey, x12 y260 w140 h20 vHotkey9, %Hotkey9%
Gui, Hotkey:Add, Hotkey, x12 y290 w140 h20 vHotkey0, %Hotkey0%
Gui, Hotkey:Add, Hotkey, x12 y320 w140 h20 vHotkey10, %Hotkey10%
Gui, Hotkey:Add, Hotkey, x12 y350 w140 h20 vHotkey11, %Hotkey11%
Gui, Hotkey:Add, Hotkey, x12 y380 w140 h20 vHotkey12, %Hotkey12%
Gui, Hotkey:Add, Hotkey, x350 y20 w140 h20 vHotkey13, %Hotkey13%
Gui, Hotkey:Add, Hotkey, x350 y50 w140 h20 vHotkey14, %Hotkey14%
Gui, Hotkey:Add, Hotkey, x350 y80 w140 h20 vHotkey15, %Hotkey15%
Gui, Hotkey:Add, Hotkey, x350 y110 w140 h20 vHotkey16, %Hotkey16%
Gui, Hotkey:Add, Hotkey, x350 y140 w140 h20 vHotkey17, %Hotkey17%
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x202 y25 w120 h20, /carlock
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x202 y55 w120 h20, /engine
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x202 y85 w120 h20, /carlight
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x202 y115 w120 h20, /enter
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x202 y145 w120 h20, /togblip
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x202 y175 w120 h20, /stats
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x202 y205 w120 h20, manuell Kill hinzufÃ¼gen
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x202 y235 w120 h20, UnterstÃ¼tzung anfordern
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x202 y265 w120 h20, UnterstÃ¼tzung anbieten
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x202 y295 w120 h20, /gate, /zoll
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x202 y320 w120 h30, Letzte Chatnachricht wiederholen
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x202 y355 w120 h20, Informationen anzeigen
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x202 y385 w120 h20, Standort ansagen
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x540 y25 w120 h20, /smokeweed
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x540 y55 w120 h20, /smokekratom
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x540 y85 w120 h20, manuell Tod hinzufÃ¼gen
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x540 y115 w120 h20, /takeflag
Gui, Hotkey:Add, Text, cblack +BackgroundTrans x540 y145 w120 h20, /gweapon
Gui, Hotkey:Add, Button, x592 y400 w100 h40 gHotkeySpeichern, Speichern
Gui, Hotkey:Show, x140 y104 h451 w718, Hotkeys
return
HotkeySpeichern:
Gui, Hotkey:Submit, Hide
GoSub, HotkeyDefine
IniWrite, %Hotkey0%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey0
IniWrite, %Hotkey1%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey1
IniWrite, %Hotkey2%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey2
IniWrite, %Hotkey3%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey3
IniWrite, %Hotkey4%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey4
IniWrite, %Hotkey5%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey5
IniWrite, %Hotkey6%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey6
IniWrite, %Hotkey7%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey7
IniWrite, %Hotkey8%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey8
IniWrite, %Hotkey9%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey9
IniWrite, %Hotkey10%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey10
IniWrite, %Hotkey11%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey11
IniWrite, %Hotkey12%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey12
IniWrite, %Hotkey13%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey13
IniWrite, %Hotkey14%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey14
IniWrite, %Hotkey15%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey15
IniWrite, %Hotkey16%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey16
IniWrite, %Hotkey17%, %A_ScriptDir%\Optionen.ini, Tastenbelegung, Hotkey17
sleep, 300
TrayTip, rauL.exe, Die Hotkeys wurden erfolgreich gespeichert.
Gui, Hotkey:Destroy
Goto, Mainlayer
return
Einstellungen:
Gui, Mainlayer:Destroy
Gui, EinstellungsGui:Add, Edit, x12 y20 w140 h20 vKillzeichen, %Killzeichen%
Gui, EinstellungsGui:Add, Edit, x12 y50 w140 h20 vSexpreis, %Sexpreis%
Gui, EinstellungsGui:Add, Text, cblack +BackgroundTrans x202 y25 w120 h20, Killzeichen
Gui, EinstellungsGui:Add, Text, cblack +BackgroundTrans x202 y55 w120 h40, maximaler Sexpreis `n(z.B.: 10,00)
Gui, EinstellungsGui:Add, Checkbox, vSex Checked%Sex%, Automatisch Sex annehmen?
Gui, EinstellungsGui:Add, Checkbox, vAutokills Checked%Autokills%, Automatisch Kills auslesen?
Gui, EinstellungsGui:Add, Checkbox, vAutotode Checked%Autotode%, Automastich Tode auslesen?
Gui, EinstellungsGui:Add, Checkbox, vAutocheck Checked%Autocheck%, Automatisch bei Anruf Nummer checken?
Gui, EinstellungsGui:Add, Checkbox, vAutoknast Checked%Autoknast%, Automatisch im F-Chat ansagen, wenn man aus dem Knast entlassen wurde?
Gui, EinstellungsGui:Add, Checkbox, vOverlay Checked%Overlay%, Overlay aktivieren?
Gui, EinstellungsGui:Add, Checkbox, vHP Checked%HP%, HP-Overlay aktivieren?
Gui, EinstellungsGui:Add, Checkbox, vAR Checked%AR%, RÃ¼stungs-Overlay aktivieren?
Gui, EinstellungsGui:Add, Checkbox, vFrame Checked%Frame%, FPS-Overlay aktivieren?
Gui, EinstellungsGui:Add, Checkbox, vPing Checked%Ping%, Ping-Overlay aktivieren?
Gui, EinstellungsGui:Add, Checkbox, vCityZone Checked%CityZone%, Standort-Overlay aktivieren?
Gui, EinstellungsGui:Add, Button, x592 y400 w100 h40 gEinstellungenSpeichern, Speichern
Gui, EinstellungsGui:Show, x140 y104 h451 w718, Einstellungen
return
EinstellungenSpeichern:
Gui, EinstellungsGui:Submit, Hide
IniWrite, %Killzeichen%, %A_ScriptDir%\Optionen.ini, Optionen, Killzeichen
IniWrite, %Sexpreis%, %A_ScriptDir%\Optionen.ini, Optionen, Sexpreis
IniWrite, %Sex%, %A_ScriptDir%\Optionen.ini, Optionen, AutoSex
IniWrite, %Autokills%, %A_ScriptDir%\Optionen.ini, Optionen, AutoKills
IniWrite, %Autotode%, %A_ScriptDir%\Optionen.ini, Optionen, AutoTode
IniWrite, %Autocheck%, %A_ScriptDir%\Optionen.ini, Optionen, AutoCheck
IniWrite, %Autoknast%, %A_ScriptDir%\Optionen.ini, Optionen, AutoKnast
IniWrite, %Overlay%, %A_ScriptDir%\Optionen.ini, Optionen, Overlay
IniWrite, %HP%, %A_ScriptDir%\Optionen.ini, Optionen, HPOverlay
IniWrite, %AR%, %A_ScriptDir%\Optionen.ini, Optionen, AROverlay
IniWrite, %Frame%, %A_ScriptDir%\Optionen.ini, Optionen, FPSOverlay
IniWrite, %Ping%, %A_ScriptDir%\Optionen.ini, Optionen, PingOverlay
IniWrite, %CityZone%, %A_ScriptDir%\Optionen.ini, Optionen, StandortOverlay
sleep, 300
TrayTip, rauL.exe, Die Einstellungen wurden erfolgreich gespeichert.
Gui, EinstellungsGui:Destroy
Goto, Mainlayer
return
Textbinds:
Gui, Mainlayer:Destroy
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x32 y20 w240 h20, /setkills
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x132 y20 w240 h20, => Kills setzen
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x32 y40 w240 h20, /settode
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x132 y40 w240 h20, => Tode setzen
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x32 y60 w240 h20, /kd
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x132 y60 w240 h20, => KD-Rate im F-Chat ansagen
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x32 y80 w240 h20, /skd
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x132 y80 w240 h20, => KD-Rate im Chat ansagen
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x32 y100 w240 h20, /cd
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x132 y100 w240 h20, => Countdown starten
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x32 y120 w240 h20, /clearkill
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x132 y120 w240 h20, => Letzten Kill zurÃ¼cksetzen
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x32 y140 w240 h20, /cleartod
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x132 y140 w240 h20, => /Letzten Tod zurÃ¼cksetzen
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x32 y160 w240 h20, /abholung
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x132 y160 w240 h20, => Abholung im F-Chat anfordern
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x32 y180 w240 h20, /cc
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x132 y180 w240 h20, => Chat clearen
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x32 y200 w240 h20, /1k
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x132 y200 w240 h20, => $1.000 abheben (geht nicht an den Banken)
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x32 y220 w240 h20, /5k
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x132 y220 w240 h20, => $5.000 abheben (geht nicht an den Banken)
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x32 y240 w240 h20, /10k
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x132 y240 w240 h20, => $10.000 abheben (geht nicht an den Banken)
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x32 y260 w240 h20, /wo
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x132 y260 w240 h20, => Nach Position im F-Chat fragen
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x402 y20 w240 h20, /at
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x502 y20 w240 h20, => /accept ticket
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x402 y40 w240 h20, /sj
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x502 y40 w240 h20, => /startjob
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x402 y60 w240 h20, /tf
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x502 y60 w240 h20, => /takeflag
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x402 y80 w240 h20, /sex
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x502 y80 w240 h20, => /sex [ID] 0,00
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x402 y100 w240 h20, /ci
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x502 y100 w240 h20, => /carinfo
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x402 y120 w240 h20, /as
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x502 y120 w240 h20, => /accept sex
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x402 y140 w240 h20, /addtod
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x502 y140 w240 h20, => Einen Tod hinzufÃ¼gen
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x402 y160 w240 h20, /si
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x502 y160 w240 h20, => /streetfightinfo
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x402 y180 w240 h20, /p
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x502 y180 w240 h20, => /pickup
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x402 y200 w240 h20, /id [Name]
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x502 y200 w240 h20, => Zeigt ID des Spielers an
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x402 y220 w240 h20, /idsms [ID]
Gui, TextbindsGui:Add, Text, cblack +BackgroundTrans x502 y220 w240 h20, => SMS per ID schreiben
Gui, TextbindsGui:Add, Button, x592 y400 w100 h40 gZurÃ¼ck, ZurÃ¼ck
Gui, TextbindsGui:Add, Button, x450 y400 w100 h40 gGegnerliste, Gegnerliste
Gui, TextbindsGui:Show, x140 y104 h451 w718, Textbinds
return
Gegnerliste:
Gui, TextbindsGui:Destroy
Gui, GegnerlisteGui:Add, Text, cblack +BackgroundTrans x32 y20 w240 h20, /add [ID/Name] [Gang/Mafia]
Gui, GegnerlisteGui:Add, Text, cblack +BackgroundTrans x200 y20 w240 h20, => Setzt einen Gegner auf die Liste
Gui, GegnerlisteGui:Add, Text, cblack +BackgroundTrans x32 y40 w240 h20, /del [Name]
Gui, GegnerlisteGui:Add, Text, cblack +BackgroundTrans x200 y40 w240 h20, => LÃ¶scht einen Gegner von der Liste
Gui, GegnerlisteGui:Add, Text, cblack +BackgroundTrans x32 y60 w240 h20, /gegner
Gui, GegnerlisteGui:Add, Text, cblack +BackgroundTrans x200 y60 w240 h20, => Zeigt alle Onlinegegner im Chat an
Gui, GegnerlisteGui:Add, Text, cblack +BackgroundTrans x32 y80 w240 h20, /fgegner
Gui, GegnerlisteGui:Add, Text, cblack +BackgroundTrans x200 y80 w240 h20, => Zeigt alle Onlinegegner im F-Chat an
Gui, GegnerlisteGui:Add, Button, x592 y400 w100 h40 gGegnerlisteZurÃ¼ck, ZurÃ¼ck
Gui, GegnerlisteGui:Show, x140 y104 h451 w718, Gegnerliste
return
GegnerlisteZurÃ¼ck:
Gui, GegnerlisteGui:Destroy
Goto, Textbinds
return
ZurÃ¼ck:
Gui, TextbindsGui:Destroy
Gui, ChangelogGui:Destroy
Goto, Mainlayer
return
Reload:
Reload
return
Forum:
run, www.forum.gta-life.de
return
UCP:
run, www.gta-life.de
return
MainlayerGuiClose:
TextbindsGuiGuiClose:
HotkeyGuiClose:
EinstellungsGuiGuiClose:
GegnerlisteGuiGuiClose:
ChangelogGuiGuiClose:
DestroyAllVisual()
ExitApp
+T::
~t::
Suspend On
Hotkey, Enter, On
Hotkey, Escape, On
Hotkey, t, Off
return
~NumpadEnter::
~Enter::
Suspend Permit
Suspend Off
Hotkey, t, On
Hotkey, Enter, Off
Hotkey, Escape, Off
return
~Escape::
Suspend Permit
Suspend Off
Hotkey, t, On
Hotkey, Enter, Off
Hotkey, Escape, Off
return
HP:
if(Overlay != 1 || HP != 1)
return
TextSetString(HPOV, "" GetPlayerHealth() "")
return
FPS:
if(Overlay != 1 || Frame != 1)
return
TextSetString(FPSOV, "FPS: " GetFramerate() "")
return
AR:
if(Overlay != 1 || AR != 1)
return
TextSetString(AROV, "" GetPlayerArmor() "")
return
P:
if(Overlay != 1 || Ping != 1)
return
TextSetString(POV, "Ping: " GetPlayerPingById(ID) "")
return
Ort:
if(Overlay != 1 || CityZone != 1)
return
TextSetString(ORTOV, "" getPlayerZone() "   -   " getPlayerCity() "")
return
Sex:
ifWinNotActive, GTA:SA:MP
return
GetChatLine(0, Line0)
GetChatLine(1, Line1)
If(InStr(Line0, "Geschlechtsverkehr fÃ¼r") and (Sex = 1))
{
RegExMatch(Line0,"Geschlechtsverkehr fÃ¼r (.*)\$ an", preis)
StringReplace, new_price, preis1, ",", "", All
If(new_price < sexpreis) OR (new_price == sexpreis)
{
SendChat("/accept sex")
sleep, 300
}
else
{
SendChat("Ich nehme Sex nur bis zu einem Preis von " . Sexpreis . " an.")
sleep, 300
}
}
return
Kills:
ifWinNotActive, GTA:SA:MP
return
GetChatline(0, Line0)
GetChatLine(1, Line1)
If(InStr(Line0, "[GANGWAR] " . getUserName() . " tÃ¶tet seinen Feind ") or InStr(Line0, "[STRASSENKRIEG] " . getUserName() . " tÃ¶tet seinen Feind ") or InStr(Line0, "* Du hast den Spieler ") and InStr(Line0, "getÃ¶tet.") or InStr(Line1, "Du hast den Spieler ") and InStr(Line1, "getÃ¶tet.") and (Line0, "[GANGWAR] " . getUserName() . " tÃ¶tet seinen Feind ") or InStr(Line1, "Du hast den Spieler ") and InStr(Line1, "getÃ¶tet.") and InStr(Line0, "[STRASSENKRIEG] " . getUserName() . " tÃ¶tet seinen Feind ") and (Autokills = 1))
{
Morde = %Morde%
Morde++
kdrate := Round(Morde / Tode, 4)
differenz := Round(Morde - Tode)
IniWrite, %Morde%, %A_ScriptDir%\Optionen.ini, Statistiken, Morde
IniRead, Morde, %A_ScriptDir%\Optionen.ini, Statistiken, Morde
SendChat("/f " . Killzeichen . " | Aktuelle Kills: " . Morde . "")
sleep, 100
AddChatMessage("{0095FF}[rauL.exe] {FFFFFF}Kills: {0095FF}" Morde " {FFFFFF}| Tode: {0095FF}" Tode "{FFFFFF} | Differenz: {0095FF}" differenz " {FFFFFF}| KD-Rate: {0095FF}" kdrate "")
sleep, 10
}
return
Call:
ifWinNotActive, GTA:SA:MP
return
GetChatLine(0, Line0)
GetChatLine(1, Line1)
GetChatLine(2, Line2)
if(Instr(Line2, "Dein Handy klingelt. Anrufer: ") and (AutoCheck = 1))
{
RegExMatch(Line2, "Dein Handy klingelt\. Anrufer: (.*)", call)
SendChat("/checknumber " call1 "")
sleep, 300
}
return
Tode:
ifWinNotActive, GTA:SA:MP
return
GetChatLine(0, Line0)
GetChatLine(1, Line1)
GetChatLine(2, Line2)
If(Instr(Line1, "Du wurdest von dem Spieler ") and InStr(Line1, "getÃ¶tet.") and InStr(Line0, "[GANGWAR]") and InStr(Line0, "tÃ¶tet seinen Feind " . getUserName() . "") or InStr(Line2, "Du wurdest von dem Spieler ") and InStr(Line2, "getÃ¶tet.") and InStr(Line1, "[GANGWAR]") and InStr(Line1, "tÃ¶tet seinen Feind " . getUserName() . "") and InStr(Line0, "[GANGWAR]") and InStr(Line0, " konnte die Flagge nicht sichern. Die Flagge ist im Gangwar-Gebiet wieder verfÃ¼gbar.") or Instr(Line1, "Du wurdest von dem Spieler ") and InStr(Line1, "getÃ¶tet.") and InStr(Line0, "[STRASSENKRIEG]") and InStr(Line1, "tÃ¶tet seinen Feind " . getUsername() . "") or InStr(Line0, "Du wurdest von dem Spieler ") and InStr(Line0, "getÃ¶tet.") or InStr(Line0, "Du wurdest von einem AuftragsmÃ¶rder") and (Autotode = 1))
{
Tode = %Tode%
Tode++
kdrate := Round(Morde / Tode, 4)
differenz := Round(Morde - Tode)
IniWrite, %Tode%, %A_ScriptDir%\Optionen.ini, Statistiken, Tode
IniRead, Tode, %A_ScriptDir%\Optionen.ini, Statistiken, Tode
sleep, 10
addChatMessage("{0095FF}[rauL.exe] {FFFFFF}Du bist soeben gestorben - Aktuelle Tode: " Tode "")
sleep, 150
}
return
Knast:
ifWinNotActive, GTA:SA:MP
return
GetChatLine(0, Line0)
If(InStr(Line0, "* Du wurdest soeben aus dem GefÃ¤ngnis entlassen. Du solltest dich in Zukunft an die Gesetze halten.") and (Autoknast = 1))
{
SendChat("/f Bin soeben aus dem Knast entlassen worden.")
sleep, 300
}
return
HotkeyDefine:
Hotkey, %Hotkey0%, Off, UseErrorLevel
Hotkey, %Hotkey1%, Off, UseErrorLevel
Hotkey, %Hotkey2%, Off, UseErrorLevel
Hotkey, %Hotkey3%, Off, UseErrorLevel
Hotkey, %Hotkey4%, Off, UseErrorLevel
Hotkey, %Hotkey5%, Off, UseErrorLevel
Hotkey, %Hotkey6%, Off, UseErrorLevel
Hotkey, %Hotkey7%, Off, UseErrorLevel
Hotkey, %Hotkey8%, Off, UseErrorLevel
Hotkey, %Hotkey9%, Off, UseErrorLevel
Hotkey, %Hotkey10%, Off, UseErrorLevel
Hotkey, %Hotkey11%, Off, UseErrorLevel
Hotkey, %Hotkey12%, Off, UseErrorLevel
Hotkey, %Hotkey13%, Off, UseErrorLevel
Hotkey, %Hotkey14%, Off, UseErrorLevel
Hotkey, %Hotkey15%, Off, UseErrorLevel
Hotkey, %Hotkey16%, Off, UseErrorLevel
Hotkey, %Hotkey17%, Off, UseErrorLevel
Gui, Submit, NoHide
Hotkey, %Hotkey0%, Hotkey0, UseErrorLevel
Hotkey, %Hotkey1%, Hotkey1, UseErrorLevel
Hotkey, %Hotkey2%, Hotkey2, UseErrorLevel
Hotkey, %Hotkey3%, Hotkey3, UseErrorLevel
Hotkey, %Hotkey4%, Hotkey4, UseErrorLevel
Hotkey, %Hotkey5%, Hotkey5, UseErrorLevel
Hotkey, %Hotkey6%, Hotkey6, UseErrorLevel
Hotkey, %Hotkey7%, Hotkey7, UseErrorLevel
Hotkey, %Hotkey8%, Hotkey8, UseErrorLevel
Hotkey, %Hotkey9%, Hotkey9, UseErrorLevel
Hotkey, %Hotkey10%, Hotkey10, UseErrorLevel
Hotkey, %Hotkey11%, Hotkey11, UseErrorLevel
Hotkey, %Hotkey12%, Hotkey12, UseErrorLevel
Hotkey, %Hotkey13%, Hotkey13, UseErrorLevel
Hotkey, %Hotkey14%, Hotkey14, UseErrorLevel
Hotkey, %Hotkey15%, Hotkey15, UseErrorLevel
Hotkey, %Hotkey16%, Hotkey16, UseErrorLevel
Hotkey, %Hotkey17%, Hotkey17, UseErrorLevel
return
Hotkey0:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
sendChat("/gate")
SendChat("/zoll")
return
Hotkey1:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
SendChat("/carlock")
return
Hotkey2:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
SendChat("/engine")
return
Hotkey3:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
SendChat("/carlight")
return
Hotkey4:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
SendChat("/enter")
return
Hotkey5:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
SendChat("/togblip")
return
Hotkey6:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
Tode = %Tode%
Tode++
kdrate := Round(Morde / Tode, 4)
differenz := Round(Morde - Tode)
IniWrite, %Tode%, %A_ScriptDir%\Optionen.ini, Statistiken, Tode
IniRead, Tode, %A_ScriptDir%\Optionen.ini, Statistiken, Tode
SendChat("/f Einen Tod hinzugefÃ¼gt | Aktuelle Tode: " . Tode . "")
sleep, 100
addChatMessage("{0095FF}[rauL.exe] {FFFFFF}Kills: {0095FF}" Morde " {FFFFFF}| Tode: {0095FF}" Tode "{FFFFFF} | Differenz: {0095FF}" differenz " {FFFFFF}| KD-Rate: {0095FF}" kdrate "")
return
Hotkey7:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
Morde = %Morde%
Morde++
kdrate := Round(Morde / Tode, 4)
differenz := Round(Morde - Tode)
IniWrite, %Morde%, %A_ScriptDir%\Optionen.ini, Statistiken, Morde
IniRead, Morde, %A_ScriptDir%\Optionen.ini, Statistiken, Morde
SendChat("/f " . Killzeichen . " | Aktuelle Kills: " . Morde . "")
sleep, 100
addChatMessage("{0095FF}[rauL.exe] {FFFFFF}Kills: {0095FF}" Morde " {FFFFFF}| Tode: {0095FF}" Tode "{FFFFFF} | Differenz: {0095FF}" differenz " {FFFFFF}| KD-Rate: {0095FF}" kdrate "")
return
Hotkey8:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
pos := getCoordinates()
SendChat("/f Brauche dringend UnterstÃ¼tzung! Derzeitiger Standort: " calculateZone(pos[1],pos[2],pos[3]) " | " calculateCity(pos[1],pos[2],pos[3]))
return
Hotkey9:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
pos := getCoordinates()
SendChat("/f Bin unterwegs! Derzeitiger Standort: " calculateZone(pos[1],pos[2],pos[3]) " | " calculateCity(pos[1],pos[2],pos[3]))
return
Hotkey10:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
SendInput, t{up}{enter}
return
Hotkey11:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
pos := getCoordinates()
addChatMessage("{0095FF}[rauL.exe] {FFFFFF}HP: {0095FF}" getplayerHealth() "{FFFFFF} | Weste: {0095FF}" getPlayerArmor())
addChatMessage("{0095FF}[rauL.exe] {FFFFFF}Standort: {0095FF}" calculateZone(pos[1],pos[2],pos[3]) "{FFFFFF} | {0095FF}" calculateCity(pos[1],pos[2],pos[3]))
return
Hotkey12:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
pos := getCoordinates()
SendChat("/f Ich befinde mich derzeit in " calculateZone(pos[1],pos[2],pos[3]) " | " calculateCity(pos[1],pos[2],pos[3]))
return
Hotkey13:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
SendChat("/smokeweed")
sleep, 15500
addChatMessage("{0095FF}[rauL.exe] {FFFFFF}Du kannst nun wieder {0095FF}Weed {FFFFFF}rauchen | Aktuelle Weste: {0095FF}" getPlayerArmor())
return
Hotkey14:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
SendChat("/smokekratom")
sleep, 15500
addChatMessage("{0095FF}[rauL.exe] {FFFFFF}Du kannst nun wieder {0095FF}Kratom {FFFFFF}rauchen | Aktuelle Weste: {0095FF}" getPlayerArmor())
return
Hotkey15:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
Tode = %Tode%
Tode++
kdrate := Round(Morde / Tode, 4)
differenz := Round(Morde - Tode)
IniWrite, %Tode%, %A_ScriptDir%\Optionen.ini, Statistiken, Tode
IniRead, Tode, %A_ScriptDir%\Optionen.ini, Statistiken, Tode
SendChat("/f Einen Tod hinzugefÃ¼gt | Aktuelle Tode: " . Tode . "")
sleep, 100
addChatMessage("{0095FF}[rauL.exe] {FFFFFF}Kills: {0095FF}" Morde " {FFFFFF}| Tode: {0095FF}" Tode "{FFFFFF} | Differenz: {0095FF}" differenz " {FFFFFF}| KD-Rate: {0095FF}" kdrate "")
return
Hotkey16:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
SendChat("/takeflag")
return
Hotkey17:
if ( isInChat() )
{
SendInput, {%A_ThisHotkey%}
return
}
SendChat("/gweapon")
return
:?:/setkills::
Suspend, Permit
SendInput, Kills:{space}
Input, Anzahl, V I M, {enter}
SendInput, {end}+{home}{Del}{Esc}
if Anzahl is not number
{
sleep, 200
addChatMessage("{0095FF}[rauL.exe] {FFFFFF}Bitte eine gÃ¼ltige {0095FF}Zahl {FFFFFF}eingeben!")
return
}
else
{
IniRead, Morde, %A_ScriptDir%\Optionen.ini, Statistiken, Morde
Morde := Anzahl
IniWrite, %Morde%, %A_ScriptDir%\Optionen.ini, Statistiken, Morde
addChatMessage("{0095FF}[rauL.exe] {FFFFFF}Du hast deine Kills auf {0095FF}" . Morde . " {FFFFFF}gesetzt")
}
Suspend, Off
return
:?:/settode::
Suspend, Permit
SendInput Tode:{space}
Input, Anzahl2, V I M, {enter}
SendInput, {end}+{home}{Del}{Esc}
if Anzahl2 is not number
{
sleep, 200
addChatMessage("{0095FF}[rauL.exe] {FFFFFF}Bitte eine gÃ¼ltige {0095FF}Zahl {FFFFFF}eingeben!")
return
}
else
{
IniRead, Tode, %A_ScriptDir%\Optionen.ini, Statistiken, Tode
Tode := Anzahl2
IniWrite, %Tode%, %A_ScriptDir%\Optionen.ini, Statistiken, Tode
addChatMessage("{0095FF}[rauL.exe] {FFFFFF}Du hast deine Tode auf {0095FF}" . Tode . " {FFFFFF}gesetzt")
}
Suspend, Off
return
:?:/kd::
Suspend, Permit
IniRead, Tode, %A_ScriptDir%\Optionen.ini, Statistiken, Tode
IniRead, Morde, %A_ScriptDir%\Optionen.ini, Statistiken, Morde
kdrate := Round(Morde / Tode, 4)
differenz := Round(Morde - Tode)
SendChat("/f Aktuelle Kills: " . Morde . " | Aktuelle Tode: " . Tode . " | Differenz: " . differenz . " | KD: " . kdrate . "")
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/skd::
Suspend, Permit
IniRead, Tode, %A_ScriptDir%\Optionen.ini, Statistiken, Tode
IniRead, Morde, %A_ScriptDir%\Optionen.ini, Statistiken, Morde
kdrate := Round(Morde / Tode, 4)
differenz := Round(Morde - Tode)
SendChat("Aktuelle Kills: " . Morde . " | Aktuelle Tode: " . Tode . " | Differenz: " . differenz . " | KD: " . kdrate . "")
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/cd::
Suspend, Permit
SendInput, {end}+{home}+{Del}+{Esc}
SendChat("Countdown gestartet!")
sleep, 100
SendChat("-3-")
sleep, 1000
SendChat("-2-")
sleep, 1000
SendChat("-1-")
sleep, 1000
SendChat("Go!")
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/tf::
Suspend, Permit
SendChat("/takeflag")
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/abholung::
Suspend, Permit
pos := getCoordinates()
SendChat("/f BenÃ¶tige Abholung in " calculateZone(pos[1],pos[2],pos[3]) " | " calculateCity(pos[1],pos[2],pos[3]))
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/clearkill::
Suspend, Permit
Morde = %Morde%
Morde--
IniWrite, %Morde%, %A_ScriptDir%\Optionen.ini, Statistiken, Morde
IniRead, Morde, %A_ScriptDir%\Optionen.ini, Statistiken, Morde
SendChat("/f Einen Kill gecleart | Aktuelle Kills: " . Morde . "")
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/cleartod::
Suspend, Permit
Tode = %Tode%
Tode--
IniWrite, %Tode%, %A_ScriptDir%\Optionen.ini, Statistiken, Tode
IniRead, Tode, %A_ScriptDir%\Optionen.ini, Statistiken, Tode
SendChat("/f Einen Tod gecleart | Aktulle Tode: " . Tode . "")
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/addtod::
Suspend, Permit
Tode = %Tode%
Tode++
kdrate := Round(Morde / Tode, 4)
differenz := Round(Morde - Tode)
IniWrite, %Tode%, %A_ScriptDir%\Optionen.ini, Statistiken, Tode
IniRead, Tode, %A_ScriptDir%\Optionen.ini, Statistiken, Tode
SendChat("/f Einen Tod hinzugefÃ¼gt | Aktuelle Tode: " . Tode . "")
sleep, 100
addChatMessage("{0095FF}[rauL.exe] {FFFFFF}Kills: {0095FF}" Morde " {FFFFFF}| Tode: {0095FF}" Tode "{FFFFFF} | Differenz: {0095FF}" differenz " {FFFFFF}| KD-Rate: {0095FF}" kdrate "")
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/cc::
Suspend, Permit
Loop, 100
{
addChatMessage(" ")
}
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/at::
Suspend, Permit
SendChat("/accept ticket")
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/sj::
Suspend, Permit
SendChat("/startjob")
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/sex::
Suspend, Permit
SendInput, /sex  0,00{left 5}
Suspend, Off
return
:?:/1k::
Suspend, Permit
SendChat("/bank")
sleep, 100
SendInput, {enter}
sleep, 100
SendInput, 1000,00
sleep, 100
SendInput, {enter}
sleep, 100
SendInput {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/5k::
Suspend, Permit
SendChat("/bank")
sleep, 100
SendInput, {enter}
sleep, 100
SendInput, 5000,00
sleep, 100
SendInput, {enter}
sleep, 100
SendInput {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/10k::
Suspend, Permit
SendChat("/bank")
sleep, 100
SendInput, {enter}
sleep, 100
SendInput, 10000,00
sleep, 100
SendInput, {enter}
sleep, 100
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/ci::
Suspend, Permit
SendChat("/carinfo")
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/wo::
Suspend, Permit
SendChat("/f Wo befinden Sie sich?")
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/as::
Suspend, Permit
SendChat("/accept sex")
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/si::
Suspend, Permit
SendChat("/streetfightinfo")
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/p::
Suspend, Permit
SendChat("/pickup")
SendInput, {end}+{home}+{Del}+{Esc}
Suspend, Off
return
:?:/gegner::
Suspend, Permit
SendInput, {Enter}
sleep, 200
gegner := 0
gegner_on := 0
if(con_all == 0)
{
AddChatMessage("{0095FF}[rauL.exe] {FFFFFF}Es ist niemand auf der Gegnerliste.")
}
else
{
AddChatMessage("{0095FF}[rauL.exe] {FFFFFF}Aktuelle Gegnerliste (Onlinespieler)")
Loop, Read, Gegner.txt
{
StringSplit, split, A_LoopReadLine, |
idname := getPlayerIdByName(split1)
if(idname != -1)
{
AddChatMessage("{0095FF}[rauL.exe] {FFFFFF}[" IDname "] " split1 " - Gang/Mafia: " . split2)
gegner_on++
}
gegner++
}
AddChatMessage("{0095FF}[rauL.exe] {FFFFFF}Es sind {0095FF}" gegner_on "/" gegner "{FFFFFF} Gegner online.")
}
Suspend, Off
return
:?:/fgegner::
Suspend, Permit
SendInput, {Enter}
gegner := 0
gegner_on := 0
if(con_all == 0)
{
AddChatMessage("{0095FF}[rauL.exe] {FFFFFF}Es ist niemand auf der Gegnerliste.")
}
else
{
SendChat("/f Aktuelle Gegnerliste (Onlinespieler)")
Loop, Read, Gegner.txt
{
StringSplit, split, A_LoopReadLine, |
idname := getPlayerIdByName(split1)
if(idname != -1)
{
SendChat("/f [" IDname "] " split1 " - Gang/Mafia: " . split2)
sleep 1550
gegner_on++
}
gegner++
}
sleep 1550
SendChat("/f Es sind " . gegner_on . "/" . gegner . " Gegner online.")
}
Suspend, Off
return
:?:/add::
Suspend, Permit
AddChatMessage("{0095FF}[rauL.exe] {FFFFFF}/add [ID/Name] [Gang/Mafia]")
SendInput, /add{Space}
Input, user, V I M, {Space}
Input, GangMafia, V I M, {Enter}
SendInput, {end}+{home}{Del}{Esc}
if(user == "" || GangMafia == "")
{
AddChatMessage("{0095FF}[rauL.exe] {FFFFFF}Fehler, der Gegner konnte nicht gespeichert werden.")
}
else
{
if user is integer
username := getPlayerNameById(user)
else
username := user
if(username == "")
{
AddChatMessage("{0095FF}[rauL.exe] {FFFFFF}Der Gegner konnte nicht gefunden werden.")
}
else
{
FileAppend, %username%|%GangMafia%`n, Gegner.txt
AddChatMessage("{0095FF}[rauL.exe] {FFFFFF}Der Gegner {0095FF}'" . username . "' {FFFFFF}wurde auf die Gegnerliste gesetzt.")
con_all++
}
}
Suspend, Off
return
:?:/del::
Suspend, Permit
AddChatMessage("{0095FF}[rauL.exe] {FFFFFF}/del [Name]")
SendInput, /del{Space}
Input, user, V I M, {Enter}
SendInput, {end}+{home}{Del}{Esc}
if(user == "")
{
AddChatMessage("{0095FF}[rauL.exe] {FFFFFF}Fehler, du hast keinen Namen eingegeben.")
}
else
{
Loop, Read, Gegner.txt
{
StringSplit, split, A_LoopReadLine, |
if(InStr(split1, user))
{
AddChatMessage("{0095FF}[rauL.exe] {FFFFFF}Der Spieler {0095FF}'" . split1 . "'{FFFFFF} wurde von der Gegnerliste entfernt.")
}
else
{
FileAppend, %split1%|%split2%`n, Gegner2.txt
}
}
FileDelete, Gegner.txt
FileMove, Gegner2.txt, Gegner.txt
}
Suspend, Off
return
:?:/id::
Suspend, Permit
SendInput, /id{space}
Input, varName, V I M,{enter}
SendInput {end}+{home}+{Del}+{Esc}
varID := getPlayerIdByName(varName)
AddChatMessage("{0095FF}[rauL.exe] {FFFFFF}ID: (" varID ") " varName ", Level " getPlayerScoreById(varID))
Suspend, Off
return
:?:/idsms::
Suspend, Permit
SendInput, /idsms{space}
Input, varId, V I M,{enter}
SendInput, {end}+{home}+{Del}+{Esc}
SendChat("/number " varID "")
SetTimer, check1, 250
Suspend, Off
return
check1:
If(!WinActive("GTA:SA:MP"))
return
GetChatLine(0, Line0)
If(InStr(Line0, "Name: "))
{
RegExMatch(Line0, "Name: (.*)\, Tel: (.*)", idsms)
SendInput, t/sms %idsms2%{space}
}
SetTimer, check1, off
