-- ~/.config/nvim/lua/core/keymaps.lua

-- Define a tecla líder para a Barra de Espaço
-- IMPORTANTE: Deve ser definida antes de qualquer outro atalho
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Modo Normal
-- Melhor navegação de janelas
keymap("n", "<C-h>", "<C-w>h", { desc = "Ir para janela à esquerda" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Ir para janela abaixo" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Ir para janela acima" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Ir para janela à direita" })

-- Limpar destaques da busca com ESC
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Modo de Inserção
-- Atalho mais rápido para sair do modo de inserção
keymap("i", "jk", "<ESC>")

-- Modo Visual
-- Manter a seleção ao indentar
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
