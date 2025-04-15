--=========== Torplem GL ===========--
-- -> Made By: Choraumm
-- -> Created in: 05/04/2025

-- Torplem GUI library (Torplem Graphics Library)
local TGL = {}

-- Include
local utf8 = require("utf8")

-- Colors
TGL.color = {}
local function initColors()
    TGL.color.WHITE     = {255/255, 255/255, 255/255}
    TGL.color.BLACK     = {0/255,   0/255,   0/255}
    TGL.color.RED       = {255/255, 0/255,   0/255}
    TGL.color.GREEN     = {0/255,   255/255, 0/255}
    TGL.color.BLUE      = {0/255,   0/255,   255/255}
    TGL.color.YELLOW    = {255/255, 255/255, 0/255}
    TGL.color.CYAN      = {0/255,   255/255, 255/255}
    TGL.color.MAGENTA   = {255/255, 0/255,   255/255}
    TGL.color.GRAY      = {128/255, 128/255, 128/255}
    TGL.color.LIGHTGRAY = {211/255, 211/255, 211/255}
    TGL.color.DARKGRAY  = {64/255,  64/255,  64/255}
    TGL.color.ORANGE    = {255/255, 165/255, 0/255}
    TGL.color.PURPLE    = {128/255, 0/255,   128/255}
    TGL.color.BROWN     = {139/255, 69/255,  19/255}
    TGL.color.LIGHTBLUE = {44/255, 122/255, 200/255}
    TGL.color.PINK      = {255/255, 192/255, 203/255}
    TGL.color.LIME      = {0/255,   255/255, 0/255}
    TGL.color.TURQUOISE = {64/255,  224/255, 208/255}
    TGL.color.AQUA      = {0/255,   255/255, 255/255}
    TGL.color.SALMON    = {250/255, 128/255, 114/255}
    TGL.color.GOLD      = {255/255, 215/255, 0/255}
    TGL.color.CRIMSON   = {220/255, 20/255, 60/255}
end
initColors()

-- Global Function to Center
function TGL.center(width)
    local x = love.graphics.getWidth()/2 - width/2
    return x
end

-- Functions
local function checkHover(a, mx, my)
    if mx > a.x and mx < a.x + a.width and my > a.y and my < a.y + a.height then return true else return false end
end
local function Mdist(x1,y1, x2,y2) 
	return ((x2-x1)^2+(y2-y1)^2)^0.5 
end
local function checkHoverC(Rbtn, mx, my)
    if Mdist(mx, my, Rbtn.x, Rbtn.y) < Rbtn.radius then return true else return false end
end
local function resetColor()
    love.graphics.setColor(1, 1, 1, 1)
end
local function resetFontSize()
    love.graphics.setNewFont()
end
local function setToolTip(toolTip)
    -- Set the Multiplier
    -- Count number of newline characters in text
    local _, newlineCount = toolTip.text:gsub("\n", "")
        
    -- Height multiplier is 1 base line + number of newlines
    toolTip.HeightMultiplier = 1 + newlineCount

    -- Check To see if there's a Title
    if toolTip.title ~= "" then
        toolTip.HeightMultiplier = toolTip.HeightMultiplier + 1 -- For the Title
    end
    -- Set the Icon
    --toolTip.text = "? " .. toolTip.text
end

----------------------------------Button--------------------------------------------------

TGL.button = {} 

function TGL.button.new(x, y, width, height, text, textcolor, fontsize, bound, clickCooldown, color, Hcolor, Ccolor, onClick, onRelease, onHover, image)
    local button = {
        x = x or 0,
        y = y or 0,
        width = width or 0,
        height = height or 0,
        text = text or "",
        textcolor = textcolor or {1, 1, 1, 1},
        fontsize = fontsize or 0,
        bound = bound or 0,
        clickCooldown = clickCooldown or 0.15,
        clicked = false,
        color = color or {1, 1, 1, 1},
        Dcolor = color or {1, 1, 1, 1},
        Hcolor = Hcolor or {1, 1, 1, 1},
        Ccolor = Ccolor or {1, 1, 1, 1},
        image = image or false,
        scale = 1,
        onClick = onClick or function() end,
        onRelease = onRelease or function () end,
        onHover = onHover or function() end
    }
    return button
end

function TGL.button.update(btn, mx, my, dt)
    btn.hovered = checkHover(btn, mx, my)
    if btn.clickCooldown > 0 then
        btn.clickCooldown = btn.clickCooldown - dt
    else
        if btn.hovered then
            btn.onHover()
        else
            btn.nonHover()
        end
    end
