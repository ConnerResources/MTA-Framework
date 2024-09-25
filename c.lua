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

    buttonColor = {
        ["gray"] = {
          dark = {23, 25, 31, 255},
          light = {34, 36, 43, 255},
        },
        ["green"] = {
          dark = {173, 205, 69, 255},
          light = {207, 242, 103, 255},
        }
    },
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

function createSvg(id, w, h, radius)
    local raw = string.format([[
        <svg width="%s" height="%s" xmlns="http://www.w3.org/2000/svg">
        <rect rx="%s" width="%s" height="%s" fill="white" />
        </svg>
    ]], w, h, radius, w, h)
    if id then
        guiData.svgs[id] = svgCreate(w, h, raw)
    else
        return svgCreate(w, h, raw)
    end
end

function getButtonColor(color)
    return guiData.buttonColor[color] and guiData.buttonColor[color] or false
end

function isMouseInPosition(x, y, width, height)
	if (not isCursorShowing()) then
		return false
	end
    local cx, cy = getCursorPosition()
    local cx, cy = (cx*sx), (cy*sy)
    if (cx >= x and cx <= x + width) and (cy >= y and cy <= y + height) then
        return true
    else
        return false
    end
end