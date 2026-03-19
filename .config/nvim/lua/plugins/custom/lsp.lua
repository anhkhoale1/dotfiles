local M = {}

M.get_servers = function()
  local home = os.getenv("HOME")
  local mason_path = home .. "/.local/share/nvim/mason/packages"
  
  local vue_ls_path = mason_path .. "/vue-language-server"
  local vue_plugin_path = vue_ls_path .. "/node_modules/@vue/typescript-plugin"
  local tsdk_path = vue_ls_path .. "/node_modules/typescript/lib"

  local has_schemastore, schemastore = pcall(require, "schemastore")

  return {
    vtsls = {
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
      settings = {
        vtsls = {
          autoUseWorkspaceTsdk = true,
          tsserver = {
            globalPlugins = {
              {
                name = "@vue/typescript-plugin",
                location = vue_plugin_path,
                languages = { "vue" },
                configNamespace = "typescript",
                enableForWorkspaceTypeScriptVersions = true,
              },
            },
          },
        },
      },
      on_attach = function(client, bufnr)
        if vim.bo[bufnr].filetype == "vue" then
          client.server_capabilities.definitionProvider = false
        end
      end,
    },

    -- 2. Volar (vue_ls)
    vue_ls = {
      filetypes = { "vue" },
      init_options = {
        vue = { hybridMode = false }, -- Hybrid mode tắt để chạy mượt hơn với vtsls
        typescript = { tsdk = tsdk_path },
      },
    },

    -- 3. JSON
    jsonls = {
      settings = {
        json = {
          schemas = has_schemastore and schemastore.json.schemas() or {},
          validate = { enable = true },
        },
      },
    },

    -- 4. Tailwind & Web
    tailwindcss = {},
    html = { filetypes = { "html", "jsp" } },
    cssls = {},

    eslint = {
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            pcall(function()
              vim.cmd("EslintFixAll")
            end)
          end,
        })
      end,
    },

    -- 6. Lua
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      },
    },
  }
end

return M
