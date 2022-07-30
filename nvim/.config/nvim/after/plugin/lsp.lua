local config = require('lspconfig')
local keymap = require('keymap')

keymap.nnoremap('[d', vim.diagnostic.goto_prev, {silent=true})
keymap.nnoremap(']d', vim.diagnostic.goto_next, {silent=true})

local on_attach = function (client, bufnr)
    local nmap = keymap.bind("n", {noremap=true, silent=true, buffer=bufnr})

    nmap("gD", vim.lsp.buf.declaration)
    nmap("gd", vim.lsp.buf.definition)
    nmap("K", vim.lsp.buf.hover)
    nmap("gi", vim.lsp.buf.implementation)
    nmap("<C-k>", vim.lsp.buf.signature_help)
    nmap("<leader>wa", vim.lsp.buf.add_workspace_folder)
    nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder)
    nmap("<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end)
    nmap("<leader>D", vim.lsp.buf.type_definition)
    nmap("<leader>rn", vim.lsp.buf.rename)
    nmap("<leader>ca", vim.lsp.buf.code_action)
    nmap("gr", vim.lsp.buf.references)
    nmap("<leader>f", vim.lsp.buf.formatting)
end

config["solargraph"].setup({
    on_attach = on_attach,
})

config["gopls"].setup({
    on_attach = on_attach,
})
