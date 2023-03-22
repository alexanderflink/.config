local function getNowPlaying()
	local nowplaying = hs.execute("/usr/local/bin/nowplaying-cli get artist title")

	local lines = {}

	for s in nowplaying:gmatch("[^\r\n]+") do
		table.insert(lines, s)
	end

	return lines
end

return getNowPlaying
