-- -- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 0
-- vim.g.loaded_netrwPlugin = 0
-- -- vim.builtin.nvimtree.setup.disable_netrw = false
-- -- vim.builtin.nvimtree.setup.hijack_netrw = false
--
-- -- set termguicolors to enable highlight groups
-- vim.opt.termguicolors = true
--
-- -- empty setup using defaults
-- -- require("nvim-tree").setup()
-- vim.keymap.set('n', '<leader>mc', ':NvimTreeToggle<CR>')
--
-- -- OR setup with some options
-- require("nvim-tree").setup({
--   disable_netrw = false,
--   hijack_netrw = false,
--   sort_by = "case_sensitive",
--   view = {
--     width = 30,
--   },
--   renderer = {
--     group_empty = true,
--   },
--   filters = {
--     dotfiles = true,
--   },
-- })
