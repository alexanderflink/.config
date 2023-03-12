require("statusbar")

-- run garbage collection on startup to be sure things are working correctly
GcTimer = hs.timer.doAfter(0, function()
	GcTimer = nil
	collectgarbage()
	collectgarbage() -- second pass in case any objects were resurrected for finalizers the first time
end)
