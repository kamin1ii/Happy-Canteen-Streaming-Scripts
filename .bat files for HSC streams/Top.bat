@echo off
title stat top
:loop
cls
mpv --network-timeout=2 --volume=0 --screen=1 --window-minimized=yes --osc=no --window-minimized=no  --title="Top" http://streetcatpull.hellobike.com/live/4258783365322591678_1.m3u8
echo MPV has exited. Restarting in 2 seconds...
timeout /t 2 /nobreak >nul
goto loop
