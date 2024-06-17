vim.api.nvim_create_user_command(
    'SetTheme',
    function(opts)
        local level = opts.args
        if level == '' then
            level = 'light'
        end
        vim.api.nvim_echo({ { "", 'none' } }, true, {})

        local file = NvimDir .. "/lua/frigid/config/catppuccin.lua"

        local lines = {}
        local modified = false

        local inFile = io.open(file, "r")
        if not inFile then
            print("Could not open file: " .. file)
            return
        end

        for line in inFile:lines() do
            table.insert(lines, line)
        end
        inFile:close()

        if not lines[42]:match('String') then
            print("Line 42 does not include the 'String' parameter. No changes were made.")
            return
        elseif level == 'light' then
            lines[9] = '    flavour = "frappe", -- latte, frappe, macchiato, mocha'
            lines[42] = '        String = {fg = "#06d6a0"},'
            modified = true
        elseif level == 'med' then
            lines[9] = '    flavour = "mocha", -- latte, frappe, macchiato, mocha'
            lines[42] = '        -- String = {fg = "#327831"},'
            modified = true
        elseif level == 'dark' then
            lines[9] = '    flavour = "latte", -- latte, frappe, macchiato, mocha'
            lines[42] = '        String = {fg = "#327831"},'
            modified = true
        end

        if modified then
            local outFile = assert(io.open(file, "w"))
            for _, line in ipairs(lines) do
                outFile:write(line, "\n")
            end
            outFile:close()
            print(string.format("Theme changed to %s mode", level))
            vim.cmd('source ' .. file)
        end
    end,
    {
        nargs = '?',
        desc = "Set the color theme of catppuccin to light, medium, or dark",
        complete = function(ArgLead, CmdLine, CursorPos)
            return { 'light', 'med', 'dark' }
        end,
    }
)

local Run_Pretty_Colors = false
local status, _ = pcall(
  function()
    require("catppuccin")
    Run_Pretty_Colors = true
  end
)
if not status then
      print("catppuccin not found: " .. error)
end

function Pretty_Colors()
    local timer = vim.loop.new_timer()

    local function reload_catppuccin()
        local file = NvimDir .. "/lua/frigid/config/catppuccin.lua"
        vim.cmd('source ' .. file)
    end

    function Kill_Colors()
        timer:stop()
        timer:close()
    end

    timer:start(0, 1000, vim.schedule_wrap(reload_catppuccin))

    vim.api.nvim_command('autocmd VimLeavePre * lua Kill_Colors()')
end

if Run_Pretty_Colors then
    Pretty_Colors()
end
