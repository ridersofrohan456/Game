function love.load()
	x = 100
	y = 100

	fruits = { "apple", "pear", "banana" }
	table.insert(fruits, "pineapple")
end

function love.update(dt)
	if love.keyboard.isDown("right") then
		x = x + 100 * dt
	elseif love.keyboard.isDown("left") then
		x = x - 100 * dt
	elseif love.keyboard.isDown("up") then
		y = y - 100 * dt
	elseif love.keyboard.isDown("down") then
		y = y + 100 * dt
	end
end

function love.draw()
	love.graphics.rectangle("line", x, y, 200, 150)

	love.graphics.print(fruits[1], 100, 100)
	love.graphics.print(fruits[2], 100, 200)
	love.graphics.print(fruits[3], 100, 300)
	love.graphics.print(#fruits, 100, 400)
end
