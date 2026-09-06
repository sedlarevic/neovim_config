local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.log.set_level("OFF")

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format,
  { desc = "Format the current buffer using the language server" })
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action,
  { desc = "Show available code actions (quick fixes, refactorings, etc.)" })

vim.keymap.set('n', '<leader>lrn', vim.lsp.buf.rename,
  { desc = "Rename the symbol under the cursor" })
vim.keymap.set('n', '<leader>lrf', vim.lsp.buf.references,
  { desc = "Find all usages of this variable, function, or class in the project"
  })

vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition,
  { desc = "Go to definition" })
vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition,
  { desc = "Go to type definition" })
vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation,
  { desc = "Jump to the code that implements an interface or function" })

vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover,
  { desc = "Show hover information (documentation) for symbol under cursor" })
vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help,
  { desc = "Show function arguments and expected types while writing a call" })
vim.keymap.set("n", "<leader>le", function()
  vim.diagnostic.open_float(nil, {
    focus = false,
    scope = "cursor",
  })
end, { desc = "Show diagnostic" })

-- Diagnostic virtual text
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 2,

    severity = {
      min = vim.diagnostic.severity.ERROR,
    },
  },

  signs = true,
  underline = true,
  severity_sort = true,
  update_in_insert = false,

  float = {
    border = "rounded",
    source = true,
  },
})

-- LUA LS
vim.lsp.config("lua_ls", {
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
        autoImportCompletions = true,
      },
    },
  },
})

-- C# (roslyn)
vim.lsp.config("roslyn_ls", {
  capabilities = capabilities,

  settings = {
    ["csharp|completion"] = {
      dotnet_show_completion_items_from_unimported_namespaces = true,
    },

    ["csharp|background_analysis"] = {
      dotnet_analyzer_diagnostics_scope = "openFiles",
      dotnet_compiler_diagnostics_scope = "openFiles",
    },

    ["csharp|formatting"] = {
      dotnet_organize_imports_on_format = true,
    },
  },
})

-- C
vim.lsp.config("clangd", {
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--query-driver=**/cl.exe",
    "--completion-style=detailed",
  },
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("basedpyright")
vim.lsp.enable("roslyn_ls")
vim.lsp.enable("clangd")
