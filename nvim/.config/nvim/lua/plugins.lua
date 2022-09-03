local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    -- Core
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")

    -- LSP
    use("neovim/nvim-lspconfig")

    -- Treesitter
    use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("nvim-treesitter/playground")
    use("nvim-treesitter/nvim-treesitter-context")

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make"})
    use("nvim-telescope/telescope-file-browser.nvim")

    -- Surround
    use("kylechui/nvim-surround")

    -- Comment
    use("numToStr/Comment.nvim")

    -- Snippets
    use("L3MON4D3/LuaSnip")

    -- Completion
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-calc")
    use("f3fora/cmp-spell")
    use("andersevenrud/cmp-tmux")

    -- Presentation
    use("EdenEast/nightfox.nvim")
    use("kyazdani42/nvim-web-devicons")
    use({"nvim-lualine/lualine.nvim", requires = "kyazdani42/nvim-web-devicons"})
    use({"akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons"})
    use("lewis6991/gitsigns.nvim")

    if packer_bootstrap then
        require("packer").sync()
    end
end)
