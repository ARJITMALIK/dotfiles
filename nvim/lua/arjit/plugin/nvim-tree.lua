local status, nvimtree = pcall(require, 'nvim-tree')
if not status then
  return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  renderer = {
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = false,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    }
  }
})
