;------------------------------------------------------------------------------
;   open everthing app
;------------------------------------------------------------------------------
desktop_lanuch_everything_app()
{
  global EVERYTHING_APPPATH
  IfWinExist, ahk_group everythin_group
  {
    WinActivate,
  }
  else
  {
    SoundBeep,
    Run, %EVERYTHING_APPPATH%, , , thePid
    GroupAdd, everythin_group, % "ahk_pid " thePid
  }  
  return
}

;------------------------------------------------------------------------------
;   lanuch sublime text
;------------------------------------------------------------------------------
desktop_lanuch_sublime_text_app()
{
  global SUBLIME_APPPATH
  if WinExist("ahk_class PX_WINDOW_CLASS")
  {
    WinActivate,
  }
  else
  {
    SoundBeep, 
    Run, %SUBLIME_APPPATH%, , , thePid
    GroupAdd, sublimetext_group, % "ahk_pid " thePid
  }  
  return
}

;------------------------------------------------------------------------------
;   open dice app path
;------------------------------------------------------------------------------
desktop_open_path(path)
{
  app_path = %path%
  SplitPath,app_path,filename
  if WinExist(filename)
  {
    WinActivate 
  }
  else
  {
    Run, explore %path%, Max,   
  }
}

desktop_open_jinyong_resource_path()
{
  desktop_open_path("D:\hxjh\bin\trunk\client\fighttribe\resource")
}




;------------------------------------------------------------------------------
;   open dice app path
;------------------------------------------------------------------------------
desktop_open_dice_app_client()
{
  Run, explore D:\DiceApp\src\branches\client\2014-1-17-91\client, Max, 
}

;------------------------------------------------------------------------------
;   open dice app confige path
;------------------------------------------------------------------------------
desktop_open_dice_app_client_config()
{
  Run, explore D:\DiceApp\src\branches\client\2014-1-17-91\client\Resources\config, Max,
}

;------------------------------------------------------------------------------
;   open dice app resource
;------------------------------------------------------------------------------
desktop_open_dice_app_client_resource_output()
{
  Run, explore D:\DiceApp\res\branches\2014-1-17-91, Max,
}

;------------------------------------------------------------------------------
;   open dice app resource trunk
;------------------------------------------------------------------------------
desktop_open_dice_app_client_resource_trunk()
{
  Run, explore D:\DiceApp\res\trunk, Max,
}


;------------------------------------------------------------------------------
;   open dice app python tool
;------------------------------------------------------------------------------
desktop_open_python_tool()
{
  Run, explore E:\Source\python_tool, Max,
}

;------------------------------------------------------------------------------
;   numerpad enter
;------------------------------------------------------------------------------
desktop_NumpadEnter()
{
  
}


desktop_open_autohotkeyfolder()
{
  global SUBLIME_APPPATH
  Run, %SUBLIME_APPPATH% C:\Users\yiluoyang\Documents\autohotkey, , , thePid
  ;Sleep, 2
  Send, {Ctrl Down}kb{Ctrl Up}
}

shelltraywnd_open_num4()
{
  Run, explore E:\app_source\lua, Max,
}

shelltraywnd_open_numequal()
{
  Run, explore E:\app_source\lua, Max,
}