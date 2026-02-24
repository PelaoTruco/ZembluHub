local Players = game:GetService("Players")
local Functions = {}

function Functions.GetZones()
	local zones = {}
	for _,v in pairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") and string.match(v.Name,"Zone$") then
			if not string.match(v.Name,"^Save") then
				table.insert(zones,v)
			end
		end
	end
	return zones
end

function Functions.TeleportTo(part)
	local player = Players.LocalPlayer
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		player.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0,3,0)
	end
end

function Functions.MoveIndicator(indicator, button)
	indicator.Visible = true
	
	local textBounds = button.TextBounds
	
	indicator:TweenSize(
		UDim2.new(0, textBounds.X, 0, 2),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quad,
		0.25,
		true
	)
	
	indicator:TweenPosition(
		UDim2.new(
			button.Position.X.Scale,
			button.Position.X.Offset + (button.AbsoluteSize.X - textBounds.X)/2,
			1,
			-2
		),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quad,
		0.25,
		true
	)
end

return Functions
