-- Player Class --

Player = Object:extend()

function Player:new()
	-- x, y are starting position coordinates --
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() / 2
	self.speed = 100

	-- animation frame data --
	image = love.graphics.newImage("images/walk.png")
	numFrames = 8
	frameHeight = image:getHeight() / 3
	frameWidth = image:getWidth() / numFrames

	self.frames = {}
	self.frames["right"] = {}
	self.frames["up"] = {}
	self.frames["down"] = {}
	loadQuads(self)

	currFrame = 1
	facingDirection = "down"
end

function Player:update(dt)
	-- animation updates --
	if currFrame > numFrames or not isAnyDirectionalDown() then
		currFrame = 1
	else
		currFrame = currFrame + 10 * dt
	end

	-- position updates --
	if love.keyboard.isDown("up") then
		self.y = self.y - self.speed * dt
		facingDirection = "up"
	elseif love.keyboard.isDown("down") then
		self.y = self.y + self.speed * dt
		facingDirection = "down"
	elseif love.keyboard.isDown("left") then
		self.x = self.x - self.speed * dt
		facingDirection = "left"
	elseif love.keyboard.isDown("right") then
		self.x = self.x + self.speed * dt
		facingDirection = "right"
	end
end

function Player:draw()
	local frame = math.floor(currFrame)
	local scaling = 2
	if love.keyboard.isDown("up") then
		love.graphics.draw(image, self.frames["up"][frame], self.x, self.y, 0, scaling, scaling)
	elseif love.keyboard.isDown("down") then
		love.graphics.draw(image, self.frames["down"][frame], self.x, self.y, 0, scaling, scaling)
	elseif love.keyboard.isDown("right") then
		love.graphics.draw(image, self.frames["right"][frame], self.x, self.y, 0, scaling, scaling)
	elseif love.keyboard.isDown("left") then
		love.graphics.draw(image, self.frames["right"][frame], self.x, self.y, 0, -scaling, scaling, frameWidth, 0) -- flip right image
	else
		if facingDirection == "left" then
			love.graphics.draw(image, self.frames["right"][frame], self.x, self.y, 0, -scaling, scaling, frameWidth, 0) -- flip right image
		else
			love.graphics.draw(image, self.frames[facingDirection][1], self.x, self.y, 0, scaling, scaling)
		end
		currFrame = 1
	end
end

function loadQuads(self)
	for i = 0, numFrames do
		table.insert(
			self.frames["right"],
			love.graphics.newQuad(i * frameWidth, 0, frameWidth, frameHeight, image:getWidth(), image:getHeight())
		)
	end

	for i = 0, numFrames do
		table.insert(
			self.frames["down"],
			love.graphics.newQuad(
				i * frameWidth,
				frameHeight,
				frameWidth,
				frameHeight,
				image:getWidth(),
				image:getHeight()
			)
		)
	end

	for i = 0, numFrames do
		table.insert(
			self.frames["up"],
			love.graphics.newQuad(
				i * frameWidth,
				frameHeight * 2,
				frameWidth,
				frameHeight,
				image:getWidth(),
				image:getHeight()
			)
		)
	end
end

function isAnyDirectionalDown()
	return love.keyboard.isDown("up")
		or love.keyboard.isDown("down")
		or love.keyboard.isDown("left")
		or love.keyboard.isDown("right")
end
