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
}
