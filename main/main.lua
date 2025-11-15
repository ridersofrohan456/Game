function love.load()
	image = love.graphics.newImage("images/jump.png")
	frames = {}

	local frameWidth = 117
	local frameHeight = 223
	local imageWidth = image:getWidth()
	local imageHeight = image:getHeight()

	for i = 0, 4 do
		table.insert(frames, love.graphics.newQuad(i * frameWidth, 0, frameWidth, frameHeight, imageWidth, imageHeight))
	end

	currFrame = 1
	goingUp = true
end

function love.update(dt)
	if currFrame > 5 then
		goingUp = false
		currFrame = 5
	end

	if goingUp and currFrame <= 5 then
		currFrame = currFrame + 5 * dt
	elseif not goingUp and currFrame > 1 then
		currFrame = currFrame - 5 * dt
	end

	if currFrame < 1 then
		goingUp = true
		currFrame = 1
	end
end

function love.draw()
	local sec = math.floor(currFrame)
	print(sec)
	love.graphics.draw(image, frames[sec], 100, 100)
end
