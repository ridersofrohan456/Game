function love.load()
	Object = require("main.classic")
	require("main.player")

	player = Player()
end

function love.update(dt)
	player:update(dt)
end

function love.draw()
	player:draw()
end
