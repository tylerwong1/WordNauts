local TweenService = game:GetService("TweenService")


local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local StartPartsFolder = workspace.Startparts
local SpaceshipFolder = workspace.Spaceships
local AsteroidFolder = workspace.Asteroids

local Spaceship = game:GetService("ServerStorage").Spaceship
local Asteroid = game.ServerStorage.Asteroid

local StartEvent = ReplicatedStorage.StartEvent
local SendQuestionEvent = ReplicatedStorage.SendQuestionEvent
local DestroyAsteroidEvent = ReplicatedStorage.DestroyAsteroidEvent
local SendAnswerEvent = ReplicatedStorage.SendAnswerEvent

local QuestionService = require(ServerStorage.QuestionService)

local PlayerDataTemplate = {
	verbAnswered = 0,
	nounAnswered = 0,
	adjectiveAnswered = 0,
	correctVerbAnswered = 0,
	correctNounAnswered = 0,
	correctAdjectiveAnswered = 0,
	distancePercentage = 0,
}

local PlayerData = {}

DestroyAsteroidEvent.OnServerEvent:Connect(function(player, asteroid, answeredCorrectly, questionType)
	--local AstTween = TweenService:Create(asteroid, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = Vector3.new(46.8, 58.5, 35.1)*100, Transparency = 0})
	--AstTween:Play()
	local AstTween2 = TweenService:Create(asteroid.Mesh, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Scale = Vector3.new(14.82, 14.82, 14.82)*5})
	AstTween2:Play()
	print("Fireserver")
	AstTween2.Completed:Connect(function()
		print(asteroid.Size, asteroid, asteroid.Parent)
		asteroid:Destroy()
	end)
	
	
	


	local increment = answeredCorrectly and 4 or -24

	player.Character.Speed.Value = math.clamp(4, player.Character.Speed.Value + increment, math.huge)

	if questionType == "Verb" then
		PlayerData[player.Name].verbAnswered = PlayerData[player.Name].verbAnswered + 1
		if answeredCorrectly then
			PlayerData[player.Name].correctVerbAnswered = PlayerData[player.Name].correctVerbAnswered + 1
		end
	end
	if questionType == "Noun" then
		PlayerData[player.Name].nounAnswered = PlayerData[player.Name].nounAnswered + 1
		if answeredCorrectly then
			PlayerData[player.Name].correctNounAnswered = PlayerData[player.Name].correctNounAnswered + 1
		end
	end
	if questionType == "Adjective" then
		PlayerData[player.Name].adjectiveAnswered = PlayerData[player.Name].adjectiveAnswered + 1
		if answeredCorrectly then
			PlayerData[player.Name].correctAdjectiveAnswered = PlayerData[player.Name].correctAdjectiveAnswered + 1
		end
	end
end)

--local PlayerDataTemplate = {
--	verbAnswered = 0,
--	nounAnswered = 0,
--	adjectiveAnswered = 0,
--	correctVerbAnswered = 0,
--	correctNounAnswered = 0,
--	correctAdjectiveAnswered = 0,
--}

SendAnswerEvent.OnServerEvent:Connect(function(player, isCorrect)
	if isCorrect then 
		player.Character.Score.Value = player.Character.Score.Value + 100
	else
		player.Character.Score.Value = math.max(0, player.Character.Score.Value - 20)
	end


end)

local RNG = Random.new()

local function HasMultipleAsteroids(player)
	local asteroidNum = 0

	for _, asteroid in pairs(AsteroidFolder:GetChildren()) do
		if string.find(asteroid.Name, player.UserId) then
			asteroidNum = asteroidNum + 1
			if asteroidNum > 1 then
				return true
			end
		end
	end

	return false
end

local function GenerateAsteroid(character)
	local player = Players:GetPlayerFromCharacter(character)

	local asteroidClone = Asteroid:Clone()
	asteroidClone.CFrame = character.HumanoidRootPart.CFrame*CFrame.new(0,0,-900)
	asteroidClone.AlignOrientation.Attachment1 = StartPartsFolder:FindFirstChild(player.UserId).Attachment 
	asteroidClone.Name = player.UserId .. tostring(tick())
	asteroidClone.Parent = AsteroidFolder
	asteroidClone.LinearVelocity.VectorVelocity = character.HumanoidRootPart.CFrame.LookVector*-250

	

	local questionLabel = asteroidClone.BillboardGui.PromptFrame.QuestionLabel

	local questionTypes = {"Verb", "Noun", "Adjective"}
	local questionIndex = RNG:NextInteger(1, 20)
	local questionType = questionTypes[RNG:NextInteger(1,3)]

	local questionText = QuestionService:GetQuestion(questionIndex, questionType)
	local answerTextList = QuestionService:GetAnswerChoices(questionIndex, questionType)
	local correctAnswer = QuestionService:GetAnswer(questionIndex, questionType)

	spawn(function()
		--while HasMultipleAsteroids(player) do wait() end
		print("Send client asteroid info")
		SendQuestionEvent:FireClient(player, asteroidClone.Name, questionText, answerTextList, correctAnswer, questionType)
	end)

	asteroidClone.QuestionText.Value = questionText
	for i = 1, #answerTextList do
		asteroidClone.AnswerTextList:GetChildren()[i].Value = answerTextList[i]
	end
	asteroidClone.CorrectAnswer.Value = correctAnswer
	asteroidClone.QuestionType.Value = questionType

	questionLabel.Text = questionText

	return asteroidClone
