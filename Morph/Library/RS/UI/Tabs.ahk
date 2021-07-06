;________________________________________________________
;                                                        
; Created by:        
;                                                        
;--------------------------------------------------------
; Description: 
; +Handles switching game tabs.
; +Checking what tab you are on.            
;--------------------------------------------------------
; Usage: 
; +Switches between game tabs.
; +SwitchTab(1-14)       
;________________________________________________________
SetWorkingDir %A_ScriptDir%
#include Core\Mouse.ahk


SwitchTab(tab){
	if(tab < 1 || tab > 15){
		return 0
	}else{
		if(tab <= 7){
			x := 540+((tab - 1) * 33)
			MoveMouse(x,215)
		}else{
			x := 540+(Mod(tab, 8) * 33)
			MoveMouse(x,510)
		}
	}
}
