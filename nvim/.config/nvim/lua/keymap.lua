local M = {}

local function bind(op, outer_opts)
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force", outer_opts, opts or {})
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nnoremap = bind("n", {noremap = true})
M.bind = bind

return M
