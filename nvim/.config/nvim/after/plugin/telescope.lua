local nnoremap = require("keymap").nnoremap
local utils = require('telescope.utils')
local builtin = require("telescope.builtin")

require("telescope").setup({
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        }
    }
})

require('telescope').load_extension('fzf')

nnoremap("<leader><leader>", function()
    local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
    if ret == 0 then
        builtin.git_files({ show_untracked = true })
    else
        builtin.find_files()
    end
end)

nnoremap("<leader><return>", function()
    builtin.buffers()
end)
