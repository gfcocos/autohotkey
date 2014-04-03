exploer_get_dir()
{
    clipboard =
    send {Down}
    send ^c 
    ClipWait, 0.01

    if(ErrorLevel)
    {
      Send {Up}
      Send ^c 
      ClipWait, 0.01
    }
    return clipboard
}
explorer_alt_g()
{
  global GITBASH_APPPATH
  path := exploer_get_dir()
  if path = 
      return 
  SplitPath, path, , dir 
  Run, D:\Git\Git Bash.vbs %dir%, Max,   
}

explorer_e()
{
  global SUBLIME_APPPATH
    path := CopySelection()
  if path = 
    return 
  SplitPath, path, , dir
  IfWinExist, ahk_group sublimetext_group
  {
    WinClose, ahk_group sublimetext_group
  }
  ;else
  ;{
  SoundBeep, 
  Run, %SUBLIME_APPPATH% %path%, , , thePid
  GroupAdd, sublimetext_group, % "ahk_pid " thePid
  ;} 
  ;sleep 2000
  ;if WinExist("ahk_class PX_WINDOW_CLASS")
  ;{
  ;  WinHide ,
  ;}
  

  ;GroupAdd, sublimetext_group, % "ahk_pid " thePid
  return

}