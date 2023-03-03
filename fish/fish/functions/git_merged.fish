function git_merged
	diff (git branch -a --merged $argv | psub) (git branch -a --no-merged $argv | psub)
end
