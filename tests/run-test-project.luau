local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- require is in () to silence the type error that would occur otherwise
local TestProject = (require)(ReplicatedStorage:FindFirstChild("TestProject"))
assert(TestProject == true, "TestProject did not return true")

local hello = _G.HELLO_GLOBAL or ""
local world = _G.WORLD_GLOBAL or ""

local output = {
	BinaryOutput = buffer.fromstring(`{hello} {world}`),
	ReturnValues = { true }
}
return output
