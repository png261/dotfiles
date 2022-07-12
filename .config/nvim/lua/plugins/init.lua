-- vim.cmd [[packadd packer.nvim]]
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)

  -- Load lua path
  local lua_path = function(name)
    return string.format("require'plugins.%s'", name)
  end

	use { "wbthomason/packer.nvim"}  
	use { "nvim-lua/plenary.nvim"} 
	use { "kyazdani42/nvim-web-devicons"} 
	use { 
        "kyazdani42/nvim-tree.lua",
        config = lua_path"nvim-tree"
    } 
	use "lewis6991/impatient.nvim" 

	-- LSP
	use { "neovim/nvim-lspconfig"}
	use { "williamboman/nvim-lsp-installer"} 
    use "jose-elias-alvarez/null-ls.nvim"

    use { 'ms-jpq/coq_nvim', 
        run = 'python3 -m coq deps',
        config = lua_path"coq" 
    }
    use 'ms-jpq/coq.artifacts'
    use 'ms-jpq/coq.thirdparty'

	-- Formatter
	use { 'mhartington/formatter.nvim', config = lua_path"formatter" }

	-- Comment
	-- use { 'numToStr/Comment.nvim', config = lua_path"comment"}
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-repeat'

	-- Colorschemes
	use "sainnhe/gruvbox-material"

	-- Telescope
	use { 'nvim-telescope/telescope.nvim', config = lua_path"telescope" }

	-- Treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = lua_path"treesitter" }
	use { 'p00f/nvim-ts-rainbow', config = lua_path"nvim-ts-rainbow" }

end)
