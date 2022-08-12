local config = require('lspconfig')
local keymap = require('keymap')

keymap.nnoremap('[d', vim.diagnostic.goto_prev, {silent=true})
keymap.nnoremap(']d', vim.diagnostic.goto_next, {silent=true})
keymap.nnoremap('<leader>d', vim.diagnostic.open_float, {silent=true})

local organize_imports = function (timeout_ms)
    local params = vim.lsp.util.make_range_params(nil, "utf-16")
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
            if r.edit then
                vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
            else
                vim.lsp.buf.execute_command(r.command)
            end
        end
    end
end

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

    vim.api.nvim_create_autocmd({"BufWritePre"}, {
        buffer = bufnr,
        callback = function ()
            organize_imports(1001)
            vim.lsp.buf.formatting_sync(nil, 1000)
        end,
    })
end

config["solargraph"].setup({
    on_attach = on_attach,
})

config["gopls"].setup({
    on_attach = on_attach,
})
