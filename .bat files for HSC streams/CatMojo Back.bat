@echo off
title stat catmojoback
:loop
cls
mpv --network-timeout=2 --volume=0 --osc=no --screen=1 --window-minimized=no --title="Cat Back" http://streetcatpull.hellobike.com/live/5144313095337151915_2.m3u8
echo MPV has exited. Restarting in 2 seconds...
timeout /t 2 /nobreak >nul
goto loop