end

function TGL.button.draw(btn)
    -- Calculate scaled button dimensions
    local ButtonW = btn.width * btn.scale
    local ButtonH = btn.height * btn.scale
    local ButtonX = btn.x + (btn.width - ButtonW) / 2
    local ButtonY = btn.y + (btn.height - ButtonH) / 2

    -- Set button color and draw background
    love.graphics.setColor(btn.color)
    if not btn.image then
        local bound = btn.bound or 0
        love.graphics.rectangle("fill", ButtonX, ButtonY, ButtonW, ButtonH, bound, bound)
    else
        love.graphics.draw(btn.image, ButtonX, ButtonY, 0, btn.scale, btn.scale)
    end
    
    -- Text
    local font = love.graphics.newFont(btn.fontsize*btn.scale)
    love.graphics.setFont(font)
    local text = tostring(btn.text)
    local TextWidth = font:getWidth(text)
    local TextHeight = font:getHeight()

    -- Center text
    local textX = ButtonX + (ButtonW - TextWidth) / 2
    local textY = ButtonY + (ButtonH - TextHeight) / 2

    -- Draw text
    love.graphics.setColor(btn.textcolor)
    love.graphics.print(text, textX, textY)

    -- Reset color
    resetColor()
    resetFontSize()
end

function TGL.button.setDefaultStatus(button)
    button.onClick = function()
        button.color = button.Ccolor
        button.scale = 0.9 -- default value
    end
    button.onHover = function()
        button.color = button.Hcolor
    end
    button.nonHover = function()
        if button.clickCooldown ~= 0 then
            button.color = button.Dcolor
            button.scale = 1
        end
    end
    button.onRelease = function()
        button.scale = 1 -- default value
    end
end

-------------------------------------------------------------------------------------------

---------------------------------Radio Button----------------------------------------------

TGL.radioButton = {}
TGL.radioGroups = {}

function TGL.radioButton.new(x, y, radius, active, Bcolor, HBcolor, callback, group)
    local radioButton = {
        x = x or 0,
        y = y or 0,
        radius = radius or 0,
        active = active or false,
        Bcolor = Bcolor or {1, 1, 1, 1}, -- Background Color
        DBcolor = Bcolor, -- Default Background Color
        HBcolor = HBcolor or {1, 1, 1, 1}, -- Hover Background Color
        Fcolor = {0, 0, 0, 1}, -- Front Color (WHITE or BLACK)
        callback = callback or function() end,
        group = group or "default",
    }
    -- Register this button into its group
    if not TGL.radioGroups[radioButton.group] then
        TGL.radioGroups[radioButton.group] = {}
    end
    table.insert(TGL.radioGroups[radioButton.group], radioButton)

    return radioButton
end

function TGL.radioButton.update(Rbtn, mx, my, dt)
    Rbtn.hovered = checkHoverC(Rbtn, mx, my)
    if  Rbtn.hovered then
        Rbtn.Bcolor = Rbtn.HBcolor
    else
        Rbtn.Bcolor = Rbtn.DBcolor
    end
    if Rbtn.active then
        Rbtn.Fcolor = {1, 1, 1, 1}
    else 
        Rbtn.Fcolor = {0, 0, 0, 1}
    end
end

function TGL.radioButton.pressed(rbtn)
    if rbtn.hovered then
        for _, other in ipairs(TGL.radioGroups[rbtn.group] or {}) do
            other.active = false
        end
        rbtn.active = true
        rbtn.callback()
    end
end

function TGL.radioButton.draw(Rbtn)
    -- Back
    love.graphics.setColor(Rbtn.Bcolor)
    love.graphics.circle("fill", Rbtn.x, Rbtn.y, Rbtn.radius)

    -- Front
    love.graphics.setColor(Rbtn.Fcolor)
    love.graphics.circle("fill", Rbtn.x, Rbtn.y, Rbtn.radius/1.5)

    -- Reset color
    resetColor()
    resetFontSize()
end

-------------------------------------------------------------------------------------------

------------------------------------Text Input---------------------------------------------

TGL.textInput = {}

