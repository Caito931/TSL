--=========== Torplem IL ===========--
-- -> Made By: Choraumm
-- -> Created in: 15/04/2025

-- Torplem Input Library (TIL)
local TIL = {}

---- Read Input ----
TIL.read = function(param)
    if param == "n" then
        local num = io.read("*n")
        io.read("*l") -- clear leftover newline
        return num
    else
        return io.read()
    end
end

---- Ask Input ----
TIL.ask = function(prompt, default)
    io.write(prompt)
    if default then io.write(" [" .. default .. "]") end
    io.write(": ")

    local input = TIL.read()
    if input == "" or input == nil then return default or "" end
    return input
end

---- Ask Number Input ----
TIL.askNumber = function(prompt, min, max)
    local ans = nil

    while true do
        io.write(prompt)
        io.write(": ")
        ans = TIL.read("n")

        if type(ans) == "number" and (not min or ans >= min) and (not max or ans <= max) then
            return ans
        else
            print("Please enter a number" ..
                (min and " >= " .. min or "") ..
                (max and " <= " .. max or "") .. ".")
        end
    end
end

---- Ask Choice Input ----
TIL.askChoice = function(prompt, options)
    print(prompt)
    for num, option in ipairs(options) do
        print(num .. ". " .. option)
    end
    local ans
    while true do
        io.write("> ")
        ans = tonumber(TIL.read())
        if ans and options[ans] then
            return options[ans]
        else
            print("Invalid choice. Enter a number from the list.")
        end
    end
end

---- Confirm Input ----
TIL.confirm = function(prompt)
    local ans

    while true do
        io.write(prompt .. " [y/n]: ")
        ans = TIL.read()
        ans = ans:lower()
        if ans == "y" then return true end
        if ans == "n" then return false end
        print("Please enter 'y' or 'n'")
    end
end

return TIL