local fs = require("@std/fs")

local runProcess = require("../src/util/runProcess")
local isWin32 = require("../src/util/isWin32")
local log = require("../src/util/log")

local version = select(2, ...) or "unknown"
local hash = select(3, ...) or "unknown"

log.setLevel("debug")

if not fs.exists("build") then
	fs.createDirectory("build")
end

local outputPath = "build/rocale-cli"

if isWin32 then
	outputPath ..= ".exe"
end

log.info("Version: " .. version)
log.info("Commit Hash: " .. hash)

local versionFormat = [[
local function version()
	print("%*\\n%*")
end

return version
]]

fs.writeStringToFile("src/commands/version.luau", string.format(versionFormat, version, hash))

log.info("Building rocale-cli...")
runProcess({ "lute", "compile", "src/cli.luau", "--output", outputPath, "--show-require-graph", "--bundle-stats" })
log.info("Build complete: " .. outputPath)
