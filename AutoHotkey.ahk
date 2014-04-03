#Include global_config.ahk
;#Include global_var.ahk
#Include common_function.ahk
#Include main.ahk
;#Include quick_input.ahk
#Include consol2.ahk
#Include explorer.ahk
#Include global.ahk
#Include desktop.ahk



;------------------------------------------------------------------------------
; Hand tool with middle button in Adobe Reader
;------------------------------------------------------------------------------
#IfWinActive ahk_class AdobeAcrobat
Mbutton::
#IfWinActive ahk_class AcrobatSDIWindow
Mbutton::
#IfWinActive ahk_class DSUI:PDFXCViewer
Mbutton::
Send {Space down}{LButton down}  ; Hold down the left mouse button.
KeyWait Mbutton  ; Wait for the user to release the middle button.
Send {LButton up}{Space up}  ; Release the left mouse button.
return
#IfWinActive

;------------------------------------------------------------------------------
; Hand tool with middle button in Sumatra PDF
;------------------------------------------------------------------------------
#IfWinActive ahk_class SUMATRA_PDF_FRAME
Mbutton::
Send {RButton down}  ; Hold down the left mouse button.
KeyWait Mbutton  ; Wait for the user to release the middle button.
Send {RButton up}  ; Release the left mouse button.
return
#IfWinActive


;------------------------------------------------------------------------------
; Ctrl+Q closes Firefox
;------------------------------------------------------------------------------
;#IfWinActive ahk_class MozillaWindowClass
;^q::
;Send !f
;Send !x
;return
;#IfWinActive


;------------------------------------------------------------------------------
; Ctrl+W closes tabs in IAR compiler or TINA-TI
;------------------------------------------------------------------------------
;#IfWinActive IAR Embedded Workbench IDE
;^w::
;#IfWinActive ahk_class TSchematicEditor
;^w::
;Send ^{F4}
;return
;#IfWinActive


;------------------------------------------------------------------------------
; WINDOWS KEY + H TOGGLES HIDDEN FILES
; from http://www.howtogeek.com/howto/keyboard-ninja/keyboard-ninja-toggle-hidden-files-with-a-shortcut-key-in-windows/
;------------------------------------------------------------------------------
#h::
RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden
If HiddenFiles_Status = 2 
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
Else 
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
WinGetClass, eh_Class,A
If (eh_Class = "#32770" OR A_OSVersion = "WIN_VISTA" OR A_OSVersion = "WIN_7")
send, {F5}
Else PostMessage, 0x111, 28931,,, A
Return


;------------------------------------------------------------------------------
; WINDOWS KEY + Y TOGGLES FILE EXTENSIONS
; from http://www.howtogeek.com/howto/windows-vista/keyboard-ninja-toggle-file-extension-display-with-a-shortcut-key-in-windows/
;------------------------------------------------------------------------------
#y::
RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt
If HiddenFiles_Status = 1 
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 0
Else 
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 1
WinGetClass, eh_Class,A
If (eh_Class = "#32770" OR A_OSVersion = "WIN_VISTA" OR A_OSVersion = "WIN_7")
send, {F5}
Else PostMessage, 0x111, 28931,,, A
Return


;------------------------------------------------------------------------------
; Google text from any app
; from http://superuser.com/questions/7271/most-useful-autohotkey-scripts/165220#165220
;------------------------------------------------------------------------------
;#g::
;MyClip := ClipboardAll
;Clipboard = ; empty the clipboard
;Send, ^c
;ClipWait, 2
;if ErrorLevel  ; ClipWait timed out.
;{
;    return
;}
;if RegExMatch(Clipboard, "^(https?://|www\.)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(/\S*)?$")
;{
;    Run % Clipboard
;}
;else
;{
;    ; Modify some characters that screw up the URL
;    ; RFC 3986 section 2.2 Reserved Characters (January 2005):  !*'();:@&=+$,/?#[]
;    StringReplace, Clipboard, Clipboard, `r`n, %A_Space%, All
;    StringReplace, Clipboard, Clipboard, #, `%23, All
;    StringReplace, Clipboard, Clipboard, &, `%26, All
;    StringReplace, Clipboard, Clipboard, +, `%2b, All
;    StringReplace, Clipboard, Clipboard, ", `%22, All
;    Run % "http://www.google.com/#hl=en&q=" . clipboard ; uriEncode(clipboard)
;}
;Clipboard := MyClip
;return


;------------------------------------------------------------------------------
; RWIN timestamp
;------------------------------------------------------------------------------
; Should be a keyboard shortcut or a phrase?
; Needs to be compatible with spreadsheet formats

+!d:: ;Shift-Alt-D: RWIN current date and time stamp
FormatTime, T, %A_Now%, yyyy-MM-dd hh:mm:ss tt ; 2012-01-24 10:54:31 PM - works in LibreOffice, Google Spreadsheet, Excel
SendInput %T%
return

::|date:: ;RWIN current date
FormatTime, T, %A_Now%, yyyy-MM-dd ; 2011-07-25
SendInput %T%
return

::|time:: ;RWIN current time
FormatTime, T, %A_Now%, hh:mm:sstt ; 09:24:20AM
SendInput %T%
return


;------------------------------------------------------------------------------
; quick input
;------------------------------------------------------------------------------
::|ahk:: autohotkey

;------------------------------------------------------------------------------
; Make windows transparent
;------------------------------------------------------------------------------
;#T::
;DetectHiddenWindows, on
;WinGet, curtrans, Transparent, A
;if ! curtrans
;	curtrans = 255
;newtrans := curtrans - 64
;if newtrans > 0
;{
;	WinSet, Transparent, %newtrans%, A

;}
;else
;{
;	WinSet, Transparent, 255, A
;	WinSet, Transparent, OFF, A
;}
;return

