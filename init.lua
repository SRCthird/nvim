NvimPath = debug.getinfo(1, "S").source:sub(2)
NvimDir = vim.fn.fnamemodify(NvimPath, ":p:h")
HomeDir = os.getenv("USERPROFILE") or os.getenv("HOME")

require("frigid")
