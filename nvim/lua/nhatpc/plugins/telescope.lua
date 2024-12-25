return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },

    config = function()
        require('telescope').setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                }
            }
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set(
            'n',
            '<leader>ff',
            function ()
                builtin.find_files(require('telescope.themes').get_dropdown({
                    winblend = 0,
                    previewer = false,
                    layout_config = {
                        width = 0.8,
                        height = 0.9,
                    },
                }))
            end ,
            { desc = '[F]ind [F]iles' }
        )

        vim.keymap.set(
            'v',
            '<leader>ff',
            function ()
                builtin.find_files(require('telescope.themes').get_dropdown({
                    winblend = 0,
                    previewer = false,
                    layout_config = {
                        width = 0.8,
                        height = 0.9,
                    },
                    default_text = vim.fn.expand("<cword>")
                }))
            end ,
            { desc = '[F]ind [F]iles' }
        )

        vim.keymap.set(
            'n',
            '<leader>fe',
            function ()
                builtin.find_files(
                    {
                        prompt_title = "Find Environment Files",
                        search_dirs = {"./"},
                        find_command = {
                            "rg",
                            "--files",
                            "--iglob", "*.env",
                            "--iglob", "*.env.example"
                        },
                    }
                )
            end ,
            { desc = '[F]ind [E]nvironment Files' }
        )

        vim.keymap.set('n', '<leader>fg', builtin.git_status, { desc = '[F]ind [G]it Changed Files' })

        vim.keymap.set(
            'n',
            '<leader>fb',
            function ()
                builtin.buffers(require('telescope.themes').get_dropdown({
                    layout_config = {
                        width = 0.8,
                        height = 0.9,
                    },
                }))
            end ,
            { desc = '[F]ind [B]uffers' }
        )

        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

        vim.keymap.set(
            'n',
            '<leader>sg',
            function ()
                builtin.live_grep({
                    debounce = 1000,
                    layout_strategy = "vertical",
                    layout_config = {
                        vertical = {
                            width = 0.9,
                            height = 0.9,
                            preview_height = 0.6,
                            preview_cutoff = 0
                        }
                    },
                })
            end,
            { desc = '[S]earch by Live [G]grep (root)' }
        )

        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp tags' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })

        vim.keymap.set('n', '<leader>/', function()
                -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 0,
                    previewer = false,
                    fuzzy_find = false,
                    layout_config = {
                        width = 0.8,
                        height = 0.9,
                    }
                })
            end,
            { desc = '[/] Fuzzily search in current buffer' }
        )

        -- Key maps
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { desc = 'LSP: ' .. desc })
        end

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

        -- Find references for the word under your cursor.
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        map(
            '<leader>ds',
            function ()
                require('telescope.builtin').lsp_document_symbols({
                    symbol_width = 45
                })
            end,
            '[D]ocument [S]ymbols'
        )

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap.
        map('K', vim.lsp.buf.hover, 'Hover Documentation')

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    end
}
