local opts = { noremap = true, silent = true }

local term_opts = { silent = true }


vim.g.mapleader = ' '

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- viagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Command --
-- Menu navigation
keymap("c", "<C-j>",  'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } )
keymap("c", "<C-k>",  'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } )

--After searching, pressing escape stops the highlight
keymap("n", "<esc>", ":noh<cr><esc>", { silent = true })

-- Plugins --
-- Telescope
keymap("n", "<Leader>1", ":Telescope sessions [save_current=true]<CR>", term_opts)
keymap("n", "<leader>p", '<cmd>lua require("telescope.builtin").find_files()<cr>', term_opts)
keymap("n", "<leader>r", '<cmd>lua require("telescope.builtin").registers()<cr>', term_opts)
keymap("n", "<leader>g", '<cmd>lua require("telescope.builtin").live_grep()<cr>', term_opts)
keymap("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers()<cr>', term_opts)
keymap("n", "<leader>j", '<cmd>lua require("telescope.builtin").help_tags()<cr>', term_opts)
keymap("n", "<leader>h", '<cmd>lua require("telescope.builtin").git_bcommits()<cr>', term_opts)
keymap("n", "<leader>f", '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>', term_opts)
keymap("n", "<leader>s", '<cmd>lua require("telescope.builtin").spell_suggest()<cr>', term_opts)
keymap("n", "<leader>i", '<cmd>lua require("telescope.builtin").git_status()<cr>', term_opts)
keymap("n", "<leader>ca", '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>', term_opts)
keymap("n", "<leader>cs", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', term_opts)
keymap("n", "<leader>cd", '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>', term_opts)
keymap("n", "<leader>cr", '<cmd>lua require("telescope.builtin").lsp_references()<cr>', term_opts)

keymap("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
keymap("n", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
keymap("v", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

keymap("n", "<leader>ci", "<cmd> lua vim.diagnostic.open_float()<cr>", term_opts)

