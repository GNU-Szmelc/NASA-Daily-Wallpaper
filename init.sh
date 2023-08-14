#!/bin/bash

# Set the destination directory
destination_dir="/home/$USER/Pictures/Wallpapers"

# Create the directory if it doesn't exist
mkdir -p "$destination_dir"

# Get the URL of the daily NASA space picture
nasa_url=$(curl -s https://apod.nasa.gov/apod/astropix.html | grep -o 'image/[0-9a-zA-Z/_]*.jpg' | head -1)
full_url="https://apod.nasa.gov/apod/$nasa_url"

# Set the filename for the downloaded image
filename=$(basename $nasa_url)

# Download the image
curl -s -o "$destination_dir/$filename" "$full_url"

# Set the downloaded image as the wallpaper
gsettings set org.gnome.desktop.background picture-uri "file://$destination_dir/$filename"
