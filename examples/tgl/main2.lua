-- SAME THING BUT ONLY IN THE TSL/ FOLDER WORKS

-- import
TGL = require("TGL")

function love.load()
    local Name
    local Sex
    local Password

    myButton = TGL.button.new(
        TGL.center(200), 300, 200, 50, "Login", {1,1,1,1}, 24, 5, 0.15,
        TGL.color.BLUE,
        TGL.color.LIGHTBLUE,
        TGL.color.LIGHTBLUE
    )
    TGL.button.setDefaultStatus(myButton)

    myButton.onClick = function()
        -- DEFAULT
        myButton.color = myButton.Ccolor
        myButton.scale = 0.9
        myButton.clickCooldown = 0.15

        -- Get Sex
        if     myRadioButton.active  then Sex = myMaleLabel.text
        elseif myRadioButton2.active then Sex = myFemaleLabel.text 
        else Sex = "" end

        -- Get Name
        Name = myInputbox.text

        -- Get Password
        Password = myInputbox2.text

        -- Print
        --[[
        print("Name: " .. Name)
        print("Password: " .. Password)
        print("Sex: " .. Sex)
        ]]

        -- Check Verification
        if Name == "Caio" and Password == "123" and Sex == "Male" then
            print("Sucefully Logged in!")
            TGL.progressBar.setProgress(myBar, 100)
        else
            print("Wrong Name or Password...")
            TGL.progressBar.setProgress(myBar, 0)
        end

    end
    myButton.onHover = function()
        myButton.color = myButton.Hcolor
        myButton.scale = 1.1
    end

    myInputbox = TGL.textInput.new(
    TGL.center(200), 125, 200, 50, {1,1,1}, {0.9,0.9,0.9}, 25, {0,0,0}
    )
    myInputbox.onHover = function ()
        myInputbox.backcolor = myInputbox.Hbackcolor
    end
    myInputbox.nonHover = function()
        myInputbox.backcolor = myInputbox.Dbackcolor
    end

    myInputbox2 = TGL.textInput.new(
        TGL.center(200), 225, 200, 50, {1,1,1}, {0.9,0.9,0.9}, 25, {0,0,0}
    )
    myInputbox2.onHover = function()
        myInputbox2.backcolor = myInputbox2.Hbackcolor
    end
    myInputbox2.nonHover = function()
        myInputbox2.backcolor = myInputbox2.Dbackcolor
    end

    myRadioButton = TGL.radioButton.new(
        myInputbox.x+25, 400, 25, false, 
        {0/255, 80/255, 200/255}, 
        {0/255, 100/255, 255/255},
        nil,
        "1"
    )
    myRadioButton.callback = function()
    end
    myRadioButton2 = TGL.radioButton.new(
        myInputbox.x+25, 475, 25, false, 
        {0/255, 80/255, 200/255}, 
        {0/255, 100/255, 255/255},
        nil,
        "1"
    )
    myRadioButton2.callback = function()
    end

    -- Male
    myMaleLabel = TGL.label.new(0, myRadioButton.y-myRadioButton.radius/2, "Male", {0,0,0,1}, 24)
    myMaleLabel.x = myRadioButton.x + myRadioButton.radius*2

    -- Female
    myFemaleLabel = TGL.label.new(0, myRadioButton2.y-myRadioButton2.radius/2, "Female", {0,0,0,1}, 24)
    myFemaleLabel.x = myRadioButton2.x + myRadioButton2.radius*2

    myLabel = TGL.label.new(0, 80, "Enter Your Name", {0,0,0,1}, 24)
    myLabel.x = TGL.label.Xcenter(myLabel.text, myLabel.fontsize)

    myLabel2 = TGL.label.new(0, 190, "Enter Your Password", {0,0,0,1},24)
    myLabel2.x = TGL.label.Xcenter(myLabel2.text, myLabel2.fontsize)

    -- Check Box
    myCheckBox = TGL.checkBox.new(600, 100, 50, 50, 0.8, 5,TGL.color.DARKGRAY, TGL.color.GRAY)
    myCheckBox.onActive = function()
        myCheckBox.active = not myCheckBox.active
        print("active -> " .. tostring(myCheckBox.active))
    end

    -- Progress Bar
    myBar = TGL.progressBar.new(600, 200, 100, 50, 0, TGL.color.BLACK, TGL.color.GREEN, 10, 5, 0.8)

    -- Tool Tip
    myTip = TGL.toolTip.new("Info", "To login Press \nThe Button", 24, TGL.color.BLACK, TGL.color.GRAY, myButton, 5)

    -- Table To Hold all the Test Elements
    GUI = {}
    GUI.Buttons = {myButton}
    GUI.TextInputs = {myInputbox, myInputbox2}
    GUI.RadioButtons = {myRadioButton, myRadioButton2}
    GUI.Labels = {myLabel, myLabel2, myMaleLabel, myFemaleLabel}
    GUI.CheckBoxes = {myCheckBox}
    GUI.ProgressBars = {myBar}
    GUI.ToolTips = {myTip}

