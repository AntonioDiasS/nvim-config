-- ~/.config/nvim/init.lua

-- Define o caminho para o lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Instala o lazy.nvim automaticamente se não estiver presente (Bootstrap)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Carrega nossas configurações principais antes de tudo
require("core.options")
require("core.keymaps")

-- Configura o LazyVim para carregar plugins da pasta lua/plugins
require("lazy").setup({
  spec = {
    -- Procura automaticamente por arquivos .lua na pasta 'plugins'
    { import = "plugins" },
  },
  -- Configurações de performance (opcional, mas recomendado)
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
