return {
    {
        "folke/noice.nvim",
        opts = function(_, opts)
            table.insert(opts.routes, {
                filter = {
                    event = "notify",
                    find = "No information available",
                },
                opts = { skip = true },
            })
            opts.presets.lsp_doc_border = true
        end,
    },
    -- wilder
    {
        "gelguy/wilder.nvim",
        modes = { ":", "/", "?" },
    },
    -- bufferline
    {
        "akinsho/bufferline.nvim",
        keys = {
            { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
            { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
        },
        opts = {
            options = {
                mode = "tabs",
                show_buffer_close_icons = false,
                show_close_icon = false,
            },
        },
    },
    -- statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = {
            options = {
                theme = "auto",
            },
        },
    },

    -- logo
    {
        "nvimdev/dashboard-nvim",
        event = "VimEnter",
        opts = function(_, opts)
            local logo = [[
___                      ___                              ___                                    
 MM                      `MM                               MM                                68b 
 MM                       MM                               MM                                Y89 
 MM____     ____  ___  __ MM   __   ____     ____  ___  __ MM____      ___     __      ____  ___ 
 MMMMMMb   6MMMMb `MM 6MM MM   d'  6MMMMb   6MMMMb `MM 6MM MMMMMMb   6MMMMb   6MMbMMM 6MMMMb.`MM 
 MM'  `Mb 6M'  `Mb MM69 " MM  d'  6M'  `Mb 6M'  `Mb MM69 " MM'  `Mb 8M'  `Mb 6M'`Mb  6M'   Mb MM 
 MM    MM MM    MM MM'    MM d'   MM    MM MM    MM MM'    MM    MM     ,oMM MM  MM  MM    `' MM 
 MM    MM MMMMMMMM MM     MMdM.   MMMMMMMM MMMMMMMM MM     MM    MM ,6MM9'MM YM.,M9  MM       MM 
 MM    MM MM       MM     MMPYM.  MM       MM       MM     MM    MM MM'   MM  YMM9   MM       MM 
 MM.  ,M9 YM    d9 MM     MM  YM. YM    d9 YM    d9 MM     MM.  ,M9 MM.  ,MM (M      YM.   d9 MM 
_MYMMMM9   YMMMM9 _MM_   _MM_  YM._YMMMM9   YMMMM9 _MM_   _MYMMMM9  `YMMM9'Yb.YMMMMb. YMMMM9 _MM_
                                                                             6M    Yb            
                                                                             YM.   d9            
                                                                              YMMMM9             
      ]]
            logo = string.rep("\n", 9) .. logo .. "\n\n"
            opts.config.header = vim.split(logo, "\n")
        end,
    },
}
