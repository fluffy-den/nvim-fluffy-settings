return {
  {
    "jbyuki/venn.nvim",
    cmd = "VBox",
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>v", ":lua Toggle_venn()<CR>", { noremap = true, silent = true })
    end,
  },
  {
    "3rd/diagram.nvim",
    dependencies = { "3rd/image.nvim" },
    opts = {
      renderer_options = {
        mermaid = { theme = "dark", background = "transparent" },
        plantuml = { theme = "dark" },
        d2 = { theme = "dark" },
      },
    },
  },
}
