local lspconfig = require("lspconfig")

-- Lista de servidores
local servers = { "lua_ls", "pyright", "tsserver", "gopls" }

-- Configuração básica para todos os servidores
for _, server in ipairs(servers) do
    lspconfig[server].setup {}
end
