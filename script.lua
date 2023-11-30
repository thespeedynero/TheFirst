-- Roblox Lua Script
-- Author: thespeedynero

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local function setupCharacter(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = 100
    humanoid.JumpPower = 100

    local InfiniteJumpEnabled = true

    UserInputService.JumpRequest:Connect(function()
        if InfiniteJumpEnabled then
            humanoid:ChangeState("Jumping")
        end
    end)
end

-- Setup for LocalPlayer
local localPlayer = Players.LocalPlayer
if localPlayer and localPlayer.Character then
    setupCharacter(localPlayer.Character)
end

-- Listen for LocalPlayer's character being added
localPlayer.CharacterAdded:Connect(function(character)
    setupCharacter(character)
end)
