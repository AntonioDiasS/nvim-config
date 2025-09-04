
  return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- ícones bonitos
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- mostra buffers (não tabs nativas do vim)
        numbers = "none", -- "ordinal" ou "buffer_id" se quiser ver número
        close_command = "bdelete! %d", -- comando para fechar buffer
        right_mouse_command = "bdelete! %d",
        show_buffer_close_icons = true,
        show_close_icon = false,
        diagnostics = "nvim_lsp", -- mostra ícones de diagnósticos do LSP
        separator_style = "slant", -- estilos: "slant", "thick", "thin"
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "NvimTree", -- se você usa nvim-tree
            text = "File Explorer",
            highlight = "Directory",
            separator = true,
          },
        },
      },
    })

    -- Keymaps para navegar rápido
    vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { silent = true, desc = "Next buffer" })
    vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { silent = true, desc = "Prev buffer" })
    vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { silent = true, desc = "Pick buffer" })
    vim.keymap.set("n", "<leader>bq", ":bdelete<CR>", { silent = true, desc = "Close buffer" })
  end,
}
