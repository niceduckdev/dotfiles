import csv
import io
import requests
from PIL import Image
from fpdf import FPDF
import pandas as pd

# Load CSV file
csv_file_path = 'urls.csv'
df = pd.read_csv(csv_file_path)

# Create a PDF document
class PDF(FPDF):
    def header(self):
        self.set_font('Arial', 'B', 12)
        self.cell(0, 10, 'Photos', 0, 1, 'C')
        
    def footer(self):
        self.set_y(-15)
        self.set_font('Arial', 'I', 8)
        self.cell(0, 10, f'Page {self.page_no()}', 0, 0, 'C')
        
    def add_image(self, img_path):
        self.image(img_path, w=90)

pdf = PDF()
pdf.set_auto_page_break(auto=True, margin=15)
pdf.add_page()

# Download images and add them to the PDF
images_per_page = 2
image_count = 0

for index, row in df.iterrows():
    url = row['url']
    try:
        response = requests.get(url)
        response.raise_for_status()
        
        content_type = response.headers.get('Content-Type')
        if 'image' not in content_type:
            print(f"URL {url} does not contain an image.")
            continue

        img = Image.open(io.BytesIO(response.content))
        img_path = f'temp_image_{index}.jpg'
        img.save(img_path)
        
        if image_count % images_per_page == 0 and image_count != 0:
            pdf.add_page()
            
        pdf.add_image(img_path)
        if image_count % 2 == 0:
            pdf.ln(95)
        else:
            pdf.ln(10)
            
        image_count += 1
    except requests.RequestException as e:
        print(f"Failed to download image from {url}: {e}")
    except Image.UnidentifiedImageError:
        print(f"Failed to identify image from {url}")
    except Exception as e:
        print(f"An error occurred with URL {url}: {e}")

# Save the PDF
output_pdf_path = 'output.pdf'
pdf.output(output_pdf_path)

print(f"PDF created successfully and saved as {output_pdf_path}")
