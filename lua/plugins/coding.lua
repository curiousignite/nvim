return {
    { "smjonas/inc-rename.nvim", cmd = "IncRename", config = true, lazy = false },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        dependencies = { "rafamadriz/friendly-snippets" },
        build = "make install_jsregexp",
    },
    { "rafamadriz/friendly-snippets" },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true,
    },
    { "echasnovski/mini.surround", version = false },
    { -- Fuzzy Finder (files, lsp, etc)
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
            },
            { "nvim-telescope/telescope-ui-select.nvim" },

            -- Useful for getting pretty icons, but requires a Nerd Font.
            { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
                defaults = {
                    file_ignore_patterns = {
                        ".jpg",
                        ".png",
                        "undodir/*",
                        ".stfolder/*",
                        ".stversions/*",
                    },
                },
            })
        end,
    },
    { "tpope/vim-fugitive", version = "*" },
}
