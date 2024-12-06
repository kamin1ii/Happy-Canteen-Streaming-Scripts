@echo off
title stat behind
:loop
cls
mpv --network-timeout=2 --volume=0 --osc=no --window-minimized=no --screen=1 --title="Behind" http://streetcatpull.hellobike.com/live/4258783365322591678_2.m3u8
echo MPV has exited. Restarting in 2 seconds...
timeout /t 2 /nobreak >nul
goto loop
