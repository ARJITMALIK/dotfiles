local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lsp, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp then
  return
end

local null_ls_mason_status, mason_null_ls = pcall(require, "mason-null-ls")
if not null_ls_mason_status then
  return
end

mason.setup()

mason_lspconfig.setup()

mason_null_ls.setup()
