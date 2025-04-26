Function calculateHash($filepath) {
    $hash = Get-FileHash -Path $filepath -Algorithm SHA256
    return $hash
}

Function eraseBaseline() {
    $baselinePath = Join-Path -Path (Split-Path -Path $directoryPath) -ChildPath "baseline.txt"
    $exists = Test-Path -Path $baselinePath

    if ($exists) {
        Remove-Item -Path $baselinePath
    }
}

Function writeToBaseline() {
    $files = Get-ChildItem -Path $directoryPath
    
    foreach ($f in $files) {
        $hash = calculateHash $f.FullName
        $baselinePath = Join-Path -Path (Split-Path -Path $directoryPath) -ChildPath "baseline.txt"
        "$($hash.Path)|$($hash.Hash)" | Out-File -FilePath $baselinePath -Append
    }
}

Function populateDictionary() {
    $baselinePath = Join-Path -Path (Split-Path -Path $directoryPath) -ChildPath "baseline.txt"
    $filePath = Get-Content -Path $baselinePath
    $hashDictionary = @{}
    foreach ($f in $filePath) {
        $path, $hashValue = $f.split("|")
        $hashDictionary.add($path, $hashValue)
    }
    return $hashDictionary
}

# Prompt the user to enter the directory path
$directoryPath = Read-Host "Please enter the directory path to monitor"

eraseBaseline

writeToBaseline

$hashDictionary = populateDictionary

Write-Host "Checking File Hashes..."

while ($true) {
    Start-Sleep -Seconds 1

    $files = Get-ChildItem -Path $directoryPath
    
    foreach ($f in $files) {
        $hash = calculateHash $f.FullName

        # Checks for file creation
        if ($hashDictionary[$hash.Path] -eq $null) {
            Write-Host "$($hash.Path) has been created" -ForegroundColor Yellow
            # File hacreation
        }

        # Checks for file changes
        else {
            if ($hashDictionary[$hash.Path] -eq $hash.Hash) {
                # File has not been changed
            } else {
                Write-Host "$($hash.Path) has changed" -ForegroundColor Red
            }
        }
    }

    # Checks for file deletion
    foreach ($key in $hashDictionary.Keys) {
        $fileExists = Test-Path -Path $key
        if (-Not $fileExists) {
            Write-Host "$($key) has been deleted" -ForegroundColor Yellow
        }
    }
}
