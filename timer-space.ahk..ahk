SetWorkingDir %A_ScriptDir%
#SingleInstance Force
SendMode Input

toggle := false

Gui, Color, 10131C
Gui, Font, s10 cFFFFFF, Segoe UI

Gui, Add, Text, x24 y18 w312 h30 Center c7C9CFFF, S P A C E   P U L S E
Gui, Font, s9 c8994AA, Segoe UI
Gui, Add, Text, x24 y49 w312 h20 Center, AUTO SPACER  /  CONTROL PANEL

Gui, Add, Progress, x24 y82 w312 h74 c1A2030 Background1A2030, 100
Gui, Font, s10 c8994AA, Segoe UI
Gui, Add, Text, x42 y94 w276 h18 Center, SYSTEM STATUS
Gui, Font, s16 cFF647C Bold, Segoe UI
Gui, Add, Text, x42 y116 w276 h28 Center vStatus, ●  OFFLINE

Gui, Font, s10 cFFFFFF Bold, Segoe UI
Gui, Add, Button, x24 y174 w148 h42 gStart, START  [F6]
Gui, Add, Button, x188 y174 w148 h42 gStop, STOP  [F7]

Gui, Font, s9 cAAB3C5, Segoe UI
Gui, Add, Text, x24 y230 w312 h22 Center, TOGGLE: F8
Gui, Add, Text, x36 y270 w112 h22, Interval (ms)
Gui, Add, Edit, x148 y266 w70 h26 vIntervalEdit Number Center, 50
Gui, Add, Text, x226 y270 w100 h22 c8994AA, lager = langzamer

Gui, Add, Progress, x24 y310 w312 h1 c30394A, 100
Gui, Font, s8 c68738A, Segoe UI
Gui, Add, Text, x24 y320 w312 h18 Center, SPACE PULSE  •  READY

Gui, Show, w360 h356, Space Pulse

; Afgeronde buitenhoeken en subtiele rand
WinSet, Region, 0-0 W360 H356 R18-18, Space Pulse
WinSet, Style, +0x800000, Space Pulse
return

F6::
Gosub, Start
return

F7::
Gosub, Stop
return

F8::
if (toggle)
    Gosub, Stop
else
    Gosub, Start
return

Start:
Gui, Submit, NoHide
if (IntervalEdit < 1)
    IntervalEdit := 1
toggle := true
GuiControl, +c54E39A, Status
GuiControl,, Status, ●  ACTIVE
SetTimer, jump, %IntervalEdit%
return

Stop:
toggle := false
GuiControl, +cFF647C, Status
GuiControl,, Status, ●  OFFLINE
SetTimer, jump, Off
return

jump:
if (toggle)
    Send, {Space}
return

GuiClose:
ExitApp
return