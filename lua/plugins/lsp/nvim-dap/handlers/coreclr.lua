local get_subdir_name = function(directory)
    local t, popen = {}, io.popen
    local pfile = popen("ls -l '" .. directory .. "' | grep ^d | awk '{print $NF}'")
    ---@cast pfile -nil
    for filename in pfile:lines() do
        table.insert(t, filename)
    end
    pfile:close()
    return t
end
local choose_proj = function(proj_dll)
    return coroutine.create(function(dap_run_co)
        local opts = {
            format_item = function(path)
                return vim.fn.fnamemodify(path, ":t")
            end,
        }
        local on_choice = function(choice)
            if choice == nil then
                return nil
            end
            coroutine.resume(dap_run_co, choice)
        end
        vim.ui.select(proj_dll, opts, on_choice)
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
                local list_subdir = get_subdir_name(vim.fn.getcwd())
                local proj_dll = {}
                for _, dir in ipairs(list_subdir) do
                    local pattern = "**/" .. dir .. "/bin/Debug/**/"..dir..".dll"
                    local all_dll = vim.fn.globpath(vim.fn.getcwd(), pattern, false, 1)
                    table.insert(proj_dll, all_dll[1])
                end
                print(vim.inspect(proj_dll))
                return choose_proj(proj_dll)
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
