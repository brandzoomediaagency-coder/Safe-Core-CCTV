$baseUrl = "https://placehold.co/600x400/0F4C75/ffffff.png?text="
$images = @{
    "dome.png" = "Dome+Camera"
    "bullet.png" = "Bullet+Camera"
    "ptz.png" = "PTZ+Camera"
    "wifi.png" = "WiFi+Camera"
    "solar.png" = "Solar+Camera"
    "nvr.png" = "NVR+System"
    "hero.png" = "Safe+Core+Security"
}

$destDir = "c:\Users\finee\Desktop\New folder\CCTC website Project\assets\images"
if (!(Test-Path $destDir)) {
    New-Item -ItemType Directory -Path $destDir | Out-Null
}

foreach ($img in $images.GetEnumerator()) {
    $url = $baseUrl + $img.Value
    $outFile = Join-Path $destDir $img.Key
    Write-Host "Downloading $($img.Key)..."
    try {
        Invoke-WebRequest -Uri $url -OutFile $outFile -UseBasicParsing
    } catch {
        Write-Error "Failed to download $($img.Key): $_"
    }
}
