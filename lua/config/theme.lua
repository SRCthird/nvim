vim.api.nvim_create_user_command(
    'SetTheme',
    function(opts)
        local level = opts.args
        if level == '' then
            level = 'light'
        end
        vim.api.nvim_echo({ { "", 'none' } }, true, {})

        local file = NvimDir .. "/lua/plugins/catppuccin.lua"

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

        if level == 'light' then
            lines[13] = '    flavour = "frappe",'
            modified = true
        elseif level == 'med' then
            lines[13] = '    flavour = "mocha",'
            modified = true
        elseif level == 'dark' then
            lines[13] = '    flavour = "latte",'
            modified = true
        elseif level == 'auto' then
            lines[13] = '    flavour = "auto",'
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
        vim.cmd.colorscheme "catppuccin"
    end,
    {
        nargs = '?',
        desc = "Set the color theme of catppuccin to light, medium, or dark",
        complete = function(ArgLead, CmdLine, CursorPos)
            return { 'light', 'med', 'dark', 'auto' }
        end,
    }
)
