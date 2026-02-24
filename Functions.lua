local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local Functions = {}

-- ZONES FILTRADAS
function Functions.GetZones()
	local zones = {}

	for _,v in ipairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") then
			if string.match(v.Name,"Zone$") and not string.match(v.Name,"^Save") then
				table.insert(zones,v)
			end
		end
	end

	return zones
end

-- TELEPORT
function Functions.TeleportTo(part)
	local player = Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local root = character:WaitForChild("HumanoidRootPart")

	root.CFrame = part.CFrame + Vector3.new(0,4,0)
end

-- SUBRAYADO ANIMADO
function Functions.MoveIndicator(indicator, button)
	local textSize = button.TextBounds.X
	
	indicator:TweenSize(
		UDim2.new(0,textSize,0,2),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quad,
		0.25,
		true
	)

	indicator:TweenPosition(
		UDim2.new(
			button.Position.X.Scale,
			button.Position.X.Offset + (button.AbsoluteSize.X - textSize)/2,
			1,
			-2
		),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Quad,
		0.25,
		true
	)
end

-- ANIMACIÓN DE APERTURA
function Functions.AnimateOpen(frame)
	frame.Size = UDim2.new(0,0,0,0)
	frame.Position = UDim2.new(0.5,0,0.5,0)

	frame:TweenSizeAndPosition(
		UDim2.new(0,700,0,450),
		UDim2.new(0.5,-350,0.5,-225),
		Enum.EasingDirection.Out,
		Enum.EasingStyle.Back,
		0.35,
		true
	)
end

-- DRAG SUAVE
function Functions.MakeDraggable(frame)
	local dragging, dragInput, startPos, startFramePos

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			startPos = input.Position
			startFramePos = frame.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - startPos
			frame.Position = UDim2.new(
				startFramePos.X.Scale,
				startFramePos.X.Offset + delta.X,
				startFramePos.Y.Scale,
				startFramePos.Y.Offset + delta.Y
			)
		end
	end)
end

-- RESET AL MORIR
function Functions.EnableReset(gui)
	local player = Players.LocalPlayer

	player.CharacterAdded:Connect(function()
		task.wait(0.2)
		if gui then
			gui:Destroy()
		end
		loadstring(game:HttpGet("https://raw.githubusercontent.com/PelaoTruco/ZembluHub/main/Loader.lua"))()
	end)
end

return Functions
