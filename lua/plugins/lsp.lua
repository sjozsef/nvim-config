-- Language Server Configuration
-- 
-- Install required language servers manually:
-- npm install -g @vtsls/language-server @vue/language-server intelephense
-- brew install lua-language-server (or download from GitHub)
--
-- Configured servers:
-- - lua_ls: Lua language server
-- - vtsls: TypeScript/JavaScript/Vue language server 
-- - intelephense: PHP language server
-- - vue_ls: Vue language server (commented out, using vtsls for Vue support)

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Lua LSP setup
      lspconfig.lua_ls.setup {}

      -- TypeScript/JavaScript LSP setup with Vue support
      lspconfig.vtsls.setup {
        cmd = { '/Users/sjozsef/.nvm/versions/node/v22.3.0/bin/vtsls', '--stdio' },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                {
                  name = '@vue/typescript-plugin',
                  location = '/Users/sjozsef/.nvm/versions/node/v22.3.0/lib/node_modules/@vue/language-server',
                  languages = { 'vue' },
                }
              }
            }
          }
        }
      }

      -- Vue Language Server setup
      -- lspconfig.vue_ls.setup {
      --   filetypes = { 'vue' }
      -- }

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
