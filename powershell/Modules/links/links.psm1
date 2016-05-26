function open-302 {
	Start-Process -FilePath "https://engineering.purdue.edu/~reibman/ece302/index.html"	
}
Set-Alias w302 open-302

function open-301 {
	Start-Process -FilePath "https://engineering.purdue.edu/~mikedz/ee301/ee301.html"	
}
Set-Alias w301 open-301

function open-362 {
	Start-Process -FilePath "https://engineering.purdue.edu/ece362/index.html"
}
Set-Alias w362 open-362

function open-369 {
	Start-Process -FilePath "https://engineering.purdue.edu/ee369/"
}
Set-Alias w369 open-369

function open-364 {
	Start-Process -FilePath "https://piazza.com/purdue/spring2016/ece364/home"
}
Set-Alias w364 open-364

function open-473 {
	Start-Process -FilePath "https://engineering.purdue.edu/~ee473/"
}
Set-Alias w473 open-473

Export-ModuleMember -Function * -Alias *
