local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_status then
  return
end

local typescript_status, typescript = pcall(require, "typescript")
if not typescript_status then
  return
end

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

-- local border = {
--       {"🭽", "FloatBorder"},
--       {"▔", "FloatBorder"},
--       {"🭾", "FloatBorder"},
--       {"▕", "FloatBorder"},
--       {"🭿", "FloatBorder"},
--       {"▁", "FloatBorder"},
--       {"🭼", "FloatBorder"},
--       {"▏", "FloatBorder"},
-- }
-- local M = {}
-- M.kind_icons = {
--   Class = "󰠱",
--   Color = "󰏘",
--   Constant = "󰏿",
--   Constructor = "",
--   Enum = "",
--   EnumMember = "",
--   Field = "󰜢",
--   File = "󰈙",
--   Folder = "󰉋",
--   Function = "󰊕",
--   Interface = "",
--   Keyword = "󰌋",
--   Method = "󰆧",
--   Module = "",
--   Property = "󰜢",
--   Snippet = "",
--   Struct = "󰙅",
--   Text = "󰉿",
--   Unit = "󰑭",
--   Value = "󰎠",
--   Variable = "󰀫",
--     -- Reference = "󰈇",
--     -- Event = "",
--     -- Operator = "󰆕",
--     -- TypeParameter = "",
-- }

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

-- local function icons()
--   local kinds = vim.lsp.protocol.CompletionItemKind
--   for i, kind in ipairs(kinds) do
--     kinds[i] = M.kind_icons[kind] or kind
--   end
-- end


-- LSP settings (for overriding per client)
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border "CmpBorder"}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border "CmpBorder" }),
}

-- Do not forget to use the on_attach function
-- require 'lspconfig'.myserver.setup { handlers=handlers }

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border "CmpBorder"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local k = vim.keymap

-- enable keybind for available lsp servers
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
  k.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
  k.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
  k.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
  k.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
  k.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
  k.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
  k.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
  k.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
  k.set("n", "d[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
  k.set("n", "d]", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
  k.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
  k.set("n", "<leader>l", "<cmd>Lspsaga outline<CR>", opts) -- see outline on right hand side
  k.set("n", "<C-t>", "<cmd>Lspsaga term_toggle<CR>", opts) -- opens a terminal

  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "tsserver" then
    k.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
    k.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
    k.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
  end
end

-- Change the Diagnostic symbols in the sign column (gutter)
-- (not in youtube nvim video)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  -- float = {
  --   focused = false,
  --   style = "minimal",
  --   border = "rounded",
  --   source = "always",
  --   header = "",
  --   prefix = ""
  -- }
})

lspconfig.html.setup({
  capabilities = capabilities,
  filetypes = { "html" },
  on_attach = on_attach,
  handlers = handlers
})

typescript.setup({
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers
  }
})

lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers
})

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
  handlers = handlers
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

lspconfig.clangd.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "c", "cpp" },
  handlers = handlers
})

-- return M