;#w::
;DetectHiddenWindows, on
;WinSet, TransColor, Black 128, A
;return

;#o::
;WinSet, Transparent, 255, A
;WinSet, Transparent, OFF, A
;return


;------------------------------------------------------------------------------
;#g::  ; Press Win+G to show the current settings of the window under the mouse.
;MouseGetPos,,, MouseWin
;WinGet, Transparent, Transparent, ahk_id %MouseWin%
;WinGet, TransColor, TransColor, ahk_id %MouseWin%
;ToolTip Translucency:`t%Transparent%`nTransColor:`t%TransColor%
;return
;------------------------------------------------------------------------------



;------------------------------------------------------------------------------
; Win+Alt+V: Paste plain text only, stripping characters unsafe for filenames
;------------------------------------------------------------------------------
#!v:: ; paste without formatting
  StringReplace, clipboardt, clipboard, `r`n, %A_Space%, All
  clipboardt := RegExReplace(clipboardt, "` {2,}", "` ")
  StringLeft, 1st, clipboardt, 1
  IfInString, 1st, %A_Space%
    StringTrimLeft, clipboardt, clipboardt, 1
  StringRIght, last, clipboardt, 1
  IfInString, last, %A_Space%
    StringTrimRight, clipboardt, clipboardt, 1
  ;Send {Raw}%clipboardt%
  
  Clip0 = %ClipBoardAll%
  ClipBoard = %clipboardt%      ; Convert to plain text
  Send ^v                       ; For best compatibility: SendPlay
  Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
  ClipBoard = %Clip0%           ; Restore original ClipBoard
  VarSetCapacity(Clip0, 0)      ; Free memory
  clipboardt =
return

;------------------------------------------------------------------------------
;全局模式
;------------------------------------------------------------------------------
^!t::
global_Always_OnTop()
return

RWIN::
global_get_app_classname()
  ;global_get_activewin_title()
  ;global_disable_rwin_key()
return

#c::global_winc_copytoclipboard()
#x::global_winx_cuttoclipboard()
#s::global_wins_savetofile()
;#v::global_winv_past_from_clipboard()
#g::global_google_translate()
#q::Send !{F4}

;------------------------------------------------------------------------------
;桌面模式
;------------------------------------------------------------------------------
#If WinActive("ahk_class WorkerW") or WinActive("ahk_class Progman") or WinActive("ahk_class Button") or WinActive("ahk_class Shell_TrayWnd")
  F3:: desktop_lanuch_everything_app()
  F1:: desktop_lanuch_sublime_text_app()

  1::desktop_open_path("D:\hxjh\bin\trunk\client\fighttribe\resource\script")   ;lua脚本
  2::desktop_open_path("D:\hxjh\bin\trunk\client\fighttribe\resource\layout")   ;layout xml
  3::desktop_open_path("D:\hxjh\src\trunk\common")                              ;pb
  4::desktop_open_path("D:\hxjh\src\trunk\client\project\FightTribe\protobuf")  ;cp pb
  5::desktop_open_path("D:\hxjh\src\trunk\client\project\FightTribe\src")       ;tolua++
  6::desktop_open_path("D:\hxjh\doc\开发区\需求和策划\0426版本\易罗阳_UI专用")  ;界面文档
  7::desktop_open_path("D:\hxjh\doc\开发区\需求和策划\0426版本\第四版界面修改方案")  ;界面文档
  ;D:\hxjh\src\trunk\client\project\FightTribe\include
  8::desktop_open_path("D:\hxjh\src\trunk\client\project\FightTribe\include")  ;界面文档
  9::desktop_open_path("D:\hxjh\src\trunk\client\project\FightTribe\src")      ;界面文档
  0::desktop_open_path("D:\hxjh\bin\trunk\client\fighttribe\resource\uiimage\destinywindow")
  q::desktop_open_path("D:\hxjh\src\trunk\client\project\tolua++")
;------------------------------------------------------------------------------
;ShellTrayWnd 模式
;------------------------------------------------------------------------------
#If WinActive("ahk_class Shell_TrayWnd")
  ;1::desktop_open_path("D:\hxjh\bin\trunk\client\fighttribe")                       ;金庸执行文件目录
  ;2::desktop_open_path("D:\hxjh\doc\开发区\需求和策划\0426版本\第四版界面修改方案") ;金庸4月26日DOC文档目录
  ;3::desktop_open_path("D:\hxjh\bin\trunk\client\fighttribe\resource\data")         ;金庸data文档目录
  ;4::desktop_open_path("D:\hxjh\bin\trunk\client\fighttribe\resource\layout")         ;金庸Layout文档目录
  ;pbuffer文档
  ;F5::desktop_open_path("D:\hxjh\src\trunk\common") 
  ;tolua++      
  ;F6::desktop_open_path("D:\hxjh\src\trunk\client\project\FightTribe\src")





  q::desktop_open_jinyong_resource_path()
  w::desktop_open_dice_app_client_resource_trunk()
  `::explorer_e()
  a::desktop_open_python_tool()
  esc::desktop_open_autohotkeyfolder()
  =::shelltraywnd_open_numequal()

;------------------------------------------------------------------------------
;explorer 模式
;------------------------------------------------------------------------------
#If WinActive("ahk_class CabinetWClass")
  !G:: explorer_alt_g()
  `:: explorer_e()
  

  
;------------------------------------------------------------------------------
;;在命令行窗口启用快捷键粘贴
;------------------------------------------------------------------------------
#IfWinActive ahk_class Console_2_Main
^v::
Send {Escape 2}ii
;SendInput %clipboard%
#IfWinActive