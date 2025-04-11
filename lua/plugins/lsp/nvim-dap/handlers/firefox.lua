return function(config)
    local handle = io.popen(MY_OS.isWindows() and "Get-Command firefox" or "which firefox")
    ---@cast handle -nil
    local firefox_path = handle:read("*a"):gsub("\n", "")
    handle:close()
    config.configurations = {
        {
            firefoxExecutable = firefox_path,
            name = "Firefox: Debug",
            reAttach = true,
            request = "launch",
            type = "firefox",
            url = "http://localhost:4200/#",
            webRoot = "${workspaceFolder}",
        },
    }
    ---@diagnostic disable-next-line: different-requires
    require("mason-nvim-dap").default_setup(config)
end
