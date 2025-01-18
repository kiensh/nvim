return function(config)
    local venv_path = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
    config.configurations = {
        {
            -- The first three options are required by nvim-dap
            type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
            request = "launch",
            name = "Python: Launch file",
            program = "${file}", -- This configuration will launch the current file if used.
            -- venv on Windows uses Scripts instead of bin
            pythonPath = venv_path
                    and ((vim.fn.has("win32") == 1 and venv_path .. "/Scripts/python") or venv_path .. "/bin/python")
                or nil,
            console = "integratedTerminal",
        },
    }
    require("mason-nvim-dap").default_setup(config)
end
