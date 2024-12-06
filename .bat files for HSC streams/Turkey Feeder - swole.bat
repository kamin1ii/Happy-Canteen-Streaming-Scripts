@echo off
title stat swole feeder
:loop
cls
mpv --network-timeout=2 --volume=0 --osc=no --screen=1 --title="SWOLE CAM" --window-minimized=no http://streetcatpull.hellobike.com/live/4300297454127511691_0.m3u8
echo MPV has exited. Restarting in 2 seconds...
timeout /t 2 /nobreak >nul
goto loop
