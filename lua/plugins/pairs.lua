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
      local rainbow_delimiters = require "rainbow-delimiters"

      -- Definindo os highlights da paleta arco-íris clássica
      vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterCyan", { fg = "#56B6C2" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#C678DD" })

      -- Configuração do plugin
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim  = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua  = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterOrange',
          'RainbowDelimiterYellow',
          'RainbowDelimiterGreen',
          'RainbowDelimiterCyan',
          'RainbowDelimiterBlue',
          'RainbowDelimiterViolet',
        },
      }
    end,
  }, }
