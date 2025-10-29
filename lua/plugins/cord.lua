return {
  "vyfor/cord.nvim",
  config = function()
    require("cord").setup({
      -- Show line number in Discord
      show_line_number = true,
      -- The main icon to show in Discord
      main_image = "neovim",
      -- Custom text below the image
      main_text = "Neovim",
      -- Update interval in seconds
      debounce_timeout = 10,
    })
  end,
}
