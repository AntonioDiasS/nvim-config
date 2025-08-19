-- Improves syntax highlighting and code analysis.
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { 
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "javascript",
      "typescript",
      "python",
      "html",
      "css",
      "go",
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
