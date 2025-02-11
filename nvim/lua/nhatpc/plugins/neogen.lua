return {
    "danymat/neogen",
    tag = "2.17.1",
    config = function ()
        local neogen = require("neogen")
        vim.keymap.set("n", "<Leader>ng", neogen.generate, { desc = "[N]eogen [G]enerate" })

        neogen.setup({ snippet_engine = "luasnip" })
    end
}
