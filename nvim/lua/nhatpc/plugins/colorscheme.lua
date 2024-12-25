return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
	config = function()
        require("tokyonight").setup({
            -- your configuration comes here
            -- or leave it empty to use the default settings
            style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
            transparent = true,
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = true },
                keywords = { italic = false },
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "transparent", -- style for sidebars, see below
                floats = "normal", -- style for floating windows
            },

            --- You can override specific color groups to use other groups or a hex color
            --- function will be called with a ColorScheme table
            ---@param colors ColorScheme
            on_colors = function(colors)
                colors.bg = "#16161e"
            end,

            on_highlights = function(highlights, colors)
                highlights["@variable"] = {
                    fg = colors.teal
                }

                highlights["@variable.parameter.phpdoc"] = { link = "@variable" }
                highlights["@keyword.phpdoc"] = { link = "@variable" }
            end
        })
        vim.cmd("colorscheme tokyonight")
    end
}
