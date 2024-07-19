local cmp = require("cmp")
local luasnip = require("luasnip")


local opts = {
    -- Don't preselect an option
    preselect = cmp.PreselectMode.None,

    experimental = {
        ghost_text = true
    },

    -- Snippet, required
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },

    mapping = {
        -- Open/close autocomplete
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

        -- Select completion
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        }),

        ['<C-c>'] = cmp.mapping.close(),

        -- Scroll through options
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,

        -- Scroll documentation
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
    },

    -- Complete options from LSP servers and the snippet engine
    sources = {
        {name = "luasnip", priority = 1},
        {name = "nvim_lsp", priority = 3},

        {name = "path"},
        {name = "buffer"}
    },
}

cmp.setup(opts)