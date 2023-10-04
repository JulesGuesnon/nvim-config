return {
    {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader><Space>",
        function() require("telescope.builtin").find_files({
           cwd = require("lazy.core.config").options.cwd,
           hidden = true,
           file_ignore_patterns = {
            ".git"
           }
        }) end,
        desc = "Find Files (cwd)",
      },
    }
  }
}