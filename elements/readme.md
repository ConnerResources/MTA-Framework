# Switch
This switch, when created, will be positioned on the client's screen, and when clicked, it will trigger an "on and off" animation. You can check and apply the on/off status, as well as other functions.

## createSwitch
Create a switch.
``` lua
element createSwitch ( float startX, float startY, float width, float height [, bool selected = false ] )
```
### Required Arguments
- **startX:** An float representing the absolute origin X position of the rectangle, represented by pixels on the screen.
- **startY:** An float representing the absolute origin Y position of the rectangle, represented by pixels on the screen.
- **width:** An float representing the width of the rectangle, drawn in a right direction from the origin.
- **height:** An float representing the height of the rectangle, drawn in a downwards direction from the origin.

### Optional Arguments
- **selected:** A boolean that indicates whether the switch will be created as selected (on).

### Returns
Returns the switch `element` if it was successfully created.

### Client-side example
```lua
local sx, sy = guiGetScreenSize()
local zoom = 1
local baseX = 1920
local minZoom = 2
if sx < baseX then
    zoom = math.min(minZoom, baseX/sx)
end

function createSwitchOnCenterScreen()
    local switch = exports.Framework:createSwitch((sx - 100/zoom)/2, (sy - 50/zoom)/2, 100/zoom, 50/zoom)
end

createSwitchOnCenterScreen()
```

## destroySwitch
Destroys a switch.
``` lua
bool destroySwitch ( table/element switch )
```
### Required Arguments
- **switch:** Switch table or element you want to destroy.

### Returns
Returns `true` if the operation was successful, otherwise returns `false`.

## showSwitch
Show switch with pop-up animation.
``` lua
bool showSwitch ( table/element switch [, float actionTime = 500, string easing = "OutQuad" ] )
```
### Required Arguments
- **switch:** Table or switch element you want to show.

