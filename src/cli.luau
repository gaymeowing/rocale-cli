local versionCommand = require("./commands/version")
local helpCommand = require("./commands/help")
local runCommand = require("./commands/run")

local availableCommands = {
	run = runCommand,
	help = helpCommand,
	version = versionCommand,
} :: { [string]: (...any) -> () }

local command = availableCommands[select(2, ...)] or helpCommand

command(...)
