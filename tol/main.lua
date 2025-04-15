-- import 
TOL = require("TOL")

local Name = "Caio"

TOL.print(Name)

TOL.println(Name)

TOL.eprintln(Name)

TOL.log(Name)

TOL.printf("%s", 0.32 .. '\n')

TOL.colorPrint(TOL.color.green, Name)

TOL.tofile("tol/test.txt", Name)

local f = io.open("tol/test.txt", "r")
if f then
    TOL.println(f:read("a"))
    f:close()
end
