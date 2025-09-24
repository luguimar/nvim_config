return {
    -- Plugin principal do GitHub Copilot
    {
        'github/copilot.vim',
    },
    -- Plugin para chat interativo com o Copilot
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = { "github/copilot.vim" },
        config = function()
            require("CopilotChat").setup()
        end
    },
    -- Atalhos para o chat interativo
    config = function()
        vim.keymap.set("n", "<Leader>cc", ":CopilotChat<CR>", { noremap = true, silent = true }) -- Abre o chat
        vim.keymap.set("v", "<Leader>cd", ":CopilotChatDocs<CR>", { noremap = true, silent = true }) -- Explica código selecionado
        vim.keymap.set("n", "<Leader>cf", ":CopilotChatFix<CR>", { noremap = true, silent = true }) -- Sugere correções
    end
}

