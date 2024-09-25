sx, sy = guiGetScreenSize()
zoom = 1
local baseX = 1920
local minZoom = 2
if sx < baseX then
  zoom = math.min(minZoom, baseX/sx)
end

guiData = {
    fonts = {},
    svgs = {},
}

function getFont(size, family)
    local font = guiData.fonts[string.format("size_%s_%d", family and family or "Inter-Regular", size)]
    if not font then font = createFont(size, family) end
    return font
end

function createFont(size, family)
    if not family then return false end
    guiData.fonts[string.format("size_%s_%d", family and family or "Inter-Regular", size)] = dxCreateFont(string.format("files/fonts/%s.ttf", family and family or "Inter-Regular"), size, false)
    return guiData.fonts[string.format("size_%s_%d", family and family or "Inter-Regular", size)]
end