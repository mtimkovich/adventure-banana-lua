Banana = {}

function Banana:new()
    local banana = {}

    banana.width = 45
    banana.height = 45

    banana.pos = {
        x = SCREEN_WIDTH - banana.width,
        y = SCREEN_HEIGHT / 1.8,
    }

    banana.vel = {
        x = 500,
        y = -20,
    }

    setmetatable(banana, { __index = Banana })
    return banana
end

function Banana:get_x()
    return self.pos.x
end

function Banana:get_y()
    return self.pos.y
end

function Banana:get_width()
    return self.width
end

function Banana:get_height()
    return self.height
end

function Banana:update(dt)
    self.pos.x = self.pos.x - self.vel.x * dt
    self.pos.y = self.pos.y + self.vel.y * dt

    self.vel.y = self.vel.y + GRAVITY
end
