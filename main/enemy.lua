Enemy = Object:extend()

function Enemy:new()
	local window_width = love.graphics.getWidth()
	self.image = love.graphics.newImage("images/snake.png")
	self.x = window_width / 2
	self.y = 10
	self.speed = 200
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()

	self.timer = 0
	self.rand = 0
end

function Enemy:draw()
	love.graphics.draw(self.image, self.x, self.y)
end

function Enemy:update(dt)
	local window_width = love.graphics.getWidth()
	self.timer = self.timer + 1

	if self.timer % 100 == 0 then
		self.rand = math.random()
	end

	if self.rand < 0.5 then
		if self.x + self.width < window_width then
			self.x = self.x + self.speed * dt
		end
	else
		if self.x > 0 then
			self.x = self.x - self.speed * dt
		end
	end
end
