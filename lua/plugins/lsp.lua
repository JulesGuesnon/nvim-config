local should_biome_start = require("utils.file_exists").file_exists("./biome.json")

-- https://gitlab.com/mrossinek/dotfiles/-/blob/8f5919d685e4c26ce0ea44b93673db9985c335f9/nvim/.config/nvim/after/plugin/nvim-lspconfig.vim
local capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

require("lspconfig").ocamllsp.setup({
  root_dir = require("lspconfig.util").root_pattern("*.opam", "esy.json", ".git", "dune-project", "dune-workspace"),
})

return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
      inlay_hints = { enabled = true },
      ---@type lspconfig.options
      servers = {
        lua_ls = {
          hints = true,
        },
        biome = {
          -- Disabling linting
          autostart = should_biome_start,
        },
        -- vtsls = {
        --   capabilities = capabilities,
        --   root_dir = require("lspconfig.util").root_pattern("package.json"),
        --   cmd = { "bunx", "--bun", "@vtsls/language-server", "--stdio" },
        --   on_attach = function(client)
        --     client.server_capabilities.documentFormattingProvider = false
        --   end,
        --   javascript = {
        --     inlayHints = {
        --       includeInlayEnumMemberValueHints = true,
        --       includeInlayFunctionLikeReturnTypeHints = true,
        --       includeInlayFunctionParameterTypeHints = true,
        --       includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        --       includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        --       includeInlayPropertyDeclarationTypeHints = true,
        --       includeInlayVariableTypeHints = true,
        --     },
        --   },
        --   typescript = {
        --     inlayHints = {
        --       includeInlayEnumMemberValueHints = true,
        --       includeInlayFunctionLikeReturnTypeHints = true,
        --       includeInlayFunctionParameterTypeHints = true,
        --       includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        --       includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        --       includeInlayPropertyDeclarationTypeHints = true,
        --       includeInlayVariableTypeHints = true,
        --     },
        --   },
        -- },
        tsserver = {
          capabilities = capabilities,
          root_dir = require("lspconfig.util").root_pattern("package.json"),
          cmd = { "bunx", "--bun", "typescript-language-server", "--stdio" },
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
          end,
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
        },
      },
    },
  },
}
