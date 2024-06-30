KEYS = {
    space = " ",
    escape = "<ESC>",
    tab = "<TAB>",
    lt = "<",
    gt = ">",

    h = "h",
    j = { k = "jk" },
    l = "l",
    n = "n",
    N = "N",
    p = "p",
    Q = "Q",
}

KEYS.leader = {
    n = {
        h = "<leader>nh",
    },
    q = "<leader>q",
    r = {
        p = "<leader>rp",
        P = "<leader>rP",
    },
    y = "<leader>y",
    p = "<leader>p",
    P = "<leader>P",
    s = {
        v = "<leader>sv",
        h = "<leader>sh",
        e = "<leader>se",
        x = "<leader>sx",
    },
    t = {
        o = "<leader>to",
        x = "<leader>tx",
        n = "<leader>tn",
        p = "<leader>tp",
    },
}

KEYS.ctrl = {
    s = "<C-s>",
    d = "<C-d>",
    u = "<C-u>",
    h = "<C-h>",
    j = "<C-j>",
    k = "<C-k>",
    l = "<C-l>",
    e = "<C-e>",
}

KEYS.alt = {
    j = "<A-j>",
    k = "<A-k>",
    a = "<A-a>",
    m = "<A-m>",
    n = "<A-n>",
    p = "<A-p>",
    a1 = "<A-1>",
    a2 = "<A-2>",
    a3 = "<A-3>",
    a4 = "<A-4>",
    a5 = "<A-5>",
}

---@diagnostic disable-next-line: undefined-field
local home = vim.uv.os_homedir()
MY_OS = ""
if vim.startswith(home, "/home/") then
    MY_OS = "linux"
elseif vim.startswith(home, "/Users/") then
    MY_OS = "mac"
else
    MY_OS = "windows"
end

if MY_OS == "mac" then
    KEYS.alt = {
        j = "∆",
        k = "˚",
        a = "å",
        m = "µ",
        n = "˜",
        p = "π",
        a1 = "¡",
        a2 = "™",
        a3 = "£",
        a4 = "¢",
        a5 = "∞",
    }
end
