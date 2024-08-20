import os
import requests
import re
from urllib.parse import urlparse
import random
import string

def generate_random_string(length=8):
    # Define the characters that can be used in the random string
    characters = string.ascii_letters + string.digits
    # Use random.choices to pick random characters
    random_string = ''.join(random.choices(characters, k=length))
    return random_string

def convert_google_drive_links(links):
    converted_links = []
    for link in links:
        # Extract File ID using regex
        match = re.search(r'/d/([^/]+)|/id=([^&]+)', link)
        if match:
            file_id = match.group(1) or match.group(2)
            new_link = f"https://drive.usercontent.google.com/download?id={file_id}"
            converted_links.append(new_link)
    return converted_links

def download_images(url_file, download_folder):
    # Create download folder if it doesn't exist
    if not os.path.exists(download_folder):
        os.makedirs(download_folder)
    
    # Read the URLs from the file
    with open(url_file, 'r') as file:
        urls = file.readlines()
    
    # Convert the URLs to the new format
    urls = [url.strip() for url in urls if url.strip()]
    
    for url in urls:
        if url:
            try:
                # Send a GET request to the URL
                response = requests.get(url, stream=True)
                response.raise_for_status()  # Raise an error for bad status codes
                
                # Generate a random image filename
                image_name = generate_random_string() + ".jpg"
                
                # Define the path where the image will be saved
                image_path = os.path.join(download_folder, image_name)
                
                # Write the image content to a file
                with open(image_path, 'wb') as image_file:
                    for chunk in response.iter_content(1024):
                        image_file.write(chunk)
                
                print(f"Downloaded {image_name} from {url}")
            
            except requests.exceptions.RequestException as e:
                print(f"Failed to download {url}: {e}")

if __name__ == "__main__":
    url_file = 'urls.txt'  # Path to the file containing URLs
    download_folder = 'toilet'  # Folder where images will be saved
    download_images(url_file, download_folder)