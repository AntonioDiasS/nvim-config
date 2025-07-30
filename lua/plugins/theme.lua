return {
  "folke/tokyonight.nvim",
  lazy = false, -- Garante que o tema seja carregado na inicialização
  priority = 1000, -- Prioridade alta para carregar antes de outros plugins
  config = function()
    vim.cmd.colorscheme("tokyonight")
  end,
}
