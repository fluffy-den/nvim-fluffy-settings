-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set up global options
local opt = vim.opt

-- leaders key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Ignore perl and ruby providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.env.PATH = vim.env.PATH .. ":" .. "/usr/bin"

-- Set PowerShell as the shell on Windows only
if vim.fn.has("win32") == 1 then
  opt.shell = "pwsh"
  opt.shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  opt.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  opt.shellquote = ""
  opt.shellxquote = ""
end