end

function love.update(dt)
    -- Mouse Position
    mx, my = love.mouse.getPosition()
    -- Button
    for _, btn in pairs(GUI.Buttons) do
        TGL.button.update(btn, mx, my, dt)
    end
    -- Text Input
    for _, ti in pairs(GUI.TextInputs) do
        TGL.textInput.update(ti, mx, my, dt)
    end
    -- Radio Button
    for _, rbtn in pairs(GUI.RadioButtons) do
        TGL.radioButton.update(rbtn, mx, my, dt)
    end
    -- Check Box
    for _, cb in pairs(GUI.CheckBoxes) do
        TGL.checkBox.update(cb, mx, my, dt)
    end
    -- Progress Bar
    for _, pb in pairs(GUI.ProgressBars) do
        TGL.progressBar.update(pb, dt)
        pb.progress = pb.progress + 1 * dt
    end
    -- Tool Tip
    for _, tt in pairs(GUI.ToolTips) do
        TGL.toolTip.update(tt, mx, my, dt)
    end
end

function love.draw()
    love.graphics.setBackgroundColor(245/255, 245/255, 245/255)
    -- Button
    for _, btn in pairs(GUI.Buttons) do
        TGL.button.draw(btn)
    end
    -- Text Input
    for _, ti in pairs(GUI.TextInputs) do
        TGL.textInput.draw(ti)
    end
    -- Radio Button
    for _, rbtn in pairs(GUI.RadioButtons) do
        TGL.radioButton.draw(rbtn)
    end
    -- Label
    for _, label in pairs(GUI.Labels) do
        TGL.label.draw(label)
    end
    -- Check Box
    for _, cb in pairs(GUI.CheckBoxes) do
        TGL.checkBox.draw(cb)
    end
    -- Progress Bar
    for _, pb in pairs(GUI.ProgressBars) do
        TGL.progressBar.draw(pb)
    end
    -- Tool Tip
    for _, tt in pairs(GUI.ToolTips) do
        TGL.toolTip.draw(tt)
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then
        for _, btn in pairs(GUI.Buttons) do
            if btn.hovered then
                btn.onClick()
            end 
        end
        for _, ti in pairs(GUI.TextInputs) do
            TGL.textInput.mousepressed(ti, x, y)
        end
        for _, rbtn in pairs(GUI.RadioButtons) do
            TGL.radioButton.pressed(rbtn)
        end
        for _, cb in pairs(GUI.CheckBoxes) do
            if cb.hovered then
                cb.onActive()
            end
        end
    end
end

function love.mousereleased(x, y, button)
    for _, btn in pairs(GUI.Buttons) do
        btn.onRelease()
    end
end

function love.keypressed(key)
    for _, ti in pairs(GUI.TextInputs) do
        TGL.textInput.keypressed(ti, key)
    end
end

function love.textinput(text)
    for _, ti in pairs(GUI.TextInputs) do
        TGL.textInput.textinput(ti, text)
    end
end