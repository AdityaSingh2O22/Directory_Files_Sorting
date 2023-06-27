$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$destinationFolder = Join-Path -Path $scriptPath -ChildPath "SORTED"

# Create the destination folder if it doesn't exist
if (!(Test-Path -Path $destinationFolder))
{
    New-Item -ItemType Directory -Path $destinationFolder | Out-Null
}

# Mapping of file extensions to their respective subfolders
$extensionMap = @{
    ".jpg" = "Images"
    ".jpeg" = "Images"
    ".png" = "Png"
    ".gif" = "Images"
    ".bmp" = "Images"
    ".mp4" = "Videos"
    ".avi" = "Videos"
    ".mkv" = "Videos"
    ".wmv" = "Videos"
    ".doc" = "Documents"
    ".docx" = "Documents"
    ".pdf" = "Documents"
    ".txt" = "Documents"
    ".xlsx" = "Documents"
    ".zip" = "Winrar"
    ".rar" = "Winrar"
    ".fbx" = "3D Models"
    ".mp3" = "Audio"
    ".wav" = "Audio"
    ".apk" = "Applications"
    ".exe" = "Softwares"
    ".psd" = "Photoshop"
    ".aep" = "After Effects"
    ".flp" = "Fl Studio"
    ".wfp" = "Filmora"
    ".xml" = "XML"
    ".msix" = "Softwares"
    ".msi" = "Softwares"
    ".html" = "HTML"
    ".csv" = "Documents"
    ".json" = "Documents"
    ".jfjf" = "Images"
    ".aac" = "Audio"
    ".cmd" = "CMD"
    ".bat" = "CMD"
    ".torrent" = "Torrent"
    ".img" = "IMG"
    ".asd" = "Documents"
    ".pptx" = "Documents"
    ".xls" = "Documents"
    ".odt" = "Documents"
    ".odp" = "Documents"
    ".ods" = "Documents"
}

# Get all files in the source folder
$files = Get-ChildItem -Path $scriptPath -File

foreach ($file in $files)
{
    $extension = $file.Extension.ToLower()

    # Check if the extension exists in the mapping
    if ($extensionMap.ContainsKey($extension))
    {
        $subfolder = $extensionMap[$extension]
        $destinationPath = Join-Path -Path $destinationFolder -ChildPath $subfolder

        # Create the subfolder if it doesn't exist
        if (!(Test-Path -Path $destinationPath))
        {
            New-Item -ItemType Directory -Path $destinationPath | Out-Null
        }

        # Move the file to the appropriate subfolder
        Move-Item -Path $file.FullName -Destination $destinationPath -Force
    }
}
