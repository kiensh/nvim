local home = vim.fn.expand("~")
MY_OS = {
    value = "",
    isWindows = function()
        return MY_OS.value == "windows"
    end,
    isMac = function()
        return vim.startswith(home, "/Users/")
    end,
    isLinux = function()
        return vim.startswith(home, "/home/") or vim.startswith(home, "/root")
    end,
}
if MY_OS.isMac() then
    MY_OS.value = "mac"
elseif MY_OS.isLinux() then
    MY_OS.value = "linux"
else
    MY_OS.value = "windows"
end

require("core.intro")
require("core.keys")
require("core.keymaps")
require("core.options")
