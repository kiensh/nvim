local home = vim.fn.expand("~")
MY_OS = {
    value = "",
    isWindows = function() return MY_OS.value == "windows" end,
    isMac = function() return MY_OS.value == "mac" end,
    isLinux = function() return MY_OS.value == "linux" end,
}
if vim.startswith(home, "/home/") then
    MY_OS.value = "linux"
elseif vim.startswith(home, "/Users/") then
    MY_OS.value = "mac"
else
    MY_OS.value = "windows"
end

require("core.intro")
require("core.keys")
require("core.keymaps")
require("core.options")
