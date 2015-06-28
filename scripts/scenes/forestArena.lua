local ui = require( "scripts.ui" )
local player = require( "scripts.player" )
local storyboard = require( "storyboard" )
local physics = require ( "physics" )
local globalData = require( "globalData" )

physics.start()
physics.setGravity( -10, 0 )

local forestArena = storyboard.newScene()
local playerPosition = globalData.playerPosition

function forestArena:createScene( event )

	forestArenaBackground = display.newImage("images/backgroundForest.png")
	forestArenaBackground.anchorX = 0
	forestArenaBackground.anchorY = 0
	forestArenaBackground.x = 0
	forestArenaBackground.y = 0
	forestArenaBackground.height = display.contentHeight
	forestArenaBackground.width = display.contentWidth
	globalData.backgroundMostRight = true
	globalData.backgroundMostLeft = false

	globalData.playerInArena = true

	player.activatePlayer()
	ui.activateUI()

	ground = display.newImage( "images/ground.png", 240, 240)
	ground.anchorX = 0
	ground.anchorY = 0
	ground.x = display.contentWidth / 3
	ground.y = 0
	ground.height = display.contentWidth * 2
	physics.addBody(ground, "static", {density = 1, bounce = 0})

end

function fore:enterScene( event )

end

function levelForest:exitScene( event )

end

-- Clean Up

function levelForest:destroyScene( event )

end

levelForest:addEventListener( "createScene", levelForest )
levelForest:addEventListener( "enterScene", levelForest )
levelForest:addEventListener( "exitScene", levelForest )
levelForest:addEventListener( "destroyScene", levelForest )

return levelForest