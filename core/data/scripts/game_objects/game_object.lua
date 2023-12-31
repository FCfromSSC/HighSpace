local Class     = require("class")
local Inspect   = require('inspect')
local Utils     = require('utils')

local GameObject = Class()

function GameObject:init(properties)
    self.Name = Utils.Game.getMandatoryProperty(properties, 'Name')
    ba.println("GameObject:init: " .. self.Name)

    self.Mission = {}
    self.System = {
        ['IsSelected'] = false,
        ['Position'] = ba.createVector(0,0,0),
    }

    if properties.System then
        self.System.IsSelected = properties.System.IsSelected or self.System.IsSelected
        self.System.Position = properties.System.Position:copy() or self.System.Position
    end
end

function GameObject:clone()
    return GameObject(self)
end

function GameObject:getMapDisplayName()
    return self.Name
end

return GameObject