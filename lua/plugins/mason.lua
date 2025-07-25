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
        ensure_installed = { "intelephense", "ts_ls", "lua_ls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      
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

      lspconfig.ts_ls.setup{}

      lspconfig.lua_ls.setup{
        init_options = {
          workspace = {
            library = {
              vim.api.nvim_get_runtime_file("", true),
              vim.fn.stdpath("config") .. "/lua",
            },
          },
        }
      }
    end
  }
}
