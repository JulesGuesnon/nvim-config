local formatter = require("utils.file_exists").file_exists("./biome.json") and "biome" or "prettier"

return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      ["javascript"] = { formatter },
      ["javascriptreact"] = { formatter },
      ["typescript"] = { formatter },
      ["typescriptreact"] = { formatter },
      ["json"] = { formatter },
      ["jsonc"] = { formatter },
      ["css"] = { "prettier" },
      ["vue"] = { "prettier" },
      ["scss"] = { "prettier" },
      ["less"] = { "prettier" },
      ["html"] = { "prettier" },
      ["yaml"] = { "prettier" },
      ["markdown"] = { "prettier" },
      ["markdown.mdx"] = { "prettier" },
      ["graphql"] = { "prettier" },
      ["handlebars"] = { "prettier" },
      ["ocaml"] = { "ocamlformat" },
      ["menhir"] = { "ocamlformat" },
      ["ocamlinterface"] = { "ocamlformat" },
      ["ocamllex"] = { "ocamlformat" },
      ["reason"] = { "ocamlformat" },
      ["dune"] = { "dune" },
    },
    formatters = {
      ocamlformat = {
        args = { "--name", "$FILENAME", "-" },
        -- stdin = false,
      },
      dune = {
        stdin = true,
        command = "dune",
        args = { "format-dune-file" },
      },
    },
  },
}
