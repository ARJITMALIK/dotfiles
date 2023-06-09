local opts = { noremap = true, silent = true }

local k = vim.api.nvim_set_keymap

k("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- using arrow keys for buffer switching
k("n", "<Left>", ":bp<CR>", opts)
k("n", "<Right>", ":bn<CR>", opts)

k("i", "<Left>", "<ESC>:bp<CR>", opts)
k("i", "<Right>", "<ESC>:bn<CR>", opts)

k("v", "<Left>", "<ESC>:bp<CR>", opts)
k("v", "<Right>", "<ESC>:bn<CR>", opts)

k("n", "<Up>", ":echo 'Nah nah nah Bro!! dont use that'<CR>", opts)
k("n", "<Down>", ":echo 'Nah nah nah Bro!! dont use that'<CR>", opts)

k("i", "<Up>", "<ESC>:echo 'Nah nah nah Bro!! dont use that'<CR>", opts)
k("i", "<Down>", "<ESC>:echo 'Nah nah nah Bro!! dont use that'<CR>", opts)

k("v", "<Up>", "<ESC>:echo 'Nah nah nah Bro!! dont use that'<CR>", opts)
k("v", "<Down>", "<ESC>:echo 'Nah nah nah Bro!! dont use that'<CR>", opts)

-- better dd (imo)
k('n', "dd", '"_dd', opts)
k('n', "x", '"_x', opts)

-- Move text up and down
k("n", "<A-j>", ":m .+1<CR>==", opts)
k("n", "<A-k>", ":m .-2<CR>==", opts)

k("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
k("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

k("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
k("v", "<A-k>", "::m '<-2<CR>gv=gv", opts)

-- file maps
k("n", "<leader>s", ":w<CR>", opts)
k("n", "<leader>w", ":wq<CR>", opts)
k("n", "<leader>q", ":q!<CR>", opts)

-- file explorer
k("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
k("n", "<leader>o", ":NvimTreeFocus<CR>", opts)
k("n", "<leader>t", ":NvimTreeRefresh<CR>", opts)

-- source current file
k("n", "<leader>r", ":so %<CR>" ,{silent = false})

-- exit insert mode
k("i", "kj", "<Esc>", opts)
k("i", "jk", "<Esc>", opts)

-- LSP keymaps
-- k('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', opts)
-- k('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', opts)
-- k('n', 'gi', "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", opts)
-- k('n', 'gw', ':lua vim.lsp.buf.document_symbol()<cr>', opts)
-- k('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<cr>', opts)
-- k('n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_cursor({}))<cr>", opts)
-- k('n', 'gt', "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", opts)
-- k('n', 'K', ':lua vim.lsp.buf.hover()<cr>', opts)
-- k('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<cr>', opts)
-- k('n', '<leader>af', ':lua vim.lsp.buf.code_action()<cr>', opts)
-- k('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', opts)
-- k('n', 'gl', '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>', opts)
-- k('n', '<leader>a', "<cmd>lua require('telescope.builtin').lsp_code_actions()<cr>", opts)
-- k('n', '<leader>g', "<cmd>lua require('telescope.builtin').diagnostics()<cr>", opts)
-- k('n', '<C-f>', ":lua vim.lsp.buf.format()<cr>", opts)


-- Telescope keymaps
k("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
k("n", "<C-p>", "<cmd>Telescope grep_string<cr>", opts)
k("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
k("n", "<leader>p", "<cmd>Telescope live_grep<cr>", opts)
k("n", "<F8>", "<cmd>Telescope treesitter<cr>", opts)

-- gitsigns
k("n", "<C-g>b", ":Gitsigns blame_line<cr>", opts)
k("n", "<C-g>h", ":Gitsigns preview_hunk<cr>", opts)

-- competetive keymaps
k("n", "<F2>", ':w <CR> :!g++ -std=c++17 -Wshadow -Wall -o a "%" -O2 -Wno-unused-result <CR>', { noremap = true, silent = false })
k("n", "<F3>", ':w <CR> :!g++ -std=c++17 -Wshadow -Wall -o a "%" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG <CR>', { noremap = true, silent = false })
k("n", "<F4>", ':w <CR> :!g++ -o a "%" -s <CR>', { noremap = true, silent = false })
k("n", "<F5>", ':w <CR> :!g++ -o a "%" -g <CR>', { noremap = true, silent = false })

-- inputless
k("n", "<F9>", ':w <CR> :!g++ -fsanitize=address -std=c++17 -Wall -Wshadow -Wextra -DONPC -O2 -o a "%" && time ./a < in <CR>', { noremap = true, silent = false })
k("n", "<F10>", ':w <CR> :!g++ -fsanitize=address -std=c++17 -DONPC -O2 -o %< % && time ./%< < in <CR>', opts)

