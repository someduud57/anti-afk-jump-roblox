SetWorkingDir %A_ScriptDir%
#SingleInstance Force
SendMode Input

toggle := false
interval := 10

Gui, Color, 10131C
Gui, Font, s10 cFFFFFF, Segoe UI

Gui, Add, Text, x24 y18 w312 h30 Center c7C9CFFF, SPACE PULSE
Gui, Font, s9 c8994AA, Segoe UI
Gui, Add, Text, x24 y49 w312 h20 Center, SPACE AUTO PRESSER

Gui, Add, Progress, x24 y82 w312 h74 c1A2030 Background1A2030, 100
Gui, Font, s10 c8994AA, Segoe UI
Gui, Add, Text, x42 y94 w276 h18 Center, SYSTEM STATUS
Gui, Font, s16 cFF647C Bold, Segoe UI
Gui, Add, Text, x42 y116 w276 h28 Center vStatus, ● OFFLINE

Gui, Font, s10 cFFFFFF Bold, Segoe UI
Gui, Add, Button, x24 y174 w148 h42 gStart, START [F6]
Gui, Add, Button, x188 y174 w148 h42 gStop, STOP [F7]

Gui, Font, s9 cAAB3C5, Segoe UI
Gui, Add, Text, x24 y230 w312 h22 Center, TOGGLE: F8
Gui, Add, Text, x24 y270 w312 h22 Center c68738A, SPACE PULSE  •  READY

Gui, Show, w360 h320, Space Pulse
WinSet, Region, 0-0 W360 H320 R18-18, Space Pulse
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
toggle := true
GuiControl, +c54E39A, Status
GuiControl,, Status, ● ACTIVE
SetTimer, jump, %interval%
return

Stop:
toggle := false
GuiControl, +cFF647C, Status
GuiControl,, Status, ● OFFLINE
SetTimer, jump, Off
return

jump:
if (toggle)
    Send, {Space}
return

GuiClose:
ExitApp
return
