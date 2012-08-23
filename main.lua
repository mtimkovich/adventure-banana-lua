Bucket = {}

function Bucket:new(x)
    local bucket = {}
    bucket.width = 100
    bucket.height = 150

    bucket.x = x
    bucket.y = SCREEN_HEIGHT - bucket.height

    bucket.vel_y = 0

    setmetatable(bucket, { __index = Bucket })
    return bucket
end

function Bucket:jump()
    if self:bottom() == SCREEN_HEIGHT then
        self.vel_y = -25
    end
end

function Bucket:bottom(y)
    if y then
        self.y = y - self.height
    end

    return self.y + self.height
end

function Bucket:right()
    return self.x + self.width
end

function Bucket:update(dt)
    self.y = self.y + self.vel_y

    if self:bottom() < SCREEN_HEIGHT then
        self.vel_y = self.vel_y + GRAVITY
    else
        self:bottom(SCREEN_HEIGHT)
        self.vel_y = 0
    end
end

function love.load()
    status = "OK"

    -- Constants
    GRAVITY = 2
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
