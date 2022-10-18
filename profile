export "PATH=$HOME/.local/bin:$PATH"
export "POWERLINE_LOCATION"="$(pip show powerline-status | grep Location | cut -d \  -f 2)"
eval "$($HOME/.linuxbrew/bin/brew shellenv)"
