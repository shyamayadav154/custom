
return require("nvim-treesitter.configs").setup {
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {

                ["am"] = { query = "@function.outer", kind = "select outer part of a method/function" },
                ["im"] = { query = "@function.inner", kind = "select inner part of a method/function" },

                ["af"] = { query = "@call.outer", kind = "select outer part of a method/function" },
                ["if"] = { query = "@call.inner", kind = "select inner part of a method/function" },

                ["a="] = { query = "@assignment.outer", kind = "select outer part of an assignment" },
                ["i="] = { query = "@assignment.inner", kind = "select inner part of an assignment" },
                ["l="] = { query = "@assignment.lhs", kind = "select left hand side of an assignment" },
                ["r="] = { query = "@assignment.rhs", kind = "select right hand side of an assignment" },

                ["aa"] = { query = "@parameter.outer", kind = "parameter" },
                -- ["ii"] = { query = "@parameter.inner", kind = "parameter" },
                --loop outer
                ["al"] = { query = "@loop.outer", kind = "loop outer" },
                ["il"] = { query = "@loop.inner", kind = "loop inner" },
                -- conditional
                ["ai"] = { query = "@conditional.outer", kind = "conditional outer" },
                ["ii"] = { query = "@conditional.inner", kind = "conditional inner" },
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
                ["tm"] = "@function.outer",
                ["tl"] = "@loop.outer",
                ["tf"] = "@call.outer",
                ["tc"] = "@class.outer",
                ["ti"] = "@conditional.outer",
            },
            goto_previous_start = {
                ["tM"] = "@function.outer",
                ["tL"] = "@loop.outer",
                ["tf"] = "@call.outer",
                ["tc"] = "@class.outer",
                ["tI"] = "@conditional.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]F"] = "@call.outer",
                ["]C"] = "@class.outer",
                ["]I"] = "@conditional.outer",
                ["]L"] = "@loop.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[F"] = "@call.outer",
                ["[C"] = "@class.outer",
                ["[I"] = "@conditional.outer",
                ["[L"] = "@loop.outer",
            },
        },
    },
}
