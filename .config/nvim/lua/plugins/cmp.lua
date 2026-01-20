return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",      -- LSP completions
    "hrsh7th/cmp-buffer",        -- Buffer words
    "hrsh7th/cmp-path",          -- File paths
    "hrsh7th/cmp-cmdline",       -- Command line completion
    "L3MON4D3/LuaSnip",          -- Snippet engine
    "saadparwaiz1/cmp_luasnip",  -- Snippet completions
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      },
      completion = {
        autocomplete = { cmp.TriggerEvent.TextChanged },  -- popup while typing
        completeopt = "menu,menuone,noinsert,noselect",   -- recommended for Neovim
      },
    })
  end,
}
