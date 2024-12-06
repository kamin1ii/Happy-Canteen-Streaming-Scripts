@echo off
title stat catmojo front
:loop
cls
mpv --network-timeout=2 --volume=0 --osc=no --screen=1 --window-minimized=no --title="Cat Front" http://streetcatpull.hellobike.com/live/5144313095337151915_0.m3u8
echo MPV has exited. Restarting in 2 seconds...
timeout /t 2 /nobreak >nul
goto loop
