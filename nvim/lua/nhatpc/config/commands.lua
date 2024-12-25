-- Highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]]

-- Copy absolute path
vim.api.nvim_create_user_command("CopyPath", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- Copy relative path
vim.api.nvim_create_user_command("CopyRelPath", function()
    local path = vim.fn.expand("%")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- Copy relative directory
vim.api.nvim_create_user_command("CopyRelDir", function()
    local path = vim.fn.expand("%:h")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

-- Copy relative directory
vim.api.nvim_create_user_command("CopyFileName", function()
    local path = vim.fn.expand("%:t")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})


-- Show relative path
vim.api.nvim_create_user_command("ShowRelPath", function()
    local path = vim.fn.expand("%")
    vim.notify(path)
end, {})

-- Show relative path
vim.api.nvim_create_user_command("SetIndentSpace", function(opts)
    vim.opt.tabstop = tonumber(opts.args)
    vim.opt.softtabstop = tonumber(opts.args)
    vim.opt.shiftwidth = tonumber(opts.args)

    vim.notify("Set indent to " .. opts.args .. " spaces")
end, {nargs = '?'})
