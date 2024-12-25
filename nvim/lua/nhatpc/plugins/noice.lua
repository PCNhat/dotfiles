return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            cmdline = {
                format = {
                    search_down = {
                        view = "cmdline",
                    },
                    search_up = {
                        view = "cmdline",
                    },
                },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        kind = "echomsg",
                        find = "AutoSave",
                    },
                    opts = { skip = true },
                },
            },
        })
    end,
}
