--=========== Torplem ML ===========--
-- -> Made By: Choraumm
-- -> Created in: 14/04/2025

-- Torplem Math Library (TML)
local TML = {}

---- Abs ----
-- Absolute value of a number
TML.abs = function(x)
    return math.abs(x)
end

---- Acos ---- 
-- Inverse cosine (arc cosine) of a number
TML.acos = function(x)
    return math.acos(x)
end

---- Asin ----
-- Inverse sine (arc sine) of a number
TML.asin = function(x)
    return math.asin(x)
end

---- Atan ----
-- Inverse tangent (arc tangent) for a given x and y
TML.atan = function(x, y)
    return math.atan(x, y)
end

---- Atan2 ----
-- Inverse tangent for coordinates (x, y)
TML.atan2 = function(x, y)
    return math.atan2 and math.atan2(x, y) or math.atan(x, y)
end

---- Ceil ----
-- Rounds a number upwards to the nearest integer
TML.ceil = function(x)
    return math.ceil(x)
end

---- Clamp ----
-- Restrict a value within a specified range [minVal, maxVal]
TML.clamp = function(x, minVal, maxVal)
    return math.max(minVal, math.min(x, maxVal))
end

---- Cos ----
-- Cosine of a number
TML.cos = function(x)
    return math.cos(x)
end

---- Cosh ----
-- Hyperbolic cosine of a number
TML.cosh = function(x)
    return (math.exp(x) + math.exp(-x)) / 2
end

---- Deg ----
-- Convert radians to degrees
TML.deg = function(x)
    return math.deg(x)
end

---- Exp ----
-- Exponential function e^x
TML.exp = function(x)
    return math.exp(x)
end

---- Fabs ----
-- Return the absolute value of x but as the negation of x if x is positive
TML.fabs = function(x)
    return x * (-1)
end

---- Floor ----
-- Rounds a number downwards to the nearest integer
TML.floor = function(x)
    return math.floor(x)
end

---- Fmod ----
-- Modulo operation that returns the remainder of x divided by y
TML.fmod = function(x, y)
    return math.fmod(x, y)
end

---- Frexp ----
-- Breaks a number into its mantissa and exponent
TML.frexp = function(x)
    return math.frexp(x)
end

---- Lerp ----
-- Linear interpolation between a and b based on t (0 <= t <= 1)
TML.lerp = function(a, b, t)
    return a + (b - a) * t
end

---- Log ----
-- Natural logarithm (base e) of a number
TML.log = function(x)
    return math.log(x)
end

---- Map Range ----
-- Maps a value x from one range [in_min, in_max] to another range [out_min, out_max]
TML.map = function(x, in_min, in_max, out_min, out_max)
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
end

---- Modf ----
-- Return the integer and fractional parts of x
TML.modf = function(x)
    return math.modf(x)
end

---- Pi ----
-- Returns the value of Pi
TML.pi = function()
    return math.pi
end

---- Pow ----
-- x raised to the power y (x^y)
TML.pow = function(x, y)
    return x ^ y or math.pow(x, y)
end

---- Rad (Degrees to Radians) ----
-- Converts degrees to radians
TML.rad = function(x)
    return math.rad(x)
end

---- Round ----
-- Rounds a number to the nearest integer
TML.round = function(x)
    return math.floor(x + 0.5)
end

---- Round to N Decimal Places ----
-- Rounds a number to N decimal places
TML.roundTo = function(x, n)
    local mult = 10 ^ (n or 0)
    return math.floor(x * mult + 0.5) / mult
end

---- Sign ----
-- Returns 1 if x is positive, -1 if x is negative, and 0 if x is zero
TML.sign = function(x)
    if x > 0 then return 1
    elseif x < 0 then return -1
    else return 0 end
end

---- Sin ----
-- Sine of a number
TML.sin = function(x)
    return math.sin(x)
end

---- Sinh ----
-- Hyperbolic sine of a number
TML.sinh = function(x)
    return (math.exp(x) - math.exp(-x)) / 2
end

---- Sqrt ----
-- Square root of a number
TML.sqrt = function(x)
    return math.sqrt(x)
end

---- Tan ----
-- Tangent of a number
TML.tan = function(x)
    return math.tan(x)
end

---- Tanh ----
-- Hyperbolic tangent of a number
TML.tanh = function(x)
    local e_pos = math.exp(x)
    local e_neg = math.exp(-x)
    return (e_pos - e_neg) / (e_pos + e_neg)
end

---- To Integer ----
-- Convert a value to an integer
TML.tointeger = function(x)
    return math.tointeger(x)
end

--============== Ease Functions ==============-

---- Ease In Quad ----
-- Quadratic ease-in function
TML.easeInQuad = function(t)
    return t * t
