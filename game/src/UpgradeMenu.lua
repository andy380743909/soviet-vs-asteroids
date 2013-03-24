-----------------------------------------------------------------------------------------
--
-- UpgradeMenu.lua
--
-- The main UpgradeMenu class.
--
-----------------------------------------------------------------------------------------
module("UpgradeMenu", package.seeall)
local Class = UpgradeMenu
Class.__index = Class

-----------------------------------------------------------------------------------------
-- Imports
-----------------------------------------------------------------------------------------

require("src.Config")
require("src.gui.Button")
require("src.gui.Colors")

-----------------------------------------------------------------------------------------
-- Initialization and Destruction
-----------------------------------------------------------------------------------------

-- Create the UpgradeMenu
function Class.create(options)
    -- Create object
    self = {}
    setmetatable(self, Class)

    self.game = options.game
    self.station = self.game.station
    self.selected = 1

    self.buttons = {}
    table.insert(
        self.buttons,
        Button.create{
            x = gameConfig.screen.width * 0.2, -- 20%
            y = gameConfig.screen.height * 0.2,
            width = gameConfig.screen.width * 0.6, -- 60%
            height = gameConfig.screen.height * 0.2,
            text = "Upgrade missiles",
            callback = self.upgradeMissiles,
        }
    )
    table.insert(
        self.buttons,
        Button.create{
            x = gameConfig.screen.width * 0.2, -- 20%
            y = gameConfig.screen.height * 0.45,
            width = gameConfig.screen.width * 0.6, -- 60%
            height = gameConfig.screen.height * 0.2,
            text = "Shiny lazer!",
            callback = self.upgradeLaser,
        }
    )
    table.insert(
        self.buttons,
        Button.create{
            x = gameConfig.screen.width * 0.2, -- 20%
            y = gameConfig.screen.height * 0.7,
            width = gameConfig.screen.width * 0.6, -- 60%
            height = gameConfig.screen.height * 0.2,
            text = "D-D-D-Drone",
            callback = self.upgradeDrone,
        }
    )

    return self
end

-- Destroy the UpgradeMenu
function Class:destroy()
end

-----------------------------------------------------------------------------------------
-- Methods
-----------------------------------------------------------------------------------------

-- Update the UpgradeMenu
--
-- Parameters:
--  dt: The time in seconds since last frame
function Class:update(dt)
end

-- Draw the UpgradeMenu
function Class:draw()
    colors.green()
    love.graphics.printf("Upgrade your shit!", 0, gameConfig.screen.height * 0.1, gameConfig.screen.width, "center")

    for key, val in pairs(self.buttons) do
        val:draw()
    end
end

-- Upgrade the missiles by reducing the cooldown between two missiles
function upgradeMissiles()
    if not self.station:hasEnoughCoins("missiles") then
        return
    end

    self.station:buyUpgrade("missiles")

    -- Upgrade the cooldown
    cooldown = self.station.missileCoolDownTime * gameConfig.missiles.cooldownUpgradeRate
    self.station:setMissileCooldown(cooldown)
    SoundManager:upgrade()
end

function upgradeLaser()
    if not self.station:hasEnoughCoins("lasers") then
        return
    end

    -- Upgrade the cooldown
    self.game:setUpgrade("satellite")
end

function upgradeDrone()
    if not self.station:hasEnoughCoins("drones") then
        return
    end

    -- Upgrade the cooldown
    self.game:setUpgrade("drone")
end

-----------------------------------------------------------------------------------------

return Class
