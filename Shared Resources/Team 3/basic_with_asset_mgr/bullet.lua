bullet = {}
bullet.width = 5
bullet.height = 5
bullet.speed = 5

function bullet.spawn(x,y,dir)
	table.insert(bullet, {x = x , y = y , dir = dir})
end
--
function bullet.draw()
	for i , v in ipairs(bullet) do
		love.graphics.setColor(0,0,255)
		love.graphics.rectangle('fill',v.x,v.y,bullet.width,bull.height)
	end
end
--
function bullet.move()
	for i,v in ipairs(bullet) do
		if v.dir == 'up' then
			v.y = v.y - bullet.speed * dt
		end

	end
end





--PARENT FUNCTIONS
function draw_Bullet()
	bullet.draw()
end

function update_Bullet(dt)
	bullet.move()
end
