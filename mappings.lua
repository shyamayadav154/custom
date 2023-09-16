---@type MappingsTable
local M = {}
local vim = vim

M.general = {
    n = {
        [";"] = {
            ":",
            "enter command mode",
            opts = {
                nowait = true
            }
        },
        ["<leader>u"] = { ":UndotreeToggle<CR>", 'Undo tree toggle' },
        ["<leader>gs"] = { vim.cmd.Git, "Git commit status" },
        ["<A-t>"] = { function ()
            require("nvterm.terminal").toggle("horizontal")
        end, "Terminal toggle horizontal" },
        ["<leader>a"] = { function() require("harpoon.mark").add_file() end },
        ["<leader>q"] = { function() require("harpoon.ui").toggle_quick_menu() end },
        ["<leader>1"] = { function() require("harpoon.ui").nav_file(1) end },
        ["<leader>2"] = { function() require("harpoon.ui").nav_file(2) end },
        ["<leader>3"] = { function() require("harpoon.ui").nav_file(3) end },
        ["<leader>4"] = { function() require("harpoon.ui").nav_file(4) end },

    },
    t = {
        [";"] = {
            ":",
            opts = {
                nowait = true
            }
        },
        ["<A-t>"] = { function ()
            require("nvterm.terminal").toggle("horizontal")
        end }
    }
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
