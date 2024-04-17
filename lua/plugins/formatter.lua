local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local formatter = file_exists("./biome.json") and "biome" or "prettier"

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
    },
  },
}