### Optional Arguments
- **actionTime:** A number of milliseconds for the animation to complete.
- **easing:** The [easing function](https://wiki.multitheftauto.com/wiki/Easing) to use for the interpolation.

## hideSwitch
Hide switch with fading animation.
``` lua
bool hideSwitch ( table/element switch [, float actionTime = 500, string easing = "OutQuad" ] )
```
### Required Arguments
- **switch:** Table or switch element you want to hide.

### Optional Arguments
- **actionTime:** A number of milliseconds for the animation to complete.
- **easing:** The [easing function](https://wiki.multitheftauto.com/wiki/Easing) to use for the interpolation.

### Returns
Returns `true` if the operation was successful, otherwise returns `false`.

## setSwitchVisible
Change switch display without animation.
``` lua
bool setSwitchVisible ( table/element switch, bool isVisible)
```
### Required Arguments
- **switch:** Table or switch element you want to destroy.
- **isVisible:** A boolean indicating whether we want to show (true) or hide it (false).

### Returns
Returns `true` if the operation was successful, otherwise returns `false`.

## isSwitchSelected
Checks whether the switch is on or off.
``` lua
bool isSwitchSelected ( element switch )
```
### Required Arguments
- **switch:** Switch element you want to check the status of.

### Returns
Returns `true` if the switch is on, otherwise returns `false`.

## setSwitchSelected
Sets the switch to on or off status.
``` lua
bool setSwitchSelected ( element switch, bool selected )
```
### Required Arguments
- **switch:** Switch element you want to apply the status to.
- **selected:** A boolean that indicates whether we want to turn it on (true) or off (false).

### Returns
Returns `true` if the operation was successful, otherwise returns `false`.



# Button
This button, when created, will be positioned on the customer's screen and when clicked, an animation will be executed on the "selected" button.

## createButton
Create a button.
``` lua
element createButton ( float startX, float startY, float width, float height [, string text = "", string color = "gray", table colorText = {255, 255, 255, 255} ] )
```
### Required Arguments
- **startX:** An float representing the absolute origin X position of the rectangle, represented by pixels on the screen.
- **startY:** An float representing the absolute origin Y position of the rectangle, represented by pixels on the screen.
- **width:** An float representing the width of the rectangle, drawn in a right direction from the origin.
- **height:** An float representing the height of the rectangle, drawn in a downwards direction from the origin.

### Optional Arguments
- **text:** A string with the name that will appear above the button.
- **color:** A string with the button's color. Default colors: (grey) and (green).
- **colorText:** A table with the R, G, B, A values for the colors in which the `text` should appear.

### Returns
Returns the button `element` if it was successfully created.

### Client-side example
```lua
local sx, sy = guiGetScreenSize()
local zoom = 1
local baseX = 1920
local minZoom = 2
if sx < baseX then
    zoom = math.min(minZoom, baseX/sx)
end

function createButtonOnCenterScreen()
    local button = exports.Framework:createButton((sx - 100/zoom)/2, (sy - 50/zoom)/2, 100/zoom, 50/zoom, "Test")
end

createButtonOnCenterScreen()
```

## destroyButton
Destroys a button.
``` lua
bool destroyButton ( table/element button )
```
### Required Arguments
- **button:** Table or button element you want to destroy.

### Returns
Returns `true` if the operation was successful, otherwise returns `false`.

## setButtonText
Changes the text above the button.
``` lua
bool setButtonText ( table/element button, string text )
```
### Required Arguments
- **button:** Table or button element you want to change the text of.
- **text:** A string with the new name that will appear above the button.

### Returns
Returns `true` if the operation was successful, otherwise returns `false`.

## getButtonText
Get the text that sits above the button.
``` lua
bool getButtonText ( element button )
```
### Required Arguments
- **button:** Button element you want to get the text from.

### Returns
Returns a `string` with the current text of the button.

## setButtonVisible
Change the display of the button without animation.
``` lua
bool setButtonVisible ( table/element button, bool isVisible)
```
### Required Arguments
- **button:** Table or button element you want to apply visibility to.
- **isVisible:** A boolean indicating whether we want to show (true) or hide it (false).

### Returns
Returns `true` if the operation was successful, otherwise returns `false`.

## showButton
Show button with pop-up animation.
``` lua
bool showButton ( table/element button [, float actionTime = 500, string easing = "OutQuad" ] )
```
### Required Arguments
- **button:** Table or button element you want to show.

### Optional Arguments
- **actionTime:** A number of milliseconds for the animation to complete.
- **easing:** The [easing function](https://wiki.multitheftauto.com/wiki/Easing) to use for the interpolation.

### Returns
Returns `true` if the operation was successful, otherwise returns `false`.

## hideButton
Hide button with fading animation.
``` lua
bool hideButton ( table/element button [, float actionTime = 500, string easing = "OutQuad" ] )
```
### Required Arguments
- **button:** Table or button element you want to hide.

### Optional Arguments
- **actionTime:** A number of milliseconds for the animation to complete.
- **easing:** The [easing function](https://wiki.multitheftauto.com/wiki/Easing) to use for the interpolation.

### Returns
Returns `true` if the operation was successful, otherwise returns `false`.

## setButtonX
Change the horizontal position of a button.
``` lua
bool setButtonX ( table/element button, float startX)
```
### Required Arguments
- **button:** Table or button element that changes position.
- **startX:** An float representing the absolute origin X position of the rectangle, represented by pixels on the screen.

### Returns
Returns `true` if the operation was successful, otherwise returns `false`.

## setButtonY
Change the vertical position of a button.
``` lua
bool setButtonX ( table/element button, float startY)
```
### Required Arguments
- **button:** Table or button element that changes position.
- **startY:** An float representing the absolute origin Y position of the rectangle, represented by pixels on the screen.

### Returns
Returns `true` if the operation was successful, otherwise returns `false`.


# Response
This responsive function was created with the intention of blocking a player's actions while he waits for a response to an event, widely used for server/client communications.

## setResponseEnabled
Apply whether you are waiting for any response or not.
``` lua
bool setResponseEnabled ( bool response )
```
### Required Arguments
- **response:** A boolean indicating whether we want to leave it waiting for a response (true) or close it (false).

### Returns
Returns `true` if the response is being awaited, otherwise returns `false`.

## isResponseEnabled
Check if you are waiting for a response.
``` lua
bool isResponseEnabled ( )
```
### Returns
Returns `true` if the response is being awaited, otherwise returns `false`.



# Gui
This function was made to identify if a GUI is open.

## setOpenGUI
Enforce whether a GUI is open or not.
``` lua
bool setOpenGUI ( bool opened )
```
### Required Arguments
- **opened:** A boolean indicating whether a GUI is open (true) or not (false).

### Returns
Returns `true` if a GUI is open, otherwise returns `false`.

## canOpenGUI
Check if the player can open another GUI.
``` lua
bool canOpenGUI ( )
```
### Returns
Returns `true` if a GUI is not open, otherwise returns `false`.


# Escape
This function was created to check if the player is out of the game.

## setEscapeOpen
Apply whether a player is out of the game or not.
``` lua
bool setEscapeOpen ( bool opened )
```
### Required Arguments
- **opened:** A boolean indicating whether a player is out of the game (true) or not (false).

### Returns
Returns `true` if the player is out of the game, otherwise returns `false`.

## isEscapeOpen
Check if the player is out of the game.
``` lua
bool isEscapeOpen ( )
```
### Returns
Returns `true` if the player is out of the game, otherwise returns `false`.
