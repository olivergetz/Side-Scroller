local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local function buttonHit( event )
	storyboard.gotoScene(event.target.goto, { effect="slideLeft" })
	return true
end

function scene:createScene( event )
	local group = self.view

	local title = display.newText("Options", 0, 0, "Helvetica", 128)

	title.x = 2 * (display.contentWidth / 3)
	title.y = display.contentHeight / 2
	title:rotate( 90 )
	group:insert(title)

	local backbtn = display.newText("Back", 0, 0, "Helvetica", 72)

	backbtn.x = title.x - (display.contentWidth / 5)
	backbtn.y = display.contentHeight / 2
	backbtn:rotate( 90 )
	backbtn.goto = "scripts.scenes.menu"
	backbtn:addEventListener("tap", buttonHit)
	group:insert(backbtn)

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