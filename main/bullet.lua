Bullet = Object:extend()

function Bullet:new()
	self.image = love.graphics.newImage("images/bullet.png")
	self.x = 0
	self.y = 0
	self.speed = 400

	self.width = self.image:getWidth()
	self.height = self.image:getHeight()
end

function Bullet:draw()
	love.graphics.draw(self.image, self.x, self.y)
end

function Bullet:update(dt)
	self.y = self.y - self.speed * dt
end

function Bullet:checkCollision(obj)
	local a_left = self.x
	local a_right = self.x + self.width
	local a_top = self.y
	local a_bottom = self.y + self.height

	local b_left = obj.x
	local b_right = obj.x + obj.width
	local b_top = obj.y
	local b_bottom = obj.y + obj.height

	-- check if any edges cross
	return a_left < b_right and a_top < b_bottom and a_right > b_left and a_bottom > b_top
end
