-- Roblox Lua Script
-- Author: thespeedynero

local humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid
humanoid.WalkSpeed = 100
humanoid.JumpPower = 150
local InfiniteJumpEnabled = true

game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)
