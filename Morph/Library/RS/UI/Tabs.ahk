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
;--------------------------------------------------------
; Todo: 
; +Erro log stuff
; +Randomize mouse add in clicks.
;___________________________________________________
SetWorkingDir %A_ScriptDir%
#include Core\Mouse.ahk


SwitchTab(tab){
	if(tab < 1 || tab >= 15 || tab = Checktab()){
		MsgBox, Error ;Add error log here
		return 0 ;todo add error log message.
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

Checktab(){
	currenttab := 0
	PixelSearch, nx, ny, 524, 170, 762, 201, 0x6B241B, 5, Fast RGB
	if ErrorLevel{
		PixelSearch, nx, ny, 531, 468, 771, 501, 0x75281E, 8, FAST RGB
			if ErrorLevel{
				;todo add error log
				tooltip, not found
				
			}else{
				if(nx <= 559 || >= 524){
					currenttab := 8
				}else if(nx <= 590 || >= 560){
					currenttab := 9
				
				}else if(nx <= 621 || >= 591){
					currenttab := 10
				
				}else if(nx <= 652 || >= 622){
					currenttab := 11
				
				}else if(nx <= 683 || >= 653){
					currenttab := 12
				
				}else if(nx <= 733 || >= 684){
					currenttab := 13
				
				}else if(nx <= 768 || >= 734){
					currenttab := 14
				
				}else{
					;add error log here
				}
				Return currenttab
			}
			
			
	}else{
			If(nx <= 559 || >= 524){
				currenttab := 1
			}else if(nx <= 590 || >= 560){
				currenttab := 2
			
			}else if(nx <= 621 || >= 591){
				currenttab := 3
			
			}else if(nx <= 652 || >= 622){
				currenttab := 4
			
			}else if(nx <= 683 || >= 653){
				currenttab := 5
			
			}else if(nx <= 733 || >= 684){
				currenttab := 6
			
			}else if(nx <= 768 || >= 734){
				currenttab := 7
			
			}else{
				;todo add error log.
			}
			Return currenttab
	}
}


