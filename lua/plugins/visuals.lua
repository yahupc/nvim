return {
  -- Rainbow delimiters para identificar funciones y llaves
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          html = rainbow_delimiters.strategy["local"],
          blade = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
  -- Líneas de indentación con colores para visualizar contextos (como divs en html/blade)
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          use_treesitter = true,
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
          },
          style = {
            "#80acff", -- Azul claro para el chunk actual
            "#c21f30",
          },
        },
        indent = {
          enable = true,
          chars = { "│" },
          style = {
            "#3b4252",
          },
        },
      })
    end,
  },
  -- Renombrado y cerrado automático de etiquetas HTML/Blade
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = true,
    },
  },
}
