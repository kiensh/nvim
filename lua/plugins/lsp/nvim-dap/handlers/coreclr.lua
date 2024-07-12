local get_debug = function(items, _)
    return coroutine.create(function(dap_run_co)
        -- local items = vim.fn.globpath(vim.fn.getcwd(), pattern, 0, 1)
        local opts = {
            format_item = function(path)
                return vim.fn.fnamemodify(path, ":t")
            end,
        }
        local cont = function(choice)
            if choice == nil then
                return nil
            end
            coroutine.resume(dap_run_co, choice)
        end
        vim.ui.select(items, opts, cont)
    end)
end

return function(config)
    if MY_OS.isMac() then
        local dap = require("dap")
        require("netcoredbg-macOS-arm64").setup(dap)
        dap.configurations.cs = {}
        config.adapters = dap.adapters.coreclr
    end
    config.configurations = {
        {
            name = "NetCoreDbg: Launch",
            type = "coreclr",
            request = "launch",
            cwd = "${fileDirname}",
            program = function()
                local pattern = "**/bin/Debug/**/*.dll"
                local items = vim.fn.globpath(vim.fn.getcwd(), pattern, false, 1)
                return get_debug(items, pattern)
            end,
            env = { ASPNETCORE_ENVIRONMENT = "Development" },
        },
        {
            type = "coreclr",
            name = "NetCoreDbg: Attach",
            request = "attach",
            processId = function()
                return require("dap.utils").pick_process({
                    filter = function(proc)
                        return vim.startswith(proc.name, vim.fn.getcwd())
                    end,
                })
            end,
        },
    }
    require("mason-nvim-dap").default_setup(config)
end
