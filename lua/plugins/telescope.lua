return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader><Space>",
        function() require("telescope.builtin").find_files({
           cwd = vim.fn.getcwd(),
           hidden = true,
        }) end,
        desc = "Find Files (cwd)",
      },
    },
  },
}

