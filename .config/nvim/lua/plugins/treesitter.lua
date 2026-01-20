return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ":TSUpdate",
    init = function()
      -- list of parsers to install
      local parser_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
      }

      -- install parsers after startup
      vim.defer_fn(function()
        require("nvim-treesitter.install").ensure_installed(parser_installed)
      end, 1000)

      require("nvim-treesitter.install").update()

      -- auto-start highlights & indentation
      vim.api.nvim_create_autocmd("FileType", {
        desc = "User: enable treesitter highlighting",
        callback = function(ctx)
          local hasStarted = pcall(vim.treesitter.start) -- safely start treesitter

          -- indent expr if treesitter started
          local noIndent = {}
          if hasStarted and not vim.tbl_contains(noIndent, ctx.match) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  }
}

