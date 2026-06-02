return {
  {
    "3rd/image.nvim",
    dependencies = {
      {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
      },
    },
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          --only_render_image_at_cursor = false,  -- Si queremos renderizar la imagen en la terminal
          only_render_image_at_cursor = true,
          only_render_image_at_cursor_mode = "popup",
          filetypes = { "markdown", "vimwiki" },
          resolve_image_path = function(file_path, image_path, default_resolver)
            local utils = require("config.utils")
            local vault = utils.find_vault_root(file_path)
            if vault then
              local full = vault .. "/Assets/Attachments/" .. image_path
              if vim.fn.filereadable(full) == 1 then
                return full
              end
            end
            local fallback = vim.fn.expand("~/Dropbox/Obsidian/Assets/Attachments/" .. image_path)
            if vim.fn.filereadable(fallback) == 1 then
              return fallback
            end
            return default_resolver(file_path, image_path)
          end,
        },
      },
      max_width = 100,
      max_height = 12,
      max_width_window_percentage = math.huge,
      max_height_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
    },
  },
}