function TGL.textInput.new(x, y, width, height, backcolor, Hbackcolor, fontsize, textcolor)
    local textInput = {
        x = x,
        y = y,
        width = width,
        height = height,
        Dbackcolor = backcolor or {1,1,1,1},
        backcolor = backcolor or {1, 1, 1, 1},
        Hbackcolor = Hbackcolor or {0.5, 0.5, 0.5},
        fontsize = fontsize or 16,
        textcolor = textcolor or {0, 0, 0, 1},
        text = "",
        active = false, 
        cursorTimer = 0,
        cursorVisible = true,
        onHover = function() end,
        nonHover = function() end,
    }
    return textInput
end

function TGL.textInput.update(ti, mx, my, dt)
    -- Cursor blink logic
    ti.cursorTimer = ti.cursorTimer + dt
    if ti.cursorTimer >= 0.5 then
        ti.cursorVisible = not ti.cursorVisible
        ti.cursorTimer = 0
    end
    if checkHover(ti, mx, my) then
        ti.onHover()
    else
        ti.nonHover()
    end
end

function TGL.textInput.draw(ti)
    -- Background
    love.graphics.setNewFont(ti.fontsize)
    love.graphics.setColor(ti.backcolor)
    love.graphics.rectangle("fill", ti.x, ti.y, ti.width, ti.height, 5, 5)

    -- Text
    love.graphics.setColor(ti.textcolor)
    local font = love.graphics.newFont(ti.fontsize)
    love.graphics.setFont(font)
    love.graphics.print(ti.text, ti.x + 5, ti.y + (ti.height - font:getHeight()) / 2)

    -- Cursor
    if ti.active and ti.cursorVisible then
        local textWidth = font:getWidth(ti.text)
        love.graphics.setLineWidth(1)
        love.graphics.line(
            ti.x + 5 + textWidth, 
            ti.y + 5, 
            ti.x + 5 + textWidth, 
            ti.y + ti.height - 5
        )
    end

    -- Reset color
    resetColor()
    resetFontSize()
end

function TGL.textInput.mousepressed(ti, x, y)
    ti.active = x >= ti.x and x <= ti.x + ti.width and y >= ti.y and y <= ti.y + ti.height
end

function TGL.textInput.isOverflowing(ti)
    local font = love.graphics.newFont(ti.fontsize)
    local textWidth = font:getWidth(ti.text)
    return textWidth >= ti.width-ti.fontsize
end

function TGL.textInput.textinput(ti, t)
    if ti.active and not TGL.textInput.isOverflowing(ti) then
        ti.text = ti.text .. t
    end
end

function TGL.textInput.keypressed(ti, key)
    if ti.active and key == "backspace" then
        local byteoffset = utf8.offset(ti.text, -1)
        if byteoffset then
            ti.text = string.sub(ti.text, 1, byteoffset - 1)
        end
    end
end

-------------------------------------------------------------------------------------------

--------------------------------------Label------------------------------------------------

TGL.label = {}

function TGL.label.new(x, y, text, textcolor, fontsize)
    local label = {
        x = x,
        y = y,
        text = text,
        textcolor = textcolor,
        fontsize = fontsize,
    }
    return label
end

function TGL.label.update(l, dt)
end

function TGL.label.draw(l)
    love.graphics.setNewFont(l.fontsize)
    love.graphics.setColor(l.textcolor)
    love.graphics.print(l.text, l.x, l.y)

    -- Reset color
    resetColor()
    resetFontSize()
end

function TGL.label.Xcenter(text, fontsize)
    -- Get text 
    local font = love.graphics.newFont(fontsize)
    love.graphics.setFont(font)
    local text = tostring(text)
    local TextWidth = font:getWidth(text)

    -- Center text
    local textX = love.graphics.getWidth()/2 - TextWidth/2
    return textX
end

-------------------------------------------------------------------------------------------

---------------------------------------Check Box----------------------------------------------

TGL.checkBox = {}

function TGL.checkBox.new(x, y, width, height, WHmultiplier, round, color, Hcolor, onActive)
    local checkbox = {
        x = x,
        y = y,
        width = width,
        height = height,
        WHmultiplier = WHmultiplier, -- Width and Height Multiplier
        round = round,
        Dcolor = color,
        color = color,
        Hcolor = Hcolor,
        Fcolor = {0,0,0};
        active = false,
        onActive = onActive or function() end,
    }
    return checkbox
end

function TGL.checkBox.update(cb, mx, my, dt)
    cb.hovered = checkHover(cb, mx, my)
    if cb.hovered then
        cb.color = cb.Hcolor
    else
        cb.color = cb.Dcolor
    end
    if cb.active then
        cb.Fcolor = {1,1,1} -- WHITE
    else
        cb.Fcolor = {0,0,0} -- BLACK
    end
