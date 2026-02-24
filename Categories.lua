local Categories = {}

Categories.Player = function(parent, Style, Functions)
	parent:ClearAllChildren()

	local zones = Functions.GetZones()
	local selected

	local container = Instance.new("Frame", parent)
	container.Size = UDim2.new(0,350,0,200)
	container.Position = UDim2.new(0,20,0,20)
	container.BackgroundColor3 = Style.DarkPurple
	container.BorderSizePixel = 0

	local title = Instance.new("TextLabel", container)
	title.Size = UDim2.new(1,0,0,30)
	title.BackgroundTransparency = 1
	title.Text = "Teleport Zones"
	title.TextColor3 = Style.Neon
	title.Font = Style.Font
	title.TextSize = 14

	local list = Instance.new("Frame", container)
	list.Position = UDim2.new(0,10,0,40)
	list.Size = UDim2.new(1,-20,0,110)
	list.BackgroundColor3 = Style.Black
	list.BorderSizePixel = 0

	local layout = Instance.new("UIListLayout", list)
	layout.Padding = UDim.new(0,5)

	for _,zone in ipairs(zones) do
		local btn = Instance.new("TextButton", list)
		btn.Size = UDim2.new(1,0,0,25)
		btn.BackgroundTransparency = 1
		btn.Text = zone.Name
		btn.Font = Style.Font
		btn.TextSize = 12
		btn.TextColor3 = Style.Neon

		btn.MouseButton1Click:Connect(function()
			selected = zone
		end)
	end

	local tp = Instance.new("TextButton", container)
	tp.Position = UDim2.new(0.5,-60,1,-35)
	tp.Size = UDim2.new(0,120,0,25)
	tp.BackgroundColor3 = Style.Black
	tp.Text = "Teleport"
	tp.Font = Style.Font
	tp.TextSize = 13
	tp.TextColor3 = Style.Neon
	tp.BorderSizePixel = 0

	tp.MouseButton1Click:Connect(function()
		if selected then
			Functions.TeleportTo(selected)
		end
	end)
end

return Categories
