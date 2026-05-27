-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- use system clipboard only on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight and sync yank to system clipboard",
  callback = function()
    if vim.v.event.operator == "y" then
      vim.fn.setreg("+", vim.v.event.regcontents, vim.v.event.regtype)
    end
  end,
})

-- markdown checkbox
-- done by lazyvim dial
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "markdown", "markdown.mdx" },
--   callback = function(args)
--     local toggle = function()
--       local line = vim.api.nvim_get_current_line()
--       if line:find("%[ %]") then
--         vim.api.nvim_set_current_line((line:gsub("%[ %]", "[x]", 1)))
--       elseif line:find("%[x%]") then
--         vim.api.nvim_set_current_line((line:gsub("%[x%]", "[ ]", 1)))
--       end
--     end
--     vim.keymap.set("n", "<C-a>", toggle, { buffer = args.buf, desc = "Toggle checkbox" })
--     vim.keymap.set("n", "<C-x>", toggle, { buffer = args.buf, desc = "Toggle checkbox" })
--   end,
-- })
--
