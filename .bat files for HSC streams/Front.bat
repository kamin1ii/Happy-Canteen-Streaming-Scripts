@echo off
title stat front
:loop
cls
mpv --network-timeout=2 --volume=100 --screen=1 --window-minimized=no --osc=no --title="Front" http://streetcatpull.hellobike.com/live/4258783365322591678_0.m3u8
echo MPV has exited. Restarting in 2 seconds...
timeout /t 2 /nobreak >nul
goto loop
