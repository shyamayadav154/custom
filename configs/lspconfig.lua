local base = require "plugins.configs.lspconfig"
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

local function add_missing_import()
    local params = {
        command = "_typescript.addMissingImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = "",
    }
    vim.lsp.buf.execute_command(params)
end

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "clangd", "graphql", "bashls", "quick_lint_js", "eslint", "jsonls", "gopls" }

lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            },
        },
    },
}

lspconfig.prismals.setup {
    on_attach = on_attach,
    capabilities = capabilities,

    prisma = {
        prismaFmtBin = "prisma",
    },
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    Lua = {
        hint = { enable = true },
        telemetry = { enable = false },
    },
}

lspconfig.emmet_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {
        "html",
        "css",
        "scss",
        -- "javascript",
        -- "javascriptreact",
        -- "typescript",
        -- "typescriptreact",
        "vue",
        "svelte",
        "markdown",
        "pug",
        "haml",
        "xml",
    },
}

--disable formatimg on attach for tsserver
local on_attach_tsserver = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    on_attach(client, bufnr)
end

lspconfig.tsserver.setup {
    on_attach = on_attach_tsserver,
    -- on_attach = on_attach,
    capabilities = capabilities,

    init_options = {
        -- maxTsServerMemory = 12288,
        preferences = {
            disableSuggestions = false,
        },
    },
    commands = {
        OrganizeImports = {
            organise_imports,
            description = "Organize Imports",
        },
        AddMissingImports = {
            add_missing_import,
            description = "Add missing imports",
        },
    },
    settings = {
        importModuleSpecifierPreference = "non-relative",
        javascript = {
            inlayHints = {
                -- includeInlayEnumMemberValueHints = true,
                -- includeInlayFunctionLikeReturnTypeHints = true,
                -- includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all",
                -- includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                -- includeInlayPropertyDeclarationTypeHints = true,
                -- includeInlayVariableTypeHints = true,
            },
        },
        typescript = {
            inlayHints = {
                -- includeInlayEnumMemberValueHints = true,
                -- includeInlayFunctionLikeReturnTypeHints = true,
                -- includeInlayFunctionParameterTypeHints = true,
                includeInlayParameterNameHints = "all",
                -- includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                -- includeInlayPropertyDeclarationTypeHints = true,
                -- includeInlayVariableTypeHints = true,
            },
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
