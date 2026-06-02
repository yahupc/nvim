local plugins = {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
        "phpactor",
        "intelephense",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "python",
        "php",
        "markdown",
        "markdown_inline",
      },
    },
  },
}
return plugins
