local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
    -- packer
    use "wbthomason/packer.nvim"
    -- some required plugins
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    -- for discord
    use 'andweeb/presence.nvim'

    -- colorscheme
    use "gruvbox-community/gruvbox"
    use 'folke/tokyonight.nvim'

    -- LSP stuff
    use 'hrsh7th/nvim-cmp'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use "jose-elias-alvarez/null-ls.nvim"

    -- sources
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lua"

    -- tree-sitter
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }

    -- icons
    use 'kyazdani42/nvim-web-devicons'

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    --tabnine
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

    -- snippet engine
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- autopairs
    use "windwp/nvim-autopairs"

    --comment stuff
    use "numToStr/Comment.nvim"
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    --git stuff
    use "lewis6991/gitsigns.nvim"

    -- file manager
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      }
    }

    -- statusline
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }

    -- startup screen
    use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
      end
    }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
