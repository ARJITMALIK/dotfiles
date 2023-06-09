local color_stat, colorrizer = pcall(require, "colorizer")
if not color_stat then
  return
end

colorrizer.setup()
