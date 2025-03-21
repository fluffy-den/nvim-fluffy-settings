return {
  -- Configure ayu theme
  {
    "Shatur/neovim-ayu",
    name = "ayu",
    priority = 1000,
    opts = {
      overrides = {
        -- Make background transparent
        Normal = { bg = "NONE" },
        NormalFloat = { bg = "NONE" },
        SignColumn = { bg = "NONE" },
        NeoTreeNormal = { bg = "NONE" },
        NeoTreeNormalNC = { bg = "NONE" },
        -- Add more UI elements that need transparency here
      },
    },
    config = function(_, opts)
      require("ayu").setup(opts)
      require("ayu").colorscheme()
    end,
  },

  -- Set up LazyVim to use ayu
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu",
    },
  },
}
