-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Auto-update plugins and Mason tools on startup
local auto_update_group = vim.api.nvim_create_augroup("auto_update", { clear = true })

vim.api.nvim_create_autocmd("VimEnter", {
  group = auto_update_group,
  desc = "Auto-update Lazy plugins and Mason tools on startup",
  callback = function()
    -- Defer to avoid blocking startup
    vim.defer_fn(function()
      -- Update Lazy plugins silently
      require("lazy").update({ show = false })

      -- Update Mason tools after Mason is ready
      local mason_ok, mason_registry = pcall(require, "mason-registry")
      if mason_ok then
        mason_registry.refresh(function()
          -- Update all installed packages
          local installed = mason_registry.get_installed_packages()
          for _, pkg in ipairs(installed) do
            pkg:check_new_version(function(success, result)
              if success then
                pkg:install()
              end
            end)
          end

          -- Install any missing packages that Mason should manage
          -- (triggers mason-lspconfig / mason-tool-installer ensure_installed)
          vim.cmd("silent! MasonToolsInstall")
        end)
      end
    end, 3000) -- 3 second delay to let startup finish
  end,
})
