vim.filetype.add({
    extension = {
        ["http"] = "http",
        ["rest"] = "http"
    },
})
return {
    "mistweaverco/kulala.nvim",
    ft = "http",
    opts = {
        -- split direction
        -- possible values: "vertical", "horizontal"
        split_direction = "vertical",
        -- default_view, body or headers or headers_body
        default_view = "headers_body",
        -- dev, test, prod, can be anything
        -- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
        default_env = "dev",
        -- enable/disable debug mode
        debug = false,
        -- default formatters/pathresolver for different content types
        contenttypes = {
            ["application/json"] = {
                ft = "json",
                formatter = { "jq", "." },
                pathresolver = function()
                    return require("kulala.parser.jsonpath").parse
                end,
            },
            ["application/xml"] = {
                ft = "xml",
                formatter = { "xmllint", "--format", "-" },
                pathresolver = { "xmllint", "--xpath", "{{path}}", "-" },
            },
            ["text/html"] = {
                ft = "html",
                formatter = { "xmllint", "--format", "--html", "-" },
                pathresolver = {},
            },
        },
        -- can be used to show loading, done and error icons in inlay hints
        -- possible values: "on_request", "above_request", "below_request", or nil to disable
        -- If "above_request" or "below_request" is used, the icons will be shown above or below the request line
        -- Make sure to have a line above or below the request line to show the icons
        show_icons = "above_request",
        -- default icons
        icons = {
            inlay = {
                loading = "⏳",
                done = "✅",
                error = "❌",
            },
            lualine = "🐼",
        },
        -- additional cURL options
        -- see: https://curl.se/docs/manpage.html
        additional_curl_options = {},
        -- scratchpad default contents
        scratchpad_default_contents = {
            "@MY_TOKEN_NAME=my_token_value",
            "",
            "# @name scratchpad",
            "POST https://httpbin.org/post HTTP/1.1",
            "accept: application/json",
            "content-type: application/json",
            "",
            "{",
            '  "foo": "bar"',
            "}",
        },
        -- enable winbar
        winbar = false,
        -- enable reading vscode rest client environment variables
        vscode_rest_client_environmentvars = false,
    },
    config = function(_, opts)
        local kulala = require("kulala")
        kulala.setup(opts)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "http" },
            callback = function(e)
                local ftopts = { buffer = e.buf, remap = true, silent = true }
                vim.keymap.set("n", KEYS.leader.k.p, kulala.jump_prev, ftopts)
                vim.keymap.set("n", KEYS.leader.k.n, kulala.jump_next, ftopts)
                vim.keymap.set("n", KEYS.leader.k.r, kulala.run, ftopts)
            end,
        })
    end,
}
