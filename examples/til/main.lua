-- import
TIL = require("TIL")

io.write("Where Are You From?: ")
local nation = TIL.read("l")
print(nation)

local name = TIL.ask("Who are You?", "name")
print(name)

local age = TIL.askNumber("How old are you?", 0, 120)
print(age)

local color = TIL.askChoice("Pick a Color:", {"red", "green", "blue"})
print(color)

if TIL.confirm("Do you want to continue?") then
    print("all done!")
else
    print("ok..")
end