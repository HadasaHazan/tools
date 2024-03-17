local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local map = vim.api.nvim_set_keymap


-- Change leader to a comma
map("", ",", "<Nop>", opts)
vim.g.mapleader = ','
vim.g.maplocalleader = " "

-- Modes
--   normal_mode       = "n",
--   insert_mode       = "i",
--   visual_mode       = "v",
--   visual_block_mode = "x",
--   term_mode         = "t",
--   command_mode      = "c",


-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>',    opts)
map('', '<down>', '<nop>',  opts)
map('', '<left>', '<nop>',  opts)
map('', '<right>', '<nop>', opts)

-- Map Esc to kk
-- map('i', 'kk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>', opts)

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>', opts)
vim.opt.pastetoggle = '<F2>'

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K', opts) -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H', opts) -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Split
map('n', '<C-n>', ':vnew <CR>', opts)
map('n', '<C-N>', ':vnew <CR>', opts)
map('n', '<C-m>', ':new <CR>', opts)
map('n', '<C-M>', ':new <CR>', opts)

-- Tabs
map('n', 'tt', ':tabnew <CR>',      opts)
map('n', 'tn', ':tabnext <CR>',     opts)
map('n', 'tp', ':tabprevious <CR>', opts)
map('n', 'tc', ':tabclose <CR>',    opts)


-- Hop easy motion
map('n', '<leader>w', ':HopWord <CR>', opts)
map('n', '<leader>l', ':HopLine <CR>', opts)


-- Tree
-- map('n', '-', ':e . <CR>', opts)

-- Move around splits using Ctrl + {h,j,k,l} + insert mode
map('i', '<C-h>', '<C-c><C-w>h', opts)
map('i', '<C-j>', '<C-c><C-w>j', opts)
map('i', '<C-k>', '<C-c><C-w>k', opts)
map('i', '<C-l>', '<C-c><C-w>l', opts)

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>', opts)

-- Fast saving with <leader> and s
map('n', '<C-s>', ':w<CR>',      opts)
map('i', '<C-s>', '<C-c>:w<CR>', opts)

-- Fast close [also in input mode]
map('n', '<C-c>', ':q<CR>',      opts)
map('i', '<C-c>', '<C-c>:q<CR>', opts)

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>', opts)

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-k>", ":m .-2<CR>==", opts)
map("v", "p", '"_dP', opts)

-- Visual block move text
map("x", "J", ":move '>+1<CR>gv-gv",     opts)
map("x", "K", ":move '<-2<CR>gv-gv",     opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':term<CR>',   { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>', { noremap = true })  -- exit

