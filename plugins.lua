local overrides = require "custom.configs.overrides"

--TODO: treesitter objext

---@type NvPluginSpec[]
local plugins = {
  -- Override plugin definition options
  {
    "OlegGulevskyy/better-ts-errors.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "BufRead",
    opts = {
      keymaps = {
        toggle = "<leader>ld", -- default '<leader>dd'
      },
    },
  },
  -- {
  --   "stevearc/conform.nvim",
  --   --  for users those who want auto-save conform + lazyloading!
  --   event = "BufWritePre",
  --   config = function()
  --     require "custom.configs.conform"
  --   end,
  -- },
  {
    "ThePrimeagen/refactoring.nvim",
    cmd = "Refactor",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp", "nvim_treesitter" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "jesseleite/nvim-macroni",
    cmd = { "YankMacro" },
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "BufRead",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   opts = {
  --     options = {
  --       component_separators = { left = "|", right = "|" },
  --       section_separators = { left = "", right = "" },
  --     },
  --   },
  -- },
  {
    "j-hui/fidget.nvim",
    event = { "BufRead", "TextChangedI", "BufReadPre" },
    opts = {
      -- options
    },
  },
  -- {
  --     "barrett-ruth/import-cost.nvim",
  --     event = { "BufEnter", "InsertLeave", "CursorHold", "BufRead" },
  --     build = "sh install.sh yarn",
  --     -- if on windows
  --     -- build = 'pwsh install.ps1 yarn',
  --     config = true,
  -- },
  -- {
  --     "hinell/duplicate.nvim",
  --     event = "VeryLazy",
  -- },
  {
    "Wansmer/treesj",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require "plugins.configs.treesitter"
      require("treesj").setup {
        use_default_keymaps = false,
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
  --     "pmizio/typescript-tools.nvim",
  --     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --     opts = {},
  --     event = "BufRead",
  --     config = function()
  --         require 'custom.configs.typescript-tools'
  --     end,
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    -- cmd = { "TodoTrouble", "TodoTelescope", "TodoQuickFix", "TodoLocList" },
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
  -- add null ls
  {
      "nvimtools/none-ls.nvim",
      dependencies = {
          "neovim/nvim-lspconfig",
      },
      event = "VeryLazy",
      config = function()
          require "custom.configs.null-ls"
      end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
    -- Override to setup mason-lspconfig
  },
  -- {
  --     "neovim/nvim-lspconfig",
  --     event = { "BufReadPre", "BufNewFile", "BufRead" },
  --     dependencies = { -- format & linting
  --         {
  --             "nvimtools/none-ls.nvim",
  --             config = function()
  --                 require "custom.configs.null-ls"
  --             end,
  --         },
  --     },
  --     config = function()
  --         require "plugins.configs.lspconfig"
  --         require "custom.configs.lspconfig"
  --     end, -- Override to setup mason-lspconfig
  -- },       -- override plugin configs
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
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = { "Copilot", "CopilotLine" },
    event = "InsertEnter",
    opts = {
      filetypes = {
        yaml = true,
        markdown = true,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
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
    "kylechui/nvim-surround",
    keys = { "cs", "ds", "ys" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
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
  },
  -- {
  --     "nvim-treesitter/nvim-treesitter-textobjects",
  --     event = "VeryLazy",
  --     enabled = false,
  --     config = function()
  --         require 'custom.configs.treesitter-textobjects'
  --     end,
  --     dependencies = {
  --         "nvim-treesitter/nvim-treesitter",
  --     },
  -- },
  {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    opts = {},
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
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
}

return plugins
