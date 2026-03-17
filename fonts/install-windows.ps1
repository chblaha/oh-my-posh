$FontDir = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts"
$RegPath = "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Fonts"


if (Get-ChildItem "$env:WINDIR\Fonts" | Where-Object { $_.Name -like "*Caskaydia*" }) {
    Write-Host "Font bereits installiert"
    exit
}

$Temp = New-Item -ItemType Directory -Force -Path "$env:TEMP\nerd-font"
Invoke-WebRequest -Uri "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip" -OutFile "$Temp\font.zip"


Expand-Archive "$Temp\font.zip" "$Temp\font" -Force

Get-ChildItem "$Temp\font" -Filter "*.ttf" | ForEach-Object {
    $Target = Join-Path $FontDir $_.Name

    if (-not (Test-Path $Target)) {
        Copy-Item $_.FullName $Target

        New-ItemProperty `
            -Path $RegPath `
            -Name $_.Name `
            -PropertyType String `
            -Value $_.Name `
            -Force | Out-Null
    }
}

Write-Host "✅ Nerd Font (per user) installiert"
