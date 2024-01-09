-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader><Space>", "<leader>fF", { desc = "Find Files (cwd)", remap = true })
map("n", "<S-g>", "<S-g>zz", { desc = "Go to bottom of the file", remap = true })
map("n", "}", "}zz", { desc = "Jump paragraph", remap = true })
vim.keymap.set("n", "<TAB>", ">>")
vim.keymap.set("n", "<S-TAB>", "<<")

---------- HARPOON ----------

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function()
  harpoon:list():append()
end, { desc = "Pin to harpoon" })

vim.keymap.set("n", "<leader>hc", function()
  harpoon:list():clear()
end, { desc = "Clear harpoon" })

vim.keymap.set("n", "<leader>hh", function()
  harpoon:list():removeAt(1)
end, { desc = "Clear harpoon 1st file" })

vim.keymap.set("n", "<leader>hj", function()
  harpoon:list():removeAt(2)
end, { desc = "Clear harpoon 2nd file" })
vim.keymap.set("n", "<leader>hk", function()
  harpoon:list():removeAt(3)
end, { desc = "Clear harpoon 3rd file" })

vim.keymap.set("n", "<leader>hl", function()
  harpoon:list():removeAt(4)
end, { desc = "Clear harpoon 4th file" })

vim.keymap.set("n", "<C-e>", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<C-h>", function()
  harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-j>", function()
  harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-k>", function()
  harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-l>", function()
  harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
  harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
  harpoon:list():next()
end)

local telescope_conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers")
    .new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = telescope_conf.file_previewer({}),
      sorter = telescope_conf.generic_sorter({}),
    })
    :find()
end

vim.keymap.set("n", "<C-e>", function()
  toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
