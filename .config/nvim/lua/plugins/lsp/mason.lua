return {
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      -- Frontend
      "html",            -- HTML
      "cssls",           -- CSS
      "tailwindcss",     -- TailwindCSS
      "jsonls",          -- JSON files
      "yamlls",          -- YAML files (config, CI/CD)
      "emmet_ls",        -- Emmet support for HTML/CSS
      -- Backend / Node.js
      "lua_ls",          -- Lua (useful if using Neovim plugins)
      "dockerls",        -- Dockerfiles
      -- Optional: frameworks / tools
      "eslint",          -- JavaScript / TypeScript linting
      "vue_ls",
      "vtsls"
    },
  },
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },
    "neovim/nvim-lspconfig",
  },
}
