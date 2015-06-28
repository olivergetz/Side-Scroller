-- AI AND GRAPHICS FOR ENEMIES

local ui = require ( "scripts.ui" )
local physics = require ( "physics" )
local globalData = require( "globalData" )

local function distanceBetween( pos1, pos2 ) -- y value distance

	local distance = pos1 - pos2

	if distance < 0 then

		distance = distance * (-1)

	end

	return distance

end

function enemyMovement( distance, enemyPosition, playerPosition, lineOfSight, speed )

	if distance < lineOfSight and enemyPosition > playerPosition then -- move left

		enemyPosition = enemyPosition - speed

	elseif distance < lineOfSight and enemyPosition < playerPosition then -- move right

		enemyPosition = enemyPosition + speed

	end

	return enemyPosition

end

local function positionTracker()

	for key,value in pairs(spawnTable) do

		local dist = distanceBetween(globalData.playerPosition, value.y)

		value.y = enemyMovement( dist, value.y, globalData.playerPosition, 500, 8 )

	end

end

Runtime:addEventListener("enterFrame", positionTracker)

-- Spawn Function

function spawnEnemy( image, enemyTable, width, height, x, y ) -- image to use (images/name.png), where to store the object, width, height, and spawn coordinates

	-- Graphics

	local enemy = display.newImage( image ) -- must be local in order to spawn more than one.
	enemy.anchorX = 0
	enemy.anchorY = 0
	enemy.x = x
	enemy.y = y
	enemyPosition = enemy.y
	enemy.height = height
	enemy.width = width
	enemy:rotate( 90 )
	physics.addBody(enemy, "dynamic", {density = 1})
	-- Set enemy index to be 1 more than the las in the table
	enemy.index = #enemyTable + 1
	-- Give the enemy a custom name
	enemy.myName = "Enemy : " .. enemy.index
	--Insert the object into the table at the specified index
	enemyTable[enemy.index] = enemy

	return enemy

end

-- Access spawned enemy, keep track of its y position, manipulate y position based on player position



