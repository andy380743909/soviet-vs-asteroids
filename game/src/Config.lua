gameConfig = {
    virtualScreenHeight = 1080,

    -- Camera
    camera = {
        -- defined around 1080px
        minVirtualHeight = 1080,
        maxVirtualHeight = 4000
    },

    missiles = {
        cooldown = 0.3, -- in seconds
        deleteDistance = 1080, -- in pixels
    },

    controls = {
        default = "joystick", -- joystick, keyboard, mouse
        force = nil, -- joystick, keyboard, mouse

        mouse = {
            controls = "missiles", -- lasers, missiles
        },

        keyboard = {
            delta = math.pi / 36, -- in radian
        },
    },

    -- Debug options
    debug = {
        all = false,
        shapes = true
    },

    asteroidBeltDistance = 1080,

    -- an asteroid will spanwn every X seconds
    asteroidSpawnEvery = 2
}
