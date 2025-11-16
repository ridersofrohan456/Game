Background = Object:extend()

function Background:new()
	backgroundImage = love.graphics.newImage("images/background.png")
	tileWidth = 16
	tileHeight = 16

	tiles = {}
	tiles["sand"] = {}
	tiles["water"] = {}

	table.insert(
		tiles["sand"],
		love.graphics.newQuad(
			tileWidth * 6,
			tileHeight,
			tileWidth,
			tileHeight,
			backgroundImage:getWidth(),
			backgroundImage:getHeight()
		)
	)
end

function Background:update(dt) end

function Background:draw()
	tilemap = {
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
		{ 1, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
		{ 1, 0, 0, 1, 1, 1, 1, 0, 0, 1 },
		{ 1, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
	}

	windowWidth = love.graphics.getWidth()
	windowHeight = love.graphics.getHeight()

	windowWidthScale = windowWidth / #tilemap[1] - tileWidth
	windowHeightScale = windowHeight / #tilemap

	for i = 1, #tilemap do
		for j = 1, #tilemap[i] do
			if tilemap[i][j] == 1 then
				love.graphics.draw(
					backgroundImage,
					tiles["sand"][1],
					(j * tileWidth) + (windowWidthScale * (j - 1)),
					(i * tileHeight) + windowHeightScale * (i - 1)
				)
			end
		end
	end
end
