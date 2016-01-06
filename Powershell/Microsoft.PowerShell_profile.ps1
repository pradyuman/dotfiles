$PROGRAMFILES86 = "C:\Program Files (x86)"
$VIMPATH    = $PROGRAMFILES86 + "\Vim\vim74\vim.exe"

Set-Alias vi   $VIMPATH
Set-Alias vim  $VIMPATH

# for editing your PowerShell profile
Function Edit-Profile
{
    vim $profile
}

# for editing your Vim settings
Function Edit-Vimrc
{
    vim $home\_vimrc
}

# Editing prompt
function prompt {
    Update-NavigationHistory $pwd.Path
    Write-Host ([System.Net.Dns]::GetHostName() + ": ") -nonewline -foregroundcolor DarkCyan
    Write-Host (([string]$pwd).Replace("C:\Users\prady", "~")) -foregroundcolor DarkYellow
    Write-Host ($([char]0x2192)) -nonewline
    return " "
}

# Configuring z
Import-Module z
Set-Alias z Search-NavigationHistory

# Configure "sudo"
function elevate-process
{
    $file, [string]$arguments = $args
    $psi = new-object System.Diagnostics.ProcessStartInfo $file
    $psi.Arguments = $arguments
    $psi.Verb = "runas"
    $psi.WorkingDirectory = get-location
    [System.Diagnostics.Process]::Start($psi)
} 

set-alias sudo elevate-process
