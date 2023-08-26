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
        ["<leader>u"] = { ":UndotreeToggle<CR>" },
        ["<leader>gs"] = { vim.cmd.Git },
    }
}
-- M.harpoon = {
--     n = {
--         ["<leader>a"] = { require("harpoon.mark").add_file },
--         ["<leader>q"] = { require("harpoon.ui").toggle_quick_menu },
--         ["<leader>1"] = { function() require("harpoon.ui").nav_file(1) end },
--         ["<leader>2"] = { function() require("harpoon.ui").nav_file(2) end },
--         ["<leader>3"] = { function() require("harpoon.ui").nav_file(3) end },
--         ["<leader>4"] = { function() require("harpoon.ui").nav_file(4) end },
--     }
-- }

return M