end

---- Ease In Cubic ----
-- Cubic ease-in function
TML.easeInCubic = function(t)
    return t * t * t
end

---- Ease In Quart ----
-- Quartic ease-in function
TML.easeInQuart = function(t)
    return t ^ 4
end

---- Ease In Quint ----
-- Quintic ease-in function
TML.easeInQuint = function(t)
    return t ^ 5
end

---- Ease In Sine ----
-- Sine ease-in function
TML.easeInSine = function(t)
    return 1 - math.cos((t * math.pi) / 2)
end

---- Ease In Expo ----
-- Exponential ease-in function
TML.easeInExpo = function(t)
    return t == 0 and 0 or 2 ^ (10 * (t - 1))
end

---- Ease In Circ ----
-- Circular ease-in function
TML.easeInCirc = function(t)
    return 1 - math.sqrt(1 - t * t)
end

---- Ease Out Quad ----
-- Quadratic ease-out function
TML.easeOutQuad = function(t)
    return t * (2 - t)
end

---- Ease Out Cubic ----
-- Cubic ease-out function
TML.easeOutCubic = function(t)
    return 1 - (1 - t) ^ 3
end

---- Ease Out Quart ----
-- Quartic ease-out function
TML.easeOutQuart = function(t)
    return 1 - (1 - t) ^ 4
end

---- Ease Out Quint ----
-- Quintic ease-out function
TML.easeOutQuint = function(t)
    return 1 - (1 - t) ^ 5
end

--========== Additional Functions ==========--

---- Sum ----
-- Calculates the sum of all values in an array
TML.sum = function(arr)
    local sum = 0
    for _, val in ipairs(arr) do
        sum = sum + val
    end
    return sum
end

---- Mean ----
-- Calculates the mean (average) of an array
TML.mean = function(arr)
    return TML.sum(arr) / #arr
end

---- Median ----
-- Calculates the median value of an array
TML.median = function(arr)
    if #arr == 0 then return nil end

    local sorted = {table.unpack(arr)}
    table.sort(sorted)

    local n = #sorted
    local mid = math.floor(n / 2)

    if n % 2 == 0 then
        return (sorted[mid] + sorted[mid + 1]) / 2
    else
        return sorted[mid + 1]
    end
end

---- Gcd ----
-- Calculates the greatest common divisor of two numbers
TML.gcd = function(a, b)
    while b ~= 0 do
        a, b = b, a % b
    end
    return a
end

---- Lcm ----
-- Calculates the least common multiple of two numbers
TML.lcm = function(a, b)
    return math.abs(a * b) / TML.gcd(a, b)
end

---- Factorial ----
-- Calculates the factorial of a non-negative integer n
TML.factorial = function(n)
    if n < 0 then return nil end
    local res = 1
    for i = 2, n do res = res * i end
    return res
end

---- Is Prime ----
-- Checks if a number n is prime
TML.isPrime = function(n)
    if n <= 1 then return false end
    for i = 2, math.floor(math.sqrt(n)) do
        if n % i == 0 then return false end
    end
    return true
end

---- Dist ----
-- Calculates the Euclidean distance between two points (x1, y1) and (x2, y2)
TML.dist = function(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end

---- Angle ----
-- Returns the angle between two points (x1, y1) and (x2, y2)
TML.angle = function(x1, y1, x2, y2)
    return TML.atan2(y2 - y1, x2 - x1)
end

---- Bubble Sort ----
-- Sorts an array in ascending order using the bubble sort algorithm
TML.bSort = function(arr)
    local n = #arr
    for i = 1, n do
        for j = 1, n - i do
            if arr[j] > arr[j + 1] then
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
            end
        end
    end
    return arr
end

---- Quick Sort ----
-- Sorts an array in ascending order using the quicksort algorithm
TML.quickSort = function(arr)
    if #arr <= 1 then return arr end

    local pivot = arr[1]
    local left, right = {}, {}

    for i = 2, #arr do
        if arr[i] < pivot then
            table.insert(left, arr[i])
        else
            table.insert(right, arr[i])
        end
    end

    local sorted = TML.quickSort(left)
    table.insert(sorted, pivot)
    for _, v in ipairs(TML.quickSort(right)) do
        table.insert(sorted, v)
    end

    return sorted
end

---- Mode ----
-- Returns the mode (most frequent value) in an array
TML.mode = function(arr)
    local dict = {}
    local greatestV = 0
    local greatestK
    for _, v in ipairs(arr) do
        dict[v] = (dict[v] or 0) + 1
        if dict[v] > greatestV then
            greatestK = v
            greatestV = dict[v]
        end
    end
    return greatestK
end

return TML