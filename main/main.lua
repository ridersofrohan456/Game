function love.load()
	image = love.graphics.newImage("images/walk.png")
	local imageWidth = image:getWidth()
	local imageHeight = image:getHeight()

	numTotalFramesPerCycle = 8

	frameWidth = imageWidth / numTotalFramesPerCycle
	frameHeight = imageHeight / 3
	walkingUpFrames = {}
	walkingLeftFrames = {}
	walkingRightFrames = {}
	walkingDownFrames = {}

	for i = 0, numTotalFramesPerCycle do
		table.insert(
			walkingRightFrames,
			love.graphics.newQuad(i * frameWidth, 0, frameWidth, frameHeight, imageWidth, imageHeight)
		)
	end
	for i = 0, numTotalFramesPerCycle do
		table.insert(
			walkingDownFrames,
			love.graphics.newQuad(i * frameWidth, frameHeight, frameWidth, frameHeight, imageWidth, imageHeight)
		)
	end
	for i = 0, numTotalFramesPerCycle do
		table.insert(
			walkingUpFrames,
			love.graphics.newQuad(i * frameWidth, frameHeight * 2, frameWidth, frameHeight, imageWidth, imageHeight)
		)
	end
	currFrame = 1
end

function love.update(dt)
	animate(dt)
end

function love.draw()
	frame = math.floor(currFrame)
	if love.keyboard.isDown("right") then
		love.graphics.draw(image, walkingRightFrames[frame], 100, 100)
	elseif love.keyboard.isDown("left") then
		love.graphics.draw(image, walkingRightFrames[frame], 100, 100, 0, -1, 1, frameWidth, 0)
	elseif love.keyboard.isDown("up") then
		love.graphics.draw(image, walkingUpFrames[frame], 100, 100)
	elseif love.keyboard.isDown("down") then
		love.graphics.draw(image, walkingDownFrames[frame], 100, 100)
	else
		love.graphics.draw(image, walkingDownFrames[4], 100, 100)
		currFrame = 1
	end
end

function animate(dt)
	if currFrame > numTotalFramesPerCycle then
		currFrame = 1
	end
	currFrame = currFrame + 10 * dt
end
