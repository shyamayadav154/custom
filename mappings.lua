---@class MappingsTable
local M = {}
local vim = vim

local unique_quickfix_list = function()
    local qlist = vim.fn.getqflist()
    local uniq_list = vim.fn.unique(qlist, 0, 1)
    vim.fn.setqflist(uniq_list)
end

local diagnostic_goto = function(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        go { severity = severity }
    end
end
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
        -- luasnip keymaps
        ["<A-n>"] = {
            function()
                require("luasnip").jump(1)
            end,
            "Jump onestep",
        },
        ["<A-p>"] = {
            function()
                require("luasnip").jump(-1)
            end,
            "Jump onestep",
        },
        ["<A-e>"] = {
            function()
                require("luasnip").expand_or_jump()
            end,
            "Jump onestep",
        },
        -- ["<A-e>"]=  { function() require('luasnip').jump(-1) end,  "jump one back"},
    },
    n = {
        [";"] = {
            ":",
            "enter command mode",
            opts = {
                nowait = true,
            },
        },
        ["<leader>qu"] = {
            function()
                unique_quickfix_list()
            end,
            "Unique quickfix list",
        },
        -- git sign preview hunk
        ["<leader>gh"] = { "<CMD>Gitsigns preview_hunk<CR>", "Preview Hunk" },
        -- git reset current file
        ["<leader>gr"] = { "<CMD>Git restore %<CR>", "Git reset current file" },
        --enable inlay hints
        ["<leader>ih"] = { function()
            vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
        end, 'Toogle inlay hints' },
        -- conform format
        -- ["<leader>fm"] = {
        --   function()
        --     require("conform").format { lsp_fallback = true, async = false, }
        --   end,
        --   "Format with conform",
        -- },
        -- to show only the lsp error disable lsp suggestion and null ls codespell
        --telescope git status
        ["<leader>fg"] = { "<CMD>Telescope git_status<CR>", "git status" },
        -- ["<leader>gs"] = { "<CMD>Telescope git_status<CR>", "git status", },
        --go to last buffer
        ["gl"] = { "<cmd>b#<CR>", "Go to last buffer" },
        ["<leader>rq"] = {
            "^ds[dWarefetch:<Esc>p/use<CR>dwiuseQuery<Esc>",
            "Replaces useLazyQuery with useQuery",
            opts = { remap = true, silent = true },
        },
        -- jump to git humks
        ["[g"] = { "<cmd>lua require'gitsigns'.prev_hunk()<CR>", "Previous Hunk" },
        ["]g"] = { "<cmd>lua require'gitsigns'.next_hunk()<CR>", "Next Hunk" },
        -- lsp diagnostic cmds
        ["]e"] = { diagnostic_goto(true, "ERROR"), "Next Error" },
        ["[e"] = { diagnostic_goto(false, "ERROR"), "Previous Error" },
        ["]w"] = { diagnostic_goto(true, "WARN"), "Next Warning" },
        ["[w"] = { diagnostic_goto(false, "WARN"), "Previous Warning" },
        --go to tod do comment
        --TODO:
        ["]t"] = {
            function()
                require("todo-comments").jump_next()
            end,
            "Next Todo comment",
        },
        ["[t"] = {
            function()
                require("todo-comments").jump_prev()
            end,
            "Previous Todo comment",
        },
        -- move to last insertion and insert
        ["gi"] = { "gi" },
        ["gT"] = {
            function()
                require("nvchad.tabufline").move_buf(-1)
            end,
        },
        ["gt"] = {
            function()
                require("nvchad.tabufline").move_buf(1)
            end,
        },
        -- toggle transparency
        ["<leader>tt"] = {
            function()
                require("base46").toggle_transparency()
            end,
            "Toggle transparency",
        },
        --Telescope find files hidden but not git
        ["<leader>ff"] = {
            "<CMD>Telescope find_files hidden=true find_command=rg,--files,--hidden,--glob,!.git <CR>",
            "Find Files hidden too",
        },

        ["<leader>o"] = { "<CMD>OrganizeImports<CR>", "Organize imports tss lsp" },
        ["<leader>e"] = { "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree" },

        -- resize window
        ["<leader>hh"] = { ":vertical resize -10<CR>", "Resize window left" },
        ["<leader>ll"] = { ":vertical resize +10<CR>", "Resize window right" },
        -- ["<leader>kk"] = { ":resize -5<CR>", "Resize window up" },
        -- ["<leader>jj"] = { ":resize +5<CR>", "Resize window down" },
        --save on double esc press
        ["<esc><esc>"] = { ":w<CR>", "Save on double esc press" },
        -- telescope branches
        ["<leader>gb"] = {
            function()
                require("telescope.builtin").git_branches()
            end,
            "git branches",
        }, -- context teesitter
        ["[tc"] = {
            function()
                require("treesitter-context").go_to_context()
            end,
            "go to treesitter context",
        },
        -- double comma to template litral with bracket using nvim-surround
        ["<leader>rt"] = { "", "template litral with bracket" },
        -- lsp restart
        ["<leader>lr"] = { ":LspRestart<CR>", "Restart LSP" }, -- lazygit
        -- diff views

        ["<leader>gg"] = { ":LazyGit<CR>", "Open lazy git ui" },

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

        -- replace the word under cursor
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
        -- duplicate
        ["<A-k>"] = { "<cmd>VisualDuplicate -1<CR>", "Duplicate line down" },
        ["<A-j>"] = { "<cmd>VisualDuplicate +1<CR>", "Duplicate line up" },
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
