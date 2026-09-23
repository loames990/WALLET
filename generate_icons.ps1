Add-Type -AssemblyName System.Drawing
$srcPath = (Resolve-Path 'assets\img\LogoApp.jpg').Path
$srcImg = [System.Drawing.Image]::FromFile($srcPath)

$sizes = @{
    'mipmap-mdpi' = 48
    'mipmap-hdpi' = 72
    'mipmap-xhdpi' = 96
    'mipmap-xxhdpi' = 144
    'mipmap-xxxhdpi' = 192
}

foreach ($entry in $sizes.GetEnumerator()) {
    $destDir = Join-Path 'android\app\src\main\res' $entry.Key
    if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Path $destDir -Force | Out-Null }
    
    $s = $entry.Value
    $destBmp = New-Object System.Drawing.Bitmap($s, $s)
    $g = [System.Drawing.Graphics]::FromImage($destBmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $g.DrawImage($srcImg, 0, 0, $s, $s)
    $g.Dispose()

    $destBmp.Save((Join-Path $destDir 'ic_launcher.png'), [System.Drawing.Imaging.ImageFormat]::Png)
    $destBmp.Save((Join-Path $destDir 'ic_launcher_round.png'), [System.Drawing.Imaging.ImageFormat]::Png)
    $destBmp.Save((Join-Path $destDir 'ic_launcher_foreground.png'), [System.Drawing.Imaging.ImageFormat]::Png)
    $destBmp.Dispose()
}

# Also save icon-192.png, icon-512.png and icono_wallet.png
$p192 = New-Object System.Drawing.Bitmap(192, 192)
$g192 = [System.Drawing.Graphics]::FromImage($p192)
$g192.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g192.DrawImage($srcImg, 0, 0, 192, 192)
$g192.Dispose()
$p192.Save('assets\img\icon-192.png', [System.Drawing.Imaging.ImageFormat]::Png)
$p192.Save('assets\img\icono_wallet.png', [System.Drawing.Imaging.ImageFormat]::Png)
$p192.Dispose()

$p512 = New-Object System.Drawing.Bitmap(512, 512)
$g512 = [System.Drawing.Graphics]::FromImage($p512)
$g512.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g512.DrawImage($srcImg, 0, 0, 512, 512)
$g512.Dispose()
$p512.Save('assets\img\icon-512.png', [System.Drawing.Imaging.ImageFormat]::Png)
$p512.Dispose()

$srcImg.Dispose()
Write-Output "All icons successfully generated from LogoApp.jpg"

