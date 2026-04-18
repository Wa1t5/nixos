{
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [ inputs.plasma-manager.homeModules.plasma-manager ];
  programs.plasma = lib.mkIf config.de.enable.plasma {
    shortcuts = {
      "ActivityManager"."switch-to-activity-23d3e688-ca7e-4f48-afff-429cbea080f6" = [ ];
      "KDE Keyboard Layout Switcher"."Switch keyboard layout to English (US)" = [ ];
      "KDE Keyboard Layout Switcher"."Switch keyboard layout to Portuguese (Brazil)" = [ ];
      "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
      "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";
      "kaccess"."Toggle Screen Reader On and Off" = "Meta+Alt+S";
      "kcm_touchpad"."Disable Touchpad" = "Touchpad Off";
      "kcm_touchpad"."Enable Touchpad" = "Touchpad On";
      "kcm_touchpad"."Toggle Touchpad" = [
        "Touchpad Toggle"
        "Meta+Ctrl+Zenkaku Hankaku,Touchpad Toggle"
        "Meta+Ctrl+Zenkaku Hankaku"
      ];
      "kmix"."decrease_microphone_volume" = "Microphone Volume Down";
      "kmix"."decrease_volume" = "Volume Down";
      "kmix"."decrease_volume_small" = "Shift+Volume Down";
      "kmix"."increase_microphone_volume" = "Microphone Volume Up";
      "kmix"."increase_volume" = "Volume Up";
      "kmix"."increase_volume_small" = "Shift+Volume Up";
      "kmix"."mic_mute" = [
        "Microphone Mute"
        "Meta+Volume Mute,Microphone Mute"
        "Meta+Volume Mute,Mute Microphone"
      ];
      "kmix"."mute" = "Volume Mute";
      "ksmserver"."Halt Without Confirmation" = "none,,Shut Down Without Confirmation";
      "ksmserver"."Lock Session" = [
        "Screensaver"
        "Meta+Ctrl+Alt+L,Meta+L"
        "Screensaver,Lock Session"
      ];
      "ksmserver"."Log Out" = "Ctrl+Alt+Del";
      "ksmserver"."Log Out Without Confirmation" = "none,,Log Out Without Confirmation";
      "ksmserver"."LogOut" = "none,,Log Out";
      "ksmserver"."Reboot" = "none,,Reboot";
      "ksmserver"."Reboot Without Confirmation" = "none,,Reboot Without Confirmation";
      "ksmserver"."Shut Down" = "none,,Shut Down";
      "kwin"."Activate Window Demanding Attention" = "Meta+Ctrl+A";
      "kwin"."Cycle Overview" = [ ];
      "kwin"."Cycle Overview Opposite" = [ ];
      "kwin"."Decrease Opacity" = "none,,Decrease Opacity of Active Window by 5%";
      "kwin"."Edit Tiles" = "Meta+T";
      "kwin"."Expose" = "Meta+\\,,Ctrl+F9,Toggle Present Windows (Current desktop)";
      "kwin"."ExposeAll" = [
        "Ctrl+F10"
        "Launch (C),Ctrl+F10"
        "Launch (C),Toggle Present Windows (All desktops)"
      ];
      "kwin"."ExposeClass" = "Ctrl+F7";
      "kwin"."ExposeClassCurrentDesktop" = [ ];
      "kwin"."Grid View" = "Meta+G";
      "kwin"."Increase Opacity" = "none,,Increase Opacity of Active Window by 5%";
      "kwin"."Kill Window" = "Meta+Ctrl+Esc";
      "kwin"."Move Tablet to Next Output" = [ ];
      "kwin"."MoveMouseToCenter" = "Meta+F6";
      "kwin"."MoveMouseToFocus" = "Meta+F5";
      "kwin"."MoveZoomDown" = [ ];
      "kwin"."MoveZoomLeft" = [ ];
      "kwin"."MoveZoomRight" = [ ];
      "kwin"."MoveZoomUp" = [ ];
      "kwin"."Overview" = [
        "Meta+Tab"
        "Meta+W,Meta+W,Toggle Overview"
      ];
      "kwin"."PoloniumCycleEngine" = "Meta+|,none,Polonium: Cycle Engine";
      "kwin"."PoloniumFocusAbove" = [ ];
      "kwin"."PoloniumFocusBelow" = [ ];
      "kwin"."PoloniumFocusLeft" = [ ];
      "kwin"."PoloniumFocusRight" = [ ];
      "kwin"."PoloniumInsertAbove" = "Meta+Shift+K,none,Polonium: Insert Above";
      "kwin"."PoloniumInsertBelow" = "Meta+Shift+J,none,Polonium: Insert Below";
      "kwin"."PoloniumInsertLeft" = "Meta+Shift+H,none,Polonium: Insert Left";
      "kwin"."PoloniumInsertRight" = "Meta+Shift+L,none,Polonium: Insert Right";
      "kwin"."PoloniumOpenSettings" = "Meta+\\\\,none,Polonium: Open Settings Dialog";
      "kwin"."PoloniumResizeAbove" = "Meta+Ctrl+K,none,Polonium: Resize Above";
      "kwin"."PoloniumResizeBelow" = "Meta+Ctrl+J,none,Polonium: Resize Below";
      "kwin"."PoloniumResizeLeft" = "Meta+Ctrl+H,none,Polonium: Resize Left";
      "kwin"."PoloniumResizeRight" = "Meta+Ctrl+L,none,Polonium: Resize Right";
      "kwin"."PoloniumRetileWindow" = "Meta+Shift+Space,none,Polonium: Retile Window";
      "kwin"."PoloniumSwitchBTree" = [ ];
      "kwin"."PoloniumSwitchHalf" = [ ];
      "kwin"."PoloniumSwitchKwin" = [ ];
      "kwin"."PoloniumSwitchMonocle" = [ ];
      "kwin"."PoloniumSwitchThreeColumn" = [ ];
      "kwin"."Setup Window Shortcut" = "none,,Setup Window Shortcut";
      "kwin"."Show Desktop" = "Meta+D";
      "kwin"."Switch One Desktop Down" = "Meta+Ctrl+Down";
      "kwin"."Switch One Desktop Up" = "Meta+Ctrl+Up";
      "kwin"."Switch One Desktop to the Left" = "Meta+Ctrl+Left";
      "kwin"."Switch One Desktop to the Right" = "Meta+Ctrl+Right";
      "kwin"."Switch Window Down" = "Meta+J,Meta+Alt+Down,Switch to Window Below";
      "kwin"."Switch Window Left" = "Meta+H,Meta+Alt+Left,Switch to Window to the Left";
      "kwin"."Switch Window Right" = "Meta+L,Meta+Alt+Right,Switch to Window to the Right";
      "kwin"."Switch Window Up" = "Meta+K,Meta+Alt+Up,Switch to Window Above";
      "kwin"."Switch to Desktop 1" = "Ctrl+F1";
      "kwin"."Switch to Desktop 10" = "none,,Switch to Desktop 10";
      "kwin"."Switch to Desktop 11" = "none,,Switch to Desktop 11";
      "kwin"."Switch to Desktop 12" = "none,,Switch to Desktop 12";
      "kwin"."Switch to Desktop 13" = "none,,Switch to Desktop 13";
      "kwin"."Switch to Desktop 14" = "none,,Switch to Desktop 14";
      "kwin"."Switch to Desktop 15" = "none,,Switch to Desktop 15";
      "kwin"."Switch to Desktop 16" = "none,,Switch to Desktop 16";
      "kwin"."Switch to Desktop 17" = "none,,Switch to Desktop 17";
      "kwin"."Switch to Desktop 18" = "none,,Switch to Desktop 18";
      "kwin"."Switch to Desktop 19" = "none,,Switch to Desktop 19";
      "kwin"."Switch to Desktop 2" = "Ctrl+F2";
      "kwin"."Switch to Desktop 20" = "none,,Switch to Desktop 20";
      "kwin"."Switch to Desktop 3" = "Ctrl+F3";
      "kwin"."Switch to Desktop 4" = "Ctrl+F4";
      "kwin"."Switch to Desktop 5" = "none,,Switch to Desktop 5";
      "kwin"."Switch to Desktop 6" = "none,,Switch to Desktop 6";
      "kwin"."Switch to Desktop 7" = "none,,Switch to Desktop 7";
      "kwin"."Switch to Desktop 8" = "none,,Switch to Desktop 8";
      "kwin"."Switch to Desktop 9" = "none,,Switch to Desktop 9";
      "kwin"."Switch to Next Desktop" = "none,,Switch to Next Desktop";
      "kwin"."Switch to Next Screen" = "none,,Switch to Next Screen";
      "kwin"."Switch to Previous Desktop" = "none,,Switch to Previous Desktop";
      "kwin"."Switch to Previous Screen" = "none,,Switch to Previous Screen";
      "kwin"."Switch to Screen 0" = "none,,Switch to Screen 0";
      "kwin"."Switch to Screen 1" = "none,,Switch to Screen 1";
      "kwin"."Switch to Screen 2" = "none,,Switch to Screen 2";
      "kwin"."Switch to Screen 3" = "none,,Switch to Screen 3";
      "kwin"."Switch to Screen 4" = "none,,Switch to Screen 4";
      "kwin"."Switch to Screen 5" = "none,,Switch to Screen 5";
      "kwin"."Switch to Screen 6" = "none,,Switch to Screen 6";
      "kwin"."Switch to Screen 7" = "none,,Switch to Screen 7";
      "kwin"."Switch to Screen Above" = "none,,Switch to Screen Above";
      "kwin"."Switch to Screen Below" = "none,,Switch to Screen Below";
      "kwin"."Switch to Screen to the Left" = "none,,Switch to Screen to the Left";
      "kwin"."Switch to Screen to the Right" = "none,,Switch to Screen to the Right";
      "kwin"."Toggle Night Color" = [ ];
      "kwin"."Toggle Window Raise/Lower" = "none,,Toggle Window Raise/Lower";
      "kwin"."Walk Through Windows" = "Alt+Tab";
      "kwin"."Walk Through Windows (Reverse)" = "Alt+Shift+Tab";
      "kwin"."Walk Through Windows Alternative" = "none,,Walk Through Windows Alternative";
      "kwin"."Walk Through Windows Alternative (Reverse)" =
        "none,,Walk Through Windows Alternative (Reverse)";
      "kwin"."Walk Through Windows of Current Application" = "Alt+`";
      "kwin"."Walk Through Windows of Current Application (Reverse)" = "Alt+~";
      "kwin"."Walk Through Windows of Current Application Alternative" =
        "none,,Walk Through Windows of Current Application Alternative";
      "kwin"."Walk Through Windows of Current Application Alternative (Reverse)" =
        "none,,Walk Through Windows of Current Application Alternative (Reverse)";
      "kwin"."Window Above Other Windows" = "none,,Keep Window Above Others";
      "kwin"."Window Below Other Windows" = "none,,Keep Window Below Others";
      "kwin"."Window Close" = "Alt+F4";
      "kwin"."Window Fullscreen" = "none,,Make Window Fullscreen";
      "kwin"."Window Grow Horizontal" = "none,,Expand Window Horizontally";
      "kwin"."Window Grow Vertical" = "none,,Expand Window Vertically";
      "kwin"."Window Lower" = "none,,Lower Window";
      "kwin"."Window Maximize" = "Meta+PgUp";
      "kwin"."Window Maximize Horizontal" = "none,,Maximize Window Horizontally";
      "kwin"."Window Maximize Vertical" = "none,,Maximize Window Vertically";
      "kwin"."Window Minimize" = "Meta+PgDown";
      "kwin"."Window Move" = "none,,Move Window";
      "kwin"."Window Move Center" = "none,,Move Window to the Center";
      "kwin"."Window No Border" = "none,,Toggle Window Titlebar and Frame";
      "kwin"."Window On All Desktops" = "none,,Keep Window on All Desktops";
      "kwin"."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
      "kwin"."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
      "kwin"."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
      "kwin"."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
      "kwin"."Window One Screen Down" = "none,,Move Window One Screen Down";
      "kwin"."Window One Screen Up" = "none,,Move Window One Screen Up";
      "kwin"."Window One Screen to the Left" = "none,,Move Window One Screen to the Left";
      "kwin"."Window One Screen to the Right" = "none,,Move Window One Screen to the Right";
      "kwin"."Window Operations Menu" = "Alt+F3";
      "kwin"."Window Pack Down" = "none,,Move Window Down";
      "kwin"."Window Pack Left" = "none,,Move Window Left";
      "kwin"."Window Pack Right" = "none,,Move Window Right";
      "kwin"."Window Pack Up" = "none,,Move Window Up";
      "kwin"."Window Quick Tile Bottom" = "Meta+Down";
      "kwin"."Window Quick Tile Bottom Left" = "none,,Quick Tile Window to the Bottom Left";
      "kwin"."Window Quick Tile Bottom Right" = "none,,Quick Tile Window to the Bottom Right";
      "kwin"."Window Quick Tile Left" = "Meta+Left";
      "kwin"."Window Quick Tile Right" = "Meta+Right";
      "kwin"."Window Quick Tile Top" = "Meta+Up";
      "kwin"."Window Quick Tile Top Left" = "none,,Quick Tile Window to the Top Left";
      "kwin"."Window Quick Tile Top Right" = "none,,Quick Tile Window to the Top Right";
      "kwin"."Window Raise" = "none,,Raise Window";
      "kwin"."Window Resize" = "none,,Resize Window";
      "kwin"."Window Shade" = "none,,Shade Window";
      "kwin"."Window Shrink Horizontal" = "none,,Shrink Window Horizontally";
      "kwin"."Window Shrink Vertical" = "none,,Shrink Window Vertically";
      "kwin"."Window to Desktop 1" = "none,,Window to Desktop 1";
      "kwin"."Window to Desktop 10" = "none,,Window to Desktop 10";
      "kwin"."Window to Desktop 11" = "none,,Window to Desktop 11";
      "kwin"."Window to Desktop 12" = "none,,Window to Desktop 12";
      "kwin"."Window to Desktop 13" = "none,,Window to Desktop 13";
      "kwin"."Window to Desktop 14" = "none,,Window to Desktop 14";
      "kwin"."Window to Desktop 15" = "none,,Window to Desktop 15";
      "kwin"."Window to Desktop 16" = "none,,Window to Desktop 16";
      "kwin"."Window to Desktop 17" = "none,,Window to Desktop 17";
      "kwin"."Window to Desktop 18" = "none,,Window to Desktop 18";
      "kwin"."Window to Desktop 19" = "none,,Window to Desktop 19";
      "kwin"."Window to Desktop 2" = "none,,Window to Desktop 2";
      "kwin"."Window to Desktop 20" = "none,,Window to Desktop 20";
      "kwin"."Window to Desktop 3" = "none,,Window to Desktop 3";
      "kwin"."Window to Desktop 4" = "none,,Window to Desktop 4";
      "kwin"."Window to Desktop 5" = "none,,Window to Desktop 5";
      "kwin"."Window to Desktop 6" = "none,,Window to Desktop 6";
      "kwin"."Window to Desktop 7" = "none,,Window to Desktop 7";
      "kwin"."Window to Desktop 8" = "none,,Window to Desktop 8";
      "kwin"."Window to Desktop 9" = "none,,Window to Desktop 9";
      "kwin"."Window to Next Desktop" = "none,,Window to Next Desktop";
      "kwin"."Window to Next Screen" = "Meta+Shift+Right";
      "kwin"."Window to Previous Desktop" = "none,,Window to Previous Desktop";
      "kwin"."Window to Previous Screen" = "Meta+Shift+Left";
      "kwin"."Window to Screen 0" = "none,,Move Window to Screen 0";
      "kwin"."Window to Screen 1" = "none,,Move Window to Screen 1";
      "kwin"."Window to Screen 2" = "none,,Move Window to Screen 2";
      "kwin"."Window to Screen 3" = "none,,Move Window to Screen 3";
      "kwin"."Window to Screen 4" = "none,,Move Window to Screen 4";
      "kwin"."Window to Screen 5" = "none,,Move Window to Screen 5";
      "kwin"."Window to Screen 6" = "none,,Move Window to Screen 6";
      "kwin"."Window to Screen 7" = "none,,Move Window to Screen 7";
      "kwin"."view_actual_size" = "Meta+0";
      "kwin"."view_zoom_in" = [
        "Meta++"
        "Meta+=,Meta++"
        "Meta+=,Zoom In"
      ];
      "kwin"."view_zoom_out" = "Meta+-";
      "mediacontrol"."mediavolumedown" = "none,,Media volume down";
      "mediacontrol"."mediavolumeup" = "none,,Media volume up";
      "mediacontrol"."nextmedia" = "Media Next";
      "mediacontrol"."pausemedia" = "Media Pause";
      "mediacontrol"."playmedia" = "none,,Play media playback";
      "mediacontrol"."playpausemedia" = "Media Play";
      "mediacontrol"."previousmedia" = "Media Previous";
      "mediacontrol"."stopmedia" = "Media Stop";
      "org_kde_powerdevil"."Decrease Keyboard Brightness" = "Keyboard Brightness Down";
      "org_kde_powerdevil"."Decrease Screen Brightness" = "Monitor Brightness Down";
      "org_kde_powerdevil"."Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
      "org_kde_powerdevil"."Hibernate" = "Hibernate";
      "org_kde_powerdevil"."Increase Keyboard Brightness" = "Keyboard Brightness Up";
      "org_kde_powerdevil"."Increase Screen Brightness" = "Monitor Brightness Up";
      "org_kde_powerdevil"."Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
      "org_kde_powerdevil"."PowerDown" = "Power Down";
      "org_kde_powerdevil"."PowerOff" = "Power Off";
      "org_kde_powerdevil"."Sleep" = "Sleep";
      "org_kde_powerdevil"."Toggle Keyboard Backlight" = "Keyboard Light On/Off";
      "org_kde_powerdevil"."Turn Off Screen" = [ ];
      "org_kde_powerdevil"."powerProfile" = [
        "Battery"
        "Meta+B,Battery"
        "Meta+B,Switch Power Profile"
      ];
      "plasmashell"."activate application launcher" = [
        "Meta"
        "Alt+F1,Meta"
        "Alt+F1,Activate Application Launcher"
      ];
      "plasmashell"."activate task manager entry 1" = "Meta+1";
      "plasmashell"."activate task manager entry 10" = "none,Meta+0,Activate Task Manager Entry 10";
      "plasmashell"."activate task manager entry 2" = "Meta+2";
      "plasmashell"."activate task manager entry 3" = "Meta+3";
      "plasmashell"."activate task manager entry 4" = "Meta+4";
      "plasmashell"."activate task manager entry 5" = "Meta+5";
      "plasmashell"."activate task manager entry 6" = "Meta+6";
      "plasmashell"."activate task manager entry 7" = "Meta+7";
      "plasmashell"."activate task manager entry 8" = "Meta+8";
      "plasmashell"."activate task manager entry 9" = "Meta+9";
      "plasmashell"."clear-history" = "none,,Clear Clipboard History";
      "plasmashell"."clipboard_action" = "Meta+Ctrl+X";
      "plasmashell"."cycle-panels" = "Meta+Alt+P";
      "plasmashell"."cycleNextAction" = "none,,Next History Item";
      "plasmashell"."cyclePrevAction" = "none,,Previous History Item";
      "plasmashell"."manage activities" = "Meta+Q";
      "plasmashell"."next activity" = "Meta+A,none,Walk through activities";
      "plasmashell"."previous activity" = "Meta+Shift+A,none,Walk through activities (Reverse)";
      "plasmashell"."repeat_action" = "none,Meta+Ctrl+R,Manually Invoke Action on Current Clipboard";
      "plasmashell"."show dashboard" = "Ctrl+F12";
      "plasmashell"."show-barcode" = "none,,Show Barcode…";
      "plasmashell"."show-on-mouse-pos" = "Meta+V";
      "plasmashell"."stop current activity" = "Meta+S";
      "plasmashell"."switch to next activity" = "none,,Switch to Next Activity";
      "plasmashell"."switch to previous activity" = "none,,Switch to Previous Activity";
      "plasmashell"."toggle do not disturb" = "none,,Toggle do not disturb";
      "services/plasma-manager-commands.desktop"."launch-konsole" = [ ];
    };
    configFile = {
      "baloofilerc"."General"."dbVersion" = 2;
      "baloofilerc"."General"."exclude filters" =
        "*~,*.part,*.o,*.la,*.lo,*.loT,*.moc,moc_*.cpp,qrc_*.cpp,ui_*.h,cmake_install.cmake,CMakeCache.txt,CTestTestfile.cmake,libtool,config.status,confdefs.h,autom4te,conftest,confstat,Makefile.am,*.gcode,.ninja_deps,.ninja_log,build.ninja,*.csproj,*.m4,*.rej,*.gmo,*.pc,*.omf,*.aux,*.tmp,*.po,*.vm*,*.nvram,*.rcore,*.swp,*.swap,lzo,litmain.sh,*.orig,.histfile.*,.xsession-errors*,*.map,*.so,*.a,*.db,*.qrc,*.ini,*.init,*.img,*.vdi,*.vbox*,vbox.log,*.qcow2,*.vmdk,*.vhd,*.vhdx,*.sql,*.sql.gz,*.ytdl,*.tfstate*,*.class,*.pyc,*.pyo,*.elc,*.qmlc,*.jsc,*.fastq,*.fq,*.gb,*.fasta,*.fna,*.gbff,*.faa,po,CVS,.svn,.git,_darcs,.bzr,.hg,CMakeFiles,CMakeTmp,CMakeTmpQmake,.moc,.obj,.pch,.uic,.npm,.yarn,.yarn-cache,__pycache__,node_modules,node_packages,nbproject,.terraform,.venv,venv,core-dumps,lost+found";
      "baloofilerc"."General"."exclude filters version" = 9;
      "dolphinrc"."General"."ViewPropsTimestamp" = "2024,11,23,18,39,8.173";
      "dolphinrc"."KFileDialog Settings"."Places Icons Auto-resize" = false;
      "dolphinrc"."KFileDialog Settings"."Places Icons Static Size" = 22;
      "kactivitymanagerdrc"."activities"."23d3e688-ca7e-4f48-afff-429cbea080f6" = "Default";
      "kactivitymanagerdrc"."main"."currentActivity" = "23d3e688-ca7e-4f48-afff-429cbea080f6";
      "kcminputrc"."Mouse"."cursorSize" = 36;
      "kcminputrc"."Mouse"."cursorTheme" = "breeze_cursors";
      "kded5rc"."Module-device_automounter"."autoload" = false;
      "kdeglobals"."DirSelect Dialog"."DirSelectDialog Size" = "820,560";
      "kdeglobals"."General"."UseSystemBell" = true;
      "kdeglobals"."KDE"."widgetStyle" = "kvantum-dark";
      "kdeglobals"."KFileDialog Settings"."Allow Expansion" = false;
      "kdeglobals"."KFileDialog Settings"."Automatically select filename extension" = true;
      "kdeglobals"."KFileDialog Settings"."Breadcrumb Navigation" = true;
      "kdeglobals"."KFileDialog Settings"."Decoration position" = 2;
      "kdeglobals"."KFileDialog Settings"."LocationCombo Completionmode" = 5;
      "kdeglobals"."KFileDialog Settings"."PathCombo Completionmode" = 5;
      "kdeglobals"."KFileDialog Settings"."Show Bookmarks" = false;
      "kdeglobals"."KFileDialog Settings"."Show Full Path" = false;
      "kdeglobals"."KFileDialog Settings"."Show Inline Previews" = true;
      "kdeglobals"."KFileDialog Settings"."Show Speedbar" = true;
      "kdeglobals"."KFileDialog Settings"."Show hidden files" = false;
      "kdeglobals"."KFileDialog Settings"."Sort by" = "Name";
      "kdeglobals"."KFileDialog Settings"."Sort directories first" = true;
      "kdeglobals"."KFileDialog Settings"."Sort hidden files last" = false;
      "kdeglobals"."KFileDialog Settings"."Sort reversed" = false;
      "kdeglobals"."KFileDialog Settings"."Speedbar Width" = 166;
      "kdeglobals"."KFileDialog Settings"."View Style" = "DetailTree";
      "kdeglobals"."WM"."activeBackground" = "30,30,46";
      "kdeglobals"."WM"."activeBlend" = "205,214,244";
      "kdeglobals"."WM"."activeForeground" = "205,214,244";
      "kdeglobals"."WM"."inactiveBackground" = "17,17,27";
      "kdeglobals"."WM"."inactiveBlend" = "166,173,200";
      "kdeglobals"."WM"."inactiveForeground" = "166,173,200";
      "krunnerrc"."Plugins"."baloosearchEnabled" = true;
      "kscreenlockerrc"."Daemon"."LockOnResume" = true;
      "kscreenlockerrc"."Daemon"."Timeout" = 10;
      "kscreenlockerrc"."Greeter"."WallpaperPlugin" = "org.kde.potd";
      "kscreenlockerrc"."Greeter/Wallpaper/org.kde.potd/General"."Provider" = "bing";
      "kwalletrc"."Wallet"."Close When Idle" = false;
      "kwalletrc"."Wallet"."Close on Screensaver" = false;
      "kwalletrc"."Wallet"."Default Wallet" = "kdewallet";
      "kwalletrc"."Wallet"."Enabled" = true;
      "kwalletrc"."Wallet"."First Use" = false;
      "kwalletrc"."Wallet"."Idle Timeout" = 10;
      "kwalletrc"."Wallet"."Launch Manager" = false;
      "kwalletrc"."Wallet"."Leave Manager Open" = false;
      "kwalletrc"."Wallet"."Leave Open" = true;
      "kwalletrc"."Wallet"."Prompt on Open" = false;
      "kwalletrc"."Wallet"."Use One Wallet" = true;
      "kwalletrc"."org.freedesktop.secrets"."apiEnabled" = true;
      "kwinrc"."Desktops"."Id_1" = "249386c9-3bce-4a94-91de-88de6ae68273";
      "kwinrc"."Desktops"."Id_2" = "6d5b6d28-1075-4838-b9aa-86cf77ffe9a9";
      "kwinrc"."Desktops"."Id_3" = "736c98d4-b99e-4a98-a374-cec4b7c47d1f";
      "kwinrc"."Desktops"."Id_4" = "0b0ca7fe-db3a-497d-a78e-0b918291b9c7";
      "kwinrc"."Desktops"."Id_5" = "cd45b1f2-d2bb-4254-b2a6-b206644d6895";
      "kwinrc"."Desktops"."Id_6" = "2be91614-a512-45fc-a8d4-9e127302f6be";
      "kwinrc"."Desktops"."Id_7" = "7fc860bc-e6bb-48a6-944e-58d46fd4abfd";
      "kwinrc"."Desktops"."Id_8" = "a86824cb-d6c6-4a4e-87e1-22de5dc7b3a0";
      "kwinrc"."Desktops"."Number[$i]" = 8;
      "kwinrc"."Desktops"."Rows" = 1;
      "kwinrc"."EdgeBarrier"."CornerBarrier" = false;
      "kwinrc"."EdgeBarrier"."EdgeBarrier" = 0;
      "kwinrc"."Effect-shakecursor"."Magnification" = 2;
      "kwinrc"."NightColor"."Active" = true;
      "kwinrc"."NightColor"."LatitudeFixed" = "-28.956941793893137";
      "kwinrc"."NightColor"."LongitudeFixed" = "-47.875939849624075";
      "kwinrc"."Plugins"."poloniumEnabled" = true;
      "kwinrc"."Tiling"."padding" = 4;
      "kwinrc"."Tiling/e0bc3b3d-743a-54f3-8bf3-9067777d103c"."tiles" =
        ''{"layoutDirection":"horizontal","tiles":[]}'';
      "kwinrc"."Wayland"."InputMethod[$e]" =
        "/etc/profiles/per-user/waltz/share/applications/org.fcitx.Fcitx5.desktop";
      "kwinrc"."Xwayland"."Scale" = 1;
      "kwinrc"."Xwayland"."XwaylandEavesdrops" = "None";
      "kwinrc"."org.kde.kdecoration2"."ButtonsOnLeft" = "SF";
      "kwinrc"."org.kde.kdecoration2"."theme" = "__aurorae__svg__CatppuccinMocha-Classic";
      "kwinrulesrc"."1"."Description" = "Dolphin";
      "kwinrulesrc"."1"."maximizehoriz" = true;
      "kwinrulesrc"."1"."maximizehorizrule" = 3;
      "kwinrulesrc"."1"."maximizevert" = true;
      "kwinrulesrc"."1"."maximizevertrule" = 3;
      "kwinrulesrc"."1"."noborder" = true;
      "kwinrulesrc"."1"."noborderrule" = 2;
      "kwinrulesrc"."1"."types" = 1;
      "kwinrulesrc"."1"."wmclass" = "dolphin";
      "kwinrulesrc"."1"."wmclasscomplete" = true;
      "kwinrulesrc"."1"."wmclassmatch" = 2;
      "kwinrulesrc"."General"."count" = 1;
      "kwinrulesrc"."General"."rules" = 1;
      "kxkbrc"."Layout"."DisplayNames" = "";
      "kxkbrc"."Layout"."LayoutList" = "br";
      "kxkbrc"."Layout"."Use" = true;
      "kxkbrc"."Layout"."VariantList" = "";
      "plasma-localerc"."Formats"."LANG" = "en_US.UTF-8";
    };
    dataFile = { };

  };
}
