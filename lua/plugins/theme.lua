return{
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      integrations = {
        nvimtree = true, -- ativa o tema no nvim-tree
      },
    })

    -- aplica o tema
    vim.cmd.colorscheme("catppuccin")
  end,
}
