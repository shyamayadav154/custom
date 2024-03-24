local autocmd = vim.api.nvim_create_autocmd


-- highlights yankgc
autocmd("TextYankPost", {
  pattern = "*",
  command = "silent! lua vim.highlight.on_yank()",
})

-- to handle the formatting of prisma files
autocmd("FileType",{
    pattern = "prisma",
    command = "setlocal shiftwidth=2"
})

-- autocmd to format on buff write
-- autocmd("BufWritePost", {
--   pattern = "*",
--   command = "lua vim.lsp.buf.format()",
-- })

-- autoc command to convert c Tab into const in javascript file
autocmd("FileType", {
  pattern = {"javascript", "typescript","typescriptreact"},
  command = "inoremap <buffer> c<Tab> const ",
})

autocmd("BufReadPost", {
  pattern = "*",
  command = "TSContextEnable",
})



-- autocmd("FileType", {
--   pattern = "javascript",
--   command = "inoremap <buffer> l<Tab> let ",
-- })

-- autocmd("FileType", {
--   pattern = "javascript",
--   command = "inoremap <buffer> f<Tab> function ",
-- })

-- autocmd("FileType", {
--   pattern = "javascript",
--   command = "inoremap <buffer> r<Tab> return ",
-- })

autocmd("TextChanged", {
  pattern = "*",
  command = "silent! update",
})

-- autocmd("TextChanged", {
--   pattern = "*",
--     -- format
--   command = "lua vim.lsp.buf.format()",
-- })

autocmd("InsertLeave", {
  pattern = "*",
  command = "silent! update",
})

-- got to last loc
autocmd("BufReadPost", {
  pattern = "*",
  command = [[if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]],
})

-- autocmd("BufWritePre", {
--   pattern = "*",
--   command = "lua vim.lsp.buf.format()",
-- })

-- autocmd("FileWritePre", {
--   pattern = "*",
--   command = "lua vim.lsp.buf.format()",
-- })

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

-- vim.opt.cursorline = true


if vim.g.neovide then
    vim.opt.guifont = "FiraCode Nerd Font:h12"
    vim.g.neovide_transparency = 0.9
    vim.g.neovide_scale_factor = 1
    end

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
vim.opt.isfname:append "@-@"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"
vim.opt.spelllang = "en_us"
vim.opt.spell = true
-- vscode format i.e json files
vim.g.vscode_snippets_path = "~/.config/nvim/lua/custom/vs_snippets"

-- snipmate format
vim.g.snipmate_snippets_path = "~/.config/nvim/lua/custom/snippets"

-- lua format
vim.g.lua_snippets_path = "~/.config/nvim/lua/custom/lua_snippets"

-- quickfixl list modifiable
vim.opt.filetype = "on"

