-- ~/.config/nvim/lua/core/options.lua

local opt = vim.opt

-- Numeração de linhas
opt.relativenumber = true -- Linhas relativas
opt.number = true         -- Número da linha atual

-- Indentação
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Aparência
opt.termguicolors = true -- Cores verdadeiras no terminal
opt.wrap = false         -- Não quebrar linhas

-- Busca
opt.incsearch = true     -- Mostra resultados enquanto digita
opt.hlsearch = true      -- Destaca todos os resultados
opt.ignorecase = true    -- Ignorar maiúsculas/minúsculas na busca
opt.smartcase = true     -- A menos que a busca contenha uma letra maiúscula

-- Outros
opt.scrolloff = 8              -- Mantém 8 linhas de contexto acima/abaixo do cursor
opt.swapfile = false           -- Desabilita arquivos de swap
opt.backup = false             -- Desabilita backups
opt.undodir = vim.fn.stdpath("data") .. "/undodir"
opt.undofile = true            -- Habilita histórico de 'undo' persistente
opt.mouse = "a"                -- Habilita o uso do mouse
opt.splitright = true          -- Abre splits verticais à direita
opt.splitbelow = true          -- Abre splits horizontais abaixo
opt.updatetime = 250           -- Menor tempo de atualização para plugins
