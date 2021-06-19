#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#include C:\Users\ihost\Desktop\rsbot\Core functions\WindHumanMouse.ahk
#include C:\Users\ihost\Desktop\rsbot\Core functions\progReport.ahk
#include C:\Users\ihost\Desktop\rsbot\Core functions\Logout.ahk
;#include C:\Users\ihost\Desktop\rsbot\Core functions\Upgraded_dropper.ahk
Global isFishing := 0
Global isFull := 0 
Global lvlup := 0 
Global stopMe := 0
Global stopVar := 0

f1::
goto theStart
return

theStart:
CoordMode, Pixel, Client
InputBox, stopVar, Break/progress settings, Enter Number of inventorys to do,, 250, 130
stopMe := 0
progGUI()
	Loop{
		lvlCheck()
		invCheck()
		doingTask()
		progressstuff()
			if (isFishing == 0 && isFull == 0 && lvlup == 0){
				guiControl,, Doing, Task: Finding fishing spot
				sleep 1000
				startTask()
			}
			if(isFull == 1){
				guiControl,, Doing, Task: Inventory full
				Sleep 1500
				drop()
			}
			if(lvlup == 1){
			Sleep 1500
			Random, randx, 164, 343
			Random, randy, 469, 483
			MoveMouse(randx, randy)
			sleep 150
			click
			}
			if(stopMe == stopVar){
			guiControl,, Doing, Task: Limit reached, logging out.
			sleep 2000
			Logout()
			}
		
	}
return

doingTask(){
isFishing := 0
	PixelSearch, nx, ny, 360, 304, 484, 355, 0x00FF00, 3, Fast
	if ErrorLevel{
		
		guiControl,, Doing, Task: Fly fishing
	}
	else{
		isFishing := 1
		guiControl,, Doing, Task: Fly fishing
	}
	Return isFishing
}

invCheck(){
isFull := 0
	PixelSearch, nx, ny, 690, 461, 725, 485, 0xFF00FF, 3, Fast
	if ErrorLevel{
		isFull := 0
	}
	else{
		isFull := 1
	}
	Return isFull
}
lvlCheck(){
lvlup := 0
	PixelSearch, x, y, 0, 367, 520, 506, 0x07F0000 , 3, Fast
	if ErrorLevel{
		lvlup := 0
	}
	else{
		lvlup := 1
		guiControl,, Doing, Task: Dismising level up
	}
	Return lvlup
}
startTask(){
	PixelSearch, nx, ny, 8, 30, 520, 364, 0x00FFFF, 3, Fast RGB
	if !ErrorLevel{
		guiControl,, Doing, Task: Finding fishing spot
		sleep 278
		Random, randx, -3, 3
		Random, randy, -3, 3
		MoveMouse(nx+randx, ny+randy)
		Click
		Sleep 7000
	}

}
progressstuff(){
	guiControl,, Progresss, Progress: %stopMe% of %stopVar% inventorys
}

Rand(min:=1, max:=1){
    Random out, min, max
    return % out
}
Drop(){
		;36 down
		;row 1, 582,257
		stopMe++
		Sleep 2500
		guiControl,, Doing, Task: Droping inventory
		Send {Shift down}
		;===========Row 1==============
		MoveMouse(582+Rand(-5, 5), 293+Rand(-5, 5))
		click
		sleep 150
		MoveMouse(582+Rand(-5, 5), 293+Rand(-5, 5)+36)
		click
		sleep 150
		MoveMouse(582+Rand(-5, 5), 293+Rand(-5, 5)+72)
		click
		sleep 150
		MoveMouse(582+Rand(-5, 5), 293+Rand(-5, 5)+108)
		click
		sleep 150
		MoveMouse(582+Rand(-5, 5), 293+Rand(-5, 5)+144)
		click
		sleep 150
		MoveMouse(582+Rand(-5, 5), 293+Rand(-5, 5)+180)
		click
		sleep 150
		;============Row 2============
		;MoveMouse(624+Rand(-5, 5), 257+Rand(-5, 5))
		;click
		sleep 150
		MoveMouse(624+Rand(-5, 5), 257+Rand(-5, 5)+36)
		click
		sleep 150
		MoveMouse(624+Rand(-5, 5), 257+Rand(-5, 5)+72)
		click
		sleep 150
		MoveMouse(624+Rand(-5, 5), 257+Rand(-5, 5)+108)
		click
		sleep 150
		MoveMouse(624+Rand(-5, 5), 257+Rand(-5, 5)+144)
		click
		sleep 150
		MoveMouse(624+Rand(-5, 5), 257+Rand(-5, 5)+180)
		click
		sleep 150
		MoveMouse(624+Rand(-5, 5), 257+Rand(-5, 5)+216)
		click
		sleep 150
		;===========Row 3==============
		MoveMouse(666+Rand(-5, 5), 257+Rand(-5, 5))
		click
		sleep 150
		MoveMouse(666+Rand(-5, 5), 257+Rand(-5, 5)+36)
		click
		sleep 150
		MoveMouse(666+Rand(-5, 5), 257+Rand(-5, 5)+72)
		click
		sleep 150
		MoveMouse(666+Rand(-5, 5), 257+Rand(-5, 5)+108)
		click
		sleep 150
		MoveMouse(666+Rand(-5, 5), 257+Rand(-5, 5)+144)
		click
		sleep 150
		MoveMouse(666+Rand(-5, 5), 257+Rand(-5, 5)+180)
		click
		sleep 150
		MoveMouse(666+Rand(-5, 5), 257+Rand(-5, 5)+216)
		click
		sleep 150
		;===========Row 4==============
		MoveMouse(708+Rand(-5, 5), 257+Rand(-5, 5))
		click
		sleep 150
		MoveMouse(708+Rand(-5, 5), 257+Rand(-5, 5)+36)
		click
		sleep 150
		MoveMouse(708+Rand(-5, 5), 257+Rand(-5, 5)+72)
		click
		sleep 150
		MoveMouse(708+Rand(-5, 5), 257+Rand(-5, 5)+108)
		click
		sleep 150
		MoveMouse(708+Rand(-5, 5), 257+Rand(-5, 5)+144)
		click
		sleep 150
		MoveMouse(708+Rand(-5, 5), 257+Rand(-5, 5)+180)
		click
		sleep 150
		MoveMouse(708+Rand(-5, 5), 257+Rand(-5, 5)+216)
		click
		sleep 750
		Send {Shift up}

}
