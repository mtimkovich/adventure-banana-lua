Banana = {}

function Banana:new()
    local banana = {}

    banana.width = 45
    banana.height = 45

    banana.x = SCREEN_WIDTH - banana.width
    banana.y = SCREEN_HEIGHT / 1.8

    banana.vel_x = 25
    banana.vel_y = -20

    setmetatable(banana, { __index = Banana })
    return banana
end

function Banana:get_x()
    return self.x
end

function Banana:get_y()
    return self.y
end

function Banana:get_width()
    return self.width
end

function Banana:get_height()
    return self.height
end

function Banana:update(dt)
    self.x = self.x - self.vel_x * dt
    self.y = self.y + self.vel_y * dt

    self.vel_y = self.vel_y + GRAVITY
end
