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
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = false, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
            },
            cmdline = {
                view = "cmdline",
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
                {
                    filter = {
                        event = "notify",
                        min_height = 3,
                    },
                    view = "split",
                },
            },
        })
    end,
}
