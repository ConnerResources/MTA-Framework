addEvent("guiButtonClick", true)

createdButtons = {}

Button = {}
Button.__index = Button

function Button:create(...)
    local instance = {}
    setmetatable(instance, Button)
    if instance:constructor(...) then
        createdButtons[instance.element] = instance
        return instance
    end
    return false
end

function Button:constructor(...)
    self.font = getFont(17, "Inter-Medium")
    
    self.x = arg[1]
    self.y = arg[2]
    self.w = arg[3]
    self.h = arg[4]
    self.text = arg[5] or ""

    local raw = string.format([[
        <svg width="%s" height="%s" xmlns="http://www.w3.org/2000/svg">
        <rect rx="%s" width="%s" height="%s" fill="white" />
        </svg>
    ]], self.w, self.h, 6, self.w, self.h)
    self.bg = svgCreate(self.w, self.h, raw)

    local colors = getButtonColor(arg[6]) or getButtonColor("gray")
    self.colorLight = colors["light"]
    self.colorDark = colors["dark"]
    self.colorRed = colors["red"]
    self.textColor = arg[7] and arg[7] or {255, 255, 255, 255}

    self.alpha = 1
    self.element = createElement("dx-button")
    self.visible = true
    self.defColor = self.colorLight
    self.defDark = self.colorDark
    self.defRed = self.colorRed
    self.clickable = true
    return true
end

function Button:destroy()
    createdButtons[self.element] = nil
    if isElement(self.element) then destroyElement(self.element) end
    self = nil
    return true
end

function Button:draw()
    if not self.visible then return end
    if self.hidding then self:hiddingDraw() end
    if self.showing then self:showingDraw() end
    dxDrawImage(self.x, self.y, self.w, self.h, self.bg, 0, 0, 0, tocolor(self.colorDark[1], self.colorDark[2], self.colorDark[3], self.colorDark[4] * self.alpha), true)

    self:hoverDraw()
    dxDrawText(self.text, self.x+4/zoom, self.y+6/zoom, self.x+4/zoom + self.w-6/zoom, self.y+6/zoom + self.h-6/zoom, tocolor(self.textColor[1], self.textColor[2], self.textColor[3], self.textColor[4] * self.alpha), 1/zoom, self.font, "center", "center", true, true, true)
end

function Button:hoverDraw()
    if isMouseInPosition(self.x, self.y, self.w, self.h) then
        if not self.hover and self.clickable and not isResponseEnabled() then
        self.hover = true

        self.hoverEffects = {
            tick = getTickCount(),
            timeToMove = 150 - (self.hoverEffects and self.hoverEffects.w and (self.hoverEffects.w/self.w * 150 + 1) or 1),
            state = "showing",
            lastW = self.hoverEffects and self.hoverEffects.w or 0,
            w = self.hoverEffects and self.hoverEffects.w or 0,
        }
        end
    else
        self.hover = nil

        if self.hoverEffects then
            if self.hoverEffects.state ~= "hidding" then
                self.hoverEffects.tick = getTickCount()
                self.hoverEffects.timeToMove = (self.hoverEffects and self.hoverEffects.w and (self.hoverEffects.w/self.w * 150 + 1) or 1)
                self.hoverEffects.state = "hidding"
                self.hoverEffects.lastW = self.hoverEffects.w
            end
        end
    end

    if self.hoverEffects then
        if self.hoverEffects.state == "showing" then
        local progress = (getTickCount() - self.hoverEffects.tick)/self.hoverEffects.timeToMove
        self.hoverEffects.w, _, _ = interpolateBetween(self.hoverEffects.lastW, 0, 0, self.w, 0, 0, progress, "OutQuad")
        dxDrawImage(self.x + self.w/2 - self.hoverEffects.w/2, self.y, self.hoverEffects.w, self.h, self.bg, 0, 0, 0, tocolor(self.colorLight[1], self.colorLight[2], self.colorLight[3], self.colorLight[4] * self.alpha), true)

        if progress >= 1 then
            self.hoverEffects.state = "hovered"
            self.hoverEffects.tick = nil
            self.hoverEffects.w = self.w
            self.hoverEffects.lastW = self.w
        end

        elseif self.hoverEffects.state == "hovered" then
            dxDrawImage(self.x, self.y, self.w, self.h, self.bg, 0, 0, 0, tocolor(self.colorLight[1], self.colorLight[2], self.colorLight[3], self.colorLight[4] * self.alpha), true)

        elseif self.hoverEffects.state == "hidding" then
            local progress = (getTickCount() - self.hoverEffects.tick)/self.hoverEffects.timeToMove
            self.hoverEffects.w, _, _ = interpolateBetween(self.hoverEffects.lastW, 0, 0, 0, 0, 0, progress, "OutQuad")
            dxDrawImage(self.x + self.w/2 - self.hoverEffects.w/2, self.y, self.hoverEffects.w, self.h, self.bg, 0, 0, 0, tocolor(self.colorLight[1], self.colorLight[2], self.colorLight[3], self.colorLight[4] * self.alpha), true)

            if progress >= 1 then
                self.hoverEffects = nil
            end
        end
    end
end

