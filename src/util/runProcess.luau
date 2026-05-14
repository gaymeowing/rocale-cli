local process = require("@lute/process")

local isWin32 = require("./isWin32")
local log = require("./log")

return function(cmd: { string })
	if isWin32 then
		cmd[1] = cmd[1] .. ".exe"
	end
	local cmdStr = table.concat(cmd, " ")
	log.debug(`Running command: {cmdStr}`)

	local ok, result = pcall(function()
		return process.run(
			cmd,
			{ stdio = "inherit", env = { PATH = `{process.cwd()}{if isWin32 then ";" else ":"}{process.env.PATH}` } }
		)
	end)

	if ok and result.ok then
		return result.stdout
	else
		return log.fatal(`Error while running command: {cmdStr}\n{result.stderr or result}`)
	end
end
