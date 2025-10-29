-- ~/.config/nvim/lua/plugins/todo.lua
return {
  {
    "folke/todo-comments.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- Add "submodules" to the default exclude list
      search = {
        exclude = { ".git", "node_modules", ".hg", "CVS", "submodules" },
        pattern = [[\b(KEYWORDS):]],
      },
    },
  },
}
