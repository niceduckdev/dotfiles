import os
import requests
from urllib.parse import urlparse
import random

def download_images(url_file, download_folder):
    # Create download folder if it doesn't exist
    if not os.path.exists(download_folder):
        os.makedirs(download_folder)
    
    # Read the URLs from the file
    with open(url_file, 'r') as file:
        urls = file.readlines()
    
    for url in urls:
        url = url.strip()
        if url:
            try:
                # Send a GET request to the URL
                response = requests.get(url, stream=True)
                response.raise_for_status()  # Raise an error for bad status codes
                
                # Parse the URL to get the image filename
                parsed_url = urlparse(url)
                image_name = random.choice('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ') + ".jpg"
                
                # Define the path where the image will be saved
                image_path = os.path.join(download_folder, image_name)
                
                # Write the image content to a file
                with open(image_path, 'wb') as image_file:
                    for chunk in response.iter_content(1024):
                        image_file.write(chunk)
                
                print(f"Downloaded {image_name}.jpg from {url}")
            
            except requests.exceptions.RequestException as e:
                print(f"Failed to download {url}: {e}")

if __name__ == "__main__":
    url_file = 'urls.txt'  # Path to the file containing URLs
    download_folder = 'images'  # Folder where images will be saved
    download_images(url_file, download_folder)