Player = Object:extend()

function Player:new()
	local window_height = love.graphics.getHeight()
	local window_width = love.graphics.getWidth()

	self.image = love.graphics.newImage("images/panda.png")
	self.x = window_width / 2
	self.y = window_height - 100
	self.speed = 400
	self.width = self.image:getWidth()
end

function Player:draw()
	-- note to self: add x and y, otherwise draw won't update
	love.graphics.draw(self.image, self.x, self.y)
end

function Player:update(dt)
	local window_width = love.graphics.getWidth()

	if love.keyboard.isDown("right") then
		if self.x + self.width < window_width then
			self.x = self.x + self.speed * dt
		end
	elseif love.keyboard.isDown("left") then
		if self.x > 0 then
			self.x = self.x - self.speed * dt
		end
	elseif love.keyboard.isDown("up") then
	elseif love.keyboard.isDown("down") then
	elseif love.keyboard.isDown("space") then
	end
end
