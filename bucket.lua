Bucket = {}

function Bucket:new(x)
    local bucket = {}
    bucket.width = 100
    bucket.height = 150

    bucket.pos = {
        x = x,
        y = SCREEN_HEIGHT - bucket.height,
    }

    bucket.vel = {y = 0}

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
    return self.pos.x
end

function Bucket:get_y()
    return self.pos.y
end

function Bucket:get_bottom()
    return self.pos.y + self.height
end

function Bucket:set_bottom(y)
    self.pos.y = y - self.height
end

function Bucket:get_right()
    return self.pos.x + self.width
end

function Bucket:jump()
    if self:get_bottom() == SCREEN_HEIGHT then
        self.vel.y = -300
    end
end

function Bucket:update(dt)
    self.pos.y = self.pos.y + self.vel.y * dt

    if self:get_bottom() < SCREEN_HEIGHT then
        self.vel.y = self.vel.y + GRAVITY
    else
        self:set_bottom(SCREEN_HEIGHT)
        self.vel.y = 0
    end
end
