---@class ChadrcConfig
local M = {}

local line_numbers = function()
  local config = require("core.utils").load_config().ui.statusline
  local sep_style = config.separator_style

  local default_sep_icons = {
    default = { left = "", right = "" },
    round = { left = "", right = "" },
    block = { left = "█", right = "█" },
    arrow = { left = "", right = "" },
  }

  local separators = (type(sep_style) == "table" and sep_style) or default_sep_icons[sep_style]

  local sep_l = separators["left"]

  local left_sep = "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon#" .. " "
  -- return line and column number
  local current_line = vim.fn.line "."
  local total_line = vim.fn.line "$"
  local column = vim.fn.col "."
  local text = string.format("%d:%d %d", current_line, column, total_line)
  -- text = (current_line == 1 and "Top") or text
  -- text = (current_line == total_line and "Bot") or text

  return left_sep .. "%#St_pos_text#" .. " " .. text .. " "
end

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  -- transparency = true,

  statusline = {

    theme = "default", -- default/vscode/vscode_colored/minimal
    -- modules arg here is the default table of modules
    overriden_modules = function(modules)
      modules[10] = line_numbers()
    end,

    -- default/round/block/arrow (separators work only for "default" statusline theme;
    -- round and block will work for the minimal theme only)
    separator_style = "round",

    -- overriden_modules = nil,
  },

  tabufline = {
    lazyload = false,
    overriden_modules = nil,
  },
  hl_override = highlights.override,
  hl_add = highlights.add,

  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,
    header = {
      " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
      " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
      " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
      " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
