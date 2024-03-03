local keymap = vim.keymap
keymap.set("n", "<leader>m", "<cmd>TSToolsOrganizeImports<cr>")
keymap.set("n", "<leader>a", "<cmd>TSToolsAddMissingImports<cr>")

local api = require "typescript-tools.api"
require("typescript-tools").setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
    handlers = {
        -- not used warning disable
        ["textDocument/publishDiagnostics"] = api.filter_diagnostics { 6133 },
    },
    settings = {
        importModuleSpecifierPreference = "non-relative",
        tsserver_file_preferences = {
            includeInlayParameterNameHints = "all",
        },
    }
}
