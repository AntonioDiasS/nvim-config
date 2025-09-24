-- lua/plugins/indent.lua
return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    -- usa config em vez de opts para garantir que os hooks e highlights
    -- sejam registrados depois que o plugin/module existir
    config = function()
      local ok, ibl = pcall(require, "ibl")
      if not ok then
        vim.notify("indent-blankline (ibl) não pôde ser carregado", vim.log.levels.ERROR)
        return
      end

      local hooks = require("ibl.hooks")

      -- nomes de highlight que o plugin vai usar (pode trocar as cores abaixo)
      local hl = {
        "IblIndent1",
        "IblIndent2",
        "IblIndent3",
        "IblIndent4",
        "IblIndent5",
        "IblIndent6",
        "IblIndent7",
      }

  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "IblIndent1", { fg = "#E06C75", nocombine = true }) -- vermelho
        vim.api.nvim_set_hl(0, "IblIndent2", { fg = "#D19A66", nocombine = true }) -- laranja
        vim.api.nvim_set_hl(0, "IblIndent3", { fg = "#E5C07B", nocombine = true }) -- amarelo
        vim.api.nvim_set_hl(0, "IblIndent4", { fg = "#98C379", nocombine = true }) -- verde
        vim.api.nvim_set_hl(0, "IblIndent5", { fg = "#56B6C2", nocombine = true }) -- ciano
        vim.api.nvim_set_hl(0, "IblIndent6", { fg = "#61AFEF", nocombine = true }) -- azul
        vim.api.nvim_set_hl(0, "IblIndent7", { fg = "#C678DD", nocombine = true }) -- violeta
      end)

      -- hook para scope highlight (usa treesitter; se não tiver treesitter, o scope pode não funcionar)
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

      -- configuração do plugin
      ibl.setup({
        indent = {
          char = "│", -- caractere da barra (troca para "▏" se preferir mais "grossa")
          highlight = hl, -- usa os highlights que criámos acima
        },
        scope = {
          enabled = false, -- mostra início/fim de escopo (usa treesitter)
          show_start = true,
          show_end = true,
          highlight = hl,
        },
        whitespace = {
          remove_blankline_trail = false,
        },
      })
    end,
  },
}
