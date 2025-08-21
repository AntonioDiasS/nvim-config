
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Abrir/Fechar NvimTree" },
  },
  opts = {
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 35,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false,
    },
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
        }
      end

      -- ===== Teclas personalizadas =====
      vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Fechar diretório"))
      vim.keymap.set("n", "l", api.node.open.preview, opts("Abrir diretório/arquivo"))
      vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Abrir diretório/arquivo"))

      -- ===== Extras úteis =====
      vim.keymap.set("n", "r", api.fs.rename, opts("Renomear"))
      vim.keymap.set("n", "a", api.fs.create, opts("Criar arquivo/pasta"))
      vim.keymap.set("n", "d", api.fs.remove, opts("Deletar"))
      vim.keymap.set("n", "R", api.tree.reload, opts("Recarregar"))
      vim.keymap.set("n", "c", api.fs.copy.node, opts("Copiar"))
      vim.keymap.set("n", "x", api.fs.cut, opts("Recortar"))
      vim.keymap.set("n", "p", api.fs.paste, opts("Colar"))
      vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copiar nome"))
      vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copiar caminho relativo"))
      vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copiar caminho absoluto"))
      vim.keymap.set("n", "q", api.tree.close, opts("Fechar NvimTree"))
      vim.keymap.set("n", "?", api.tree.toggle_help, opts("Ajuda"))
    end,
  },
}
