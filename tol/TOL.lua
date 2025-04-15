--=========== Torplem OL ===========--
-- -> Made By: Choraumm
-- -> Created in: 15/04/2025

-- Torplem Output Library (TOL)
TOL = {}

-- Colors
TOL.color = {
    red = "\27[31m",
    green = "\27[32m",
    yellow = "\27[33m",
    reset = "\27[0m"
}

---- Simple Print ----
TOL.print = function(...)
    io.write(...)
end

---- Ln Print ----
TOL.println = function(...)
    print(...)
end

---- Err Print ----
TOL.eprintln = function(...)
    io.stderr:write(table.concat({...}, " ") .. "\n")
end

---- Format Print ----
TOL.printf = function(fmt, ...)
    io.write(string.format(fmt, ...))
end

---- Log Print ----
TOL.log = function(...)
    io.stderr:write(table.concat({...}, " ") .. "\n") 
end

---- Color Print ----
TOL.colorPrint = function(color, ...)
    io.write(TOL.color[color] or "", table.concat({...}, " "), TOL.color.reset, "\n")
end

---- To File Print ----
TOL.tofile = function(path, ...)
    local f = io.open(tostring(path), "a")

    if f then
        f:write(table.concat({...}, " ") .. "\n")
        f:close()
    else
        TOL.eprintln("Could Not Open File!")
    end
end