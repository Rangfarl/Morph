#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#include rsbot\Core functions\WindHumanMouse.ahk
#include rsbot\Core functions\progReport.ahk
#include rsbot\Core functions\Logout.ahk
Global isCutting := 0
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
			if (isCutting == 0 && isFull == 0 && lvlup == 0){
				guiControl,, Doing, Task: Finding tree
				sleep 1000
				startTask()
			}
			if(isFull == 1){
				guiControl,, Doing, Task: Inventory full
				Sleep 1500
				Drop()
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
isCutting := 0
	PixelSearch, nx, ny, 8, 30, 520, 364, 0x00FF00, 3, Fast
	if ErrorLevel{
		
		guiControl,, Doing, Task: Chopping willow logs
	}
	else{
		isCutting := 1
		guiControl,, Doing, Task: Chopping willow logs
	}
	Return isCutting
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
	PixelSearch, nx, ny, 8, 30, 520, 364, 0xFEFE00, 3, Fast
	if !ErrorLevel{
		guiControl,, Doing, Task: Tree found
		sleep 278
		Random, randx, -25, 25
		Random, randy, -25, 25
		MoveMouse(nx+randx, ny+randy)
		Click
		Sleep 3000
	}

}

progressstuff(){
	guiControl,, Progresss, Progress: %stopMe% of %stopVar% 
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
		MoveMouse(624+Rand(-5, 5), 257+Rand(-5, 5))
		click
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

