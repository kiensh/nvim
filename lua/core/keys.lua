KEYS = {
    space = " ",
    escape = "<ESC>",
    tab = "<TAB>",
    enter = "<CR>",
    lt = "<",
    gt = ">",
    rbracket = {
        d = "]d",
        h = "]h",
    },
    lbracket = {
        d = "[d",
        h = "[h",
    },

    g = {
        b = {
            done = "gb",
            c = "gbc",
        },
        c = {
            done = "gc",
            c = "gcc",
        },
        d = "gd",
        D = "gD",
        i = "gi",
        r = "gr",
        t = "gt",

    },
    h = "h",
    j = { k = "jk" },
    K = "K",
    l = "l",
    n = "n",
    N = "N",
    p = "p",
    q = "q",
    Q = "Q",

    f5 = "<F5>",
    f10 = "<F10>",
    f11 = "<F11>",
    f12 = "<F12>",
}

KEYS.leader = {
    b = "<leader>b",
    B = "<leader>B",
    c = {
        a = "<leader>ca",
        h = "<leader>ch"
    },
    d = {
        c = "<leader>dc",
        f = "<leader>df",
        h = "<leader>dh",
        i = "<leader>di",
        j = "<leader>dj",
        k = "<leader>dk",
        l = "<leader>dl",
        p = "<leader>dp",
        r = "<leader>dr",
        s = "<leader>ds",
    },
    f = {
        c = "<leader>fc",
        f = "<leader>ff",
        m = "<leader>fm",
        r = "<leader>fr",
        s = "<leader>fs",
    },
    g = {
        c = "<leader>gc",
        f = "<leader>gf",
        b = "<leader>gb",
        s = "<leader>gs",
        p = "gp",
        P = "gP",
    },
    h = {
        s = "<leader>hs",
        S = "<leader>hS",
        x = "<leader>hx",
        X = "<leader>hX",
        u = "<leader>hu",
        p = "<leader>hp",
        b = "<leader>hb",
        d = "<leader>hd",
        D = "<leader>hD",
    },
    l = "<leader>l",
    n = { h = "<leader>nh", },
    y = "<leader>y",
    p = "<leader>p",
    P = "<leader>P",
    q = "<leader>q",
    r = {
        p = "<leader>rp",
        P = "<leader>rP",
        n = "<leader>rn",
    },
    s = {
        e = "<leader>se",
        h = "<leader>sh",
        l = "<leader>sl",
        r = "<leader>sr",
        s = "<leader>ss",
        v = "<leader>sv",
        x = "<leader>sx",
    },
    t = {
        n = "<leader>tn",
        o = "<leader>to",
        p = "<leader>tp",
        x = "<leader>tx",
    },
    x = { x = "<leader>xx" },
}

KEYS.ctrl = {
    space = "<C-Space>",
    rbracket = "<C-]>",
    lbracket = "<C-[>",
    bslash = "<C-\\>",
    up = "<C-Up>",
    down = "<C-Down>",

    c = "<C-c>",
    d = "<C-d>",
    e = "<C-e>",
    h = "<C-h>",
    j = "<C-j>",
    k = "<C-k>",
    l = "<C-l>",
    n = "<C-n>",
    q = "<C-q>",
    s = "<C-s>",
    u = "<C-u>",
}

KEYS.alt = {
    a = "<A-a>",
    j = "<A-j>",
    k = "<A-k>",
    m = "<A-m>",
    n = "<A-n>",
    p = "<A-p>",

    a1 = "<A-1>",
    a2 = "<A-2>",
    a3 = "<A-3>",
    a4 = "<A-4>",
    a5 = "<A-5>",
}

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

if MY_OS.isMac() then
    KEYS.alt = {
        a = "å",
        j = "∆",
        k = "˚",
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
