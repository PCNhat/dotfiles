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

                    ["vuels"] = function ()
                        local util = require("lspconfig.util")
                        local function has_tsconfig(root_dir)
                            return vim.fn.filereadable(root_dir .. "/tsconfig.json") == 1
                        end

                        local lspconfig = require("lspconfig")
                        lspconfig.vuels.setup {
                            root_dir = function (fname)
                                local root = util.root_pattern("package.json", ".git")(fname)
                                if root and not has_tsconfig(root) then
                                    return root
                                end
                                return nil
                            end
                        }
                    end
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


