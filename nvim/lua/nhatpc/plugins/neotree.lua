return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function ()
        local stats = vim.uv.fs_stat(vim.fn.argv(0))
        if stats and stats.type == "directory" then
          -- vim.cmd("Neotree filesystem reveal left")
          --vim.cmd("Neotree position=current")
        end

        vim.keymap.set("n", "<leader>e", ":Neotree left reveal<CR>", { desc = "File Explorer", silent = true })
    end
}
