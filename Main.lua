return function(Style, Functions, Categories)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "ZembluHub"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,700,0,450)
main.Position = UDim2.new(0.5,-350,0.5,-225)
main.BackgroundColor3 = Style.Black
main.BorderSizePixel = 0

local header = Instance.new("Frame", main)
header.Size = UDim2.new(1,0,0,40)
header.BackgroundColor3 = Style.DarkPurple

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1,0,1,0)
title.BackgroundTransparency = 1
title.Text = "ZembluHub | Player"
title.Font = Style.Font
title.TextSize = 16
title.TextColor3 = Style.Neon

local toolbar = Instance.new("Frame", main)
toolbar.Position = UDim2.new(0,0,0,40)
toolbar.Size = UDim2.new(1,0,0,30)
toolbar.BackgroundColor3 = Style.MidPurple

local layout = Instance.new("UIListLayout", toolbar)
layout.FillDirection = Enum.FillDirection.Horizontal
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Padding = UDim.new(0,40)

local indicator = Instance.new("Frame", toolbar)
indicator.Size = UDim2.new(0,100,0,2)
indicator.Position = UDim2.new(0,0,1,-2)
indicator.BackgroundColor3 = Style.Neon

local options = Instance.new("Frame", main)
options.Position = UDim2.new(0,0,0,70)
options.Size = UDim2.new(1,0,1,-70)
options.BackgroundColor3 = Style.Black

local function createTab(name)
	local btn = Instance.new("TextButton", toolbar)
	btn.Size = UDim2.new(0,120,0,25)
	btn.BackgroundTransparency = 1
	btn.Text = name
	btn.Font = Style.Font
	btn.TextSize = 14
	btn.TextColor3 = Style.Neon
	
	btn.MouseButton1Click:Connect(function()
		title.Text = "ZembluHub | "..name
		Functions.MoveIndicator(indicator, btn)
		options:ClearAllChildren()
		
		if Categories[name] then
			Categories[name](options)
		end
	end)
end

createTab("Player")
createTab("Visual")
createTab("Misc")

Categories.Player(options)

end
