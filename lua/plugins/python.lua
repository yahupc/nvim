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

local python_venv = find_venv()

local plugins = {
  {
    "nvim-neotest/nvim-nio",
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local path = python_venv or vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
      require("dap-python").setup(path)
    end,
  },
}
return plugins
