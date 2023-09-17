local GalaxyImage = script.Parent.Clipper.GalaxyImage
local RunService = game:GetService("RunService")
local Players = game.Players
local XPos = -16.553
local ListOfPlayerImages = {}
local StartEvent = game.ReplicatedStorage.StartEvent
local RouteGui = script.Parent
local StartScale = 0.93
local EndScale = 0.064
local Started = false;

function PositionPlayerAvatars()
	for i, playerBust : ImageLabel in ListOfPlayerImages do
		local Percent = math.abs(Players[playerBust.Name].Character.HumanoidRootPart.Position.Z / 2000)
		--print(Percent)
		local NewScale = StartScale + (EndScale - StartScale) * Percent
		--print(NewScale)
		playerBust.Position = UDim2.fromScale(0.94, NewScale)
	end
end

RunService.Heartbeat:Connect(function(deltaTime)
	GalaxyImage.Position = UDim2.fromScale(XPos, GalaxyImage.Position.Y.Scale)
	XPos = math.clamp(XPos + 16.553 * deltaTime, -16.553, 0)
	
	if XPos >= 0 then
		XPos = -16.553
	end
	if Started then

		PositionPlayerAvatars()
	end
end)

StartEvent.OnClientEvent:Connect(function()
	Started = true

	for i, player : Player in Players:GetPlayers() do
		local userId = player.UserId
		
		if player.UserId < 100 then
			userId = 810407882
		end
		local PlayerHeadShot = Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size60x60)
		local NewImageLabel = game.ReplicatedStorage.PlayerBust:Clone()
		NewImageLabel.Image = PlayerHeadShot
		NewImageLabel.Name = player.Name
		NewImageLabel.Position = UDim2.fromScale(0.94, StartScale)
		NewImageLabel.Parent = RouteGui
		table.insert(ListOfPlayerImages, NewImageLabel)
	end
end)