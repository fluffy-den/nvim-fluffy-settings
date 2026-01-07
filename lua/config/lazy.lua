local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  checker = { enabled = true },
})

-- activate copilot lsp
local ok, copilot = pcall(require, "copilot")
if ok and copilot.setup then
  copilot.setup({})
end

-- load the color scheme (tinted)
---@diagnostic disable-next-line: missing-parameter
require("tinted-colorscheme").setup("base24-ayu-mirage")

-- light grey comments (including treesitter)
vim.api.nvim_set_hl(0, "Comment", { fg = "#888888", bg = "NONE" })
vim.api.nvim_set_hl(0, "@comment", { fg = "#888888", bg = "NONE" })

-- clear all backgrounds
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })

-- lualine setup
require("lualine").setup({ options = { theme = "auto" } })

-- Configure options before loading plugins
-- set clipboard to use system clipboard
vim.opt.clipboard = "unnamedplus"

-- set file line number to be absolute
vim.opt.relativenumber = false
vim.opt.number = true

-- soft wrap lines
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↪ "
