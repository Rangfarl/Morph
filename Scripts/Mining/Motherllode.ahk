#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;Mine ore
;Walk to center
;Deposit ore in sack
;Walk to mining zone
;Repeat x4
;Collect
;Deposit to bank
f2::
exitapp
return
Global lvlup := 0
Global isMining := 0
Global isFull := 0
Global centerx := 260
Global centery := 200

f1::
goto theStart
return

theStart:
	Loop{
		invCheck()
		lvlCheck()
		doingTask()
			if (isMining == 0 && isFull == 0 && lvlup == 0){
				sleep 1000
				startTask()
			}
			if(isFull == 1){

				deposit()
			}
			if(lvlup == 1){
			Sleep 1500
			Random, randx, 164, 343
			Random, randy, 469, 483
			MouseMove, randx, randy
			sleep 150
			click
			}
		
	}
return
invCheck(){
isFull := 0
	PixelSearch, nx, ny, 690, 461, 725, 485, 0x62626a, 15, Fast RGB
	if ErrorLevel{
		isFull := 0
	}
	else{
		isFull := 1
	}
	Return isFull
}

startTask(){
	PixelSearch, nx, ny, 8, 68, 518, 224, 0xA49896, 25, Fast RGB
	if !ErrorLevel{
		sleep 278
		Mousemove, nx, ny
		Click
		Sleep 7000
	}

}
lvlCheck(){
lvlup := 0
	PixelSearch, x, y, 0, 367, 520, 506, 0x07F0000 , 3, Fast
	if ErrorLevel{
		lvlup := 0
	}
	else{
		lvlup := 1
	}
	Return lvlup
}
doingTask(){
isMining := 0
	PixelSearch, nx, ny, 15, 50, 140, 100, 0x00FF00, 3, Fast
	if ErrorLevel{
		
	}
	else{
		isMining := 1
	}
	Return isMining
}
deposit(){
	PixelSearch, nx, ny, 576, 108, 697, 148, 0x5b4f55, 3, Fast RGB
	if ErrorLevel{
		msgbox, error
	}
	else{
		sleep 278
		Mousemove, nx, ny
		Click
		Sleep 5000
		mousemove, 260-35 , 200
		sleep 200
		Click
		sleep 4000
		mousemove, 260 , 200-150
		click
		sleep 5000
		mousemove, 260, 200+15
		sleep
		click
		sleep 4000
	}
}
