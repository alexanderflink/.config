if test -e /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
end

if test -e /usr/local/bin/brew
    eval (/usr/local/bin/brew shellenv)
end

# eval (brew shellenv)
fnm env --use-on-cd --log-level quiet | source

set -gx EDITOR zed

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

    # lazygit
    abbr --add lg lazygit
end

function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# pnpm
set -gx PNPM_HOME "/Users/alexanderflink/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
