local lspconfig = require("lspconfig")

local sail_container = get_sail_container()
if sail_container == "" then
  print("⚠️ No se encontró un contenedor de Sail en ejecución")
else
  print("✅ Laravel Sail detectado: " .. sail_container)
end

lspconfig.intelephense.setup({
  cmd = { "docker", "exec", "-i", sail_container, "php", "/root/.composer/vendor/bin/intelephense", "--stdio" },
  filetypes = { "php" },
  root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
  settings = {
    intelephense = {
      stubs = {
        "bcmath",
        "bz2",
        "Core",
        "curl",
        "date",
        "dom",
        "fileinfo",
        "filter",
        "gd",
        "gettext",
        "hash",
        "iconv",
        "intl",
        "json",
        "libxml",
        "mbstring",
        "mcrypt",
        "mysql",
        "mysqli",
        "password",
        "pcntl",
        "pcre",
        "PDO",
        "pdo_mysql",
        "Phar",
        "posix",
        "readline",
        "Reflection",
        "session",
        "SimpleXML",
        "soap",
        "sockets",
        "sodium",
        "SPL",
        "standard",
        "tokenizer",
        "xml",
        "xmlreader",
        "xmlwriter",
        "zip",
        "zlib",
      },
      environment = {
        phpVersion = "8.4.3",
      },
    },
  },
})
