local getUser = require("statusbar/lua/getUser")
local getTime = require("statusbar/lua/getTime")
local getDate = require("statusbar/lua/getDate")
local getNowPlaying = require("statusbar/lua/getNowPlaying")

local webserver = hs.httpserver.hsminweb.new("./statusbar/public")
webserver:port(8080)
webserver:start()

local webviewController = hs.webview.usercontent.new("statusbar")

local primaryScreen = hs.screen.primaryScreen()
local frame = primaryScreen:frame()

local webview = hs.webview.new(
	{ x = 0, y = 0, w = frame.w, h = 24 },
	{ developerExtrasEnabled = true },
	webviewController
)

webview:behaviorAsLabels({ "canJoinAllSpaces" })
webview:url("http://localhost:" .. webserver:port())
webview:bringToFront(false)
webview:show()

local function onScreenChange()
	primaryScreen = hs.screen.primaryScreen()
	frame = primaryScreen:frame()

	webview:frame({ x = 0, y = 0, w = frame.w, h = 24 })
end

ScreenWatcher = hs.screen.watcher.newWithActiveScreen(onScreenChange):start()

local function updateWebViewState(state)
	local json = hs.json.encode(state)
	webview:evaluateJavaScript("window.updateState(" .. json .. ")")
end

CPUUsageCallback = function(cpuUsage)
	local overallCpuUsage = cpuUsage.overall.active

	updateWebViewState({ cpu = overallCpuUsage })
end

CheckCPUUsage = hs.timer.doEvery(1, function()
	hs.host.cpuUsage(CPUUsageCallback)
end)

UpdateState = hs.timer.doEvery(1, function()
	local user = getUser()
	local time = getTime()
	local date = getDate()
	local nowPlaying = getNowPlaying()

	updateWebViewState({ time = time, user = user, nowPlaying = nowPlaying, date = date })
end)

local function onWebviewReady()
	local user = getUser()
	local time = getTime()
	updateWebViewState({ user = user, time = time })
end

webviewController:setCallback(onWebviewReady)

-- listen for messages on unix socket
local server = hs.socket
		.new(function(data)
			local json = string.gsub(data, "\n", "")
			webview:evaluateJavaScript("window.updateState(" .. json .. ")")
		end)
		:listen("/tmp/statusbar")

ReadSocket = hs.timer.doEvery(0.1, function()
	server:read("\n")
end)
