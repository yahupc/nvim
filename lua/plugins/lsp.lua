local function get_sail_container()
  local handle = io.popen("docker ps --format '{{.Names}}' | grep 'sail-' | head -n 1")
  local result = handle:read("*a")
  handle:close()
  return result:gsub("%s+", "")
end

return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}
    opts.servers.intelephense = opts.servers.intelephense or {}

    local sail_container = get_sail_container()
    if sail_container ~= "" then
      opts.servers.intelephense.cmd = {
        "docker", "exec", "-i", sail_container,
        "php", "/root/.composer/vendor/bin/intelephense", "--stdio",
      }
    end

    opts.servers.intelephense.settings = vim.tbl_deep_extend("force", opts.servers.intelephense.settings or {}, {
      intelephense = {
        stubs = {
          "bcmath", "bz2", "Core", "curl", "date", "dom", "fileinfo", "filter",
          "gd", "gettext", "hash", "iconv", "intl", "json", "libxml", "mbstring",
          "mcrypt", "mysql", "mysqli", "password", "pcntl", "pcre", "PDO",
          "pdo_mysql", "Phar", "posix", "readline", "Reflection", "session",
          "SimpleXML", "soap", "sockets", "sodium", "SPL", "standard",
          "tokenizer", "xml", "xmlreader", "xmlwriter", "zip", "zlib",
        },
        environment = {
          phpVersion = "8.4.3",
        },
      },
    })

    return opts
  end,
}