function Button:hiddingDraw()
    local progress = (getTickCount() - self.hidding)/ (self.actionTime and self.actionTime or 500)
    self.alpha, _, _ = interpolateBetween(self.alphaCurrent, 0, 0, 0, 0, 0, progress, self.easing)
    if progress >= 1 then
        self.alphaCurrent = nil
        self.easing = nil
        self.hidding = nil
        self.actionTime = nil
        self.visible = nil
        self.hover = nil
    end
end

function Button:showingDraw()
    local progress = (getTickCount() - self.showing)/ self.actionTime
    self.alpha = interpolateBetween(self.alphaCurrent, 0, 0, 1, 0, 0, progress, self.easing)
    if progress >= 1 then
        self.alphaCurrent = nil
        self.easing = nil
        self.showing = nil
        self.actionTime = nil
        self.clickable = true
    end
end

function Button:setText(...)
    self.text = arg[1]
    return true
end

function Button:setX(...)
    self.x = arg[1]
    return true
end

function Button:setY(...)
    self.y = arg[1]
    return true
end

function Button:setColor(...)
    local colors = getButtonColor(arg[1])
    return colors[arg[2]]
end

function Button:getText(...)
    return self.text
end

function Button:hide(...)
    if not self.visible then return end
    self.alphaCurrent = self.alpha
    self.hidding = getTickCount()
    self.actionTime = arg[1] or 500
    self.easing = arg[2] or "OutQuad"
    self.clickable = nil
    return true
end

function Button:show(...)
    if self.visible then return end
    self.alphaCurrent = self.alpha
    self.showing = getTickCount()
    self.actionTime = arg[1] or 500
    self.easing = arg[2] or "OutQuad"
    self.visible = true
    self.hoverEffects = nil
    return true
end

function Button:click(state)
    if isMouseInPosition(self.x, self.y, self.w, self.h) and getKeyState("mouse1") and self.clickable and self.visible then
        if not self.clicked then
        self.colorDark = {self.colorLight[1], self.colorLight[2], self.colorLight[3], self.colorLight[4]}
        end

        self.clicked = true
    else
        if self.clicked then
        self.colorDark = self.defDark
            if isMouseInPosition(self.x, self.y, self.w, self.h) and not isResponseEnabled() and not isEscapeOpen() then
                triggerEvent("guiButtonClick", root, self.element)
            end
        end
        self.clicked = nil
    end
end

function Button:setVisible(...)
    self.visible = arg[1]
    if self.visible then
        self.alpha = 1
        self.hover = nil
        self.hoverEffects = nil
    else
        self.alpha = 0
        self.hover = nil
        self.hoverEffects = nil
    end
end

function Button:setOwner(...)
    self.owner = arg[1]
end
  
function Button:getOwner()
    return self.owner
end

function createButton(...)
    local button = Button:create(...)
    button:setOwner(getResourceName(sourceResource))
    return button.element
end

function destroyButton(...)
    if type(arg[1]) == "table" then
        for _, v in pairs(arg[1]) do
        createdButtons[v]:destroy()
        end
    else
        createdButtons[arg[1]]:destroy()
    end
    return true
end

function setButtonText(...)
    if type(arg[1]) == "table" then
        for _, v in pairs(arg[1]) do
        createdButtons[v]:setText(arg[2])
        end
    else
        createdButtons[arg[1]]:setText(arg[2])
    end
    return true
end

function getButtonText(...)
    return createdButtons[arg[1]]:getText(arg[2])
end

function setButtonX(...)
    if type(arg[1]) == "table" then
        for _, v in pairs(arg[1]) do
        createdButtons[v]:setX(arg[2])
        end
    else
        createdButtons[arg[1]]:setX(arg[2])
    end
    return true
end

function setButtonY(...)
    if type(arg[1]) == "table" then
        for _, v in pairs(arg[1]) do
        createdButtons[v]:setY(arg[2])
        end
    else
        createdButtons[arg[1]]:setY(arg[2])
    end
    return true
end

function showButton(...)
    if type(arg[1]) == "table" then
        for _, v in pairs(arg[1]) do
        createdButtons[v]:show(arg[2], arg[3])
        end
    else
        createdButtons[arg[1]]:show(arg[2], arg[3])
    end
    return true
end

function hideButton(...)
    if type(arg[1]) == "table" then
        for _, v in pairs(arg[1]) do
        createdButtons[v]:hide(arg[2], arg[3])
        end
    else
        createdButtons[arg[1]]:hide(arg[2], arg[3])
    end
    return true
end

function setButtonVisible(...)
    if type(arg[1]) == "table" then
        for _, v in pairs(arg[1]) do
        createdButtons[v]:setVisible(arg[2])
        end
    else
        createdButtons[arg[1]]:setVisible(arg[2])
    end
    return true
end

function renderButtons()
    for i, v in pairs(createdButtons) do
        v:draw()
    end
end
addEventHandler("onClientRender", root, renderButtons)

function clickButtons(btn, state)
    if btn == "left" then
        for i, v in pairs(createdButtons) do
        v:click(state)
        end
    end
end
addEventHandler("onClientClick", root, clickButtons)