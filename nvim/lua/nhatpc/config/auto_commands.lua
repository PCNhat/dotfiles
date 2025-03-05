-- Automatically copy pyrightconfig.json when opening a Django project
vim.api.nvim_create_autocmd("UIEnter", {
    pattern = "*",
    callback = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.glob(cwd .. "/manage.py") ~= "" then
            local pyright_path = cwd .. "/pyrightconfig.json"
            if vim.fn.filereadable(pyright_path) == 0 then
                vim.fn.system("cp $HOME/.config/nvim/projects/python/django/pyrightconfig.json " .. pyright_path)
            end
        end
    end,
})
