local M = {}

local config_names = {
  "tailwind.config.js",
  "tailwind.config.cjs",
  "tailwind.config.mjs",
  "tailwind.config.ts",
  "tailwind.config.cts",
  "tailwind.config.mts",
}

local function has_dependency(dir)
  local file = io.open(vim.fs.joinpath(dir, "package.json"), "r")
  if not file then
    return false
  end
  local contents = file:read("*a")
  file:close()
  local ok, package = pcall(vim.json.decode, contents)
  if not ok or type(package) ~= "table" then
    return false
  end
  for _, field in ipairs({ "dependencies", "devDependencies", "peerDependencies", "optionalDependencies" }) do
    if type(package[field]) == "table" and package[field].tailwindcss then
      return true
    end
  end
  return false
end

function M.root_dir(bufnr, on_dir)
  local name = vim.api.nvim_buf_get_name(bufnr)
  if name == "" or name:match("^%w+://") then
    return
  end
  local dir = vim.fs.dirname(name)
  while dir do
    for _, config in ipairs(config_names) do
      if vim.uv.fs_stat(vim.fs.joinpath(dir, config)) then
        return on_dir(dir)
      end
    end
    -- v4 needs no tailwind.config.*: let the server discover its CSS entrypoints.
    if has_dependency(dir) then
      return on_dir(dir)
    end
    -- A Git repository or generic PostCSS config alone does not imply Tailwind.
    if vim.uv.fs_stat(vim.fs.joinpath(dir, ".git")) then
      return
    end
    local parent = vim.fs.dirname(dir)
    dir = parent ~= dir and parent or nil
  end
end

return M
