;桌面模式 F1映射

MYWORKSPACE := "work"

DESKTOP_F1_KEYMAP  = 
EVERYTHING_APPPATH = 
SUBLIME_APPPATH    = 
GITBASH_APPPATH    = 

load_my_workspace()
{
	global MYWORKSPACE
	global DESKTOP_F1_KEYMAP
	global EVERYTHING_APPPATH
	global SUBLIME_APPPATH
	global GITBASH_APPPATH

	if(MYWORKSPACE = "work")
	{
		TrayTip, AutoHotkey.ahk, workspace is work, 1
		DESKTOP_F1_KEYMAP  = C:\BigMoney
		EVERYTHING_APPPATH = D:\Everything\Everything.exe
		SUBLIME_APPPATH    = D:\Sublime Text 2\sublime_text.exe	
		GITBASH_APPPATH	   = D:\Git\bin\sh.exe --login -i
	}
	else if(MYWORKSPACE = "myhome")
	{
		TrayTip, AutoHotkey.ahk, workspace is myhome, 1
		DESKTOP_F1_KEYMAP = C:\BigMoney
		EVERYTHING_APPPATH= D:\Everything\Everything.exe
		SUBLIME_APPPATH   = c:\Sublime Text 2\sublime_text.exe		
	}
	else
	{
		MsgBox "workspace is myhome"
	}
}

#if 1
	load_my_workspace()




