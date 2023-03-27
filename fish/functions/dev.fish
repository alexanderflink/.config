function dev --argument-names path --description "Open neovim in zellij in the specified path or current directory"

  if test $ZELLIJ
    # this is terrible, but I don't know how to conditionally add flags in fish
    if test $path
      zellij action new-tab -l ~/.config/zellij/layouts/dev --cwd $path
    else
      zellij action new-tab -l ~/.config/zellij/layouts/dev
    end
  else
    if test $path
      cd $path
    end

    zellij -l ~/.config/zellij/layouts/dev
  end
end
