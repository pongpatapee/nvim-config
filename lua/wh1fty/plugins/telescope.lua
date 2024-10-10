return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local builtin = require('telescope.builtin')
    -- File
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>,', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- General search
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "[S]earch Help Tags"})
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    -- vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, { desc = '[S]earch [S]ymbol' })
    vim.keymap.set('n', '<leader>sS', builtin.builtin, { desc = '[S]earch [S]elect Telescope' }) -- Search for any possible telescope search
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>sR', builtin.oldfiles, { desc = '[S]earch Recent Files' })
    vim.keymap.set('n', '<leader>sq', builtin.quickfix, { desc = '[S]earch [Q]uickfix List' })

   -- git
    vim.keymap.set('n' , "<leader>gc", builtin.git_commits, {desc = "[G]it [C]ommits"})
    vim.keymap.set('n' , "<leader>gs", builtin.git_status, {desc = "[G]it [S]tatus"})

  end
}

