return {
  "neovim/nvim-lspconfig",
  config = function()
    local custom_lsp = require("plugins.custom.lsp")
    local servers = custom_lsp.get_servers()

    for server, opts in pairs(servers) do
      vim.lsp.config(server, opts)
      vim.lsp.enable(server)
    end
  end,
}
