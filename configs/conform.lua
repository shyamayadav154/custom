local conform = require "conform"

conform.setup {
  formatters_by_ft = {
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    yaml = { "prettierd" },
    json = { "prettierd" },
    markdown = { "prettierd" },
    graphql = { "prettierd" },
    lua = { "stylua" },
    python = { "black" },
  },


}

-- vim.keymap.set({ "n", "v" }, "<leader>fm", function()
--     conform.format {
--         lsp_fallback = true,
--         async = false,
--         timeout_ms = 500,
--     }
-- end
-- )
