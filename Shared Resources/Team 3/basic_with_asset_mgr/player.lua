player = {}

function player.load()

	player.x = 5
	player.y = 5
	player.xVel = 0
	player.yVel = 0
	player.friction = 9.5
	player.speed = 1500
	player.img = love.graphics.newImage('asset/ufoBlue.png')
	player.width = player.img:getWidth()
	player.height = player.img:getHeight()
end

function player.draw()
	love.graphics.draw(player.img,player.x,player.y)
	
end

function player.physics(dt)
	player.x = player.x + player.xVel * dt
	player.y = player.y + player.yVel * dt
	player.xVel = player.xVel * (1 - math.min(dt*player.friction, 1))
	player.yVel = player.yVel * (1 - math.min(dt*player.friction, 1))
end


function player.boundary()
	if player.x < 0 then
		player.x = 0
		player.xVel = 0
	end
	if player.y < 0 then
		player.y = 0
		player.yVel = 0
	end
	if player.x + player.width > screenWidth then
		player.x = screenWidth - player.width 
		player.xVel = 0
	end
	if player.y + player.height > screenWidth then
		player.y = screenHeight - player.height 
		player.yVel = 0
	end

end

function player.move(dt)
	if love.keyboard.isDown('d') and player.xVel < player.speed then
		player.xVel = player.xVel + player.speed * dt
	elseif love.keyboard.isDown('a') and player.xVel >  -player.speed then
		player.xVel = player.xVel - player.speed * dt

	elseif love.keyboard.isDown('s') and player.yVel < player.speed then
		player.yVel = player.yVel + player.speed * dt

	elseif love.keyboard.isDown('w') and player.yVel >  -player.speed then
		player.yVel = player.yVel - player.speed * dt
		end
end
--
function player.shoot(key)
	if key == 'b' then
		bullet.spawn(player.x + player.width / 2 - bullet.width /2, player.y - bullet.height,'up')
	end
end



function player.update(dt)



end



-- PARENT FUNCTIONS
function draw_Player()
	player.draw()

end
function update_Player(dt)
	player.move(dt)
	player.boundary()
	player.physics(dt)
	player.update(dt)
end