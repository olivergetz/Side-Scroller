local storyboard = require( "storyboard" )
local globalData = require( "globalData" )
local scene = storyboard.newScene()

local function buttonHit( event )

	storyboard.gotoScene(event.target.goto, { effect="slideRight" })

	return true

end

function scene:createScene( event )
	local group = self.view

	local title = display.newText("Side-Scroller", 0, 0, "Helvetica", 128)

	title.x = 2 * (display.contentWidth / 3)
	title.y = display.contentHeight / 2
	title:rotate( 90 )
	group:insert(title)

	local playbtn = display.newText("Play", 0, 0, "Helvetica", 72)

	playbtn.x = title.x - (display.contentWidth / 5)
	playbtn.y = display.contentHeight / 2
	playbtn:rotate( 90 )
	playbtn.goto = "scripts.scenes.levelForest"
	playbtn:addEventListener("tap", buttonHit)
	group:insert(playbtn)

	local optionsbtn = display.newText("Options", 0, 0, "Helvetica", 72)

	optionsbtn.x = playbtn.x - (display.contentWidth / 10)
	optionsbtn.y = display.contentHeight / 2
	optionsbtn:rotate( 90 )
	optionsbtn.goto = "scripts.scenes.options"
	optionsbtn:addEventListener("tap", buttonHit)
	group:insert(optionsbtn)

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