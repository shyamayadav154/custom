local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local function organise_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "clangd", "eslint", "graphql", "prismals" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "html",
    "css",
    "scss",
    -- "javascript",
    "javascriptreact",
    -- "typescript",
    "typescriptreact",
    "vue",
    "svelte",
    "markdown",
    "pug",
    "haml",
    "xml",
  },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- init_options = {
  --   preferences = {
  --     disableSuggestions = true,
  --   },
  -- },
  commands = {
    OrganizeImports = {
      organise_imports,
      description = "Organize Imports",
    },
  },
}

--
-- lspconfig.pyright.setup { blabla}
-- Without the loop, you would have to manually set up each LSP
--
-- lspconfig.html.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.cssls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
