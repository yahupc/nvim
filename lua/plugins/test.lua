local function find_venv()
  local venv_names = { "venv", "myenv", ".venv" }
  local current_dir = vim.fn.getcwd()

  for _, venv_name in ipairs(venv_names) do
    local venv_path = current_dir .. "/" .. venv_name .. "/bin/python"
    if vim.fn.filereadable(venv_path) == 1 then
      return venv_path
    end
  end

  local parent = vim.fn.fnamemodify(current_dir, ":h")
  if parent ~= current_dir then
    vim.fn.chdir(parent)
    local result = find_venv()
    vim.fn.chdir(current_dir)
    return result
  end

  return nil
end

return {
  {
    "nvim-neotest/neotest",
    optional = true,
  },
  {
    "nvim-neotest/neotest-python",
    dependencies = "nvim-neotest/neotest",
    config = function()
      local venv_python = find_venv()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            python = venv_python,
          }),
        },
      })
    end,
  },
}
