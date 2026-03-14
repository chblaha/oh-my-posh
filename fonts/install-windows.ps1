$FontName = "CaskaydiaCove Nerd Font"

if (Get-ChildItem "$env:WINDIR\Fonts" | Where-Object { $_.Name -like "*Caskaydia*" }) {
    Write-Host "Font bereits installiert"
    exit
}

$Temp = New-Item -ItemType Directory -Force -Path "$env:TEMP\nerd-font"
Invoke-WebRequest `
    -Uri "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CaskaydiaCove.zip" `
    -OutFile "$Temp\font.zip"

Expand-Archive "$Temp\font.zip" "$Temp\font"

Get-ChildItem "$Temp\font" -Filter *.ttf | ForEach-Object {
    Copy-Item $_.FullName "$env:WINDIR\Fonts"
}
