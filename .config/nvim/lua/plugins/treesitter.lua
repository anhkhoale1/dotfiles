return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- updated branch specification
    build = ":TSUpdate",
    main = "nvim-treesitter.configs", -- use this module for opts
    opts = {
      ensure_installed = {
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
      },
      auto_install = true, -- auto-install missing parsers
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false, -- set to false for performance
      },
      indent = { enable = true },
      autotag = { enable = true },
    },
  },
}

