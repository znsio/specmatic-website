# Remove the docs directory
Write-Host "Removing docs directory..."
if (Test-Path -Path "docs") {
    Remove-Item -Recurse -Force "docs"
}

# Create the docs directory
Write-Host "Creating docs directory..."
New-Item -ItemType Directory -Path "docs" | Out-Null

# Unzip website.zip into the docs directory
Write-Host "Unpacking website.zip into docs..."
if (Test-Path -Path "tmp/website.zip") {
    Expand-Archive -Path "tmp/website.zip" -DestinationPath "docs" -Force
    Write-Host "Unpacking complete."
} else {
    Write-Host "website.zip not found in tmp directory. Exiting."
    exit 1
}

# Copy contents of extra-files into the docs directory
Write-Host "Copying extra files from extra-files to docs..."
if (Test-Path -Path "extra-files") {
    Copy-Item -Path "extra-files\*" -Destination "docs" -Recurse -Force
    Write-Host "Extra files copied successfully."
} else {
    Write-Host "Directory extra-files does not exist. Skipping extra files setup."
}

Write-Host "All tasks completed."
