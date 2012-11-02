Banana = {}

function Banana:new()
    local banana = {}

    banana.width = 45
    banana.height = 45

    banana.x = SCREEN_WIDTH - banana.width
    banana.y = SCREEN_HEIGHT / 1.8

    banana.vel_x = 25
    banana.vel_y = -20

    setmetatable(banana, { __index = Bucket })
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
