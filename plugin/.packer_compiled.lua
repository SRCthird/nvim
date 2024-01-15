-- Automatically generated packer.nvim plugin loader code
if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
    vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
    return
end
  
vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

    _G._packer = _G._packer or {}
    _G._packer.inside_compile = true

    local time
    local profile_info
    local should_profile = false
    if should_profile then
        local hrtime = vim.loop.hrtime
        profile_info = {}
        time = function(chunk, start)
        if start then
            profile_info[chunk] = hrtime()
        else
            profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
        end
        end
    else
        time = function(chunk, start) end
    end

    local function save_profiles(threshold)
        local sorted_times = {}
        for chunk_name, time_taken in pairs(profile_info) do
            sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
        end
        table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
        local results = {}
        for i, elem in ipairs(sorted_times) do
            if not threshold or threshold and elem[2] > threshold then
                results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
            end
        end
        if threshold then
            table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
        end

        _G._packer.profile_output = results
    end

    time([[Luarocks path setup]], true)

    -- Function to check if running in PowerShell
    local function isPowershell()
        local shell = os.getenv("COMSPEC")
        if shell and shell:find("powershell") then
            return true
        end
        return false
    end

    local version = "2.1.1703358377" -- Adjust this as needed

    local temp_env
    local home_path
    if isPowershell() then
        temp_env = "$TEMP"
        home_path = "$LOCALAPPDATA" 
    else
        temp_env = "%%TEMP%%"
        home_path = "%%LOCALAPPDATA%%"
    end

    local package_path_str
    local install_cpath_pattern
    if system == "Windows" then
        package_path_str = string.format("%s\\nvim\\packer_hererocks\\%s\\share\\lua\\5.1\\?.lua;%s\\nvim\\packer_hererocks\\%s\\share\\lua\\5.1\\?\\init.lua;%s\\nvim\\packer_hererocks\\%s\\lib\\luarocks\\rocks-5.1\\?.lua;%s\\nvim\\packer_hererocks\\%s\\lib\\luarocks\\rocks-5.1\\?\\init.lua", temp_env, version, temp_env, version, temp_env, version, temp_env, version)
        install_cpath_pattern = string.format("%s\\nvim\\packer_hererocks\\%s\\lib\\lua\\5.1\\?.so", temp_env, version)
    elseif system == "Linux" then
        package_path_str = string.format("~/.cache/nvim/packer_hererocks/%s/share/lua/5.1/?.lua;~/.cache/nvim/packer_hererocks/%s/share/lua/5.1/?/init.lua;~/.cache/nvim/packer_hererocks/%s/lib/luarocks/rocks-5.1/?.lua;~/.cache/nvim/packer_hererocks/%s/lib/luarocks/rocks-5.1/?/init.lua", version, version, version, version)
        install_cpath_pattern = string.format("~/.cache/nvim/packer_hererocks/%s/lib/lua/5.1/?.so", version)
    end

    if not string.find(package.path, package_path_str, 1, true) then
        package.path = package.path .. ';' .. package_path_str
    end

    if not string.find(package.cpath, install_cpath_pattern, 1, true) then
        package.cpath = package.cpath .. ';' .. install_cpath_pattern
    end

    time([[Luarocks path setup]], false)
    time([[try_loadstring definition]], true)
    local function try_loadstring(s, component, name)
        local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
        if not success then
            vim.schedule(function()
                vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
            end)
        end
        return result
    end

    local packer_home
    if system == "Windows" then
        packer_home = string.format("%s\\nvim-data\\site\\pack\\packer\\start\\packer.nvim", home_path)
    elseif system == "Linux" then
        packer_home = "~/.local/share/nvim/site/pack/packer/start/packer.nvim"
    end

    time([[try_loadstring definition]], false)
    time([[Defining packer_plugins]], true)
    _G.packer_plugins = {
        ["packer.nvim"] = {
        loaded = true,
        path = packer_home,
        url = "https://github.com/wbthomason/packer.nvim"
        }
    }

    time([[Defining packer_plugins]], false)

    _G._packer.inside_compile = false
    if _G._packer.needs_bufread == true then
        vim.cmd("doautocmd BufRead")
    end
    _G._packer.needs_bufread = false

    if should_profile then 
        save_profiles() 
    end

end)

if not no_errors then
    error_msg = error_msg:gsub('"', '\\"')
    vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end