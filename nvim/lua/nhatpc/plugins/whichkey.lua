return {
    "folke/which-key.nvim",
    dependencies = {
        "echasnovski/mini.icons",
    },
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300

        local wk = require("which-key")
        wk.add({
            { "<leader>c", group = "[C]ode" },
            { "<leader>d", group = "[D]ocument" },
            { "<leader>f", group = "[F]ind" },
            { "<leader>h", group = "Git [H]unk" },
            { "<leader>j", group = "[J]ump" },
            { "<leader>m", group = "[M]ake" },
            { "<leader>o", group = "[O]pen" },
            { "<leader>p", group = "[P]roject" },
            { "<leader>q", group = "[Q]uickfix" },
            { "<leader>r", group = "[R]eplace, [R]ename" },
            { "<leader>s", group = "[S]earch" },
            { "<leader>t", group = "[T]oggle" },
            { "<leader>w", group = "[W]indow, [W]orkspace" },
        })
        -- wk.register({
        --     ["<leader>"] = {
        --         c = {
        --             desc = "[C]ode",
        --         },
        --         d = {
        --             desc = "[D]ocument",
        --         },
        --         f = {
        --             desc = "[F]ind",
        --         },
        --         h = {
        --             desc = "Git [H]unk",
        --             mode = { "n", "v" },
        --         },
        --         j = {
        --             desc = "[J]ump",
        --         },
        --         m = {
        --             desc = "[M]ake",
        --             mode = { "n", "v" },
        --         },
        --         q = {
        --             desc = "[Q]uickfix",
        --         },
        --         r = {
        --             desc = "[R]ename",
        --         },
        --         s = {
        --             desc = "[S]earch",
        --             mode = { "n", "v" },
        --         },
        --     },
        -- })
    end,

    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
}
