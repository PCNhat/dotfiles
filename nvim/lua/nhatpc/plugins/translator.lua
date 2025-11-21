return {
    "uga-rosa/translate.nvim",
    config = function()
        require("translate").setup({
            preset = {
                output = {
                    split = {
                        append = true,
                    },
                },
            },
        })

        vim.keymap.set("v", "<space>te", ":Translate en<CR>", { desc = "[T]ranslate to [E]nglish" })
        vim.keymap.set("v", "<space>tv", ":Translate vi<CR>", { desc = "[T]ranslate to [V]ietnamese" })
    end,
}
