- **"clock - Copy.html"** is the HTML file/browser source for OBS containing the time in China (synced towards your local clock).

- The `.bat` files open the feeder streams via MPV, which automatically reopens itself whenever it loses signal or something.

- **"info.lua"** is the script for OBS that reads the `api_response.txt`.

- **"api_response.txt"** needs to exist and be read by the OBS script, but the file location is hard-coded (so edit both the OBS script and Python script to locate `api_response.txt`).

- **"info caller.py"** needs to be run separately to update `api_response.txt` (every 13 seconds).

- If you don’t have a spare monitor or a dummy display plug, you can use a virtual second monitor. [Link for Windows](https://github.com/VirtualDisplay/Virtual-Display-Driver/tree/23.10.20.2)
