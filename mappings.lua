---@type MappingsTable
local M = {}
local vim = vim



-- vim.keymap.set('n',"J","mzj `z" )

-- vim.keymap.set({'n', 't'}, '<A-h>', '<CMD>NavigatorLeft<CR>')
-- vim.keymap.set({'n', 't'}, '<A-l>', '<CMD>NavigatorRight<CR>')
-- vim.keymap.set({'n', 't'}, '<A-k>', '<CMD>NavigatorUp<CR>')
-- vim.keymap.set({'n', 't'}, '<A-j>', '<CMD>NavigatorDown<CR>')
-- vim.keymap.set({'n', 't'}, '<A-p>', '<CMD>NavigatorPrevious<CR>')

M.general = {
  x = {
    ["<leader>p"] = { '"_dP', "Paste without losing" },
  },
    i = {
        --comment code Comment.nvim
        ["<A-c>"]={function ()
            require('Comment').toggle()
        end, "Comment code"},
    },
  n = {
    [";"] = {
      ":",
      "enter command mode",
      opts = {
        nowait = true,
      },
    },
    -- enable cspell check using null ls
     -- telescope branches
    ["<leader>gb"] = {
      function()
        require("telescope.builtin").git_branches()
      end,
      "git branches",
    },
    -- context teesitter
    ["[tc"] = {
      function()
        require("treesitter-context").go_to_context()
      end,
      "go to treesitter context",
    },
    -- double comma to template litral with bracket using nvim-surround
    ["<leader>rt"]= {"",'template litral with bracket'},
    -- lsp restart
    ["<leader>lr"] = {":LspRestart<CR>","Restart LSP" }, -- lazygit
    -- diff views

    ["<leader>gg"] = {":LazyGit<CR>","Open lazy git ui"},

    -- write to file
    ["<leader>w"] = { "<cmd>w<CR>", "write to file" },

    --html/jsx code folds
    ["<leader>z"] = { "zfat", "toggle fold" },

    -- quick fix navigation
    ["<A-j>"] = { "<cmd>cnext<CR>zz", "next quickfix" },
    ["<A-k>"] = { "<cmd>cprev<CR>zz", "prev quickfix" },
    -- ["<leader>sj"] = { "<cmd>lnext<CR>zz", "next quickfix" },
    -- ["<leader>sk"] = { "<cmd>lprev<CR>zz", "prev quickfix" },
    -- ["<leader>so"] = { "<cmd>copen<CR>", "open quickfix" },
    -- ["<leader>sl"] = { "<cmd>lopen<CR>", "open location" },
    ["<leader>qo"] = { "<cmd>copen<CR>", "open quickfix" },
    ["<leader>qc"] = { "<cmd>cclose<CR>", "open quickfix" },
    -- ["<C-l>"] = { "<cmd>lopen<CR>", "open location" },

    -- replace the word uder cursor
    ["<leader>s"] = {
      [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
      "replace word under cursor in current file",
    },
    -- replace prop input into component props
    ["<leader>sp"] = {
      [[:s/\v(\w+),/\1={\1}/g<CR>]],
      "replace word under cursor in current file",
    },

    ["<leader>p"] = { '"+p', "Paste from system clipboard" },

    -- close other buffers
    ["<leader>co"] = { ":%bd|e#<CR>", "close other buffers" },

    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },

    ["<C-d>"] = { "<C-d>zz", "Jump hanlf page down with cursor in th middle" },
    ["<C-u>"] = { "<C-u>zz", "Jump hanlf page down with cursor in th middle" },

    ["J"] = { "mzJ`z", "dont move cursor on j press" },

    ["<leader>u"] = { ":UndotreeToggle<CR>", "Undo tree toggle" },
    ["<leader>gs"] = { vim.cmd.Git, "Git commit status" },
    ["<A-t>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Terminal toggle horizontal",
    },
    ["<leader>a"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Add file to harpoon menu",
    },
    ["<leader>hp"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Open harpoon menu",
    },
    ["<leader>1"] = {
      function()
        require("harpoon.ui").nav_file(1)
      end,
      "Navigate to file 1 in harpoon",
    },
    ["<leader>2"] = {
      function()
        require("harpoon.ui").nav_file(2)
      end,
      "Navigate to file 2 in harpoon",
    },
    ["<leader>3"] = {
      function()
        require("harpoon.ui").nav_file(3)
      end,
      "Navigate to file 3 in harpoon",
    },
    ["<leader>4"] = {
      function()
        require("harpoon.ui").nav_file(4)
      end,
      "Navigate to file 4 in harpoon",
    },
    ["<leader>j"] = {
      function()
        require("harpoon.ui").nav_next()
      end,
      "Navigate to next mark in harpoon",
    },
    ["<leader>k"] = {
      function()
        require("harpoon.ui").nav_prev()
      end,
      "Navigate to prev mark in harpoon",
    },
  },
  v = {
    -- line up and down
    ["J"] = { ":m '>+1<CR>gv=gv", "Move line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move line up" },
    -- paste from system clipboard
    ["<leader>p"] = { '"+p', "Paste from system clipboard" },
    -- replace prop input into component props
    ["<leader>sp"] = {
      [[:s/\v(\w+),/\1={\1}/g<CR>]],
      "replace prop input into component props",
    },
  },
  t = {
    [";"] = {
      ":",
      opts = {
        nowait = true,
      },
    },
    ["<A-t>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
    },
  },
}
-- M.harpoon = {
--     n = {
--         ["<leader>a"] = { require("harpoon.mark").add_file() },
--         ["<leader>q"] = { require("harpoon.ui").toggle_quick_menu() },
--         ["<leader>1"] = { function() require("harpoon.ui").nav_file(1) end },
--         ["<leader>2"] = { function() require("harpoon.ui").nav_file(2) end },
--         ["<leader>3"] = { function() require("harpoon.ui").nav_file(3) end },
--         ["<leader>4"] = { function() require("harpoon.ui").nav_file(4) end },
--     }
-- }

return M
