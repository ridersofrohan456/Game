function love.load()
	Object = require("main.classic")
	require("main.player")
	require("main.enemy")

	player = Player()
	enemy = Enemy()
end

function love.update(dt)
	player:update(dt)
	enemy:update(dt)
end

function love.draw()
	player:draw()
	enemy:draw()
end

function checkCollision(a, b)
	local a_left = a.x
	local a_right = a.x + a.width
	local a_top = a.y
	local a_bottom = a.y + a.height

	local b_left = b.x
	local b_right = b.x + b.width
	local b_top = b.y
	local b_bottom = b.y + b.height

	-- check if any edges cross
	return a_left < b_right and a_top < b_bottom and a_right > b_left and a_bottom > b_top
end
