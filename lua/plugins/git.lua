-- Open a diffview command, or close the current diffview tab if one is already open
local function diffview_toggle(cmd)
  return function()
    if require("diffview.lib").get_current_view() then
      vim.cmd("DiffviewClose")
    else
      vim.cmd(cmd)
    end
  end
end

-- Base branch of the repo (origin/HEAD), falling back to "main"
local function default_branch()
  local ref = vim.fn.systemlist({ "git", "symbolic-ref", "--short", "refs/remotes/origin/HEAD" })[1]
  if vim.v.shell_error ~= 0 or not ref or ref == "" then
    return "main"
  end
  return ref
end

return {
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewFileHistory",
    },
    keys = {
      { "<leader>gvv", diffview_toggle("DiffviewOpen"), desc = "Diffview Working Tree (toggle)" },
      { "<leader>gvf", diffview_toggle("DiffviewFileHistory %"), desc = "Diffview File History" },
      { "<leader>gvh", diffview_toggle("DiffviewFileHistory"), desc = "Diffview Repo History" },
      {
        "<leader>gvb",
        function()
          diffview_toggle("DiffviewOpen " .. default_branch() .. "...HEAD")()
        end,
        desc = "Diffview Branch vs Base (PR review)",
      },
      { "<leader>gvh", ":DiffviewFileHistory<cr>", mode = "x", desc = "Diffview Selection History" },
      { "<leader>gvq", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
    },
    opts = function()
      local close = { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" } }
      return {
        enhanced_diff_hl = true, -- better highlighting of changed words within lines
        view = {
          merge_tool = {
            layout = "diff3_mixed", -- ours | theirs on top, result below
            disable_diagnostics = true,
          },
        },
        file_panel = {
          win_config = { width = 35 },
        },
        keymaps = {
          view = { close },
          file_panel = { close },
          file_history_panel = { close },
        },
      }
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>gv", group = "diffview" },
      },
    },
  },
  {
    "tpope/vim-fugitive",
  },
}
