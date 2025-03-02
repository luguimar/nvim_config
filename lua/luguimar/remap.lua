vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tl", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>th", ":tabprevious<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true }) -- Ir para definição
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true }) -- Referências
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true }) -- Mostrar documentação
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true }) -- Renomear variável
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true }) -- Ações do código

vim.keymap.set("n", "<F5>", function() require("dap").continue() end)      -- Iniciar/Continuar
vim.keymap.set("n", "<F10>", function() require("dap").step_over() end)   -- Step Over
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end)   -- Step Into
vim.keymap.set("n", "<F12>", function() require("dap").step_out() end)    -- Step Out
vim.keymap.set("n", "<Leader>b", function() require("dap").toggle_breakpoint() end) -- Toggle Breakpoint
vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.open() end) -- Abrir REPL
vim.keymap.set("n", "<F4>", function() require("dap").terminate() end, {silent = true })
vim.keymap.set("n", "<Leader>du", function() require("dapui").toggle() end, {silent = true }) -- Alternar UI
vim.keymap.set("n", "<Leader>dc", function() require("dapui").close() end, {silent = true }) -- Fechar UI
