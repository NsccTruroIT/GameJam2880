require('init')
require('game')
require('player')
require('bullet')

function love.load()


	screenWidth = love.graphics.getWidth()
	screenHeight = love.graphics.getHeight()

	player.load()

end

function love.keypressed(key)
	player.shoot(key)
end


function love.update(dt)
	update_Player(dt)
	update_Bullet(dt)
end

function love.draw()
	draw_Bullet()
	draw_Player()
end





