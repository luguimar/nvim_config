return {

    -- (1) nvim-lspconfig (não precisa configurar nada aqui)
    {
        "neovim/nvim-lspconfig",
    },

    -- (2) Mason + Mason-LSPConfig + Mason-Null-LS + Mason-DAP
    {
        "williamboman/mason.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason-lspconfig.nvim",
            "jay-babu/mason-null-ls.nvim",
            "williamboman/mason-nvim-dap.nvim",  -- Integração DAP
            "mfussenegger/nvim-dap",
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local mason_null_ls = require("mason-null-ls")
            local mason_dap = require("mason-nvim-dap")
            local lspconfig = require("lspconfig")

            mason.setup()

            ----------------------------------------------------------------
            -- (A) LSPs para C, C++, Lua, Java, JS/TS, Markdown, etc.
            ----------------------------------------------------------------
            mason_lspconfig.setup({
                ensure_installed = {
                    "clangd",   -- C / C++
                    "lua_ls",   -- Lua
                    "jdtls",    -- Java
                    "marksman", -- Markdown
                },
            })

            -- Configura cada LSP após instalar
            mason_lspconfig.setup_handlers({
                function(server)
                    lspconfig[server].setup {}
                end
            })

            ----------------------------------------------------------------
            -- (B) Linters/Formatters para as linguagens acima
            ----------------------------------------------------------------
            mason_null_ls.setup({
                ensure_installed = {
                    "clang_format", -- C/C++
                    "stylua",       -- Lua
                },
                automatic_installation = true,
            })

            ----------------------------------------------------------------
            -- (C) DAPs (Depuradores) para C/C++, Java, JS/TS, etc.
            ----------------------------------------------------------------
            mason_dap.setup({
                ensure_installed = {
                    "codelldb",           -- C/C++ (usando codelldb)
                    "debugpy",            -- Python (caso queira depurar Python também)
                    "java-debug-adapter", -- Java
                    "java-test",          -- Testes em Java
                    "js-debug-adapter",           -- JS/TS
                },
                automatic_installation = true,
            })
        end
    },

    -- (3) Null-LS (para usar linters/formatters dentro do Neovim)
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,    -- Lua
                    null_ls.builtins.formatting.clang_format, -- C/C++
                    null_ls.builtins.formatting.prettier,     -- Web/JS/TS/Markdown
                }
            })
        end
    },

    -- (4) nvim-cmp (autocompletar)
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
                    ["<CR>"] = cmp.mapping.confirm { select = true },
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                })
            })
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio", -- Adicionado
        },
        config = function()
            local dapui = require("dapui")
            local dap = require("dap")
            dapui.setup()  -- Inicializa com as configurações padrão

            -- Abre a UI quando a depuração inicia
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            -- Fecha a UI quando a depuração termina
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
}

