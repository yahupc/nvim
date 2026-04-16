local plugins = {
  {
    "nvimtools/none-ls.nvim",
    ft = { "python" },
    opts = function()
      return require("config.null-ls")
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        --        "ruff-lsp",
        "ruff",
        "pyright",
        "phpactor",
        "intelephense",
      },
    },
  },
  {
    "nvim-neotest/neotest-python",
  },
  --  {
  --    "neovim/nvim-lspconfig",
  --   config = function()
  --      require("plugins.configs.lspconfig")
  --      require("custom.configs.lspconfig")
  --    end,
  --  },
}
return plugins
