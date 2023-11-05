return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "%.git/" },
      },
    },
    keys = {
      {
        "<leader><Space>",
        function()
          require("telescope.builtin").find_files({
            hidden = true,
          })
        end,
        desc = "Find Files (cwd)",
      },
    },
  },
}
