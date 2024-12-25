return {
    "danymat/neogen",
    tag = "2.17.1",
    config = function ()
        local neogen = require("neogen")
        vim.keymap.set("n", "<Leader>ng", neogen.generate, { desc = "[N]eogen [G]enerate" })
        vim.keymap.set('i', '<C-l>', neogen.jump_next, { desc = "Neogen jump next" })
        vim.keymap.set('i', '<C-h>', neogen.jump_prev, { desc = "Neogen jump previous" })

        neogen.setup()
    end
}
