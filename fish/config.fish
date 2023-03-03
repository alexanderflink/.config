eval (brew shellenv)
fnm env --use-on-cd --log-level quiet | source

if status is-interactive
    # init prompt
    starship init fish | source

    # git
    abbr --add g git
    abbr --add ga git add
    abbr --add gb git branch
    abbr --add gcm git commit
    abbr --add gco git checkout
    abbr --add gpl git pull
    abbr --add gps git push
    abbr --add gs git status
    abbr --add gsw git switch

    # zellij
    abbr --add zj zellij
    abbr --add zja zellij attach
    abbr --add zjka zellij kill-all-sessions
    abbr --add zjk zellij kill-session
    abbr --add zjls zellij list-sessions

    # neovim
    abbr --add nv nvim .

    # misc
    abbr --add s say
end
