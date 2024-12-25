return {
    {
        "SmiteshP/nvim-navic",
        config = function ()
            require("nvim-navic").setup({
                icons = {
                    File          = "󰈙 ",
                    Module        = " ",
                    Namespace     = "󰌗 ",
                    Package       = " ",
                    Class         = "󰌗 ",
                    Method        = "󰆧 ",
                    Property      = " ",
                    Field         = " ",
                    Constructor   = " ",
                    Enum          = "󰕘",
                    Interface     = "󰕘",
                    Function      = "󰊕 ",
                    Variable      = "󰆧 ",
                    Constant      = "󰏿 ",
                    String        = "󰀬 ",
                    Number        = "󰎠 ",
                    Boolean       = "◩ ",
                    Array         = "󰅪 ",
                    Object        = "󰅩 ",
                    Key           = "󰌋 ",
                    Null          = "󰟢 ",
                    EnumMember    = " ",
                    Struct        = "󰌗 ",
                    Event         = " ",
                    Operator      = "󰆕 ",
                    TypeParameter = "󰊄 ",
                },
                lsp = {
                    auto_attach = true,
                    preference = {'intelephense', 'phpactor'},
                },
                highlight = false,
                separator = "  ",
                depth_limit = 0,
                depth_limit_indicator = "..",
                safe_output = true,
                lazy_update_context = false,
                click = false,
                format_text = function(text)
                    return text
                end,
            })
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },

        config = function ()
            local navic = require("nvim-navic")

            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 500,
                        tabline = 500,
                        winbar = 500
                    }
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {
                        'branch',
                        'diff',
                        'diagnostics'
                    },
                    lualine_c = {
                        {
                            function()
                                return navic.get_location()
                            end,
                            cond = function()
                                return navic.is_available()
                            end
                        },
                    },
                    lualine_x = {
                        {
                            require("noice").api.statusline.mode.get,
                            cond = require("noice").api.statusline.mode.has and function ()
                                local reg = vim.fn.reg_recording()
                                if reg == "" then
                                    return false
                                end -- not recording

                                return true
                            end,
                            color = { fg = "#ff9e64" },
                        },
                        'encoding',
                        'fileformat',
                        'filetype'
                    },
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {
                    lualine_b = {
                        {
                            'filename', path = 1,
                        }
                    },
                },
                inactive_winbar = {},
                extensions = {}
                }
        end
    }
}
