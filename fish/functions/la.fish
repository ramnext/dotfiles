# Defined in - @ line 0
function la --description 'alias la=exa -alhg --group-directories-first --git --time-style long-iso'
	exa -alhg --group-directories-first --git --time-style long-iso $argv;
end
