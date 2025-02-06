function Rename-FolderToOld {
    param (
        [Parameter(Mandatory=$true)]
        [array]$folders
    )
    
    foreach ($folder in $folders) {
        # Check if the folder exists
        if (Test-Path -Path $folder) {
            # Get the folder name and the parent directory
            $parentDirectory = [System.IO.Path]::GetDirectoryName($folder)
            $folderName = [System.IO.Path]::GetFileName($folder)
            
            # Create the new folder name with '_old' suffix
            $newFolderName = "$folderName" + "_old"
            $newFolderPath = Join-Path -Path $parentDirectory -ChildPath $newFolderName
            
            # Rename the folder by renaming the folder itself
            Rename-Item -Path $folder -NewName $newFolderName
            Write-Host "Renamed '$folder' to '$newFolderPath'"
        } else {
            Write-Host "Folder '$folder' does not exist."
        }
    }
}

<# Example useage:

Rename-FolderToOld -Folders "\\UNC1\D$\Folder1\Folder2","\\UNC2\D$\Folder3\Folder4"
or
$Folders = "\\UNC1\D$\Folder1\Folder2","\\UNC2\D$\Folder3\Folder4"
Rename-FolderToOld -Folders $Folders

#>