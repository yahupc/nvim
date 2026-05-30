return {
  "HakonHarnes/img-clip.nvim",
  opts = {
    default = {
      dir_path = function()
        local utils = require("config.utils")
        return utils.get_attachment_dir(vim.fn.expand("%:p"))
      end,
      file_name = "Pasted image %Y%m%d%H%M%S",
      use_absolute_path = false,
      prompt_for_file_name = false,
      drag_and_drop = {
        enabled = true,
      },
    },
    filetypes = {
      markdown = {
        template = "![[$FILE_NAME]]",
      },
    },
  },
  keys = {
    { "<leader>pi", "<cmd>PasteImage<cr>", desc = "Paste image" },
  },
}
