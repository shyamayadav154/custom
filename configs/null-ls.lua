local present, null_ls = pcall(require, "null-ls")

if not present then
    return
end

local b = null_ls.builtins

local sources = {

    -- webdev stuff
    b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "javascript", "javascriptreact","typescript","typescriptreact" ,"json" } }, -- so prettier works only on these filetypes
    -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "javascript", "javascriptreact", "json" } }, -- so prettier works only on these filetypes
    -- b.formatting.deno_fmt,                                                                                            -- choosed deno for ts/js files cuz its very fast!
    -- b.formatting.prismaFmt,

    b.code_actions.eslint,
    -- b.code_actions.eslint_d,
    b.diagnostics.jsonlint,
    b.diagnostics.zsh,

    -- b.diagnostics.dotenv_linter,

    -- cpsell
    -- b.diagnostics.cspell,
    -- b.code_actions.cspell,
    --  b.code_actions.cspell.with({
    --      config = {
    --          find_json = function (cwd)
    --              return vim.fn.expand('~/.config/nvim/lua/custom' .. '/.cspell.json')
    --          end,
    --      },
    -- }),

    --codespell
    b.diagnostics.codespell,
    b.formatting.codespell,

    --luasnip
    -- b.completion.spell,

    -- Lua
    -- b.formatting.stylua,
}

null_ls.setup {
    debug = true,
    sources = sources,
}
