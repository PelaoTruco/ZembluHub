local Categories = {}

Categories.Player = function(parent)
	local label = Instance.new("TextLabel", parent)
	label.Size = UDim2.new(1,0,0,40)
	label.BackgroundTransparency = 1
	label.Text = "Player Category Loaded"
	label.TextColor3 = Color3.fromRGB(170,70,255)
	label.Font = Enum.Font.Code
	label.TextSize = 18
end

Categories.Visual = function(parent)
	local label = Instance.new("TextLabel", parent)
	label.Size = UDim2.new(1,0,0,40)
	label.BackgroundTransparency = 1
	label.Text = "Visual Category Loaded"
	label.TextColor3 = Color3.fromRGB(170,70,255)
	label.Font = Enum.Font.Code
	label.TextSize = 18
end

Categories.Misc = function(parent)
	local label = Instance.new("TextLabel", parent)
	label.Size = UDim2.new(1,0,0,40)
	label.BackgroundTransparency = 1
	label.Text = "Misc Category Loaded"
	label.TextColor3 = Color3.fromRGB(170,70,255)
	label.Font = Enum.Font.Code
	label.TextSize = 18
end

return Categories
