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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
  -- packer related stuff
  use 'wbthomason/packer.nvim'
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- discord
  use 'andweeb/presence.nvim'
  
  -- theme of choice
  use 'navarasu/onedark.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'folke/tokyonight.nvim'
  
  -- utils
  use 'tpope/vim-surround'
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  -- startup screen
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }

	use 'theprimeagen/harpoon'

  -- file explorer
  use 'nvim-tree/nvim-tree.lua'

  -- indent bracket
  use "lukas-reineke/indent-blankline.nvim"

  -- LSP stuff
  use 'hrsh7th/nvim-cmp'
  use 'neovim/nvim-lspconfig'
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    }
  })
  use 'jose-elias-alvarez/typescript.nvim'
  
  -- treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- sources
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- autopairs
  use "windwp/nvim-autopairs"

  -- snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- colorizer
  use 'norcalli/nvim-colorizer.lua'


  -- statusline
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

  -- lsp handler
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- linters and formatters
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jayp0521/mason-null-ls.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
