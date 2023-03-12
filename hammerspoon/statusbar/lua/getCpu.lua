local function getUser()
	return string.gsub(hs.execute('top -l  2 | grep -E "^CPU" | tail -1 | awk \'{ print $3 + $5"%" }\''), "\n", "")
end

return getUser
