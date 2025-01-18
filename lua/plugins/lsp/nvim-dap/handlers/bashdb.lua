return function(config)
    local bashdb_dir = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir"
    config.configurations = {
        {
            args = {},
            cwd = "${fileDirname}",
            env = {},
            name = "Bash: Launch file",
            pathBash = "/opt/homebrew/bin/bash",
            pathBashdb = bashdb_dir .. "/bashdb",
            pathBashdbLib = bashdb_dir,
            pathCat = "cat",
            pathMkfifo = "/usr/bin/mkfifo",
            pathPkill = "/usr/bin/pkill",
            program = "${file}",
            request = "launch",
            type = "bash",
        },
    }
    require("mason-nvim-dap").default_setup(config)
end
