return {
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local cmp_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities()
            )

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "phpactor",
                    "intelephense",
                    "vuels"
                },
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup {
                            capabilities = capabilities
                        }
                    end,

                    -- Suppress warning: undefined global `vim`
                    ["lua_ls"] = function ()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" }
                                    }
                                }
                            }
                        }
                    end,
                }
            })

            vim.lsp.set_log_level("off")
        end
    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup({})
        end
    },
    {
        "jay-babu/mason-null-ls.nvim",
        dependencies = {
            "nvimtools/none-ls.nvim"
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "stylua",
                    "jq",
                    "php-cs-fixer"
                }
            })
        end
    }
}


