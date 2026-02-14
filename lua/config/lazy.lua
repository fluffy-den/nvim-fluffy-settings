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

    -- Add base24 support
    {
      "tinted-theming/tinted-vim",
      lazy = false,
      priority = 1000,
    },
  },
  checker = { enabled = true },
})

-- activate copilot lsp
local ok, copilot = pcall(require, "copilot")
if ok and copilot.setup then
  copilot.setup({})
end

-- prefer the newer 'tinted-schemes' on Neovim 0.12+
vim.opt.termguicolors = true

-- Apply base24-ayu-mirage colorscheme
vim.cmd("colorscheme base24-ayu-mirage")

-- light grey comments (including treesitter)
vim.api.nvim_set_hl(0, "Comment", { fg = "#888888", bg = "NONE" })
vim.api.nvim_set_hl(0, "@comment", { fg = "#888888", bg = "NONE" })

-- transparent background for various UI elements
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
vim.api.nvim_set_hl(0, "SpecialKey", { bg = "NONE" })
vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })

-- Popups et fenêtres flottantes
vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })

-- Telescope (si tu l'utilises)
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE" })

-- Neo-tree / NvimTree (si tu les utilises)
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })

-- light grey comments (including treesitter)
vim.api.nvim_set_hl(0, "Comment", { fg = "#888888", bg = "NONE" })
vim.api.nvim_set_hl(0, "@comment", { fg = "#888888", bg = "NONE" })
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
