-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

local awesome = awesome

Menu = {}

Menu["Applications_Accessibility"] = {
	{"Xmag", "xmag"}
}
Menu["Applications_Editors"] = {
	{"Xedit", "xedit"}
}
Menu["Applications_Emulators"] = {
	{"VirtualBox", "/usr/bin/virtualbox", "/usr/share/pixmaps/virtualbox.xpm"}
}
Menu["Applications_Graphics"] = {
	{"xcb", "/usr/bin/xcb"},
	{"X Window Snapshot", "xwd | xwud"}
}
Menu["Applications_Network_Communication"] = {
	{"Telnet", "x-terminal-emulator -e " .. "/usr/bin/telnet.netkit"},
	{"Xbiff", "xbiff"}
}
Menu["Applications_Network_Monitoring"] = {
	{"netwatch", "x-terminal-emulator -e " .. "/usr/sbin/netwatch"},
	{"statnet", "x-terminal-emulator -e " .. "/usr/bin/statnet"},
	{"trafshow", "x-terminal-emulator -e " .. "/usr/sbin/trafshow"}
}
Menu["Applications_Network_Web_Browsing"] = {
	{"Google Chrome", "/opt/google/chrome/google-chrome", "/opt/google/chrome/product_logo_32.xpm"},
	{"Opera", "/usr/bin/opera", "/usr/share/pixmaps/opera.xpm"},
	{"Qutebrowser", "qutebrowser", "/usr/share/pixmaps/qutebrowser.xpm"},
	{"w3m", "x-terminal-emulator -e " .. "/usr/bin/w3m /usr/share/doc/w3m/MANUAL.html"}
}
Menu["Applications_Network"] = {
	{"Communication", Menu["Applications_Network_Communication"]},
	{"Monitoring", Menu["Applications_Network_Monitoring"]},
	{"Web Browsing", Menu["Applications_Network_Web_Browsing"]}
}
Menu["Applications_Programming"] = {
	{"GDB", "x-terminal-emulator -e " .. "/usr/bin/gdb"},
	{"Tclsh8.6", "x-terminal-emulator -e " .. "/usr/bin/tclsh8.6"},
	{"TkWish8.6", "x-terminal-emulator -e /usr/bin/wish8.6"}
}
Menu["Applications_Science_Mathematics"] = {
	{"Bc", "x-terminal-emulator -e " .. "/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e " .. "/usr/bin/dc"},
	{"Xcalc", "xcalc"}
}
Menu["Applications_Science"] = {
	{"Mathematics", Menu["Applications_Science_Mathematics"]}
}
Menu["Applications_Shells"] = {
	{"Bash", "x-terminal-emulator -e " .. "/bin/bash --login"},
	{"Dash", "x-terminal-emulator -e " .. "/bin/dash -i"},
	{"fish", "x-terminal-emulator -e " .. "/usr/bin/fish"},
	{"Sh", "x-terminal-emulator -e " .. "/bin/sh --login"},
	{"Zsh", "x-terminal-emulator -e " .. "/bin/zsh"}
}
Menu["Applications_Sound"] = {
	{"ncmpcpp", "x-terminal-emulator -e " .. "/usr/bin/ncmpcpp"}
}
Menu["Applications_System_Administration"] = {
	{"Editres", "editres"},
	{"Xclipboard", "xclipboard"},
	{"Xfontsel", "xfontsel"},
	{"Xkill", "xkill"},
	{"Xrefresh", "xrefresh"}
}
Menu["Applications_System_Hardware"] = {
	{"Xvidtune", "xvidtune"}
}
Menu["Applications_System_Monitoring"] = {
	{"Pstree", "x-terminal-emulator -e " .. "/usr/bin/pstree.x11", "/usr/share/pixmaps/pstree16.xpm"},
	{"Top", "x-terminal-emulator -e " .. "/usr/bin/top"},
	{"Xconsole", "xconsole -file /dev/xconsole"},
	{"Xev", "x-terminal-emulator -e xev"},
	{"Xload", "xload"}
}
Menu["Applications_System_Package_Management"] = {
	{"Aptitude Package Manager (text)", "x-terminal-emulator -e " .. "/usr/bin/aptitude-curses"}
}
Menu["Applications_System"] = {
	{"Administration", Menu["Applications_System_Administration"]},
	{"Hardware", Menu["Applications_System_Hardware"]},
	{"Monitoring", Menu["Applications_System_Monitoring"]},
	{"Package Management", Menu["Applications_System_Package_Management"]}
}
Menu["Applications_Viewers"] = {
	{"Wordview", "/usr/bin/wordview"},
	{"Xditview", "xditview"}
}
Menu["Applications"] = {
	{"Accessibility", Menu["Applications_Accessibility"]},
	{"Editors", Menu["Applications_Editors"]},
	{"Emulators", Menu["Applications_Emulators"]},
	{"Graphics", Menu["Applications_Graphics"]},
	{"Network", Menu["Applications_Network"]},
	{"Programming", Menu["Applications_Programming"]},
	{"Science", Menu["Applications_Science"]},
	{"Shells", Menu["Applications_Shells"]},
	{"Sound", Menu["Applications_Sound"]},
	{"System", Menu["Applications_System"]},
	{"Viewers", Menu["Applications_Viewers"]}
}
Menu["Games_Toys"] = {
	{"Oclock", "oclock"},
	{"Xclock (analog)", "xclock -analog"},
	{"Xclock (digital)", "xclock -digital -update 1"},
	{"Xeyes", "xeyes"},
	{"Xlogo", "xlogo"}
}
Menu["Games"] = {
	{"Toys", Menu["Games_Toys"]}
}
Menu["Help"] = {
	{"Xman", "xman"}
}
Menu["Window_Managers"] = {
	{
		"awesome",
		function()
			awesome.exec("/usr/bin/awesome")
		end,
		"/usr/share/pixmaps/awesome.xpm"
	},
	{
		"Bspwm",
		function()
			awesome.exec("/usr/bin/bspwm")
		end
	},
	{
		"Herbstluftwm",
		function()
			awesome.exec("/usr/bin/herbstluftwm")
		end,
		"/usr/share/pixmaps/herbstluftwm.xpm"
	}
}
Menu["Debian"] = {
	{"Applications", Menu["Applications"]},
	{"Games", Menu["Games"]},
	{"Help", Menu["Help"]},
	{"Window Managers", Menu["Window_Managers"]}
}

Mainmenu = {menu = {Menu = Menu}}
return Mainmenu
