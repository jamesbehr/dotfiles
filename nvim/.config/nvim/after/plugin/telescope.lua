local nnoremap = require("keymap").nnoremap
local utils = require('telescope.utils')
local builtin = require("telescope.builtin")
local extensions = require("telescope").extensions

require("telescope").setup({
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
        file_browser = {
            hijack_netrw = true,
            hidden = true, -- show hidden files by default
        },
    }
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

nnoremap("<leader>t", "<cmd>Telescope<cr>")

nnoremap("<leader><leader>", function()
    local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
    if ret == 0 then
        builtin.git_files({ show_untracked = true })
    else
        builtin.find_files()
    end
end)

nnoremap("<leader><return>", builtin.buffers)

nnoremap("<leader>f", function()
    extensions.file_browser.file_browser({ path = "%:p:h" })
end)

nnoremap("<leader>rg", builtin.live_grep)
