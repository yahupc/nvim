return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      intelephense = {
        cmd = { "./vendor/bin/sail", "exec", "npm", "run", "--silent", "intelephense" }, -- Ejecuta Intelephense dentro de Docker
        settings = {
          intelephense = {
            files = {
              maxSize = 5000000, -- Soporta archivos grandes
              associations = { "*.php", "*.module", "*.inc", "*.install" },
            },
          },
        },
      },
    },
  },
}
