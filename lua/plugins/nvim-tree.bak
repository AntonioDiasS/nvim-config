return {
  "nvim-tree/nvim-tree.lua",
  enable = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Desabilita netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup()

    -- Atalho para abrir/fechar o nvim-tree
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Alternar explorador de arquivos" })
  end,
}
