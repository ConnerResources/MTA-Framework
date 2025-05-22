addEvent("guiSlideClick", true)

createdSlides = {}

local clicked = false

Slide = {}
Slide.__index = Slide

function Slide:create(...)
    local instance = setmetatable({}, Slide)
    if instance:constructor(...) then
        createdSlides[instance.element] = instance
        return instance
    end
    return false
end

function Slide:constructor(...)
    self.visible = true

    self.x = arg[1]
    self.y = arg[2]
    self.w = arg[3]
    self.h = arg[4]

    self.cw = arg[5]
    self.ch = arg[6]

    self.minValue = arg[7] or 1
    self.maxValue = arg[8] or 100
    self.radius = arg[9] or 5
    self.colorBg = arg[10] or {0, 0, 0, 255}
    self.barColor = arg[11] or {80, 80, 80, 255}
    self.circleColor = arg[12] or {255, 255, 255, 255}
    self.showedInfo = arg[13] or false

    local bar = string.format([[
        <svg width="%s" height="%s" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect rx="%s" width="%s" height="%s" fill="#FFFFFF" />
        </svg>
    ]], self.w, self.h, self.radius, self.w, self.h)

    local info = string.format([[
        <svg width="%s" height="%s" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect rx="%s" width="%s" height="%s" fill="#FFFFFF" />
        </svg>
    ]], self.w, self.h, 20, self.w, self.h)

    local circle = string.format([[
        <svg width="%s" height="%s" viewBox="0 0 %s %s" fill="none" xmlns="http://www.w3.org/2000/svg">
            <circle cx="%s" cy="%s" r="%s" fill="#FFFFFF"/>
        </svg>
    ]], self.cw, self.ch, self.cw, self.ch, self.cw/2, self.ch/2, self.ch/2)

    self.bar = svgCreate(self.w, self.h, bar)
    self.info = svgCreate(self.w, self.h, info)
    self.circle = svgCreate(self.cw, self.ch, circle)

    self.alpha = 1
    self.element = createElement("dx-slide")
    self.clicked = false
    self.value = 0
    self.old = 0
    self.progress = 0
    self.tick = 0

    self.clickable = true
    return self.element
end

function Slide:draw()
    if not self.visible then return end
    if self.hidding then self:hiddingDraw() end
    if self.showing then self:showingDraw() end
    if self.clicked then
        local cx = getCursorPosition()
        if cx then
            cx = cx * sx
            self.progress = math.min(math.max(cx - self.x, 0), self.w)
        end
        self.value = math.ceil(self.minValue + (self.progress/self.w * (self.maxValue - self.minValue)))
    end

    local interpolateBar = interpolateBetween(self.old, 0, 0, self.value, 0, 0, (getTickCount() - self.tick)/300, "OutQuad")
    dxDrawImage(self.x, self.y, self.w, self.h, self.bar, 0, 0, 0, tocolor(self.colorBg[1], self.colorBg[2], self.colorBg[3], self.colorBg[4] * self.alpha), true)
    dxDrawImage(self.x, self.y, self.progress, self.h, self.bar, 0, 0, 0, tocolor(self.barColor[1], self.barColor[2], self.barColor[3], self.barColor[4] * self.alpha), true)
    dxDrawImage(self.x + self.progress - (self.cw/2), self.y + (self.h - self.ch)/2, self.cw, self.ch, self.circle, 0, 0, 0, tocolor(self.circleColor[1], self.circleColor[2], self.circleColor[3], self.circleColor[4] * self.alpha), true)
    if self.showedInfo then
        if not self.clicked then return end
        dxDrawImage(self.x + interpolateBar - self.cw/2 - 6/zoom, self.y - self.h - 25/zoom, self.cw + 12/zoom, self.ch, self.info, 0, 0, 0, tocolor(255, 255, 255, 255 * self.alpha), true)
        dxDrawText(self.value, self.x + interpolateBar - self.cw/4 + 7/zoom, self.y - self.h - 10/zoom, self.x + interpolateBar - self.cw/4 + 7/zoom, self.y - self.h - 10/zoom, tocolor(0, 0, 0, 255 * self.alpha), 1, "default-bold", "center", "center")
    end
end

function Slide:hiddingDraw()
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

function Slide:showingDraw()
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
  
