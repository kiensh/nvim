return {
    "jay-babu/mason-nvim-dap.nvim",
    enabled = false,
    lazy = true,
    dependencies = {
        "williamboman/mason.nvim",
    },
    -- cmd = { "DapInstall", "DapUninstall" },
    opts = function()
        local get_debug = function(items, _)
            return coroutine.create(function(dap_run_co)
                -- local items = vim.fn.globpath(vim.fn.getcwd(), pattern, 0, 1)
                local opts = {
                    format_item = function(path)
                        return vim.fn.fnamemodify(path, ":t")
                    end,
                }
                local function cont(choice)
                    if choice == nil then
                        return nil
                    else
                        coroutine.resume(dap_run_co, choice)
                    end
                end

                vim.ui.select(items, opts, cont)
            end)
        end

        return {
            ensure_installed = {},
            handlers = {
                function(config)
                    -- all sources with no handler get passed here

                    -- Keep original functionality
                    require("mason-nvim-dap").default_setup(config)
                end,
                coreclr = function(config)
                    config.name = "coreclr"
                    config.filetypes = { "cs" }
                    config.configurations = {
                        {
                            type = "coreclr",
                            name = "NetCoreDbg: Launch",
                            request = "launch",
                            cwd = "${fileDirname}",
                            program = function()
                                local pattern = "**/bin/Debug/**/*.dll"
                                local items = vim.fn.globpath(vim.fn.getcwd(), pattern, false, 1)
                                return get_debug(items, pattern)
                            end,
                            env = {
                                ASPNETCORE_ENVIRONMENT = "Development",
                            },
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
                                -- return require("dap.utils").pick_process({ filter = vim.fn.getcwd() })
                            end,
                        },
                    }

                    require("mason-nvim-dap").default_setup(config)
                end,
            },
        }
    end,
}
