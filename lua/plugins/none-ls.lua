-- Configuration for none-ls (replacement for deprecated null-ls)
-- Provides formatting and diagnostic capabilities for Python and other languages

return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")

      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        -- Python formatting with black
        null_ls.builtins.formatting.black,

        -- Python diagnostics with mypy
        null_ls.builtins.diagnostics.mypy.with({
          extra_args = function()
            local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
            return { "--python-executable", virtual .. "/bin/python" }
          end,
        }),
      })

      return opts
    end,
  },
}
