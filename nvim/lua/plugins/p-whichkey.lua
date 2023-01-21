return {
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")
      -- Modes
      --   normal_mode = "n",
      --   insert_mode = "i",
      --   visual_mode = "v",
      --   visual_block_mode = "x",
      --   term_mode = "t",
      --   command_mode = "c",

      --
      -- Telescope Key Mappings
      --
      local telescope = require('telescope.builtin')
      wk.register({
        t = {
          name = "Telescope",
          f = { telescope.find_files, "Find File" },
          g = { telescope.live_grep,  "Live Grep" },
          b = { telescope.buffers,    "Buffer"    },
          h = { telescope.help_tags,  "Help Tags" },
        },
      },{
        -- options
        mode = "n",
        prefix = "<leader>",
        silent = true,
        noremap = true,
      })
      --
      -- Defaults Key Mappings for NORMAL Mode
      --
      wk.register({
        ["<leader><space>"] = { "<CMD>nohlsearch<CR>", "Clear Search HL" },
        ["<C-n>"] = { "<CMD>NvimTreeFindFileToggle<CR>", "Toggle Nvim-Tree" },
        -- Better window navigation
        ["<C-h>"] = { "<C-w>h", "Move to Left Window" },
        ["<C-j>"] = { "<C-w>j", "Move to Down Window" },
        ["<C-k>"] = { "<C-w>k", "Move to Up Window" },
        ["<C-l>"] = { "<C-w>l", "Move to Right Window" },
        -- Resize with arrows key
        ["<C-Up>"]    = { "<CMD>resize -2<CR>", "Horizontal resize -2" },
        ["<C-Down>"]  = { "<CMD>resize +2<CR>", "Horizontal resize +2" },
        ["<C-Left>"]  = { "<CMD>vertical resize -2<CR>", "vertical resize -2" },
        ["<C-Right>"]  = { "<CMD>vertical resize +2<CR>", "vertical resize +2" },
        -- viagate buffers
        ["<S-l>"]    = { "<CMD>bnext<CR>", "Move to Next Buffer" },
        ["<S-h>"]    = { "<CMD>bprevious<CR>", "Move to Previous Buffer" },
        -- Move text up and down
        ["<A-j>"]   = { "<ESC>:m .+1<CR>==gi", "Move Text Down" },
        ["<A-k>"]   = { "<ESC>:m .-2<CR>==gi", "Move Text Up" },
        -- Formating
        ["<leader>fm"]   = { "<CMD>lua vim.lsp.buf.format()<CR>", "Formatting" },
      },{
        mode = "n",
        silent = true,
        noremap = true,
      })
      --
      -- Defaults Key Mappings for INSERT Mode
      --
      wk.register({
        ["jk"] = { "<ESC>", "ESC" },
      },{
        mode = "i",
        silent = true,
        noremap = true,
      })
      --
      -- Defaults Key Mappings for Virtual Mode
      --
      wk.register({
        -- Indent
        ["<"] = { "<gv", "Left Indent" },
        [">"] = { ">gv", "Right Indent" },
        -- Move Text Up and Down
        ["<A-j>"] = { ":m .+1<CR>==", "Move Text Down" },
        ["<A-k>"] = { ":m .-2<CR>==", "Move Text Up" },
      },{
        mode = "v",
        silent = true,
        noremap = true,
      })
      --
      -- Defaults Key Mappings for Virtual Block Mode
      --
      wk.register({
        ["J"] = { ":move '>+1<CR>gv-gv", "Move Text Down" },
        ["K"] = { ":move '<-2<CR>gv-gv", "Move Text Up" },
        --["<A-j>"] = { ":move '>+1<CR>gv-gv", "Move Text Down" },
        --["<A-k>"] = { ":move '<-2<CR>gv-gv", "Move Text Up" },
      },{
        mode = "x",
        silent = true,
        noremap = true,
      })
      --
      -- Defaults Key Mappings for Terminal Mode
      --
      wk.register({
        ["<C-h>"] = { "<C-\\><C-N><C-w>h", "Move Left window" },
        ["<C-j>"] = { "<C-\\><C-N><C-w>j", "Move Down window" },
        ["<C-k>"] = { "<C-\\><C-N><C-w>k", "Move Up window" },
        ["<C-l>"] = { "<C-\\><C-N><C-w>l", "Move Right window" },
      },{
        mode = "t",
        silent = true,
        noremap = true,
      })
      --
      -- Defaults Key Mappings for Command Mode
      --
      wk.register({
        ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', "Menu navigate to Next/Down" },
        ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', "Menu navigate to Previous/Up" },
      },{
        mode = "c",
        silent = true,
        noremap = true,
      })
    end,
  },
}
