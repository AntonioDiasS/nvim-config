-- Plugins que melhoram a interface do usuário e a experiência de uso.
return {
  -- Mostra os próximos atalhos de teclado possíveis.
  {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
      delay = 0,
      --  spec = {
      --  { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      --{ '<leader>d', group = '[D]ocument' },
      --{ '<leader>r', group = '[R]ename' },

      { '<leader>y', group = '[Y]ank(copy)' },
      { '<leader>s', group = '[S]earch' },

      --{ '<leader>w', group = '[W]orkspace' },
      --{ '<leader>t', group = '[T]oggle' },
      --{ '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      -- },
    },
  },

  -- Destaca TODO, NOTE, FIXME, etc., nos comentários.
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },

  -- Coleção de pequenos plugins. Usamos para:
  -- - Melhores text objects (ex: `va)` para selecionar ao redor de parênteses)
  -- - Adicionar/remover/substituir "arredores" (ex: `ds'` para deletar aspas simples)
  -- - Uma statusline simples e bonita.
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.surround").setup()
      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = vim.g.have_nerd_font })
      statusline.section_location = function()
        return "%2l:%-2v"
      end
    end,
  },
}
