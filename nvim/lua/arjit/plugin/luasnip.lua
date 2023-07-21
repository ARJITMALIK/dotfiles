local status, ls = pcall(require, "luasnip")
if not status then
  return
end

local snip = ls.snippet
-- local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
-- local func = ls.function_node
-- local choice = ls.choice_node
-- local dynamicn = ls.dynamic_node

ls.add_snippets("cpp", {
  snip("hehe", {
    text({"#include <iostream>",
    "#include <vector>",
    "#include <algorithm>",
    "#include <cctype>",
    "#include <sstream>",
    "#include <string>",
    "#define LOG(x) std::cout << x << \"\\n\" ",
    "",
    "int main() {",
    "  "}), insert(0, "// code goes here"),
    text({"",
    "  return 0;",
    "}"})
  }),
  snip("pa", {
    text({"void printArray(int ar[], int n) {",
    "  for (int i = 0; i < n; i++) {",
    "    LOG(ar[i]);",
    "  }",
    "}"}),
  })
})
