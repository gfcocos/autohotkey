; Launch console if necessary; hide/show on Win+`

Launch_console()
{
    DetectHiddenWindows, on
    IfWinExist ahk_class Console_2_Main
    {
      IfWinActive ahk_class Console_2_Main
        {
          WinHide ahk_class Console_2_Main
          ; need to move the focus somewhere else.
          WinActivate ahk_class Shell_TrayWnd
        }
      else
        {
          WinShow ahk_class Console_2_Main
          WinActivate ahk_class Console_2_Main
        }
    }
    else
      Run C:\Console2\Console.exe
    ; the above assumes a shortcut in the c:\windows folder to console.exe.
    ; also assumes console is using the default console.xml file, or
    ; that the desired config file is set in the shortcut.

    DetectHiddenWindows, off
    return
}

; hide console on "esc".
hide_console()
{
   IfWinActive ahk_class Console_2_Main
   {
     WinHide ahk_class Console_2_Main
     WinActivate ahk_class Shell_TrayWnd
   }
   return
}

;------------------------------------------------------------------------------
;;在命令行窗口启用快捷键粘贴
;------------------------------------------------------------------------------
;#IfWinActive ahk_class Console_2_Main
;^v::
;Send {Escape 2}ii
;SendInput %clipboard%
;#IfWinActive