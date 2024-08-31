-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Removes current bindnings for hjkl
vim.keymap.set({ 'n', 'v' }, 'h', '<Nop>')
vim.keymap.set({ 'n', 'v' }, 'j', '<Nop>')
vim.keymap.set({ 'n', 'v' }, 'k', '<Nop>')
vim.keymap.set({ 'n', 'v' }, 'l', '<Nop>')

-- re-bind from hjkl into jklö and making it a bit easier for swe keyboards
local opts = { noremap = true }
vim.keymap.set({ 'n', 'v' }, 'j', '<Left>', opts)
vim.keymap.set({ 'n', 'v' }, 'k', '<Down>', opts)
vim.keymap.set({ 'n', 'v' }, 'l', '<Up>', opts)
vim.keymap.set({ 'n', 'v' }, 'ö', '<Right>', opts)

-- re-bind window navigation
vim.keymap.set({ 'n', 'v' }, '<C-w>j', '<C-w><Left>', opts)
vim.keymap.set({ 'n', 'v' }, '<C-w>k', '<C-w><Down>', opts)
vim.keymap.set({ 'n', 'v' }, '<C-w>l', '<C-w><Up>', opts)
vim.keymap.set({ 'n', 'v' }, '<C-w>ö', '<C-w><Right>', opts)

-- Make handling indentation a bit easier
vim.keymap.set('v', '<S-Tab>', '<gv', opts)
vim.keymap.set('v', '<Tab>', '>gv', opts)

vim.keymap.set('v', 'K', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', 'L', ":m '<-2<CR>gv=gv", opts)

-- Better text jumping (will centralize view after jumping)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Same thing but when searching
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Copilot keymaps
vim.keymap.set({ 'n', 'v', 'i' }, '<M-m>', '<Nop>')
vim.keymap.set({ 'n', 'v', 'i' }, '<M-n>', '<Nop>')
-- vim.keymap.set('n', '<M-m>', require('copilot.suggestion').accept, { desc = 'Accept current suggestion' })
-- vim.keymap.set('n', '<M-m>', require('custom.plugins.copilot').accept, { desc = 'Accept current suggestion' })
-- vim.keymap.set('n', '<M-n>', require('copilot.suggestion').next, { desc = 'Show next suggestion' })

-- Fix ^M in current buffer
vim.api.nvim_set_keymap('n', '<leader>dtu', ':%s/\\r//g<CR>', { noremap = true, silent = false, desc = 'Remove ^M from current buffer' })

-- Trouble keys
-- TODO: something ain't right with the commented out bindings

-- vim.keymap.set('n', '<leader>tt', function()
--   require('trouble').toggle 'diagnostics'
-- end, { desc = '[T]oggle [T]rouble' })

vim.keymap.set({ 'n', 'v' }, '<leader>tt', '<cmd>Trouble diagnostics toggle<cr>', { desc = '[T]oggle [T]rouble' })
vim.keymap.set({ 'n', 'v' }, '<leader>tq', '<cmd>Trouble quickfix toggle<cr>', { desc = '[T]oggle trouble [Q]uickfix' })

-- vim.keymap.set('n', '<leader>tq', function()
--   require('trouble').toggle 'quickfix'
-- end, { desc = '[T]oggle Trouble [Q]uickfix' })

-- vim.keymap.set("n", "<leader>tw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = '[T]oggle [W]orkspace diagnostic' })
-- vim.keymap.set("n", "<leader>td", function() require("trouble").toggle("diagnostics") end, { desc = '[T]oggle [D]ocument diagnostic' })

-- Oil keys
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Git keymaps
vim.keymap.set('n', '<leader>gs', ':G<cr>', { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gc', ':G commit<cr>', { desc = '[G]it [C]ommit' })
vim.keymap.set('n', '<leader>gp', ':G push<cr>', { desc = '[G]it [P]ush' })
vim.keymap.set('n', '<leader>gl', ':G pull<cr>', { desc = '[G]it [L]ull' })
vim.keymap.set('n', '<leader>gb', ':G blame<cr>', { desc = '[G]it [B]lame' })
vim.keymap.set('n', '<leader>gd', ':G diff<cr>', { desc = '[G]it [D]iff' })
vim.keymap.set('n', '<leader>gD', ':G diff --cached<cr>', { desc = '[G]it [D]iff [C]ached' })
vim.keymap.set('n', '<leader>gj', ':diffget //3<cr>', { desc = '[G]it [J]ump to [C]onflict' })
vim.keymap.set('n', '<leader>gk', ':diffget //2<cr>', { desc = '[G]it [K]eep [C]onflict' })
vim.keymap.set('n', '<leader>gr', ':G rebase<cr>', { desc = '[G]it [R]ebase' })
vim.keymap.set('n', '<leader>gR', ':G rebase --continue<cr>', { desc = '[G]it [R]ebase [C]ontinue' })
vim.keymap.set('n', '<leader>gq', ':G rebase --quit<cr>', { desc = '[G]it [R]ebase [Q]uit' })
vim.keymap.set('n', '<leader>ga', ':G rebase --abort<cr>', { desc = '[G]it [R]ebase [A]bort' })
vim.keymap.set('n', '<leader>gS', ':G stash<cr>', { desc = '[G]it [S]tash' })
