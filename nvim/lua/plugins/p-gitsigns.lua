return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local wk = require("which-key")
      require('gitsigns').setup {
        signs                        = {
          add          = { text = '+' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
          interval = 1000,
          follow_files = true
        },
        attach_to_untracked          = true,
        current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil, -- Use default
        max_file_length              = 40000, -- Disable if file is longer than this (in lines)
        preview_config               = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
        yadm                         = {
          enable = false
        },
        on_attach                    = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true })

          -- Actions
          wk.register({
            h = {
              name = "GitSigns",
              s = { "<CMD>Gitsigns stage_hunk<CR>", "Stage Hunk" },
              r = { "<CMD>Gitsigns reset_hunk<CR>", "Reset Hunk" },
              S = { gs.stage_buffer, "Stage Buffer" },
              u = { gs.undo_stage_hunk, "Undo Stage Hunk" },
              R = { gs.reset_buffer, "Reset Buffer" },
              p = { gs.preview_hunk, "Preview Hunk" },
              b = { function() gs.blame_line { full = true } end, "Blame Line" },
              B = { gs.toggle_current_line_blame, "Toggle Current Blame Line" },
              d = { gs.diffthis, "Diff This" },
              D = { function() gs.diffthis('~') end, "Diff This ~" },
              t = { gs.toggle_deleted, "Toggle Delete" },
            },
          }, {
            mode = "n",
            prefix = "<leader>",
            silent = true,
            noremap = true,
          })

          wk.register({
            h = {
              name = "Gitsigns",
              s = { "<CMD>Gitsigns stage_hunk<CR>", "Stage Hunk" },
              r = { "<CMD>Gitsigns reset_hunk<CR>", "Reset Hunk" },
            },
          }, {
            mode = "v",
            prefix = "<leader>",
            silent = true,
            noremap = true,
          })

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
    end
  },
}
