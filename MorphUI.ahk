#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%
SetBatchLines -1

;***********Build Main gui**********

Gui Font, s9, Segoe UI
Gui Add, Button, x144 y288 w97 h33 vStart gButtonManage, Start script
Gui Add, Button, x8 y288 w97 h33 vStop gButtonManage, Stop script
Gui Add, GroupBox, x5 y64 w238 h177, Script manager
Gui Add, Button, x8 y248 w97 h33 vSettings gButtonManage, Settings
Gui Add, Button, x144 y248 w97 h33 vDev gButtonManage, Dev
Gui Add, Button, x128 y79 w106 h25 vAddScript gButtonManage, Add Script
Gui Add, Button, x128 y112 w106 h25 vRemoveScript gButtonManage, Remove Script
;Gui Add, ListBox, x128 y112 w106 h121 vInfo,
Gui Add, ListBox, x16 y112 w106 h121 vScriptchoice,
Gui Add, DropDownList, x16 y80 w106 vSkillChoice gOnSelect,Combat|Prayer|Support Magic|Runecrafting|Crafting|Mining|Smithing|Fishing|Cooking|Firemaking|Woodcutting|Agility|Herblore|Thieving|Fletching|Farming|Construction|Hunter
Gui Font

Gui Font, s12, Segoe UI
Gui Add, Text, x12 y8 w200 h25, Status:
Gui Add, Text, x12 y32 w200 h25, Break:
Gui Font

Gui Font, s12 c0xFF0000, Segoe UI
Gui Add, Text, x68 y8 w200 h25 vStatus, No script running
Gui Add, Text, x68 y32 w200 h25 vBreak, No breaks setup
Gui Font

Gui Show, w248 h328, Morph

;***********Build settings gui**********
    Gui 2:Font, s9, Segoe UI
    Gui 2:Add, Button, x144 y288 w97 h33 vApplysettings gButtonManage, Apply settings
    Gui 2:Add, Button, x8 y288 w97 h33 vExitsettings gButtonManage, Exit settings
    Gui 2:Add, Text, x16 y24 w76 h23 +0x200 vBreaktoggle, Enable breaks:
    Gui 2:Add, GroupBox, x8 y0 w233 h148, Break settings
    Gui 2:Add, Text, x16 y48 w81 h23 +0x200 , Breaks time min:
    Gui 2:Add, Text, x16 y72 w80 h23 +0x200 , Breaks time max:
    Gui 2:Add, CheckBox, x112 y24 w120 h23
    Gui 2:Add, Edit, x112 y48 w120 h21 vBreakMin, Enter min hours
    Gui 2:Add, Edit, x112 y72 w120 h21 vBreakMax, Enter Max hours
    Gui 2:Add, Text, x16 y96 w217 h42, Example: 0 min 5max with choice a random time between 1 minute and 5 hours
    Gui 2:Add, Text, x16 y168 w76 h23 +0x200, Random size:
    Gui 2:Add, Text, x96 y168 w25 h23 +0x200 , Min:
    Gui 2:Add, Text, x168 y168 w25 h23 +0x200 , Max:
    Gui 2:Add, Edit, x128 y168 w32 h21 +Number vRandomMax
    Gui 2:Add, Edit, x200 y168 w32 h21 +Number vRandomMin
    Gui 2:Add, GroupBox, x8 y152 w233 h135, Settings
    Gui 2:Add, Text, x16 y192 w78 h23 +0x200, Reaction time:
    Gui 2:Add, Slider, x96 y192 w135 h24, 50
    Gui 2:Add, Text, x208 y208 w22 h23 +0x200, Fast
    Gui 2:Add, Text, x96 y208 w26 h23 +0x200, Slow
    Gui 2:Add, Text, x16 y232 w131 h23 +0x200, Time controlled reaction:
    Gui 2:Add, CheckBox, x160 y232 w17 h23 vTCRtoggle, CheckBox
