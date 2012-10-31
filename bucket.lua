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

function Bucket:get_height()
    return self.height
end

function Bucket:get_width()
    return self.width
end

function Bucket:get_x()
    return self.x
end

function Bucket:get_y()
    return self.y
end

function Bucket:get_bottom()
    return self.y + self.height
end

function Bucket:set_bottom(y)
    self.y = y - self.height
end

function Bucket:get_right()
    return self.x + self.width
end

function Bucket:jump()
    if self:get_bottom() == SCREEN_HEIGHT then
        self.vel_y = -300
    end
end

function Bucket:update(dt)
    self.y = self.y + self.vel_y * dt

    if self:get_bottom() < SCREEN_HEIGHT then
        self.vel_y = self.vel_y + GRAVITY
    else
        self:set_bottom(SCREEN_HEIGHT)
        self.vel_y = 0
    end
end
