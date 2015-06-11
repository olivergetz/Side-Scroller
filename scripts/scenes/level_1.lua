local ui = require("scripts.ui")
local player = require("scripts.player")
local storyboard = require( "storyboard" )
local physics = require "physics"

physics.start()
physics.setGravity( -7, 0 )

local scene = storyboard.newScene()

function scene:createScene( event )

	local background = display.newImage("images/background.png")
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0
	background.y = 0
	background.height = display.contentHeight
	background.width = display.contentWidth

	player.activatePlayer()
	ui.activateUI()

	ground = display.newImage( "images/ground.png", 240, 240)
	ground.anchorX = 0
	ground.anchorY = 0
	ground.x = display.contentWidth / 3
	ground.y = 0
	physics.addBody(ground, "static", {density = 1, bounce = 0})

end

function scene:enterScene( event )

end

function scene:exitScene( event )

end

function scene:destroyScene( event )

end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene