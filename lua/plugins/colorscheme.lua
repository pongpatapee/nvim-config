return {
  {
    "LazyVim/LazyVim",
    opts = {
      -- pick colorscheme here
      colorscheme = "tokyonight-night",
    },
  },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    "navarasu/onedark.nvim",
    opts = {
      style = "darker",
    },
  },

  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      -- vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "original"
      vim.g.gruvbox_material_transparent_background = 0
    end,
  },

  { "rebelot/kanagawa.nvim" },
  { "EdenEast/nightfox.nvim" },
}
