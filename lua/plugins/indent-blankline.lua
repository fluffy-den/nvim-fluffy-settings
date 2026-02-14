return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    opts = function()
      return {
        indent = {
          char = "│",
          tab_char = "│",
        },
        scope = {
          enabled = true,
          show_start = false,
          show_end = false,
        },
        exclude = {
          filetypes = {
            "help",
            "alpha",
            "dashboard",
            "neo-tree",
            "Trouble",
            "trouble",
            "lazy",
            "mason",
            "notify",
            "toggleterm",
            "lazyterm",
          },
        },
      }
    end,
    config = function(_, opts)
      -- Define highlight groups BEFORE setup
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3e4b59", nocombine = true })
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#5c6773", nocombine = true })
      vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "#2d3640", nocombine = true })

      require("ibl").setup(opts)
    end,
  },
}
