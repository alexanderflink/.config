if status is-interactive
    if env | grep -q "HOSTNAME=toolbx"
        # This only runs inside toolbox containers

        # Run container environment file
        if test -e /etc/env.fish
            source /etc/env.fish
        end
    else
        # Homebrew
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

        # starship prompt
        starship init fish | source

        # z to jump around directories
        zoxide init fish | source
    end
end
