;________________________________________________________
;                                                        
; Created by:        
;                                                        
;--------------------------------------------------------
; Description: 
; +Handles general random sleeps.            
;________________________________________________________



CryptGenRandom(Min := -2147483648, Max := 2147483647, Len := 4) {
    Local n

    If (DllCall("Advapi32.dll\CryptAcquireContext", "Ptr*", hProv, "Ptr", 0, "Ptr", 0, "UInt", 1, "UInt", 0)) {
        VarSetCapacity(Buffer, Len, 0)
        If (DllCall("Advapi32.dll\CryptGenRandom", "Ptr", hProv, "UInt", Len, "Ptr", &Buffer)) {
            n := Mod(NumGet(Buffer), (Max + 1 - Min)) + Min
        }

        DllCall("Advapi32.dll\CryptReleaseContext", "Ptr", hProv, "UInt", 0)
    }

    return n != "" ? n : "ERROR"
}

WRand(min, target, max) 
{
    m := CryptGenRandom((target+min)/1.777,(max+target)/2.222) . " "
	n := CryptGenRandom(min, m) . " "
	o := CryptGenRandom(m, max) . " "
	p := Round(CryptGenRandom(n, o) . " ")

	Return, p
}
