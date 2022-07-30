local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
    use("nvim-telescope/telescope-file-browser.nvim")
    use("EdenEast/nightfox.nvim")
    use("neovim/nvim-lspconfig")
    use({'echasnovski/mini.nvim', branch = 'stable'})
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})

    -- Snippets
    use("L3MON4D3/LuaSnip")

    -- Completion
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/nvim-cmp")

    if packer_bootstrap then
        require('packer').sync()
    end
end)
