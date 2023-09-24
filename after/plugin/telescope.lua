local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<C-p>', builtin.git_files)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
-- current word
vim.keymap.set('n', '<leader>fw', builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>rg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches)
vim.keymap.set('n', '<leader>gc', builtin.git_commits)
vim.keymap.set('n', '<leader>gs', builtin.git_status)
vim.keymap.set('n', '<leader>li', builtin.lsp_implementations)
vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions)
vim.keymap.set('n', '<leader>lt', builtin.lsp_type_definitions)
vim.keymap.set('n', '<leader>lr', builtin.lsp_references)
vim.keymap.set('n', '<leader>fg', function()
  builtin.grep_string({ search = vim.fn.input('Grep > ') });
end)

require ('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')
