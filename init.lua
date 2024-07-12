NvimPath = debug.getinfo(1, "S").source:sub(2)
NvimDir = vim.fn.fnamemodify(NvimPath, ":p:h")
HomeDir = os.getenv("USERPROFILE") or os.getenv("HOME")
SystemOS = (function()
  local BinaryFormat = package.cpath:match("%p[\\|/]?%p(%a+)")
  if BinaryFormat == "dll" or BinaryFormat == "Users" then
    return "Windows"
  elseif BinaryFormat == "so" then
    return "Linux"
  elseif BinaryFormat == "dylib" then
    return "MacOS"
  end
end)()

require("frigid")
