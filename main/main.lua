function love.load()
	Object = require("main.classic")
	require("main.player")
	require("main.background")

	background = Background()
	player = Player()

	print(love.graphics.getHeight()) -- 600
	print(love.graphics.getWidth()) -- 800
end

function love.update(dt)
	player:update(dt)
end

function love.draw()
	background:draw()
	player:draw()
end
