from PIL import Image

im = Image.open('evil_duck.png')

pixels = list(im.getdata())


print(pixels)
