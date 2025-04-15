-- import
TML = require("TML")

-- Examples
local myArray = {1.50, 1.54, 1.55, 1.60, 1.65, 1.67, 1.69, 1.75, 1.78}
local myArray2 = {15, 15, 27, 32, 32, 44}
local myArray3 = {4, 9, 6, 3, 4, 2}
local myArray4 = {2, 3, 3, 4}

print("Mean: " .. TML.mean(myArray))                   --> 1.636666...
print("Median: " .. TML.median(myArray))               --> 1.65
print("Median: " .. TML.median(myArray2))              --> 29.5
print("Mean: " .. TML.mean({7, 8, 5, 9}))              --> 7.25
print("Median: " .. TML.median({25, 28, 32, 30, 35}))  --> 30
print("Median: " .. TML.median(myArray3))              --> 4.0
print("Mode: " ..  TML.mode(myArray4))
print("Sum: " .. TML.sum(myArray4))

-- ChatGPT Examples
print(TML.abs(-5))                        -- 5
print(TML.acos(1))                        -- 0
print(TML.asin(0))                        -- 0
print(TML.atan(1, 1))                     -- 0.785...
print(TML.atan2(1, 1))                    -- 0.785...
print(TML.ceil(2.3))                      -- 3
print(TML.clamp(15, 0, 10))               -- 10
print(TML.cos(0))                         -- 1
print(TML.cosh(0))                        -- 1
print(TML.deg(math.pi))                   -- 180
print(TML.exp(1))                         -- 2.718...
print(TML.fabs(-4))                       -- 4
print(TML.floor(2.8))                     -- 2
print(TML.fmod(10, 3))                    -- 1
print(TML.frexp(8))                       -- (0.5, 4)
print(TML.lerp(0, 10, 0.5))               -- 5
print(TML.log(math.exp(1)))               -- 1
print(TML.map(5, 0, 10, 0, 100))          -- 50
print(TML.modf(5.5))                      -- (0.5, 5)
print(TML.pi())                           -- 3.141...
print(TML.pow(2, 3))                      -- 8
print(TML.rad(180))                       -- 3.141...
print(TML.round(2.6))                     -- 3
print(TML.roundTo(3.14159, 2))            -- 3.14
print(TML.sign(-42))                      -- -1
print(TML.sin(0))                         -- 0
print(TML.sinh(0))                        -- 0
print(TML.sqrt(9))                        -- 3
print(TML.tan(0))                         -- 0
print(TML.tanh(0))                        -- 0
print(TML.tointeger(5.0))                 -- 5

-- Ease functions
print(TML.easeInQuad(0.5))                -- 0.25
print(TML.easeInCubic(0.5))               -- 0.125
print(TML.easeInQuart(0.5))               -- 0.0625
print(TML.easeInQuint(0.5))               -- 0.03125
print(TML.easeInSine(1))                  -- 1
print(TML.easeInExpo(1))                  -- 1
print(TML.easeInCirc(1))                  -- 1
print(TML.easeOutQuad(0.5))               -- 0.75
print(TML.easeOutCubic(0.5))              -- ~0.875
print(TML.easeOutQuart(0.5))              -- ~0.9375
print(TML.easeOutQuint(0.5))              -- ~0.96875

-- Stats & extras
print(TML.sum({1,2,3}))                   -- 6
print(TML.mean({1,2,3}))                  -- 2
print(TML.median({3,1,2}))                -- 2
print(TML.gcd(54, 24))                    -- 6
print(TML.lcm(4, 5))                      -- 20
print(TML.factorial(5))                   -- 120
print(TML.isPrime(7))                     -- true
print(TML.dist(0, 0, 3, 4))               -- 5
print(TML.angle(0, 0, 1, 1))              -- 0.785...

-- Sorting
print(table.concat(TML.bSort({5, 3, 1}), ', '))       -- 1, 3, 5
print(table.concat(TML.quickSort({5, 3, 1}), ', '))   -- 1, 3, 5

-- Mode
print(TML.mode({1, 2, 2, 3}))             -- 2