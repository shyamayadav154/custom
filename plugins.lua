local overrides = require "custom.configs.overrides"

-- TODO: hell no

---@type NvPluginSpec[]
local plugins = { -- Override plugin definition options
  {
    "j-hui/fidget.nvim",
    event = "BufRead",
    opts = {
      -- options
    },
  },
  -- {
  --   "barrett-ruth/import-cost.nvim",
  --   event = {"BufEnter", "InsertLeave", "CursorHold","BufRead" },
  --   build = "sh install.sh yarn",
  --   -- if on windows
  --   -- build = 'pwsh install.ps1 yarn',
  --   config = true,
  -- },
  {
    "hinell/duplicate.nvim",
    event = "VeryLazy",
  },
  {
    "Wansmer/treesj",
    keys = { "<space>m" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup {--[[ your config ]]
      }
    end,
  },
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },
  {
    "axelvc/template-string.nvim",
    event = "VeryLazy",
    config = function()
      require("template-string").setup {}
    end,
  },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  --   event = "BufRead",
  --   config = function()
  --     local keymap = vim.keymap
  --     keymap.set("n", "<leader>m", "<cmd>TSToolsOrganizeImports<cr>")
  --     keymap.set("n", "<leader>a", "<cmd>TSToolsAddMissingImports<cr>")
  --
  --     local api = require "typescript-tools.api"
  --     require("typescript-tools").setup {
  --       handlers = {
  --               -- not used warning disable
  --         ["textDocument/publishDiagnostics"] = api.filter_diagnostics { 6133 },
  --       },
  --       settings = {
  --         tsserver_file_preferences = {
  --           importModuleSpecifierPreference = "non-relative",
  --           -- includeInlayParameterNameHints = "all",
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoTrouble", "TodoTelescope", "TodoQuickFix", "TodoLocList" },
    opts = {},
  },
  {
    "tpope/vim-dadbod",
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      require("custom.configs.dadbod").setup()
    end,
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    cmd = {
      "DBCompletionClearCache",
    },
    dependencies = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-ui",
      "hrsh7th/nvim-cmp",
    },
    -- event = "InsertEnter",
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
    },
    cmd = { "DBUIToggle", "DBUIAddConnection", "DBUI", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUIConfig", "DB" },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { -- format & linting
      {
        "nvimtools/none-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  }, -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  }, -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        auto_trigger = true,
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup {
        user_default_options = {
          tailwind = true,
        },
      }
    end,
  },
  {

    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },
  {
    "stevearc/aerial.nvim",
    cmd = { "Aerial", "AerialOpen", "AerialClose", "AerialToggle", "AerialNext", "AerialPrev" },
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "Git",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gsplit",
      "Gvsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
    ft = { "fugitive" },
  },
  {
    "ThePrimeagen/harpoon",
  },
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewFileHistory",
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "David-Kunz/gen.nvim",
    cmd = { "Gen", "GenOnly" },
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  {
    -- nvim treesitter context plugin
    "nvim-treesitter/nvim-treesitter-context",
    cmd = { "TSContextEnable", "TSContextDisable", "TSContextToggle" },
    event = "BufRead",
    config = function()
      require("nvim-treesitter.configs").setup {
        context_commentstring = {
          enable = true,
          enable_autocmd = true,
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "BufRead",
    config = function()
      require("nvim-treesitter.configs").setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {

              ["am"] = { query = "@function.outer", kind = "select outer part of a method/function" },
              ["im"] = { query = "@function.inner", kind = "select inner part of a method/function" },

              ["af"] = { query = "@call.outer", kind = "select outer part of a method/function" },
              ["if"] = { query = "@call.inner", kind = "select inner part of a method/function" },

              ["ac"] = { query = "@class.outer", kind = "select outer part of a class" },
              ["ic"] = { query = "@class.inner", kind = "select inner part of a class" },

              ["a="] = { query = "@assignment.outer", kind = "select outer part of an assignment" },
              ["i="] = { query = "@assignment.inner", kind = "select inner part of an assignment" },
              ["l="] = { query = "@assignment.lhs", kind = "select left hand side of an assignment" },
              ["r="] = { query = "@assignment.rhs", kind = "select right hand side of an assignment" },

              ["aa"] = { query = "@parameter.outer", kind = "parameter" },
              ["ii"] = { query = "@parameter.inner", kind = "parameter" },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>na"] = "@parameter.inner", -- swap parameter/argument with next
              ["<leader>nm"] = "@function.outer", -- swap function with next
            },
            swap_previous = {
              ["<leader>pa"] = "@parameter.inner", -- swap parameter/argument with next
              ["<leader>pm"] = "@function.outer", -- swap function with next
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]f"] = "@call.outer",
              ["]c"] = "@class.outer",
              ["]i"] = "@condition.outer",
              ["]l"] = "@loop.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]F"] = "@call.outer",
              ["]C"] = "@class.outer",
              ["]I"] = "@condition.outer",
              ["]L"] = "@loop.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[f"] = "@call.outer",
              ["[c"] = "@class.outer",
              ["[i"] = "@condition.outer",
              ["[l"] = "@loop.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[F"] = "@call.outer",
              ["[C"] = "@class.outer",
              ["[I"] = "@condition.outer",
              ["[L"] = "@loop.outer",
            },
          },
        },
      }
    end,
  },
  {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    opts = {
      highlight_hovered_item = true,
      show_guides = true,
      auto_preview = false,
      position = "right",
      relative_width = true,
      width = 25,
      auto_close = false,
      show_numbers = false,
      show_relative_numbers = false,
      show_symbol_details = true,
      preview_bg_highlight = "Pmenu",
      autofold_depth = nil,
      auto_unfold_hover = true,
      fold_markers = { "", "" },
      wrap = false,
      keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
        fold = "h",
        unfold = "l",
        fold_all = "W",
        unfold_all = "E",
        fold_reset = "R",
      },
      lsp_blacklist = {},
      symbol_blacklist = {},
      symbols = {
        File = { icon = "File", hl = "@text.uri" },
        Module = { icon = "Module", hl = "@namespace" },
        Namespace = { icon = "Namespace", hl = "@namespace" },
        Package = { icon = "", hl = "@namespace" },
        Class = { icon = "𝓒", hl = "@type" },
        Method = { icon = "fn", hl = "@method" },
        Property = { icon = "", hl = "@method" },
        Field = { icon = "__", hl = "@field" },
        Constructor = { icon = "", hl = "@constructor" },
        Enum = { icon = "En", hl = "@type" },
        Interface = { icon = "I", hl = "@type" },
        Function = { icon = "fn", hl = "@function" },
        Variable = { icon = "let/var", hl = "@constant" },
        Constant = { icon = "const", hl = "@constant" },
        String = { icon = "𝓐", hl = "@string" },
        Number = { icon = "#", hl = "@number" },
        Boolean = { icon = "⊨", hl = "@boolean" },
        Array = { icon = "[]", hl = "@constant" },
        Object = { icon = "{}", hl = "@type" },
        Key = { icon = "🔐", hl = "@type" },
        Null = { icon = "NULL", hl = "@type" },
        EnumMember = { icon = "", hl = "@field" },
        Struct = { icon = "𝓢", hl = "@type" },
        Event = { icon = "Ev", hl = "@type" },
        Operator = { icon = "+-=*", hl = "@operator" },
        TypeParameter = { icon = "𝙏", hl = "@parameter" },
        Component = { icon = "</>", hl = "@function" },
        Fragment = { icon = "<>", hl = "@constant" },
      },
    },
  },
  {
    -- autotag rename
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup {
        filetypes = { "html", "xml", "javascript", "javascriptreact", "typescriptreact", "svelte", "vue" },
      }
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "LazyGit", "LazyGitConfig" },
  },
  {
    -- zen mode
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
  },
  {
    -- git blame
    "f-person/git-blame.nvim",
    cmd = { "GitBlameToggle", "GitBlameEnable", "GitBlameOpenCommitURL", "GitBlameCopySHA", "GitBlameCopyCommitURL" },
  },
  {
    -- jsx/tsx comment
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufRead",
    config = function()
      -- require("nvim-treesitter.configs").setup {
      --   context_commentstring = {
      --     enable = true,
      --     enable_autocmd = true,
      --   },
      -- }
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
}

return plugins
