return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {

    [[          ▀████▀▄▄              ▄█ ]],
    [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
    [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
    [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
    [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
    [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
    [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
    [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
    [[   █   █  █      ▄▄           ▄▀   ]],

    }

     dashboard.section.buttons.val = {
       dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
       dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
       dashboard.button("r", "󰈞  Recently used files", ":Telescope oldfiles <CR>"),
       dashboard.button("t", "󰊄  Find text", ":Telescope live_grep <CR>"),
       dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
       dashboard.button("q", "󰈆  Quit Neovim", ":qa<CR>"),
    }

    local function footer()
        return "Mimimimimi."
    end

    dashboard.section.footer.val = footer()

    -- total lines
    local total_content_lines = #dashboard.section.header.val
      + #dashboard.section.buttons.val
      + 3

    -- win height
    local win_height = vim.api.nvim_get_option("lines")
    local top_padding = math.max(0, math.floor((win_height - total_content_lines) / 3))

    dashboard.config.layout = {
      { type = "padding", val = top_padding },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 2 },
      dashboard.section.footer,
    }

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Keyword"
    dashboard.config.opts.noautocmd = true

    alpha.setup(dashboard.opts)
  end,
}
