return {
  "3rd/image.nvim",
  opts = {
    backend = "ueberzug",
    integrations = {
      markdown = {
        enabled = true,
        download_remote_images = false,
        filetypes = { "markdown" },
      },
    },
    max_width = 60,
    max_height = 20,
    max_width_window_percentage = 50,
    max_height_window_percentage = 40,
    window_overlap_clear_enabled = true,
  },
}
