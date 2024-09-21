return {
  --"rebelot/kanagawa.nvim",
  --config = function()
    --vim.cmd.colorscheme "kanagawa-wave"
  --end
  'AlexvZyl/nordic.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require 'nordic' .load()
  end
}
