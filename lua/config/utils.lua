local M = {}

function M.find_vault_root(file_path)
  local dir = vim.fn.fnamemodify(file_path, ":h")
  while dir ~= "/" do
    if vim.fn.isdirectory(dir .. "/.obsidian") == 1 then
      return dir
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end
  return nil
end

function M.get_attachment_dir(file_path)
  local vault = M.find_vault_root(file_path)
  if vault then
    return vault .. "/Assets/Attachments"
  end
  return "~/Dropbox/Obsidian/Assets/Attachments" -- fallback
end

return M
