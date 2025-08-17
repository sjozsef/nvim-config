return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "intelephense", "lua_ls", "vtsls", "vue_ls" },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Lua LSP setup
      lspconfig.lua_ls.setup {}

      -- Vue Language Tools configuration
      local vue_language_server_path = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

      local vue_plugin = {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
        configNamespace = 'typescript',
      }

      -- TypeScript/JavaScript LSP setup with Vue plugin
      lspconfig.vtsls.setup {
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = { vue_plugin },
            },
          },
        },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
      }

      -- Vue LSP setup
      lspconfig.vue_ls.setup {}

      -- PHP (Intelephense) setup
      lspconfig.intelephense.setup {
        settings = {
          intelephense = {
            stubs = {
              "bcmath", "bz2", "calendar", "Core", "curl", "date",
              "dba", "dom", "enchant", "fileinfo", "filter", "ftp",
              "gd", "gettext", "hash", "iconv", "imap", "intl",
              "json", "ldap", "libxml", "mbstring", "mcrypt", "mysql",
              "mysqli", "password", "pcntl", "pcre", "PDO", "pdo_mysql",
              "Phar", "readline", "recode", "Reflection", "regex",
              "session", "SimpleXML", "soap", "sockets", "sodium",
              "SPL", "standard", "superglobals", "tokenizer", "xml",
              "xdebug", "xmlreader", "xmlwriter", "yaml", "zip", "zlib"
            },
            files = {
              maxSize = 5000000;
            };
          };
        };
      }
    end
  }
}
