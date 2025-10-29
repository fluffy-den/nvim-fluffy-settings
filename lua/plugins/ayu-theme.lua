--- Ayu Theme with transparent background
return {
  {
    "Shatur/neovim-ayu",
    name = "ayu",
    priority = 1000,
    opts = {
      terminal = true,
      mirage = true,
      overrides = {
        Normal = { bg = "None" },
        NormalFloat = { bg = "None" },
        ColorColumn = { bg = "None" },
        SignColumn = { bg = "None" },
        Folded = { bg = "None" },
        FoldColumn = { bg = "None" },
        CursorLine = { bg = "None" },
        CursorColumn = { bg = "None" },
        VertSplit = { bg = "None" },
      },
    },
    config = function(_, opts)
      require("ayu").setup(opts)
      require("ayu").colorscheme()
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu",
    },
  },
}
