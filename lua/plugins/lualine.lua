return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Dependência para ícones
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight",
        icons_enabled = true,
        component_separators = "|",
        section_separators = "",
      },
    })
  end,
}
