return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        preset = "helix",
    },
    config = function(_, opts)
        require("which-key").setup(opts)
        local wk = require("which-key")
        wk.add({
            -- File/Telescope group
            { "<leader>f", group = "Find", icon = "󰭎" },
            { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
            { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
            { "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },

            -- File Explorer
            { "<leader>e", group = "Explorer", icon = "󱏒" },
            { "<leader>ee", "<cmd>Neotree filesystem reveal left<CR>", desc = "Toggle filesystem" },
            { "<leader>eb", "<cmd>Neotree buffers reveal float<CR>", desc = "Reveal current buffer" },

            -- LSP
            { "<leader>l", group = "LSP", icon = "" },
            { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
            { "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "References" },
            { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code action" },
            { "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover docs" },

            -- null-ls / Formatting
            { "<leader>n", group = "Format", icon = "󰉷" },
            { "<leader>nf", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format buffer" },

            -- Git / Gitsigns
            { "<leader>g", group = "Git" },
            { "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<CR>", desc = "Preview hunk" },
            { "<leader>gt", "<cmd>lua require('gitsigns').blame_line()<CR>", desc = "Blame line" },

            -- Git Conflict
            { "<leader>c", group = "Conflict", icon = "" },
            { "<leader>cn", "<cmd>GitConflictNextConflict<CR>", desc = "Next conflict" },
            { "<leader>cp", "<cmd>GitConflictPrevConflict<CR>", desc = "Previous conflict" },
            { "<leader>co", "<cmd>GitConflictChooseOurs<CR>", desc = "Keep ours" },
            { "<leader>ct", "<cmd>GitConflictChooseTheirs<CR>", desc = "Keep theirs" },
            { "<leader>cb", "<cmd>GitConflictChooseBoth<CR>", desc = "Keep both" },
            { "<leader>c0", "<cmd>GitConflictChooseNone<CR>", desc = "Discard both" },

            -- Normal‑mode helpers
            { "<leader>h", ":nohlsearch<CR>", desc = "Clear highlights", icon = "󰸱" },

            -- window navigation
            { "<C-h>", "<cmd>wincmd h<CR>", desc = "Move to left window" },
            { "<C-j>", "<cmd>wincmd j<CR>", desc = "Move to down window" },
            { "<C-k>", "<cmd>wincmd k<CR>", desc = "Move to up window" },
            { "<C-l>", "<cmd>wincmd l<CR>", desc = "Move to right window" },

            -- Show which-key
            { "<leader>?", "<cmd>WhichKey<CR>", desc = "Show keymap cheat sheet", icon = "" },

            -- Keybind change
            { "jk", "<Esc>", desc = "Exit Insert mode", mode = "i" },

            -- Terminal
            { "<leader>t", group = "Terminal" },
            { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Open Last Type Terminal" },
            { "<leader>tl", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Toggle Lazygit" },
            { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float" }, -- Floating Terminal

            { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal" },
            { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical" },

            -- natural ways to close
            { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Close Terminal", mode = "t" },
            { "<esc>", "<cmd>ToggleTerm<cr>", desc = "Close Terminal", mode = "t" },
            { "jk", "<cmd>ToggleTerm<cr>", desc = "Close Terminal", mode = "t" },

            { "<C-h>", "<C-\\><C-n><C-W>h", desc = "Window ←", mode = "t" },
            { "<C-j>", "<C-\\><C-n><C-W>j", desc = "Window ↓", mode = "t" },
            { "<C-k>", "<C-\\><C-n><C-W>k", desc = "Window ↑", mode = "t" },
            { "<C-l>", "<C-\\><C-n><C-W>l", desc = "Window →", mode = "t" },

            -- Window management
            { "<leader>-", "<C-w>s", desc = "Split window below", icon = "" },
            { "<leader>|", "<C-w>v", desc = "Split window right", icon = "" },
            { "<leader>w", group = "Windows", icon = "" },
            { "<leader>wd", "<C-w>c", desc = "Delete window" },

            -- Tabs
            { "<leader><tab>", group = "Tabs" },
            { "<leader><tab>l", "<cmd>tablast<CR>", desc = "Last Tab" },
            { "<leader><tab>o", "<cmd>tabonly<CR>", desc = "Close other tabs" },
            { "<leader><tab>f", "<cmd>tabfirst<CR>", desc = "First Tab" },
            { "<leader><tab><tab>", "<cmd>tabnew<CR>", desc = "New Tab" },
            { "<leader><tab>]", "<cmd>tabnext<CR>", desc = "Next Tab" },
            { "<leader><tab>d", "<cmd>tabclose<CR>", desc = "Close Tab" },
            { "<leader><tab>[", "<cmd>tabprevious<CR>", desc = "Previous Tab" },
        })
    end
}