function Slide:click(state)
    if not self.visible then return end
    if not self.clickable then return end
    if state == "down" then
        if isMouseInPosition(self.x - self.ch, self.y - self.ch/2, self.w + (self.ch + self.ch), self.ch + self.ch) then
            if clicked then return end
            self.clicked = true
            clicked = true
            self.old = self.value
            self.tick = getTickCount()
            triggerEvent("guiSlideClick", root, self.element, "down")
        end
    else
        if self.clicked then
            triggerEvent("guiSlideClick", root, self.element, "up")
        end
        self.clicked = false
        clicked = false
    end
end

function Slide:destroy()
    createdSlides[self.element] = nil
    if isElement(self.element) then destroyElement(self.element) end
    self = nil
    return true
end

function Slide:setVisible(...)
    self.visible = arg[1]
    return true
end

function Slide:getValue()
    return self.value
end

function Slide:setValue(...)
    self.old = self.value
    self.value = arg[1]
    self.progress = (arg[1]/self.maxValue) * self.w
    self.tick = getTickCount()
end

function Slide:setX(...)
    self.x = arg[1]
    return true
end

function Slide:setY(...)
    self.y = arg[1]
    return true
end

function Slide:hide(...)
    if not self.visible then return end
    self.alphaCurrent = self.alpha
    self.hidding = getTickCount()
    self.actionTime = arg[1] or 500
    self.easing = arg[2] or "OutQuad"
    self.clickable = nil
    return true
end
  
function Slide:show(...)
    if self.visible then return end
    self.alphaCurrent = self.alpha
    self.showing = getTickCount()
    self.actionTime = arg[1] or 500
    self.easing = arg[2] or "OutQuad"
    self.visible = true
    return true
end

function Slide:setOwner(...)
    self.owner = arg[1]
    return true
end
  
function Slide:getOwner()
    return self.owner
end

function createSlide(...)
    slide = Slide:create(...)
    slide:setOwner(getResourceName(sourceResource))
    return slide.element
end

function showSlide(...)
    if type(arg[1]) == "table" then
      for _, v in pairs(arg[1]) do
        createdSlides[v]:show(arg[2], arg[3])
      end
    else
        createdSlides[arg[1]]:show(arg[2], arg[3])
    end
    return true
end

function hideSlide(...)
    if type(arg[1]) == "table" then
        for _, v in pairs(arg[1]) do
        createdSlides[v]:hide(arg[2], arg[3])
        end
    else
        createdSlides[arg[1]]:hide(arg[2], arg[3])
    end
    return true
end

function destroySlide(...)
    if not arg[1] then return end
    if type(arg[1]) == "table" then
        for _, v in pairs(arg[1]) do
            createdSlides[v]:destroy()
        end
    else
        createdSlides[arg[1]]:destroy()
    end
    return true
end

function getSlideValue(...)
    return createdSlides[arg[1]]:getValue()
end

function setSlideValue(...)
    if type(arg[1]) == "table" then
        for _, v in pairs(arg[1]) do
            createdSlides[v]:setValue(arg[2])
        end
    else
        createdSlides[arg[1]]:setValue(arg[2])
    end
    return true
end

function setSlideVisible(...)
    if type(arg[1]) == "table" then
        for _, v in pairs(arg[1]) do
            createdSlides[v]:setVisible(arg[2])
        end
    else
        createdSlides[arg[1]]:setVisible(arg[2])
    end
    return true
end

function setSlideX(...)
    if type(arg[1]) == "table" then
        for _, v in pairs(arg[1]) do
            createdSlides[v[1]]:setX(v[2])
        end
    else
        createdSlides[arg[1]]:setX(arg[2])
    end
    return true
end

function setSlideY(...)
    if type(arg[1]) == "table" then
        for _, v in pairs(arg[1]) do
            createdSlides[v]:setY(arg[2])
        end
    else
        createdSlides[arg[1]]:setY(arg[2])
    end
    return true
end

function renderSlides()
    for i, v in pairs(createdSlides) do
        v:draw()
    end
end
addEventHandler("onClientRender", root, renderSlides)

function clickSlides(btn, state)
    if btn == "left" then
        for i, v in pairs(createdSlides) do
            v:click(state)
        end
    end
end
addEventHandler("onClientClick", root, clickSlides)
