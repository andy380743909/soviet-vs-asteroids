-----------------------------------------------------------------------------------------
--
-- Station.lua
--
-- The station class.
--
-----------------------------------------------------------------------------------------

module("Station", package.seeall)
local Class = Station
Class.__index = Class

-----------------------------------------------------------------------------------------
-- Imports
-----------------------------------------------------------------------------------------

require("src.Missile")
local sin = math.sin
local cos = math.cos

-----------------------------------------------------------------------------------------
-- Initialization and Destruction
-----------------------------------------------------------------------------------------

-- Create the station
function Class.create(options)
    -- Create object
    self = {}
    setmetatable(self, Class)

    -- Initialize attributes
    self.x = 0
    self.y = 0
    self.radius = 100
    self.missiles = {}

    self.joy1Angle = 0
    self.joy2Angle = 0

    return self
end

-- Destroy the station
function Class:destroy()
    for _, missile in pairs(self.missiles) do
        missile:destroy()
    end
end

-----------------------------------------------------------------------------------------
-- Methods
-----------------------------------------------------------------------------------------

function Class:launchMissile()
    self.space:addMissile(Missile.create{
        x = 0,
        y = 0,
        angle = math.random(0, 360),
        speed = 10
    })
end

-- Update the station
--
-- Parameters:
--  dt: The time in seconds since last frame
function Class:update(dt)
    -- Update missiles
    if math.random() < 0.01 then
        self:launchMissile()
    end
end

-- Draw the game
function Class:draw()
    -- Draw debug station
    love.graphics.setColor(0, 0, 255)
    love.graphics.circle('line', self.x, self.y, self.radius, 32)
end
