function love.load()
	frames = {}
	for i = 1, 5 do
		table.insert(frames, love.graphics.newImage("images/jump" .. i .. ".png"))
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
	local frameNum = math.floor(currFrame)
	print(frameNum)
	love.graphics.draw(frames[frameNum])
end
