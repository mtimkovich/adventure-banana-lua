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

    buckets = {}

    start = 100
    for i = 0,2 do
        table.insert(buckets, Bucket:new(start + 2*start*i))
    end
end

function love.mousepressed(mouse_x, mouse_y, button)
    if button == "l" then
        for i = 1,3 do
            if mouse_x > buckets[i]:get_x() and 
                mouse_x < buckets[i]:get_right() and 
                mouse_y > buckets[i]:get_y() then

                buckets[i]:jump()
                break
            end
        end
    end
end

function love.update(dt)
    love.graphics.setColor(BLACK.r, BLACK.g, BLACK.b)

    for i = 1,3 do
        buckets[i]:update(dt)
    end
end

function love.draw()
    love.graphics.print(status, 0, 0)

    -- Draw the buckets
    for i = 1,3 do
        love.graphics.rectangle("fill", buckets[i]:get_x(), buckets[i]:get_y(), buckets[i]:get_width(), buckets[i]:get_height())
    end
end
