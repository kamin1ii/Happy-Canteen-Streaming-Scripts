@echo off
title stat turk feeder
:loop
cls
mpv --network-timeout=2 --volume=100 --osc=no --screen=1 --title="TURKEY CAM" --window-minimized=no http://streetcatpull.hellobike.com/live/4234466737891854147_0.m3u8
echo MPV has exited. Restarting in 2 seconds...
timeout /t 2 /nobreak >nul
goto loop
