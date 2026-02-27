return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},

    config = function()
        require("ibl").setup({
            indent = {
                char = "▏", -- Use a thin character
            },
            scope = {
                show_start = false,
                show_end = false,
            },
            exclude = {
                filetypes = {
                    "lspinfo",
                    "packer",
                    "checkhealth",
                    "help",
                    "man",
                    "gitcommit",
                    "TelescopePrompt",
                    "TelescopeResults",
                    "dashboard",
                },
            },
        })
    end,
}
