return {
    {
        -- "nvim-java/nvim-java",
        -- config = function()
        --     require("java").setup()
        --     vim.lsp.enable("jdtls")
        -- end,
        "mfussenegger/nvim-jdtls",
        config = function()
            vim.lsp.config("jdtls", {
                settings = {
                    java = {
                        -- Custom eclipse.jdt.ls options go here
                    },
                },
            })
            vim.lsp.enable("jdtls")
        end,
    },
}
