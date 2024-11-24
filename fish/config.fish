if status is-interactive
    # Commands to run in interactive sessions can go here

    # Homebrew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    # Starship prompt
    starship init fish | source

    if env | grep -q "HOSTNAME=toolbx"
        cd ~
    end

end
