return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- Atualiza automaticamente as linguagens suportadas
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = "all", -- Instala suporte para todas as linguagens
			highlight = { enable = true }, -- Ativa o realce de sintaxe
			indent = { enable = true }, -- Ativa indentação baseada na árvore
		})
	end,
}
