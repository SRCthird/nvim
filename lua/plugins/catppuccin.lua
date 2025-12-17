local function random_color()
  local function hex()
    return string.format('%02x', math.random(255))
  end
  return '#' .. hex() .. hex() .. hex()
end

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = {
    flavour = "frappe",
    transparent_background = true,
    show_end_of_buffer = false,
    custom_highlights = {
      Comment = { fg = random_color() }
    }
  }
}
