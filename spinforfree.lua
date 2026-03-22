local TweenService = game:GetService("TweenService")
local player = game.Players.LocalPlayer
local part = workspace.Obbies.WinParts:FindFirstChild("3")

local speed = 1000

while true do
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    if part then
        local distance = (hrp.Position - part.Position).Magnitude
        local time = distance / speed

        local tween = TweenService:Create(
            hrp,
            TweenInfo.new(time, Enum.EasingStyle.Linear),
            {CFrame = part.CFrame + Vector3.new(0, 3, 0)}
        )

        getgenv().CurrentTween = tween
        tween:Play()
        tween.Completed:Wait()
    end

    task.wait(0.1)
end
