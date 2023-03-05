function apienv
    set file $API_ENVS_PATH/$argv[1].fish
    source $file

    echo "Sourced api environment variables:"

    for line in (cat $file | grep -o ' \([A-Z]\|\_\)* ' | sed 's/ //g'); echo $line $$line;  end
end

 grep -o ' \([A-Z]\|\_\)* '
