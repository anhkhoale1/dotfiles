return {
  "catppuccin/nvim",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",
      dim_inactive = {
        enabled = true,      -- turn on/off dimming
        shade = "dark",      -- can be "dark" or "light" depending on theme
        percentage = 0.15,   -- how much to dim inactive windows (15% here)
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
