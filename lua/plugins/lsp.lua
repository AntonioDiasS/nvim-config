return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      -- Desabilitar mensagem "No LSP found"
      vim.g.lsp_zero_noblock = true
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "L3MON4D3/LuaSnip" },
    },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
   -- lazy = true,
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.on_attach(function(client, bufnr)
        -- Atalhos do LSP
        local keymap = vim.keymap.set
        keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = bufnr, desc="Ver documentação (hover)" })
        keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = bufnr, desc="Ir para definição" })
        keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = bufnr, desc="Ver referências" })
        keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = bufnr, desc="Ações de código" })
        keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = bufnr, desc="Renomear" })
      end)

      lsp_zero.preset("recommended")
      lsp_zero.setup()
    end,
  },
}
