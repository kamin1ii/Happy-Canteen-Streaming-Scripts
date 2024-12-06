<div dir="ltr">
• "clock - Copy.html_" is the html file/browser source for OBS containing the time in China (synced towards your local clock)<br>
<br>
• the .bat files opens the feeder streams via MPV which automatically reopens itself whenever it loses signal or something<br>
<br>
• "info.lua" is the script for OBS that reads the "api_response.txt"<br>
<br>
• "api_response.txt" needs to exist and be read from the OBS script, but the file location is hard coded (so edit both the OBS script and python script to locate "api_response.txt"<br> 
<br>
• "info caller.py" needs to be run separately to update "api_response.txt" (every 13 seconds)

</div>

