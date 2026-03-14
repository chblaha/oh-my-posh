winget install JanDeDobbeleer.OhMyPosh -s winget

& "$HOME\oh-my-posh\fonts\install-windows.ps1"

if (!(Select-String dotfiles $PROFILE -ErrorAction SilentlyContinue)) {
    Add-Content $PROFILE `
        "`n. `$HOME\oh-my-posh\pwsh\Microsoft.PowerShell_profile.ps1"
}