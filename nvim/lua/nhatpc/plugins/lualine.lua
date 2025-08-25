return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            local function lsp_name()
                local clients = vim.lsp.get_active_clients({ bufnr = 0 })
                if next(clients) == nil then
                    return "No LSP"
                end
                return " "
                    .. table.concat(
                        vim.tbl_map(function(client)
                            return client.name
                        end, clients),
                        ", "
                    )
            end

            local function codeium_suggestions()
                local status = require("codeium.virtual_text").status()

                if status.state == "idle" then
                    -- Output was cleared, for example when leaving insert mode
                    return " "
                end

                if status.state == "waiting" then
                    -- Waiting for response
                    return "Waiting..."
                end

                if status.state == "completions" and status.total > 0 then
                    return string.format("%d/%d", status.current, status.total)
                end

                return " 0 "
            end

            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 50,
                        tabline = 500,
                        winbar = 500,
                    },
                },
                sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {
                        {
                            "filename",
                            path = 1,
                        },
                        "branch",
                        "diff",
                        "diagnostics",
                    },
                    lualine_x = {
                        codeium_suggestions,
                        "encoding",
                        lsp_name,
                        "filetype",
                        "progress",
                        "location",
                    },
                    lualine_y = {},
                    lualine_z = {},
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            })
        end,
    },
}
