local status_harpoon, mark = pcall(require, "harpoon.mark")
if not status_harpoon then
  return
end

local status_ui, ui = pcall(require, "harpoon.ui")
if not status_ui then
  return
end

local v = vim.keymap

v.set("n", "<leader>a", mark.add_file)
v.set("n", "<leader>h", ui.toggle_quick_menu)

v.set("n", "<A-1>", function() ui.nav_file(1) end)
v.set("n", "<A-2>", function() ui.nav_file(2) end)
v.set("n", "<A-3>", function() ui.nav_file(3) end)
v.set("n", "<A-4>", function() ui.nav_file(4) end)
v.set("n", "<A-5>", function() ui.nav_file(5) end)
v.set("n", "<A-6>", function() ui.nav_file(6) end)
v.set("n", "<A-7>", function() ui.nav_file(7) end)
v.set("n", "<A-8>", function() ui.nav_file(8) end)
v.set("n", "<A-9>", function() ui.nav_file(9) end)
