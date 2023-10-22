local autocmd = vim.api.nvim_create_autocmd

autocmd('TextChanged', {
    pattern = '*',
    command = 'silent! update'
})

autocmd('InsertLeave', {
    pattern = '*',
    command = 'silent! update'
})

-- got to last loc
autocmd('BufReadPost', {
    pattern = '*',
    command = [[if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]
})

autocmd('BufWritePre', {
    pattern = '*',
    command = 'lua vim.lsp.buf.formatting_sync(nil, 1000)'
})

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

local vim = vim

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"
-- vscode format i.e json files