end

function TGL.checkBox.draw(cb)
    -- Back
    love.graphics.setColor(cb.color)
    love.graphics.rectangle("fill", cb.x, cb.y, cb.width, cb.height, cb.round)

    -- Front Rectangle -- WHITE or BLACK
    local Fw = cb.width*cb.WHmultiplier
    local Fh = cb.height*cb.WHmultiplier
    local Fx = cb.x + ((cb.width - Fw) / 2)
    local Fy = cb.y + ((cb.height - Fh) / 2)

    -- Front
    love.graphics.setColor(cb.Fcolor)
    love.graphics.rectangle("fill", Fx, Fy, Fw, Fh, cb.round)

    resetColor()
    resetFontSize()
end

-------------------------------------------------------------------------------------------

-------------------------------------Progress Bar------------------------------------------

TGL.progressBar = {}

function TGL.progressBar.new(x, y, width, height, round, color, barColor, progress, offset, Hmultiplier)
    local progressbar = {
        x = x,
        y = y,
        width = width,
        height = height,
        round = round,
        color = color,
        barColor = barColor,
        barWidth = progress,
        progress = progress,
        offset = offset or 5,
        Hmultiplier = Hmultiplier or 0.9,
    }
    return progressbar
end

function TGL.progressBar.update(pB, dt)
    -- Clamp
    pB.progress = math.max(0, math.min(pB.progress, pB.width - pB.offset * 2))
    pB.barWidth = pB.progress
end

function TGL.progressBar.draw(pB)
    -- Back
    love.graphics.setColor(pB.color)
    love.graphics.rectangle("fill", pB.x, pB.y, pB.width, pB.height, pB.round)

    -- Front
    local Fbar = {}
    Fbar.width = pB.barWidth
    Fbar.height = pB.height * pB.Hmultiplier
    Fbar.x = pB.x + pB.offset
    Fbar.y = pB.y + ((pB.height - Fbar.height) / 2)

    love.graphics.setColor(pB.barColor)
    love.graphics.rectangle("fill", Fbar.x, Fbar.y, Fbar.width, Fbar.height, pB.round)

    resetColor()
    resetFontSize()
end

function TGL.progressBar.setProgress(pB, value)
    pB.progress = math.max(0, math.min(value, pB.width - pB.offset * 2))
    pB.barWidth = pB.progress
end

-------------------------------------------------------------------------------------------

--------------------------------------Tool Tip---------------------------------------------

TGL.toolTip = {}

function TGL.toolTip.new(title, text, fontsize, color, Bcolor, component, round)
    local toolTip = {
        x = 0,
        y = 0,
        title = title or "",
        text = text or "",
        HeightMultiplier = 1,
        fontsize = fontsize or nil, 
        color = color or TGL.color.BLACK,
        Bcolor = Bcolor or TGL.color.WHITE,
        component = component,
        round = round or 0,
        active = false,
    }
    setToolTip(toolTip)

    return toolTip
end

function TGL.toolTip.update(tT, mx, my, dt)
    if checkHover(tT.component, mx, my) then
        tT.active = true
        tT.x = mx + 25 -- Default Offset
        tT.y = my + 25
    else
        tT.active = false
    end
end

function TGL.toolTip.draw(tT)
    -- Calculate the Back Width and Height
    local font = love.graphics.newFont(tT.fontsize)
    love.graphics.setFont(font)
    
    -- Set the Rectangle Width and Height
    local BHeight = font:getHeight(tT.text) * tT.HeightMultiplier  
    local BWidth = font:getWidth(tT.text) * 1.2

    -- Title
    local TitleWidth = font:getWidth(tT.title)
    local TitleHeight = font:getHeight(tT.title)
    local titleX = tT.x + (BWidth - TitleWidth) / 2
    if tT.active then
        -- Back
        love.graphics.setColor(tT.Bcolor)
        love.graphics.rectangle("fill", tT.x, tT.y, BWidth, BHeight, tT.round)
        -- Title
        love.graphics.setColor(tT.color)
        love.graphics.print(tT.title, titleX, tT.y)
        -- Text
        love.graphics.setColor(tT.color)
        love.graphics.print(tT.text, tT.x, tT.y+TitleHeight)
    end

    resetColor()
    resetFontSize()
end

-------------------------------------------------------------------------------------------

return TGL