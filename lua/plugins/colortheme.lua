return {
  -- Disable LazyVim's colorscheme customizations
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        vim.cmd("colorscheme base24-ayu-mirage")
      end,
    },
  },

  -- Configure lualine to use your colorscheme
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto", -- will auto-detect base24-ayu-mirage
      },
    },
  },
}
