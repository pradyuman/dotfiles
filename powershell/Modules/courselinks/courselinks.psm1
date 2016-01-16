function open-302 {
	Start-Process -FilePath "https://engineering.purdue.edu/~reibman/ece302/index.html"	
}
Set-Alias w302 open-302

function open-301 {
	Start-Process -FilePath "https://engineering.purdue.edu/~mikedz/ee301/ee301.html"	
}
Set-Alias w301 open-301

Export-ModuleMember -Function * -Alias *
