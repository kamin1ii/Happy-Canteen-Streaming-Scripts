<div dir="ltr">
• "_clock - Copy.html_" is the html file/browser source for OBS containing the time in China (synced towards your local clock)<br>
<br>
• the _.bat_ files opens the feeder streams via MPV which automatically reopens itself whenever it loses signal or something<br>
<br>
• "_info.lua_" is the script for OBS that reads the "_api_response.txt_"<br>
<br>
• "_api_response.txt_" needs to exist and be read from the OBS script, but the file location is hard coded (so edit both the OBS script and python script to locate "_api_response.txt_"<br> 
<br>
• "_info caller.py_" needs to be run separately to update "_api_response.txt_" (every 13 seconds)

</div>

