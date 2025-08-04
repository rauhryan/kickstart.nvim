-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'tpope/vim-fugitive',
  'preservim/nerdtree',
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      { 'fredrikaverpil/neotest-golang', version = '*' }, -- Installation
    },
    config = function()
      local neotest = require 'neotest'
      require('neotest').setup {
        adapters = {
          require 'neotest-golang',
        },
      }
      -- setup some keybindings
      vim.keymap.set('n', '<leader>tt', neotest.summary.toggle, { desc = '[T]oggle [T]est summary window' })
      vim.keymap.set('n', ',t', neotest.run.run, { desc = '[T]est [N]earest test to your cursor' })
      vim.keymap.set('n', ',T', neotest.run.run_last, { desc = '[T]est [N]earest test to your cursor' })
    end,
  },
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {
      variant = 'winter', -- "spring" | "summer" | "autumn" | "winter" (default)
    },
    config = function(_, opts)
      vim.o.termguicolors = true
      vim.o.background = 'dark'
      require('solarized').setup(opts)
      vim.cmd.colorscheme 'solarized'
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      lazygit = { enabled = true },
      gitbrowse = { enabled = true },
      indent = {
        enabled = true,
        scope = {
          underline = true,
        }
      },
      notifier = {},
    },
    keys = {
      { "<leader>gg", function() Snacks.lazygit() end,        desc = "Lazygit" },
      { "<leader>gB", function() Snacks.gitbrowse() end,      desc = "Git Browse",           mode = { "n", "v" } },
      { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git blame" },
      { "<leader>.",  function() Snacks.scratch() end,        desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
    }

  },
  -- {
  --   "m4xshen/hardtime.nvim",
  --   lazy = false,
  --   dependencies = { "MunifTanjim/nui.nvim" },
  --   opts = {},
  -- },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  }
}
