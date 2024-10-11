; ┌──────────────────────────┐
; │     Help                 │
; └──────────────────────────┘
; Alt: !, Ctrl: ^, Shift: +, Win: #

; ┌──────────────────────────┐
; │     Move                 │
; └──────────────────────────┘
;ctrl+h: move left
^h:: Send("{Left}") 

;ctrl+j: move down
^j:: Send("{Down}")

;ctrl+k: move up
^k:: Send("{Up}")

;ctrl+l: move right
^l:: Send("{Right}")

;ctrl+0: move to the beginning of the line
^0:: Send("{Home}")

;ctrl+shift+4: move to the end of the line
^+4:: Send("{End}")

; ┌──────────────────────────┐
; │     Operator             │
; └──────────────────────────┘
GroupAdd("GroupA", "ahk_exe msedge.exe") ; Edge 浏览器
GroupAdd("GroupA", "ahk_exe Code.exe") ; VS Code
GroupAdd("GroupA", "ahk_exe zotero.exe") ; VS Code
#HotIf WinActive("ahk_group GroupA")
!w::Send("^w")
#HotIf
!w::Send("!{F4}")

;ctrl+alt+f: maximize window or restore window
^!f::{
    if WinGetMinMax("A"){
        WinRestore "A"
    }else{
        WinMaximize "A"
    }
}

; ┌──────────────────────────┐
; │     Like MacOS           │
; └──────────────────────────┘
;ctrl+alt+q: lock screen
^!q:: DllCall("LockWorkStation")

;alt+c: copy
!c:: Send("^c")

;alt+v: paste
!v:: Send("^v")