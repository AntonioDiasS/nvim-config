return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- Usar a versão master (releases são muito antigos)
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" }, -- Carrega apenas ao abrir um arquivo
  opts = {
    -- Uma lista de parsers para instalar obrigatoriamente
    ensure_installed = {
      "bash",
      "c",
      "html",
      "javascript",
      "json",
      "lua",
      "python",
      "query",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
    -- Instala parsers automaticamente ao abrir arquivos novos
    auto_install = true,
    
    -- Ativa o realce de sintaxe (Highlighting)
    highlight = {
      enable = true,
      -- Desabilitar para arquivos muito grandes para não travar
      disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
              return true
          end
      end,
    },
    
    -- Ativa a indentação baseada no treesitter (melhor que a padrão)
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
