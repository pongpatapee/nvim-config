return {

  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    function _G.get_oil_winbar()
      local dir = require("oil").get_current_dir()
      if dir then
        return vim.fn.fnamemodify(dir, ":~")
      else
        -- If there is no current dir (e.g. over ssh), just show buf name
        return vim.api.nvim_buf_get_name(0)
      end
    end

    require("oil").setup({
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-k>"] = false,
        ["<C-j>"] = false,
        ["<M-h>"] = "actions.select_split",
      },

      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },

      win_options = {
        winbar = "%{v:lua.get_oil_winbar()}",
      },
    })

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
