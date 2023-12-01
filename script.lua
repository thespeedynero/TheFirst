-- Roblox Lua Script
-- Author: thespeedynero

local hasGivenTool = false

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local function setupCharacter(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = 100
    humanoid.JumpPower = 150

    local InfiniteJumpEnabled = true

    UserInputService.JumpRequest:Connect(function()
        if InfiniteJumpEnabled then
            humanoid:ChangeState("Jumping")
        end
    end)
end

while true do
    wait(1)
    local mouse = game.Players.LocalPlayer:GetMouse()
    
    if not hasGivenTool then
        local tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "Permanent Tp Tool"
        tool.Activated:Connect(function()
            local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
            pos = CFrame.new(pos.X, pos.Y, pos.Z)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
        end)
        tool.Parent = game.Players.LocalPlayer.Backpack
        hasGivenTool = true
    end

    local localPlayer = Players.LocalPlayer
    if localPlayer and localPlayer.Character then
        setupCharacter(localPlayer.Character)
    end

    localPlayer.CharacterAdded:Connect(function(character)
        setupCharacter(character)
    end)
end
