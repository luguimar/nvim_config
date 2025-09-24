return {

  -- (1) nvim-lspconfig (continua a fornecer os configs)
  { "neovim/nvim-lspconfig" },

  -- (2) Mason + bridges (LSP / none-ls / DAP)
  {
    "williamboman/mason.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
      "williamboman/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      local mason           = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_null_ls   = require("mason-null-ls")
      local mason_dap       = require("mason-nvim-dap")

      mason.setup()

      ----------------------------------------------------------------
      -- (A) LSPs (Neovim 0.11+: vim.lsp.config / vim.lsp.enable)
      ----------------------------------------------------------------
      local servers = { "clangd", "lua_ls", "jdtls", "marksman" }

      mason_lspconfig.setup({
        ensure_installed = servers,     -- instala via Mason
        -- automatic_enable = true,     -- (default) ativa com vim.lsp.enable()
      })

      -- capacidades globais (ex.: nvim-cmp)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })  -- aplica a todos os LSPs

      -- ativa estes servidores (podes deixar só isto; mason-lspconfig tb ativa por defeito)
      vim.lsp.enable(servers)

      ----------------------------------------------------------------
      -- (B) Linters/Formatters (none-ls via mason-null-ls)
      ----------------------------------------------------------------
      mason_null_ls.setup({
        ensure_installed = { "clang_format", "stylua", "prettier" },
        automatic_installation = true,
      })

      ----------------------------------------------------------------
      -- (C) DAPs
      ----------------------------------------------------------------
      mason_dap.setup({
        ensure_installed = {
          "codelldb", "debugpy",
          "java-debug-adapter", "java-test",
          "js-debug-adapter",
        },
        automatic_installation = true,
      })
    end,
  },

  -- (3) none-ls (fork do null-ls) — o require continua a ser "null-ls"
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.prettier,
        },
      })
    end,
  },

  -- (4) nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- (5) DAP UI
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dapui = require("dapui")
      local dap = require("dap")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end,
  },
}

