-- Em ~/.config/nvim/lua/plugins/ui-enhancements.lua
return {
  -- Plugin 1: Autopares para fechar chaves, parênteses, etc.
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {}, -- Usa a configuração padrão que é excelente
  },

  -- Plugin 2: Delimitadores coloridos para chaves, parênteses, etc.
  {
  "HiPhish/rainbow-delimiters.nvim",
    config = function()
    -- Configuração padrão já funciona bem
    -- mas você pode personalizar os grupos de cores se quiser
    local rainbow_delimiters = require "rainbow-delimiters"

    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }
  end,
  },
}
