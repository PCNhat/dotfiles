return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                window = {
                    mappings = {
                        ["o"] = "system_open",
                        ["Y"] = function(state)
                            local node = state.tree:get_node()
                            local filepath = node:get_id()
                            local filename = node.name
                            local modify = vim.fn.fnamemodify

                            local pickers = require("telescope.pickers")
                            local finders = require("telescope.finders")
                            local actions = require("telescope.actions")
                            local action_state = require("telescope.actions.state")

                            local results = {
                                "1. Absolute path: " .. filepath,
                                "2. Path relative to CWD: " .. modify(filepath, ":."),
                                "3. Path relative to HOME: " .. modify(filepath, ":~"),
                                "4. Filename: " .. filename,
                                "5. Filename without extension: " .. modify(filename, ":r"),
                                "6. Extension of the filename: " .. modify(filename, ":e"),
                            }

                            pickers
                                .new({}, {
                                    prompt_title = "Choose to copy to clipboard",
                                    finder = finders.new_table(results),
                                    sorter = require("telescope.config").values.generic_sorter({}),
                                    attach_mappings = function(_, map)
                                        actions.select_default:replace(function(prompt_bufnr)
                                            local selection = action_state.get_selected_entry()[1]
                                            local i = tonumber(selection:sub(1, 1)) -- Extract the number
                                            local result = results[i]:match(": (.+)$") -- Extract the actual path
                                            vim.fn.setreg('"', result)
                                            vim.fn.setreg("+", result)
                                            vim.notify("Copied: " .. result)
                                            actions.close(prompt_bufnr)
                                        end)
                                        return true
                                    end,
                                })
                                :find()
                        end,
                    },
                },
            },
            commands = {
                system_open = function(state)
                    local node = state.tree:get_node()
                    local path = node:get_id()
                    vim.fn.jobstart({ "xdg-open", path }, { detach = true })
                end,
            },
        })

        vim.keymap.set("n", "<leader>e", ":Neotree left reveal<CR>", { desc = "File Explorer", silent = true })
    end,
}
