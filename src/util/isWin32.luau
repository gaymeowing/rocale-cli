local system = require("@std/system")

return string.lower(system.os) == "windows_nt"
