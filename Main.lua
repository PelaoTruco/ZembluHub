local base = "https://raw.githubusercontent.com/PelaoTruco/ZembluHub/main/"

local Styles = loadstring(game:HttpGet(base.."Styles.lua"))()
local Functions = loadstring(game:HttpGet(base.."Functions.lua"))()

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "ZembluHub"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

Functions.EnableReset(gui)

local main = Instance.new("Frame", gui)
main.BackgroundColor3 = Styles.Black
main.BorderSizePixel = 0

Functions.AnimateOpen(main)
Functions.MakeDraggable(main)

-- HEADER
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1,0,0,40)
header.BackgroundColor3 = Styles.DarkPurple

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1,0,1,0)
title.BackgroundTransparency = 1
title.Text = "ZembluHub | Player"
title.Font = Styles.Font
title.TextSize = 16
title.TextColor3 = Styles.Neon

-- TOOLBAR
local toolbar = Instance.new("Frame", main)
toolbar.Position = UDim2.new(0,0,0,40)
toolbar.Size = UDim2.new(1,0,0,30)
toolbar.BackgroundColor3 = Styles.MidPurple

local layout = Instance.new("UIListLayout", toolbar)
layout.FillDirection = Enum.FillDirection.Horizontal
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Padding = UDim.new(0,40)

local indicator = Instance.new("Frame", toolbar)
indicator.Size = UDim2.new(0,0,0,2)
indicator.Position = UDim2.new(0,0,1,-2)
indicator.BackgroundColor3 = Styles.Neon

-- CONTENT
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0,0,0,70)
content.Size = UDim2.new(1,0,1,-70)
content.BackgroundColor3 = Styles.MidPurple

-- PLAYER TAB
local function LoadPlayer()
	content:ClearAllChildren()

	local zones = Functions.GetZones()
	local selected

	local list = Instance.new("Frame", content)
	list.Size = UDim2.new(0,350,0,200)
	list.Position = UDim2.new(0,20,0,20)
	list.BackgroundColor3 = Styles.DarkPurple
	list.BorderSizePixel = 0

	local layout = Instance.new("UIListLayout", list)
	layout.Padding = UDim.new(0,5)

	for _,zone in ipairs(zones) do
		local btn = Instance.new("TextButton", list)
		btn.Size = UDim2.new(1,0,0,25)
		btn.BackgroundTransparency = 1
		btn.Text = zone.Name
		btn.Font = Styles.Font
		btn.TextSize = 12
		btn.TextColor3 = Styles.Neon

		btn.MouseButton1Click:Connect(function()
			selected = zone
		end)
	end

	local tp = Instance.new("TextButton", content)
	tp.Position = UDim2.new(0,20,0,240)
	tp.Size = UDim2.new(0,150,0,30)
	tp.BackgroundColor3 = Styles.Black
	tp.Text = "Teleport"
	tp.Font = Styles.Font
	tp.TextSize = 14
	tp.TextColor3 = Styles.Neon
	tp.BorderSizePixel = 0

	tp.MouseButton1Click:Connect(function()
		if selected then
			Functions.TeleportTo(selected)
		end
	end)
end

-- TAB BUTTON
local playerTab = Instance.new("TextButton", toolbar)
playerTab.Size = UDim2.new(0,120,0,25)
playerTab.BackgroundTransparency = 1
playerTab.Text = "Player"
playerTab.Font = Styles.Font
playerTab.TextSize = 14
playerTab.TextColor3 = Styles.Neon

playerTab.MouseButton1Click:Connect(function()
	title.Text = "ZembluHub | Player"
	Functions.MoveIndicator(indicator, playerTab)
	LoadPlayer()
end)

LoadPlayer()
Functions.MoveIndicator(indicator, playerTab)
