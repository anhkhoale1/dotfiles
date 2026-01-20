return {
  "mg979/vim-visual-multi",
  branch = "master",
  config = function()
    vim.g.VM_default_mappings = 1
    vim.g.VM_theme = "green"
  end,
}

-- select words with Ctrl-n (like Ctrl-d in Sublime Text/VS Code)
-- press n/N to get next/previous occurrence
-- press q to skip current and get next occurrence
-- press Q to remove current cursor/selection
-- create cursors vertically with Ctrl-Down/Ctrl-Up
-- select one character at a time with Shift-Arrows
-- press [/] to select next/previous cursor
-- start insert mode with i,a,I,A