end

local GameRunning = false

local function StartGame()
	StartEvent:FireAllClients()
	
	GameRunning = true
	
	for _, v in pairs(SpaceshipFolder:GetChildren()) do
		local seat = v.FlySeat
		local character = seat.Occupant.Parent
		
		seat.PlaneZConstraint.Enabled = false
		--game:GetService"RunService".Stepped:Connect(function()
			
		--end)
		
		game:GetService"RunService".Stepped:Wait()
		seat:SetNetworkOwner(nil)
		
		seat.LinearVelocity.VectorVelocity = character.HumanoidRootPart.CFrame.LookVector * character.Speed.Value
	end
	
	local steppedConnection = nil
	
	steppedConnection = game:GetService"RunService".Stepped:Connect(function()
		if not GameRunning then
			steppedConnection:Disconnect()
		end
		
		for _, v in pairs(SpaceshipFolder:GetChildren()) do
			local seat = v.FlySeat
			local character = seat.Occupant.Parent

			seat.LinearVelocity.VectorVelocity = character.HumanoidRootPart.CFrame.LookVector * character.Speed.Value
		end
	end)

	for _, player in pairs(Players:GetPlayers()) do
		local waitTime = player.Character.TimeIncrement.Value

		spawn(function()
			while GameRunning do
				local asteroid = GenerateAsteroid(player.Character)
				
				asteroid.AncestryChanged:Wait()
			end
		end)
	end
	
	for i = 1, 120 do
		for _, player in pairs(PlayerData) do
			print(player.distancePercentage)
			if player.distancePercentage >= 100 then
				break
			end
		end
		wait(1)
	end
	
	GameRunning = false
	
	for _, v in pairs(SpaceshipFolder:GetChildren()) do
		local seat = v.FlySeat
		local character = seat.Occupant.Parent

		seat.PlaneZConstraint.Enabled = true
		--game:GetService"RunService".Stepped:Connect(function()

		--end)
	end
	
end

local function TeleportPlayer(player)
	local startPart = Instance.new("Part")
	startPart.CanCollide = false
	startPart.Anchored = true
	startPart.Position = Vector3.new(#StartPartsFolder:GetChildren()*300,20,0)
	startPart.BrickColor = BrickColor.new("Bright red")
	startPart.Transparency = 1
	startPart.Name = tostring(player.UserId)
	startPart.Parent = StartPartsFolder

	local spaceshipClone = Spaceship:Clone()

	spaceshipClone.PrimaryPart.CFrame = startPart.CFrame*CFrame.new(0,0,0)
	spaceshipClone.Name = player.UserId

	local att1 = Instance.new("Attachment")
	att1.Parent = startPart
	spaceshipClone.PrimaryPart.AlignOrientation.Attachment1 = att1

	local highlight = Instance.new("Highlight")
	highlight.FillColor = Color3.fromRGB(255, 255, 255)
	highlight.FillTransparency = 0.7
	highlight.Parent = player.Character

	spaceshipClone.Parent = SpaceshipFolder
	wait() -- fixes param is not humanoid bug
	spaceshipClone.FlySeat:Sit(player.Character.Humanoid)
end

local function SendData()

end

local function onPlayerAdded(player)
	player.Chatted:Connect(function(msg)
		if msg == "start" then
			StartGame()
		end
	end)

	player.CharacterAdded:Connect(function()
		TeleportPlayer(player)
	end)

	PlayerData[player.Name] = table.clone(PlayerDataTemplate)


end

for _, player in pairs(Players:GetPlayers()) do
	onPlayerAdded(player)
end
Players.PlayerAdded:Connect(onPlayerAdded)

local HttpService = game:GetService("HttpService")

while true do
	for _, player in pairs(Players:GetPlayers()) do
		local spaceship = SpaceshipFolder:WaitForChild(player.UserId)
		local zDistance = spaceship.PrimaryPart.Position.Z
		PlayerData[player.Name].distancePercentage = zDistance/-2000*100
		

	end
	
	for userId, dataTable in pairs(PlayerData) do
		--print(userId, "Verb Answered:", dataTable.verbAnswered)
		--print(userId, "Correct Answered:", dataTable.correctVerbAnswered)
		--print(userId, "Noun Answered:", dataTable.nounAnswered)
		--print(userId, "Correct Noun Answered:", dataTable.correctNounAnswered)
		--print(userId, "Adjective Answered:", dataTable.adjectiveAnswered)
		--print(userId, "Correct Adjective Answered:", dataTable.correctAdjectiveAnswered)
		--print(userId, "Distance Percenage:", dataTable.distancePercentage)
	end

	wait(2)

	local dataToEncode = {
		serverId = game.JobId,
		gameTime = 0,
		playerData = PlayerData
	}
	--HttpService:PostAsync("http://ec2-3-85-42-156.compute-1.amazonaws.com:3001/api/post-data", HttpService:JSONEncode(dataToEncode))
	HttpService:PostAsync("http://10.108.162.216:3001/api/post-data", HttpService:JSONEncode(dataToEncode))
	--http://10.108.162.216:3001/api/post-data
end
