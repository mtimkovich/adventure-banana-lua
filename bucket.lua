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
