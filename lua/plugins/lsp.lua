-- Language Server Configuration (nvim 0.11+ API)
--
-- Install required language servers manually:
--   npm install -g @vtsls/language-server @vue/language-server intelephense
--
-- Configured servers:
-- - vtsls: TypeScript/JavaScript/Vue language server
-- - intelephense: PHP language server

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Resolve @vue/language-server via the active npm global root so the
      -- config works on macOS (nvm), Linux, and any other npm install layout.
      local function vue_ts_plugin_path()
        if vim.fn.executable("npm") ~= 1 then return nil end
        local root = vim.trim(vim.fn.system("npm root -g"))
        if vim.v.shell_error ~= 0 then return nil end
        local path = root .. "/@vue/language-server"
        return vim.fn.isdirectory(path) == 1 and path or nil
      end

      local global_plugins = {}
      local vue_path = vue_ts_plugin_path()
      if vue_path then
        table.insert(global_plugins, {
          name = "@vue/typescript-plugin",
          location = vue_path,
          languages = { "vue" },
        })
      end

      vim.lsp.config("vtsls", {
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        settings = {
          vtsls = {
            tsserver = { globalPlugins = global_plugins },
          },
        },
      })

      vim.lsp.config("intelephense", {
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
              "xdebug", "xmlreader", "xmlwriter", "yaml", "zip", "zlib",
            },
            files = { maxSize = 5000000 },
          },
        },
      })

      vim.lsp.enable({ "vtsls", "intelephense" })
    end,
  },
}
