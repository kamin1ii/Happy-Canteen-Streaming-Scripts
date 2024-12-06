import requests
import time

# API URL and output file
api_url = "https://api.meow.camera/catHouse/4258783365322591678"
output_file = "api_response.txt"

while True:
    try:
        # Fetch data from the API
        response = requests.get(api_url, verify=True)
        response.raise_for_status()  # Raise an error for bad responses

        # Write the response to the output file
        with open(output_file, 'w', encoding='utf-8') as file:
            file.write(response.text)

        print("Data written to file:", output_file)
    except Exception as e:
        print("Error fetching data:", e)

    time.sleep(13)  # Wait for 13 seconds before the next request
