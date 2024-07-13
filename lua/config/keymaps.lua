-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")
local harpoon = require("harpoon")
-- REQUIRED
harpoon:setup()
-- REQUIRED

--Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
-- New tab
keymap.set("n", "te", ":tabedit<Return>", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

--Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
--Move window
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
--Explore
keymap.set("n", "<leader>fs", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "[F]ind with [S]tring" })

--IncRename
keymap.set("n", "<leader>rn", ":IncRename ")

--UndoTree
keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)

keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
--Smart Move
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set({ "n", "x", "o" }, "H", "^")
keymap.set({ "n", "x", "o" }, "L", "$")
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
--Yank into system clipboard
keymap.set("v", "<leader>y", '"+y', { desc = "[Y]ank to system clipboard" })
keymap.set("n", "<leader>y", '"+y', { desc = "[Y]ank to system clipboard" })
keymap.set("n", "<leader>Y", '"+Y', { desc = "[Y]ank to system clipboard" })
-- Delete to void
keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "[D]elete to void" })
-- Shift+Insert Multiline paste for windows
keymap.set("i", "<S-Insert>", "<C-R>+")
keymap.set("n", "<S-Insert>", "<C-R>")

-- Open parent directory in current window
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- Open parent directory in floating window
keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Open parent directory floating" })
-- Diagnostic keymaps
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "go to previous [d]iagnostic message" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "go to next [d]iagnostic message" })
keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "show diagnostic [e]rror messages" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
--Quick Save
keymap.set("n", "<ESC>", "<CMD>w<CR>")
-- TIP: Disable arrow keys in normal mode
keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
-- Searching
-- Enable Telescope extensions if they are installed
pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

-- Slightly advanced example of overriding default behavior and theme
keymap.set("n", "<leader>/", function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, { desc = "[/] Fuzzily search in current buffer" })

-- Harpoon configs
keymap.set("n", "<leader>a", function()
    harpoon:list():add()
end, { desc = "[A]dd to Harpoon list" })
keymap.set("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Toggle Harpoon list" })

vim.keymap.set("n", "<C-n>", function()
    harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-m>", function()
    harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-ö>", function()
    harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-ç>", function()
    harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
keymap.set("n", "<leader>p", function()
    harpoon:list():prev()
end, { desc = "Harpoon [P]revious" })
keymap.set("n", "<leader>n", function()
    harpoon:list():next()
end, { desc = "Harpoon [N]ext" })

keymap.set({ "n", "t" }, "<C-t>", function()
    vim.cmd([[ ToggleTermToggleAll ]])

    -- list current buffers
    local buffers = vim.api.nvim_list_bufs()

    -- check if toggleterm buffer exists. If not then create one by vim.cmd [[ exe 1 . "ToggleTerm" ]]
    local toggleterm_exists = false
    for _, buf in ipairs(buffers) do
        local buf_name = vim.api.nvim_buf_get_name(buf)
        if buf_name:find("toggleterm#") then
            toggleterm_exists = true
            break
        end
    end

    if not toggleterm_exists then
        vim.cmd([[ exe 1 . "ToggleTerm" ]])
    end
end)
keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [S]tatus" })
keymap.set("n", "<leader>ga", "<CMD>G add *<CR>", { desc = "[G]it [A]dd" })
keymap.set("n", "<leader>gc", "<CMD>G commit<CR>", { desc = "[G]it [C]ommit" })
keymap.set("n", "<leader>gp", "<CMD>G push<CR>", { desc = "[G]it [P]ush" })
keymap.set("n", "<leader>gP", "<CMD>G pull --rebase<CR>", { desc = "[G]it [P]ush" })
