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

    -- colorschemes
    use 'navarasu/onedark.nvim'

    -- icons
    use 'kyazdani42/nvim-web-devicons'
    
    -- Telescope
    use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    
    -- file explorer
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      }
    }

    -- completions and intellisense
    use {'neoclide/coc.nvim', branch = 'release'}

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }

    --comment stuff
    use "numToStr/Comment.nvim"
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- for discord
    use 'andweeb/presence.nvim'

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
    
    -- colorizer
    use {
      'norcalli/nvim-colorizer.lua',
      config = function ()
        require 'colorizer'.setup()
      end
    }

    -- autopairs
    use 'jiangmiao/auto-pairs'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
