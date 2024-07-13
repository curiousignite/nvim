-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("luasnip.loaders.from_vscode").lazy_load()
vim.opt.scrolloff = 8
vim.opt.scroll = 16
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "C:\\Users\\berke\\AppData\\Local\\nvim\\undodir"
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.g.mapleader = " "

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- PERF fully optimized
if vim.g.vscode then
    -- config vscode
    Map = vim.keymap.set
    Cmd = vim.cmd

    VSCodeNotify = vim.fn.VSCodeNotify
    VSCodeCall = vim.fn.VSCodeCall

    require("_vscode.functions")
    require("_vscode.mappings")
end
