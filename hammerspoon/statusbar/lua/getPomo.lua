local function getPomo()
	local pomo = string.gsub(hs.execute("pomo.sh clock", true), "\n", "")

	local pattern = "(%a?)(%a)(%d%d:%d%d)"

	local paused, mode, time = pomo:match(pattern)

	return { paused = paused == "P" and true or false, mode = mode, time = time }
end

return getPomo