Return
ButtonManage:
{
    Gui, Submit, NoHide
    If ( A_GuiControl = "Start" )
    {
    try{
            IF(Scriptchoice != ""){
                Gui, Font, s12 cGreen, Segoe UI
                GuiControl,Font, Status
                GuiControl,, Status, Starting script
                sleep (1000)
                ;MsgBox, Starting Script
                Run, "%A_ScriptDir%\Scripts\%SkillChoice%\%Scriptchoice%.ahk"
            }else{
            MsgBox, Please select a script
            }
        
        }catch e{
            Gui, Font, s12 cRed, Segoe UI
            GuiControl,Font, Status
            GuiControl,, Status, No script running
            MsgBox, Error: Script not found
        }
    }
    Else If ( A_GuiControl = "Stop" )
    {
        Gui, Font, s12 cRed, Segoe UI
        GuiControl,Font, Status
        GuiControl,, Status, No script running
        fullScriptPath = %A_ScriptDir%\Scripts\%SkillChoice%\%Scriptchoice%.ahk  ; edit with your full script path
        DetectHiddenWindows, On 
        WinClose, %fullScriptPath% ahk_class AutoHotkey
    }
    Else If ( A_GuiControl = "Settings" )
    {
        Gui 2:Show, ,Settings
    }    
        Else If ( A_GuiControl = "Dev" )
    {
        MsgBox, Dev menu
    }  
    Else If ( A_GuiControl = "AddScript" )
    {
        MsgBox, To add a script first select a skill from the drop down menu.
        IF(SkillChoice = ""){
            MsgBox, No skill Selected
        }else{
            ;InputBox, newscript, Enter new script name, Please enter the exact name of the ahk file,,, 135
            FileSelectFile, SelectedScript, 3, , Select your script,(*.ahk)
            if(ErrorLevel){
                MsgBox, No Input
            }else{
                if(SelectedScript= ""){
                    MsgBox, No Script Selected
                }else{
                    SplitPath, SelectedScript, Scriptname
                    NewScriptname := RegExReplace(Scriptname, "[.ahk]")
                    IniRead, OutputVar, Scripts.ini, %SkillChoice%, key
                    Newscriptlist = %outputVar%|%NewScriptname%
                    IniWrite, %Newscriptlist%, Scripts.ini, %SkillChoice%, key
                    FileMove, %SelectedScript% , %A_ScriptDir%\Scripts\%SkillChoice%
                    guicontrol,, Scriptchoice, |
                    GuiControl,, Scriptchoice, %Newscriptlist%
             
                }
            }
        }

    } 
    Else If ( A_GuiControl = "RemoveScript" )
    {
        MsgBox, Please select the script to remove from the list`n(Warning this will delete the script!!)
        if(Scriptchoice = ""){
            MsgBox, No Script Selected
        }else{
            IniRead, OutputVar, Scripts.ini, %SkillChoice%, key
            Newscriptlist := StrReplace(OutputVar, Scriptchoice, "")
            FileDelete, %A_ScriptDir%\Scripts\%SkillChoice%\%Scriptchoice%.ahk
			Newlist := StrReplace(Newscriptlist, "||", "|")
            IniWrite, %Newlist%, Scripts.ini, %SkillChoice%, key
            guicontrol,, Scriptchoice, |
            GuiControl,, Scriptchoice, %Newlist%

        }
    }
    else if ( A_GuiControl = "Exitsettings" )
    {
        Gui 2:Hide
    }
    else if ( A_GuiControl = "Applysettings" )
    {
        MsgBox, Settings saved
        Gui 2:Hide
    }
    

}
Return
OnSelect:
{
    Gui, Submit, NoHide
    IF(SkillChoice = "Combat")
    {
        IniRead, OutputVar, Scripts.ini, Combat, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Prayer")
    {
        IniRead, OutputVar, Scripts.ini, Prayer, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Support Magic")
    {
        IniRead, OutputVar, Scripts.ini, Support Magic, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Runecrafting")
    {
        IniRead, OutputVar, Scripts.ini, Runecrafting, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Crafting")
    {
        IniRead, OutputVar, Scripts.ini, Crafting, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Mining")
    {
        IniRead, OutputVar, Scripts.ini, Mining, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Smithing")
    {
        IniRead, OutputVar, Scripts.ini, Smithing, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Fishing")
    {
        IniRead, OutputVar, Scripts.ini, Fishing, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Cooking")
    {
        IniRead, OutputVar, Scripts.ini, Cooking, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Firemaking")
    {
        IniRead, OutputVar, Scripts.ini, Firemaking, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Woodcutting")
    {
        IniRead, OutputVar, Scripts.ini, Woodcutting, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Agility")
    {
        IniRead, OutputVar, Scripts.ini, Agility, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Herblore")
    {
        IniRead, OutputVar, Scripts.ini, Herblore, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Thieving")
    {
        IniRead, OutputVar, Scripts.ini, Thieving, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Fletching")
    {
        IniRead, OutputVar, Scripts.ini, Fletching, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Farming")
    {
        IniRead, OutputVar, Scripts.ini, Farming, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Construction")
    {
        IniRead, OutputVar, Scripts.ini, Construction, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
        Else If (SkillChoice = "Hunter")
    {
        IniRead, OutputVar, Scripts.ini, Hunter, key
        guicontrol,, Scriptchoice, |
        GuiControl,, Scriptchoice, %Outputvar%
    }
    
}
return

GuiEscape:
GuiClose:
    ExitApp
