nvim_path = debug.getinfo(1, "S").source:sub(2)
nvim_dir = vim.fn.fnamemodify(nvim_path, ":p:h")
home_dir = os.getenv("USERPROFILE") or os.getenv("HOME")

require("frigid")
