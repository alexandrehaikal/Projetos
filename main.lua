---------------------------------------------------ATARI PONG 2020.1 REMASTERED---------------------------------------------------------------------------
--by Alexandre Haikal, David Wolff & Gabriel Duek---------------------------------------------------------------------------------------------------------
--Load Settings : 1280x720 msaa 16x-----------------------------------------------------------------------------------------------------------------------
  local paddle_left_x = 50
  local y = 360-149/2
  local bx = 629
  local by = 318
  math.randomseed(os.time())
  local directionx = math.random(-1, -1.3)
  local directiony =  math.random(1.2, -1.8)
  local paddle_right_orientation = 360-149/2
  local score_left = 0
  local score_right = 0
  if directiony == 0 then
    directiony = directiony + 0.1
  end
function love.load()
  --window
  love.window.setTitle("Atari Pong")
  love.window.setMode(1280, 720, {msaa = 16})
  love.graphics.setBackgroundColor(0.0, 0.0, 0.0)
  --objects
  atari_classic = love.graphics.newFont("AtariClassicChunky-PxXP.ttf", 70)
  paddle_left = love.graphics.newImage("paddle_left.png")
  paddle_right = love.graphics.newImage("paddle_right.png")
  ball = love.graphics.newImage("ball.png")
end
function love.update(dt)
  bx = (bx + directionx + dt * math.pi)
  by = by + directiony + dt * math.pi
  if bx <= paddle_left_x + 38 and by >= y and by<= y + 139 then
    bx = -bx
  end
  if (love.keyboard.isDown("w")) then
    y = y - dt * 200 * math.pi
  end
  if (love.keyboard.isDown("s")) then
    y = y + dt * 200 * math.pi 
  end
  
  if (bx >= 1260 or bx <= 0) then
    love.timer.sleep(0.2)
    bx = 1280
  end
  
  if (by >= 720 or by <= 0) then
    directiony = -directiony
  end
  
  if by > 0 then
    paddle_right_orientation = by + 149/2 - 20
    if bx >= 1280 then 
      score_right=score_right+1
      paddle_right_orientation = 360 - 149/2
      bx=629
      by=318
    elseif bx <= 0 then
      score_left=score_left+1
      paddle_right_orientation = 360 - 149/2
      bx=629
      by=318
    end
  end
  
end  
-- Linha


--Board lines
function divide_mesa()
  love.graphics.rectangle('fill', 632.5, 0, 15, 30)
  love.graphics.rectangle('fill', 632.5, 60, 15, 30)
  love.graphics.rectangle('fill', 632.5, 120, 15, 30)
  love.graphics.rectangle('fill', 632.5, 180, 15, 30)
  love.graphics.rectangle('fill', 632.5, 240, 15, 30)
  love.graphics.rectangle('fill', 632.5, 300, 15, 30)
  love.graphics.rectangle('fill', 632.5, 360, 15, 30)
  love.graphics.rectangle('fill', 632.5, 420, 15, 30)
  love.graphics.rectangle('fill', 632.5, 480, 15, 30)
  love.graphics.rectangle('fill', 632.5, 540, 15, 30)
  love.graphics.rectangle('fill', 632.5, 600, 15, 30)
  love.graphics.rectangle('fill', 632.5, 660, 15, 30)
  love.graphics.rectangle('fill', 632.5, 720, 15, 30)
  love.graphics.rectangle('fill', 632.5, 750, 15, 30)
end
--Score
function desenha_placares()
  love.graphics.setFont(atari_classic)
  love.graphics.setColor(0.5, 0.5, 0.5)
  love.graphics.print(score_left, 420, 50)
  love.graphics.print(score_right, 780, 50)
end
--Paddles
function desenha_raquetes()
  local paddle_size_left = 150
  local paddle_size_right = 150
  local paddle_height_left = 285
  love.graphics.setColor(0.5, 0.5, 0.5)
  love.graphics.draw(paddle_left, paddle_left_x, y)
  love.graphics.draw(paddle_right, 1192, paddle_right_orientation)
end
--Ball

function desenha_bola()
  love.graphics.draw(ball, bx, by)
end
--Draw

function love.draw()
  divide_mesa()
  desenha_placares()
  desenha_raquetes()
  desenha_bola()
end