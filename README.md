• the _.bat_ files opens MPV towads the feeders
• "_info.lua_" is the script for OBS that reads the "_api_response.txt_"
• "_api_response.txt_" needs to exist and be read from the OBS script, but the file location is hard coded (so edit both the OBS script and python script to locate "_api_response.txt_"
• "_info caller.py_" needs to be run separately to update "_api_response.txt_" (every 13 seconds)
