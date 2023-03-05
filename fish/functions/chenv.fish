# this function only supports CAPITAL_CASED envionment variables for now, see example files in ~/.config/fish/envs

function chenv
    set file $ENVS_PATH/$argv[1].fish
    source $file

    echo "Sourced environment variables:"

    for line in (cat $file | grep -o ' \([A-Z]\|\_\)* ' | sed 's/ //g'); echo $line $$line;  end
end

 grep -o ' \([A-Z]\|\_\)* '
