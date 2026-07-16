import os
from PIL import Image, ImageFilter, ImageEnhance, ImageDraw

master_path = r'C:\Users\HP\.gemini\antigravity-ide\brain\7b3c469f-f239-4479-a561-96836a332552\deviceinsight_master_1784187457129.png'
assets_dir = r'c:\vision\deviceinsight\assets\icon'
os.makedirs(assets_dir, exist_ok=True)

try:
    img = Image.open(master_path).convert('RGBA')
    width, height = img.size
    
    # 1. Master Icon (1024x1024)
    img_resized = img.resize((1024, 1024), Image.Resampling.LANCZOS)
    img_resized.save(os.path.join(assets_dir, 'icon_master.png'))
    
    # 2. Adaptive Foreground
    crop_margin = int(width * 0.15)
    foreground = img.crop((crop_margin, crop_margin, width - crop_margin, height - crop_margin))
    
    # We don't necessarily need a circular mask, let's just make it the center
    # Adaptive foregrounds can have transparency. We'll leave it as cropped.
    foreground_resized = foreground.resize((1024, 1024), Image.Resampling.LANCZOS)
    foreground_resized.save(os.path.join(assets_dir, 'icon_foreground.png'))
    
    # 3. Adaptive Background
    background = img.filter(ImageFilter.GaussianBlur(50)).resize((1024, 1024), Image.Resampling.LANCZOS)
    background.save(os.path.join(assets_dir, 'icon_background.png'))
    
    # 4. Monochrome Icon
    gray = foreground.convert('L')
    # Anything lighter than a threshold becomes white, else transparent
    mono_mask = gray.point(lambda p: 255 if p > 150 else 0)
    mono_white = Image.new('RGBA', mono_mask.size, (255, 255, 255, 255))
    mono_white.putalpha(mono_mask)
    mono_white = mono_white.resize((1024, 1024), Image.Resampling.LANCZOS)
    mono_white.save(os.path.join(assets_dir, 'icon_monochrome.png'))
    
    print('Successfully generated icon assets.')
except Exception as e:
    print('Error:', e)
