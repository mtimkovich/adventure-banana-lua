Bucket = {}

function Bucket:new(x)
    local bucket = {}
    bucket.width = 100
    bucket.height = 150

    bucket.x = x
    bucket.y = love.graphics.getHeight() - bucket.height

    setmetatable(bucket, { __index = Bucket })
    return bucket
end

function Bucket:jump()
    self.y = self.y - 10
end

function love.load()
    buckets = {}

    start = 100
    for i = 0,2 do
        table.insert(buckets, Bucket:new(start + 2*start*i))
    end
end

function love.draw()
    for i = 1,3 do
        love.graphics.rectangle("fill", buckets[i].x, buckets[i].y, buckets[i].width, buckets[i].height)
    end
end

function love.mousepressed(mousex, mousey, button)
    if button == "l" then
        for i = 1,3 do
            if mousex > buckets[i].x and mousex < buckets[i].x+buckets[i].width then
                buckets[i]:jump()
                break
            end
        end
    end
end
