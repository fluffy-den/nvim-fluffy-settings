return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      -- Set up clangd for C/C++
      require('lspconfig').clangd.setup{
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy", 
          "--header-insertion=iwyu",
          "--suggest-missing-includes",
          "--completion-style=detailed",
        },
        init_options = {
          clangdFileStatus = true,
          usePlaceholders = true,
        },
      }
      
      -- LSP keymaps
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local bufnr = args.buf
          
          -- Define keymaps
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = "Goto Definition" })
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover Documentation" })
        end,
      })
    end,
  },

  -- Static Analysis Tools
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          -- C/C++ static analysis - Windows paths use forward slashes in Lua strings
          null_ls.builtins.diagnostics.cppcheck.with({
            extra_args = {
              "--enable=all",
              "--suppress=missingIncludeSystem",
              "--inline-suppr",
            },
          }),
          
          -- Style checking
          null_ls.builtins.diagnostics.cpplint,
          
          -- Security scanning
          null_ls.builtins.diagnostics.flawfinder,
          
          -- Code formatting
          null_ls.builtins.formatting.clang_format,
        },
      })
    end,
  },
}}
