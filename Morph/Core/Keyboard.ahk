;________________________________________________________
;                                                        
; Created by:        
;                                                        
;--------------------------------------------------------
; Description: 
; +Keyboard functions         
;________________________________________________________
#include Library\Antiban\SleepRandom.ahk

SendKey(key){
	StrValue := Key
	tooltip, %StrValue%
	if(StrValue <= 1){
		Sleep, WRand(130, 170, 195) ;Intergrate with settings menu.
		Send % key
	}else{
		;Put log info here.
	}
}
SendSting(string){
	Loop, parse, string
	{
		Send % A_LoopField
		s := WRand(135, 170, 215)
		Sleep, %s% ;Intergrate with settings menu.
		tooltip, %s%
	}
}
