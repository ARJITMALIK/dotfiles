local status, telescope = pcall(require, 'telescope')
if not status then
  return 
end

local action, actions = pcall(require, 'telescope.actions')
if not action then
  return
end

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<A-n>"] = actions.cycle_history_next,
        ["<A-p>"] = actions.cycle_history_prev,

        ["<A-j>"] = actions.move_selection_next,
        ["<A-k>"] = actions.move_selection_previous,

        ["jk"] = actions.close,

        ["<CR>"] = actions.select_default,
        ["<A-x>"] = actions.select_horizontal,
        ["<A-v>"] = actions.select_vertical,
        ["<A-t>"] = actions.select_tab,

        ["<A-u>"] = actions.preview_scrolling_up,
        ["<A-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<A-x>"] = actions.select_horizontal,
        ["<A-v>"] = actions.select_vertical,
        ["<A-t>"] = actions.select_tab,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["gm"] = actions.move_to_middle,
        ["G"] = actions.move_to_bottom,

        ["<A-u>"] = actions.preview_scrolling_up,
        ["<A-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    buffers  = {
        previewer = false,
        theme = "dropdown",
    },
    lsp_code_actions = {
        previewer = false,
        theme = "dropdown",
    },
    diagnostics = {
        theme = "dropdown",
    },
    treesitter = {
        theme = "dropdown",
    }
  }
}

telescope.load_extension('fzf')
