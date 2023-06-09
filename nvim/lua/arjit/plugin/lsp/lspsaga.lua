local lspsaga_status, lspsaga = pcall(require, "lspsaga")
if not lspsaga_status then
  return
end

-- lspsaga.init_lsp_saga({
--   move_in_saga = {
--     prev = "<A-k>",
--     next = "<A-j>"
--   },
--   finder_action_keys = {
--     open = "<CR>"
--   },
--   definition_action_keys = {
--     edit = "<CR>"
--   }
-- })
local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

lspsaga.setup({
  -- keybinds for navigation in lspsaga window
  scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
  -- use enter to open file with definition preview
  definition = {
    edit = "<CR>",
  },
  outline = {
    win_position = "right",
    win_with = "",
    win_width = 30,
    show_detail = true,
    auto_preview = true,
    auto_refresh = true,
    auto_close = true,
    custom_sort = nil,
    keys = {
      jump = "o",
      expand_collapse = "u",
      quit = "q",
    },
  },
  symbol_in_winbar = {
    enable = true,
    separator = " ",
    ignore_patterns={},
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
  ui = {
    -- Border type can be single, double, rounded, solid, shadow.
    border = border "CmpBorder",
    winblend = 0,
    expand = "",
    collapse = "",
    code_action = "💡",
    incoming = " ",
    outgoing = " ",
    hover = ' ',
    kind = {},
  },
  diagnostic = {
    on_insert = false,
    on_insert_follow = true,
    insert_winblend = 0,
    show_virt_line = true,
    show_code_action = true,
    show_source = true,
    jump_num_shortcut = true,
    --1 is max
    max_width = 0.7,
    custom_fix = nil,
    custom_msg = nil,
    text_hl_follow = true,
    border_follow = true,
    keys = {
      exec_action = "o",
      quit = "q",
      go_action = "g"
    },
  },
  lightbulb = {
    enable = false,
    enable_in_insert = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true,
  },
})
