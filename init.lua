require("config.lazy")
require("config.noice")
require("luguimar")
vim.cmd [[colorscheme moonfly]]
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "none", bg = "none" })
vim.keymap.set("n", "<Leader>nh", ":Noice history<CR>", { noremap = true, silent = true }) -- Abrir histórico de mensagens
vim.keymap.set("n", "<Leader>nl", ":Noice last<CR>", { noremap = true, silent = true }) -- Última mensagem
vim.keymap.set("n", "<Leader>nt", ":Noice telescope<CR>", { noremap = true, silent = true }) -- Abrir mensagens no Telescope
vim.keymap.set("n", "<Leader>nd", ":Noice dismiss<CR>", { noremap = true, silent = true }) -- Fechar mensagens
vim.keymap.set("n", "<Leader>nc", ":Noice clear<CR>", { noremap = true, silent = true }) -- Limpar todas as mensagens
vim.keymap.set("n", "<Leader>cc", ":CopilotChat<CR>", { noremap = true, silent = true }) -- Abre o chat
vim.keymap.set("v", "<Leader>cd", ":CopilotChatDocs<CR>", { noremap = true, silent = true }) -- Explica código selecionado
vim.keymap.set("n", "<Leader>cf", ":CopilotChatFix<CR>", { noremap = true, silent = true }) -- Sugere correções

