-- disabling LazyVim plugins I dont' want

return {

  -- Changes f,F,t,T behaviors
  {
    "ggandor/flit.nvim",
    enabled = false,
  },
  {
    "ggandor/leap.nvim",
    enabled = false,
  },
  {
    "folke/flash.nvim",
    enabled = false,
  },

  -- {
  --   "lukas-reineke/headlines.nvim",
  --   enabled = false,
  -- },

  -- Notification bar on the top right
  {
    "rcarriga/nvim-notify",
    enabled = false,
  },

  {
    "folke/noice.nvim",
    enabled = false,
  },
}
