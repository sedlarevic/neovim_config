local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format,
  { desc = "Format the current buffer using the language server" })
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action,
  { desc = "Show available code actions (quick fixes, refactorings, etc.)" })
vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename,
  { desc = "Rename the symbol under the cursor" })
vim.keymap.set('n', '<leader>lrf', vim.lsp.buf.references,
  { desc = "Find all usages of this variable, function, or class in the project"
  })
vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation,
  { desc = "Jump to the code that implements an interface or function" })
vim.keymap.set('n', '<leader>lg', vim.lsp.buf.type_definition,
  { desc = "Jump to the type of a variable or expression (e.g. struct/class)" })
vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help,
  { desc = "Show function arguments and expected types while writing a call" })
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover,
  { desc = "Show hover information (documentation) for symbol under cursor" })

-- LUA LS
vim.lsp.config("lua_ls",{
  capabilities = capabilities,
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      }
    }
  }
})

-- GOLANG
vim.lsp.config("gopls", {
  capabilities = capabilities,
})

-- PYTHON (basedpyright)
vim.lsp.config("basedpyright", {
  capabilities = capabilities,
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "basic",
      },
    },
  },
})

-- C# (roslyn)
local roslyn_path = vim.fn.expand("~/.tools/roslyn/Microsoft.CodeAnalysis.LanguageServer.dll")
vim.lsp.config("roslyn", {
  capabilities = capabilities,
  cmd = {
    "dotnet",
    roslyn_path,
    "--logLevel=Information",
    "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.log.get_filename()),
    "--stdio",
  },
})

-- C
vim.lsp.config("clangd", {
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
  },
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("basedpyright")
vim.lsp.enable("roslyn")
vim.lsp.enable("clangd")


-- AUTOCOMPLETION

