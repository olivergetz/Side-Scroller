-- LEVEL 1 - FOREST LEVEL

local ui = require( "scripts.ui" )
local player = require( "scripts.player" )
local enemies = require( "scripts.enemies" )
local storyboard = require( "storyboard" )
local physics = require ( "physics" )
local globalData = require( "globalData" )

physics.start()
physics.setGravity( -10, 0 )

globalData.playerPosition = 50
globalData.backgroundSpeed = 10 -- Should be the same as player speed.
globalData.backgroundMostRight = true
globalData.backgroundMostLeft = false

local levelForest = storyboard.newScene()
spawnTable = {}

function levelForest:createScene( event )

	background = display.newImage("images/backgroundForest.png")
	background.anchorX = 0
	background.anchorY = 0
	background.x = 0
	background.y = 0
	background.height = display.contentHeight * 4
	background.width = display.contentWidth
	globalData.backgroundMostRight = true
	globalData.backgroundMostLeft = false
	staticObjects:insert(background)

	globalData.playerInArena = false

	player.activatePlayer()
	ui.activateUI()

	ground = display.newImage( "images/ground.png", 240, 240)
	ground.anchorX = 0
	ground.anchorY = 0
	ground.x = display.contentWidth / 3
	ground.y = 0
	ground.height = display.contentWidth * 2
	physics.addBody(ground, "static", {density = 1, bounce = 0})
	staticObjects:insert(ground)

	spawnEnemy("images/bandit.png", spawnTable, 50, 150, display.contentWidth / 2, display.contentHeight / 1.5)

end

-- Move background based on player position

function backgroundScroll( event )

	-- Move Background Right

	if globalData.backgroundMostRight == true then

		-- Do Nothing

	elseif globalData.backgroundMostLeft == true then

		-- Do Nothing

	elseif globalData.backgroundMostRight == false and globalData.rightButtonPressed == true then

			staticObjects.y = staticObjects.y - globalData.backgroundSpeed
			globalData.backgroundPosition = staticObjects.y

			if staticObjects.y <= 0 - (display.contentHeight * 3) then

				globalData.backgroundMostLeft = true

			end

			for key, value in pairs(spawnTable) do -- move enemies left

				value.y = value.y - globalData.backgroundSpeed
				globalData.backgroundPosition = value.y

				if value.y <= 0 - (display.contentHeight * 3) then

					globalData.backgroundMostLeft = true

				end

			end

	elseif globalData.backgroundMostRight == false and globalData.leftButtonPressed == true then

			staticObjects.y = staticObjects.y + globalData.backgroundSpeed
			globalData.backgroundPosition = staticObjects.y

			if staticObjects.y == 0 then

				globalData.backgroundMostRight = true

			end

			for key, value in pairs(spawnTable) do -- move enemies right

			value.y = value.y + globalData.backgroundSpeed
			globalData.backgroundPosition = value.y

				if value.y == 0 then

					globalData.backgroundMostRight = true

				end

			end

	end

end

Runtime:addEventListener( "enterFrame", backgroundScroll )

function levelForest:enterScene( event )

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