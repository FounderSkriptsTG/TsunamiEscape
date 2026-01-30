--[[
    WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- Founder Scripts Telegram GUI | Toggle: L | Mobile Friendly | Delta Injector

local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FounderScriptsGUI"
ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- 🔔 EXECUTION NOTIFICATION
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Founder Scripts",
        Text = "📱 GUI для телефона | Toggle: L | Telegram: Founder Scripts",
        Duration = 5
    })
end)

-- Main Frame (Mobile Optimized)
local Frame = Instance.new("Frame")
Frame.Size = UDim2.fromOffset(300, 380) -- Уменьшено для телефона
Frame.Position = UDim2.fromScale(0.5, 0.5)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -70, 0, 35)
Title.BackgroundTransparency = 1
Title.Text = "Founder Scripts"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16 -- Уменьшено для мобильных
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Position = UDim2.new(0, 15, 0, 5)
Title.Parent = Frame

-- Telegram Label
local TelegramLabel = Instance.new("TextLabel")
TelegramLabel.Size = UDim2.new(1, -70, 0, 20)
TelegramLabel.Position = UDim2.new(0, 15, 0, 35)
TelegramLabel.BackgroundTransparency = 1
TelegramLabel.Text = "t.me/FounderScripts"
TelegramLabel.TextColor3 = Color3.fromRGB(0, 200, 255)
TelegramLabel.Font = Enum.Font.Gotham
TelegramLabel.TextSize = 12
TelegramLabel.TextXAlignment = Enum.TextXAlignment.Left
TelegramLabel.Parent = Frame

-- Close Button (Mobile Friendly)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -40, 0, 5)
CloseBtn.Text = "✕"
CloseBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
CloseBtn.Parent = Frame
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 8)

-- Drag Handle (Mobile)
local DragHandle = Instance.new("Frame")
DragHandle.Size = UDim2.new(1, 0, 0, 45)
DragHandle.Position = UDim2.new(0, 0, 0, 0)
DragHandle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
DragHandle.BorderSizePixel = 0
DragHandle.Parent = Frame
Instance.new("UICorner", DragHandle).CornerRadius = UDim.new(0, 12, 0, 0)

-- Content Frame
local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1, -20, 1, -65)
Content.Position = UDim2.new(0, 10, 0, 55)
Content.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Content.BorderSizePixel = 0
Content.ScrollBarThickness = 6
Content.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
Content.CanvasSize = UDim2.new(0, 0, 2, 0)
Content.Parent = Frame
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 8)

-- Mobile Button Function
local function createMobileButton(text, yPos, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -20, 0, 50)
    b.Position = UDim2.new(0, 10, 0, yPos)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 14
    b.Parent = Content
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 10)
    
    b.MouseButton1Click:Connect(callback)
    b.TouchTap:Connect(callback) -- Для мобильных
    
    -- Hover Effect
    b.MouseEnter:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 170, 255)}):Play()
    end)
    b.MouseLeave:Connect(function()
        TweenService:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 150, 255)}):Play()
    end)
end

-- MAIN BUTTONS (Escape Tsunami)
createMobileButton("🏠 Teleport to Spawn", 10, function()
    local c = Player.Character or Player.CharacterAdded:Wait()
    if c:FindFirstChild("HumanoidRootPart") then
        c.HumanoidRootPart.CFrame = CFrame.new(124, 3.1, 1) * CFrame.Angles(0, math.rad(-90), 0)
    end
end)

createMobileButton("🏁 Go to End", 70, function()
    local c = Player.Character or Player.CharacterAdded:Wait()
    if c:FindFirstChild("HumanoidRootPart") then
        c.HumanoidRootPart.CFrame = CFrame.new(2606, -2.84, 1) * CFrame.Angles(0, math.rad(-90), 0)
    end
end)

createMobileButton("🌊 Delete Tsunami", 130, function()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and (obj.Name == "Hitbox" or obj.Name == "TsunamiWave") then
            obj:Destroy()
        end
    end
end)

createMobileButton("🧱 Delete VIP Walls", 190, function()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "VIP" and obj.Parent and obj.Parent.Name == "VIPWalls" then
            obj:Destroy()
        end
    end
end)

createMobileButton("💰 Auto Collect Money", 250, function()
    -- Простая версия для мобильных
    local c = Player.Character or Player.CharacterAdded:Wait()
    if c:FindFirstChild("HumanoidRootPart") then
        for baseNum = 1, 4 do
            for slotNum = 1, 30 do
                local base = workspace.Bases:FindFirstChild("Base"..baseNum)
                if base and base:FindFirstChild("Slots") then
                    local slot = base.Slots:FindFirstChild("Slot"..slotNum)
                    if slot and slot:FindFirstChild("Collect") then
                        c.HumanoidRootPart.CFrame = slot.Collect.CFrame + Vector3.new(0,3,0)
                        wait(0.1)
                    end
                end
            end
        end
    end
end)

-- Toggle GUI (L Key) - Работает на мобильных через контекстное меню
UIS.InputBegan:Connect(function(i,g)
    if not g and i.KeyCode == Enum.KeyCode.L then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

-- MOBILE DRAG SYSTEM (Delta Compatible)
local dragging = false
local dragStart = nil
local startPos = nil

local function updateInput(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        local delta = input.Position - dragStart
        Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end

DragHandle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        startPos = Frame.Position
        dragStart = input.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging then
        updateInput(input)
    end
end)

-- Close Button
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
CloseBtn.TouchTap:Connect(function()
    ScreenGui:Destroy()
end)

print("✅ Founder Scripts GUI загружен! t.me/FounderScripts")
