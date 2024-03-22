local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {'ellisonleao/gruvbox.nvim'}
  vim.o.background = "dark" -- or "light" for light mode
  vim.cmd([[colorscheme gruvbox]])
  vim.g.gruvbox_baby_transparent_mode = 1

  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use('tpope/vim-fugitive')
  use('ray-x/lsp_signature.nvim')
  use('mbbill/undotree')
  use('xiyaowong/transparent.nvim')
  use 'wakatime/vim-wakatime'
  -- use('nvim-tree/nvim-tree.lua')

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use('lukas-reineke/indent-blankline.nvim')


  use {
    'nvim-telescope/telescope.nvim', --tag = '0.1.0',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    }
  }
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      -- { 'hrsh7th/cmp-buffer' },
      -- { 'hrsh7th/cmp-path' },
      -- { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      -- { 'L3MON4D3/LuaSnip' },
      -- { 'rafamadriz/friendly-snippets' },
    }
  }
  use {'ThePrimeagen/vim-be-good'}
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  -- Ai autocomplete
  use {'Exafunction/codeium.vim'}
  -- nushell support
  use{
    'LhKipp/nvim-nu',
    run = ':TSInstall nu',
    requires = {
      'jose-elias-alvarez/null-ls.nvim'
    }
  }
  use {'ron-rs/ron.vim'}
  use 'karb94/neoscroll.nvim'
  use {
    'prichrd/netrw.nvim',
    reqires = {
      'nvim-tree/nvim-web-devicons'
    }
  }
end)
