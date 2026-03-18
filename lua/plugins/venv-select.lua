return {
  "linux-cultist/venv-selector.nvim",
  opts = {
    options = {
      notify_user_on_venv_activation = true,
      override_notify = false,
      -- log_level = "TRACE", -- enable VenvSelectLog command
    },
    search = {
      miniforge_envs = {
        command = "$FD 'bin/python$' ~/miniforge3/envs --no-ignore-vcs --full-path --color never",
        type = "miniforge",
      },
      miniforge_base = {
        command = "$FD '/python$' ~/miniforge3/bin --no-ignore-vcs --full-path --color never",
        type = "miniforge",
      },
    },
  },
}
