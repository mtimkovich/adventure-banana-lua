require "bucket" 

function love.load()
    status = "OK"

    -- Constants
    GRAVITY = 10
    SCREEN_HEIGHT = love.graphics.getHeight()
    SCREEN_WIDTH = love.graphics.getWidth()
    
    -- Colors
    BLACK = {r=0, g=0, b=0}
    WHITE = {r=255, g=255, b=255}

    love.graphics.setBackgroundColor(WHITE.r, WHITE.g, WHITE.b)
    love.graphics.setColor(BLACK.r, BLACK.g, BLACK.b)

    buckets = {}

    start = 100
    for i = 0,2 do
        table.insert(buckets, Bucket:new(start + 2*start*i))
    end
end

function love.mousepressed(mousex, mousey, button)
    if button == "l" then
        for i = 1,3 do
            if mousex > buckets[i].x and mousex < buckets[i]:right() and mousey > buckets[i].y then
                buckets[i]:jump()
                break
            end
        end
    end
end

function love.update(dt)
    for i = 1,3 do
        buckets[i]:update(dt)
    end
end

function love.draw()
    love.graphics.print(status, 0, 0)

    -- Draw the buckets
    for i = 1,3 do
        love.graphics.rectangle("fill", buckets[i].x, buckets[i].y, buckets[i].width, buckets[i].height)
    end
end
