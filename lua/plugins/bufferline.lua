return {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("bufferline").setup {
                options = {
                    mode = "buffers",
                    numbers = "ordinal",
                    diagnostics = "nvim_lsp",
                    separator_style = "slant",
                    always_show_bufferline = true,
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "📁 File Explorer",
                            highlight = "Directory",
                            text_align = "left"
                        }
                    }
                }
            }

            -- 🔥 Atalhos para navegar entre buffers
            vim.keymap.set("n", "<leader>bc", ":bdelete<CR>", { noremap = true, silent = true })
        end
    }
