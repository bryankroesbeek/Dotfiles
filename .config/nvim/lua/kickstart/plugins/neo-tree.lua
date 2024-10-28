-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal current<CR>', { desc = 'NeoTree reveal' } },
    { '<leader>pr', ':Neotree reveal current<cr>', { desc = 'NeoTree reveal current' } },
    -- nnoremap / 
    -- nnoremap | :Neotree reveal<cr>
    -- nnoremap gd :Neotree float reveal_file=<cfile> reveal_force_cwd<cr>
    -- nnoremap <leader>b :Neotree toggle show buffers right<cr>
    -- nnoremap <leader>s :Neotree float git_status<cr>
  },
  opts = {
    filesystem = {
      hijak_netrw_behavior = "open_default",
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
