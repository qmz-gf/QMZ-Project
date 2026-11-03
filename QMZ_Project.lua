
--[[
    QMZ PROJECT | PREMIUM UI
    Version 1.0
    Visual demonstration interface
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local C = {
    Background = Color3.fromRGB(10, 8, 16),
    Panel = Color3.fromRGB(22, 17, 32),
    Purple = Color3.fromRGB(155, 70, 255),
    White = Color3.fromRGB(245, 240, 255),
    Gray = Color3.fromRGB(120, 110, 135)
}

local gui = Instance.new("ScreenGui")
gui.Name = "QMZ_Project"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

local function round(object, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = object
end

local function stroke(object)
    local s = Instance.new("UIStroke")
    s.Color = C.Purple
    s.Thickness = 1.4
    s.Parent = object
end

local function label(parent, text, size, pos, fontSize)
    local l = Instance.new("TextLabel")
    l.BackgroundTransparency = 1
    l.Size = size
    l.Position = pos
    l.Text = text
    l.TextColor3 = C.White
    l.Font = Enum.Font.GothamBold
    l.TextSize = fontSize
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = parent
    return l
end

-- ACCESS SCREEN

local access = Instance.new("Frame")
access.Size = UDim2.fromScale(1, 1)
access.BackgroundColor3 = C.Background
access.Parent = gui

local title = label(
    access, "QMZ PROJECT",
    UDim2.new(1, 0, 0, 55),
    UDim2.new(0, 0, 0.28, 0), 32
)
title.TextXAlignment = Enum.TextXAlignment.Center

local sub = label(
    access, "PREMIUM EXPERIENCE",
    UDim2.new(1, 0, 0, 25),
    UDim2.new(0, 0, 0.37, 0), 12
)
sub.TextColor3 = C.Purple
sub.TextXAlignment = Enum.TextXAlignment.Center

local key = Instance.new("TextBox")
key.Size = UDim2.fromOffset(270, 45)
key.Position = UDim2.new(0.5, -135, 0.47, 0)
key.BackgroundColor3 = C.Panel
key.TextColor3 = C.White
key.PlaceholderText = "Enter key..."
key.PlaceholderColor3 = C.Purple
key.Font = Enum.Font.Gotham
key.TextSize = 14
key.ClearTextOnFocus = false
key.Parent = access
round(key, 9)
stroke(key)

local unlock = Instance.new("TextButton")
unlock.Size = UDim2.fromOffset(270, 43)
unlock.Position = UDim2.new(0.5, -135, 0.47, 55)
unlock.BackgroundColor3 = C.Purple
unlock.Text = "UNLOCK"
unlock.TextColor3 = C.White
unlock.Font = Enum.Font.GothamBold
unlock.TextSize = 14
unlock.Parent = access
round(unlock, 9)

-- MAIN MENU

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(650, 420)
main.Position = UDim2.new(0.5, -325, 0.5, -210)
main.BackgroundColor3 = C.Background
main.Visible = false
main.Parent = gui
round(main, 15)
stroke(main)

local top = Instance.new("Frame")
top.Size = UDim2.new(1, 0, 0, 70)
top.BackgroundColor3 = C.Panel
top.BorderSizePixel = 0
top.Parent = main
round(top, 15)

label(top, "QMZ PROJECT",
    UDim2.new(0, 300, 0, 35),
    UDim2.fromOffset(20, 8), 24)

local version = label(top, "PREMIUM INTERFACE  •  V1.0",
    UDim2.new(0, 300, 0, 20),
    UDim2.fromOffset(21, 42), 10)
version.TextColor3 = C.Purple

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(35, 35)
close.Position = UDim2.new(1, -48, 0, 17)
close.BackgroundColor3 = Color3.fromRGB(55, 25, 75)
close.Text = "X"
close.TextColor3 = C.White
close.Font = Enum.Font.GothamBold
close.Parent = top
round(close, 8)

local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 160, 1, -85)
sidebar.Position = UDim2.fromOffset(12, 78)
sidebar.BackgroundColor3 = C.Panel
sidebar.Parent = main
round(sidebar, 10)

local content = Instance.new("Frame")
content.Size = UDim2.new(1, -185, 1, -85)
content.Position = UDim2.fromOffset(173, 78)
content.BackgroundColor3 = C.Panel
content.Parent = main
round(content, 10)

local pages = {}

local function createPage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name
    page.Size = UDim2.new(1, -20, 1, -20)
    page.Position = UDim2.fromOffset(10, 10)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = C.Purple
    page.CanvasSize = UDim2.new(0, 0, 0, 350)
    page.Visible = false
    page.Parent = content
    pages[name] = page
    return page
end

local function heading(page, text, y)
    label(page, text, UDim2.new(1, -10, 0, 35),
        UDim2.fromOffset(5, y), 17)
end

local function toggle(page, text, y)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 43)
    button.Position = UDim2.fromOffset(5, y)
    button.BackgroundColor3 = C.Background
    button.Text = ""
    button.Parent = page
    round(button, 8)

    label(button, text, UDim2.new(1, -65, 1, 0),
        UDim2.fromOffset(12, 0), 12)

    local indicator = Instance.new("Frame")
    indicator.Size = UDim2.fromOffset(35, 19)
    indicator.Position = UDim2.new(1, -47, 0.5, -9)
    indicator.BackgroundColor3 = C.Gray
    indicator.Parent = button
    round(indicator, 15)

    local dot = Instance.new("Frame")
    dot.Size = UDim2.fromOffset(13, 13)
    dot.Position = UDim2.fromOffset(3, 3)
    dot.BackgroundColor3 = C.White
    dot.Parent = indicator
    round(dot, 15)

    local enabled = false

    button.MouseButton1Click:Connect(function()
        enabled = not enabled

        TweenService:Create(indicator, TweenInfo.new(0.2), {
            BackgroundColor3 = enabled and C.Purple or C.Gray
        }):Play()

        TweenService:Create(dot, TweenInfo.new(0.2), {
            Position = enabled and UDim2.fromOffset(19, 3)
                or UDim2.fromOffset(3, 3)
        }):Play()
    end)
end

local dashboard = createPage("Dashboard")
heading(dashboard, "Welcome to QMZ", 10)
label(dashboard, "Your premium experience starts here.",
    UDim2.new(1, -10, 0, 30), UDim2.fromOffset(5, 50), 12)
label(dashboard, "Status: Interface loaded",
    UDim2.new(1, -10, 0, 25), UDim2.fromOffset(5, 90), 11)

local aim = createPage("Aim-bot")
heading(aim, "AIM-BOT / VISUAL DEMO", 10)
toggle(aim, "Aim interface demo", 55)
toggle(aim, "FOV indicator demo", 110)
toggle(aim, "Target marker demo", 165)

local esp = createPage("ESP")
heading(esp, "ESP / VISUAL DEMO", 10)
toggle(esp, "ESP interface demo", 55)
toggle(esp, "Player box demo", 110)
toggle(esp, "Name display demo", 165)

local dupe = createPage("Dupeo")
heading(dupe, "DUPEO / VISUAL DEMO", 10)
toggle(dupe, "Dupe interface demo", 55)

local settings = createPage("Settings")
heading(settings, "SETTINGS", 10)
label(settings, "Menu toggle: K",
    UDim2.new(1, -10, 0, 30), UDim2.fromOffset(5, 55), 13)
label(settings, "TikTok: @immxnuuu",
    UDim2.new(1, -10, 0, 30), UDim2.fromOffset(5, 95), 13)

local tabs = {"Dashboard", "Aim-bot", "ESP", "Dupeo", "Settings"}

local function selectPage(name)
    for pageName, page in pairs(pages) do
        page.Visible = pageName == name
    end
end

for i, name in ipairs(tabs) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -16, 0, 42)
    button.Position = UDim2.fromOffset(8, 10 + (i - 1) * 49)
    button.BackgroundColor3 = C.Background
    button.Text = name
    button.TextColor3 = C.White
    button.Font = Enum.Font.GothamBold
    button.TextSize = 13
    button.Parent = sidebar
    round(button, 8)

    button.MouseButton1Click:Connect(function()
        selectPage(name)
    end)
end

selectPage("Dashboard")

unlock.MouseButton1Click:Connect(function()
    if key.Text == "qmzproject" then
        access:Destroy()
        main.Visible = true

        main.Size = UDim2.fromOffset(600, 380)
        TweenService:Create(main, TweenInfo.new(0.3,
            Enum.EasingStyle.Back), {
                Size = UDim2.fromOffset(650, 420)
            }):Play()
    else
        key.Text = ""
        key.PlaceholderText = "Incorrect key!"
    end
end)

close.MouseButton1Click:Connect(function()
    main.Visible = false
end)

UIS.InputBegan:Connect(function(input, processed)
    if processed then return end

    if input.KeyCode == Enum.KeyCode.K then
        if access.Parent then return end
        main.Visible = not main.Visible
    end
end)

print("[QMZ] Interface loaded.")
