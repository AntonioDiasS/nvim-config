  -- This file combines LSP (Language Server Protocol) and Autocompletion configurations.
-- LSP provides code intelligence (go to definition, diagnostics, etc.).
-- Autocompletion provides suggestions as you type.

return {
  -- ===================================================================
  -- I. LSP CONFIGURATION
  -- Manages language servers, providing features like diagnostics and code navigation.
  -- ===================================================================
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install and manage LSPs.
      { "williamboman/mason.nvim", opts = {} },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Shows LSP progress in the statusline.
      { "j-hui/fidget.nvim", opts = {} },

      -- Crucial dependency for nvim-cmp to understand LSP capabilities.
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- This function is executed when an LSP server attaches to a buffer.
      -- It sets up keymaps for LSP-related actions.
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc) vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc }) end

          -- Keymaps for LSP navigation and actions.
          map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
          map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
          map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
          map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
          map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
          map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
          map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
          map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
          map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        end,
      })

      -- Get capabilities from nvim-cmp and extend them for LSP.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      -- List of language servers to be installed automatically by Mason.
      -- Add any new language servers you need here.
      local servers = {
        lua_ls = {
          settings = { Lua = { completion = { callSnippet = "Replace" } } },
        },
        -- Example for other servers:
        clangd = {},
        -- tsserver = {},
        -- pyright = {},
        -- rust_analyzer = {},
      }

      -- Ensure the servers and additional tools are installed.
      local ensure_installed = vim.tbl_keys(servers)
      vim.list_extend(ensure_installed, { "stylua" }) -- Add the Lua formatter
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      -- Setup mason-lspconfig to automatically configure servers.
      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- Combine default capabilities with server-specific ones.
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end,
  },

  -- ===================================================================
  -- II. AUTOCOMPLETION CONFIGURATION
  -- Manages the autocompletion engine (nvim-cmp) and its sources.
  -- ===================================================================
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Snippet engine
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
      -- Source for snippets
      "saadparwaiz1/cmp_luasnip",
      -- Source for file paths
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      luasnip.config.setup({})

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          -- Show completion menu even when no item is selected.
          completeopt = "menu,menuone,noinsert",
        },
        -- Keymappings for the completion menu.
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(), -- Select the next item
          ["<C-p>"] = cmp.mapping.select_prev_item(), -- Select the previous item
          ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Scroll documentation back
          ["<C-f>"] = cmp.mapping.scroll_docs(4), -- Scroll documentation forward
          ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
          ["<C-Space>"] = cmp.mapping.complete({}), -- Manually trigger completion
          -- Navigate through snippets
          ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { "i", "s" }),
          ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),
        }),
        -- Sources for autocompletion, in order of priority.
        sources = {
          { name = "nvim_lsp" }, -- Source from the Language Server
          { name = "luasnip" },  -- Source from the snippet engine
          { name = "path" },     -- Source for file system paths
        },
      })
    end,
  },
}
