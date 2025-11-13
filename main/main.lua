function love.load()
	Object = require("main.classic")
	require("main.player")
	require("main.enemy")
	require("main.bullet")

	player = Player()
	enemy = Enemy()

	listOfBullets = {}
end

function love.update(dt)
	player:update(dt)
	enemy:update(dt)

	for i, v in ipairs(listOfBullets) do
		v:update(dt)
		if v:checkCollision(enemy) then
			table.remove(listOfBullets, i)
		end
	end
	if love.keyboard.isDown("space") then
		createBullet(player.x, player.y)
	end
end

function love.draw()
	player:draw()
	enemy:draw()

	for i, v in ipairs(listOfBullets) do
		v:draw()
	end
end

function createBullet(x, y)
	local bullet = Bullet()
	bullet.x = x
	bullet.y = y
	table.insert(listOfBullets, bullet)
end
