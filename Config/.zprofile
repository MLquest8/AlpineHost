if systemctl -q is-active graphical.target && [[ ! $DISPLAY &&  $XDG_VTNR -le 2 ]]; then 
	exec startx 
fi
