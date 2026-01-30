--[[
    WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]

local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FounderScriptsGUI"
ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- 🔔 EXECUTION NOTIFICATION
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Founder Scripts",
        Text = "Toggle GUI with L | t.me/Founderscripts",
        Duration = 4
    })
end)

-- Main Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.fromOffset(350, 250)
Frame.Position = UDim2.fromScale(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -70, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "Founder Scripts"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Parent = Frame

-- Telegram Label
local TelegramLabel = Instance.new("TextLabel")
TelegramLabel.Size = UDim2.new(1, -70, 0, 20)
TelegramLabel.Position = UDim2.new(0, 0, 0, 30)
TelegramLabel.BackgroundTransparency = 1
TelegramLabel.Text = "t.me/Founderscripts"
TelegramLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
TelegramLabel.Font = Enum.Font.Gotham
TelegramLabel.TextSize = 12
TelegramLabel.Parent = Frame

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.Parent = Frame
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 5)

-- Content
local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1, -20, 1, -70)
Content.Position = UDim2.new(0, 10, 0, 60)
Content.BackgroundTransparency = 1
Content.ScrollBarThickness = 6
Content.CanvasSize = UDim2.new(0, 0, 2, 0)
Content.Parent = Frame

-- Toggle GUI visibility
local guiVisible = true
CloseBtn.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    Frame.Visible = guiVisible
end)

-- === VIP WALLS DELETE ===
local function createButton(text, yPos, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -20, 0, 45)
    b.Position = UDim2.new(0, 10, 0, yPos)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(50, 150, 250)
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.Parent = Content
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    b.MouseButton1Click:Connect(callback)
end

-- Delete VIP Walls
createButton("🟣 Delete VIP Walls", 10, function()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == "VIP" and obj.Parent and obj.Parent.Name == "VIPWalls" then
            obj:Destroy()
        end
    end
    
    -- Auto delete new VIP walls
    workspace.DescendantAdded:Connect(function(obj)
        if obj:IsA("BasePart") and obj.Name == "VIP" and obj.Parent and obj.Parent.Name == "VIPWalls" then
            obj:Destroy()
        end
    end)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Founder Scripts",
        Text = "VIP Walls Deleted!",
        Duration = 3
    })
end)

-- Delete VIP+ Walls
createButton("💎 Delete VIP+ Walls", 65, function()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == "VIP+" and obj.Parent then
            obj:Destroy()
        end
        if obj:IsA("MeshPart") and obj.Name == "VIP+" then
            obj:Destroy()
        end
    end
    
    -- Auto delete new VIP+ walls
    workspace.DescendantAdded:Connect(function(obj)
        if obj:IsA("BasePart") and obj.Name == "VIP+" then
            obj:Destroy()
        end
        if obj:IsA("MeshPart") and obj.Name == "VIP+" then
            obj:Destroy()
        end
    end)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Founder Scripts",
        Text = "VIP+ Walls Deleted!",
        Duration = 3
    })
end)

-- Toggle GUI (L key) - Mobile friendly
UIS.InputBegan:Connect(function(i,g)
    if not g and i.KeyCode == Enum.KeyCode.L then
        guiVisible = not guiVisible
        Frame.Visible = guiVisible
    end
end)

-- Drag GUI (Mobile & PC)
local dragging, dragStart, startPos
Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position
    end
end)

Frame.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- Mobile Open/Close button (optional)
local MobileToggle = Instance.new("TextButton")
MobileToggle.Size = UDim2.new(0, 60, 0, 60)
MobileToggle.Position = UDim2.new(0, 20, 1, -80)
MobileToggle.Text = "📱"
MobileToggle.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
MobileToggle.TextColor3 = Color3.new(1,1,1)
MobileToggle.Font = Enum.Font.GothamBold
MobileToggle.TextSize = 20
MobileToggle.Parent = ScreenGui
Instance.new("UICorner", MobileToggle).CornerRadius = UDim.new(0, 30)
MobileToggle.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    Frame.Visible = guiVisible
end)
