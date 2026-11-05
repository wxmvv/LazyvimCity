-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local map = vim.keymap.set

-- 打开/隐藏项目终端（兼容 Ctrl+/ 的传统终端编码）
-- local function toggle_terminal()
--   Snacks.terminal.focus(nil, { cwd = LazyVim.root() })
-- end
--
-- for _, key in ipairs({ "<C-/>", "<C-_>", "<C-`>" }) do
--   map({ "n", "i", "t" }, key, toggle_terminal, { desc = "Terminal (Root Dir)" })
-- end

-- 复制相对路径
map("n", "<leader>yp", function()
  vim.fn.setreg("+", vim.fn.expand("%:."))
  vim.notify("已复制相对路径")
end, { desc = "Copy relative path" })

-- 复制绝对路径
map("n", "<leader>yP", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
  vim.notify("已复制绝对路径")
end, { desc = "Copy absolute path" })

-- 复制路径+行号
map("n", "<leader>yl", function()
  vim.fn.setreg("+", vim.fn.expand("%:p") .. ":" .. vim.fn.line("."))
  vim.notify("已复制路径+行号")
end, { desc = "Copy path with line number" })

vim.keymap.del("n", "<C-w><C-d>")
vim.keymap.set("n", "<C-w>D", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })
