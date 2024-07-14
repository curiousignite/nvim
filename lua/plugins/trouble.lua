return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
    opts = {
        focus = true,
    },
    cmd = "Trouble",
    keys = {
        { "<leader>xw", "<cmdTrouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
        { "<leader>xd", "<cmdTrouble diagnostics toggle filter.buf=0<CR>", desc = "Open trouble document diagnostics" },
        { "<leader>xq", "<cmdTrouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
        { "<leader>xl", "<cmdTrouble loclist toggle<CR>", desc = "Open trouble location list" },
        { "<leader>xt", "<cmdTrouble todo toggle<CR>", desc = "Open todos in trouble" },
    },
}
