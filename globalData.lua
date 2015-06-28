-- Graphics Layering Groups

backgroundGraphicsLayer = display.newGroup()
staticObjects = display.newGroup() -- Objects that should appear static when the player moves
uiGraphicsLayer = display.newGroup()
buttonsGraphicsLayer = display.newGroup()
playerGraphicsLayer = display.newGroup()

-- Variables to be accessed between modules

-- Player Variables

local playerData = {}

return playerData