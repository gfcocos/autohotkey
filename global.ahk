;------------------------------------------------------------------------------
;窗口置顶
;------------------------------------------------------------------------------
global_Always_OnTop()
{
  static active_id = -1
  WinSet, AlwaysOnTop, Off,ahk_id %active_id%
  WinGet, active_id, ID, A
  WinSet, AlwaysOnTop, On,ahk_id %active_id%
  SoundBeep
}
;------------------------------------------------------------------------------
;获取程序类名
;------------------------------------------------------------------------------
global_get_app_classname()
{
  WinGetClass, class, A
  MsgBox, The active window's class is "%class%".
}

;------------------------------------------------------------------------------
;获取程序标题
;------------------------------------------------------------------------------
global_get_activewin_title()
{
  WinGetActiveTitle, Title
  MsgBox, The active window is "%Title%".  
}

;------------------------------------------------------------------------------
; Disable RWIN key
;------------------------------------------------------------------------------
global_disable_rwin_key()
{
  ;$RWIN::return
  ;!RWIN::Send, {RWIN} ; Use Alt+RWIN to toggle the 'RWIN mode'  
  ;return 
}

;------------------------------------------------------------------------------
; close current windowd
;------------------------------------------------------------------------------
global_close_active_window()
{
  Send !{F4}  
  return
}

;Sleep 1000  ; 让用户有机会释放按键 (以防释放它们时再次唤醒显视器).
; 关闭显示器:
;SendMessage, 0x112, 0xF170, 2,, Program Manager  ; 0x112 为 WM_SYSCOMMAND, 0xF170 为 SC_MONITORPOWER.
;WinGetTitle, wintitle, A
;Send exit
;Send {ENTER}
;return

;------------------------------------------------------------------------------
;
;------------------------------------------------------------------------------



;------------------------------------------------------------------------------
; Win+c: copy as plain text to clipboard
;------------------------------------------------------------------------------
global_winc_copytoclipboard()
{
  Clipboard = ; empty the clipboard
  Send, ^c
  return  
}

;------------------------------------------------------------------------------
; Win+x: copy as plain text to clipboard
;------------------------------------------------------------------------------
global_winx_cuttoclipboard()
{
  Clipboard = ; empty the clipboard
  Send, ^c
  Send, {BS}  
  return
}

;------------------------------------------------------------------------------
; Win+s: save file
;------------------------------------------------------------------------------
global_wins_savetofile()
{
  Send, ^s  
  return
}

;------------------------------------------------------------------------------
; Win+V: Paste as plain text from clipboard
;------------------------------------------------------------------------------
global_winv_past_from_clipboard()
{
  Clip0 = %ClipBoardAll%
  ClipBoard = %ClipBoard%       ; Convert to plain text
  Send ^v                       ; For best compatibility: SendPlay
  Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
  ClipBoard = %Clip0%           ; Restore original ClipBoard
  VarSetCapacity(Clip0, 0)      ; Free memory
  Return
}



;------------------------------------------------------------------------------
; Google translate selected text
;------------------------------------------------------------------------------
global_google_translate()
{
  MyClip := ClipboardAll
  Clipboard = ; empty the clipboard
  Send, ^c
  ClipWait, 2
  if ErrorLevel  ; ClipWait timed out.
  {
      return
  }
  StringReplace, Clipboard, Clipboard, `%, `%25, All ; has to come first
  StringReplace, Clipboard, Clipboard, `r`n, `%0A, All
  Run % "http://translate.google.com/#auto|zh-CN|" . clipboard ; uriEncode(clipboard)
  Clipboard := MyClip
  return
}

  


