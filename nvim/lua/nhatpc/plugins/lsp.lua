return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
        require("mason-lspconfig").setup {
            automatic_installation = true,
            ensure_installed = {
                "lua_ls",
                "phpactor",
                "intelephense",
                "vuels",
                "ts_ls",
                "eslint",
                "gopls",
                "pyright",
            },
        }
    end
}
