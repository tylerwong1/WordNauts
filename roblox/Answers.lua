local TweenService = game:GetService("TweenService")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = script.Parent

local SpaceshipFolder =  workspace.Spaceships
local AsteroidFolder = workspace.Asteroids

local Started = false

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StartEvent = ReplicatedStorage.StartEvent
local SendQuestionEvent = ReplicatedStorage.SendQuestionEvent

local HRP = Character:WaitForChild("HumanoidRootPart")
local Speed = Character:WaitForChild("Speed")

local AnswerChoicesGUI =  LocalPlayer.PlayerGui:WaitForChild("AnswerChoices")
local ScoreGUI = LocalPlayer.PlayerGui:WaitForChild("ScoreGui")
local StartingScreenGUI = LocalPlayer.PlayerGui:WaitForChild("StartingScreen")

StartingScreenGUI.Enabled = true

local SendAnswerEvent = ReplicatedStorage.SendAnswerEvent
local DestroyAsteroidEvent = ReplicatedStorage.DestroyAsteroidEvent

AnswerChoicesGUI.Enabled = false

local QuestionInfo = {
	asteroid = nil,
	questionText = "",
	answerTextList = {},
	correctAnswer = "",
}

local DefaultStrokeColor = Color3.fromRGB(237, 34, 255)
local GreenStrokeColor = Color3.fromRGB(255, 255, 255)
local RedStrokeColor = Color3.fromRGB(255, 0, 0)

local function onPlayerAdded(player)
	local viewportFrame = game.ReplicatedStorage.ViewportFrame:Clone()
	viewportFrame.Parent = StartingScreenGUI.PlayerFrame

	local viewportCamera = Instance.new("Camera")
	viewportCamera.FieldOfView = 40
	viewportFrame.CurrentCamera = viewportCamera
	viewportCamera.Parent = viewportFrame

	local function onCharacterAdded(character)
		--character.Archivable = true

		--character.Archivable = false
		local spaceshipTemplate = SpaceshipFolder:WaitForChild(player.UserId)
		spaceshipTemplate:WaitForChild("FlySeat")
		local spaceshipProp = SpaceshipFolder:WaitForChild(player.UserId):Clone() 
		--local spaceshipProp = ReplicatedStorage.Spaceship:Clone()--ReplicatedStorage.Spaceship:Clone()
		for _, v in pairs(spaceshipProp:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Anchored = true
			end
		end
		
		ReplicatedStorage.R15:WaitForChild("HumanoidRootPart")
		local characterProp = ReplicatedStorage.R15:Clone() --  character:Clone()
		spaceshipProp.Parent = workspace
		characterProp.Parent = workspace
		character:WaitForChild("HumanoidRootPart")
		characterProp.PrimaryPart.CFrame = character.PrimaryPart.CFrame
		spaceshipProp:WaitForChild("FlySeat"):Sit(characterProp.Humanoid)

		local hum = character:WaitForChild("Humanoid")
		if not character:IsDescendantOf(workspace) then
			character.AncestryChanged:Wait()
		end
		local description = hum:GetAppliedDescription()
		characterProp.Humanoid:ApplyDescription(description)

		spaceshipProp.Parent = viewportCamera
		characterProp.Parent = viewportCamera


		viewportCamera.CFrame = CFrame.new(characterProp.PrimaryPart.CFrame * CFrame.new(0, 0, -10).Position, characterProp.PrimaryPart.Position)
	end

	player.CharacterAdded:Connect(onCharacterAdded)
	if player.Character then
		print("Character added")
		onCharacterAdded(player.Character)
	end
end

Players.PlayerAdded:Connect(onPlayerAdded)
for _, player in pairs(Players:GetPlayers()) do
	print("Player added")
	onPlayerAdded(player)
end

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

local function GetAnswerButtonWithText(answerText)
	for _, answerButton in pairs(AnswerChoicesGUI.Frame:GetChildren()) do
		if answerButton:IsA("TextButton") and answerButton.Text == answerText then
			return answerButton
		end	
	end	
end

local function ForAllAnswerButtons(func)
	for _, answerButton in pairs(AnswerChoicesGUI.Frame:GetChildren()) do
		if answerButton:IsA("TextButton") then
			func(answerButton)
		end	
	end			
end

ForAllAnswerButtons(function(answerButton)
	answerButton.UIStroke.Color = DefaultStrokeColor

	answerButton.Activated:Connect(function()
		if answerButton.Text == QuestionInfo.correctAnswer then
			SendAnswerEvent:FireServer(true, QuestionInfo.questionType)

			DestroyAsteroidEvent:FireServer(QuestionInfo.asteroid, true, QuestionInfo.questionType)
			answerButton.UIStroke.Color = GreenStrokeColor
			wait(0.2)
			answerButton.UIStroke.Color = DefaultStrokeColor
			ForAllAnswerButtons(function(answerButton)
				answerButton.Visible = false
			end)

			local asteroid = QuestionInfo.asteroid
			asteroid.AncestryChanged:Connect(function()
				ForAllAnswerButtons(function(answerButton) 

					answerButton.Visible = true
				end)
			end)


		else
			SendAnswerEvent:FireServer(false, QuestionInfo.questionType)

			local correctAnswerButton = GetAnswerButtonWithText(QuestionInfo.correctAnswer)


			correctAnswerButton.UIStroke.Color = GreenStrokeColor

			answerButton.UIStroke.Color = RedStrokeColor
			wait(0.2)
			correctAnswerButton.UIStroke.Color = DefaultStrokeColor
			answerButton.UIStroke.Color = DefaultStrokeColor
			ForAllAnswerButtons(function(answerButton)
				answerButton.Visible = false
			end)

			local asteroid = QuestionInfo.asteroid
			asteroid.AncestryChanged:Connect(function()
				ForAllAnswerButtons(function(answerButton) 

					answerButton.Visible = true
				end)
			end)
		end
	end)
end)

StartEvent.OnClientEvent:Connect(function()
	Started = true

	ScoreGUI.TextLabel.Visible = true
	
	local seat = SpaceshipFolder[LocalPlayer.UserId].PrimaryPart
	--seat.LinearVelocity.VectorVelocity = HRP.CFrame.LookVector * Speed.Value

	AnswerChoicesGUI.Enabled = true
	StartingScreenGUI.Enabled = false
end)

local EndEvent = ReplicatedStorage.EndEvent

EndEvent.OnClientEvent:Connect(function()
	Started = false
	
	ScoreGUI.TextLabel.Visible = false
	
	AnswerChoicesGUI.Enabled = false
	StartingScreenGUI.Enabled = true
end)

spawn(function()
	while true do
		local seat = SpaceshipFolder[LocalPlayer.UserId].PrimaryPart
		--seat.LinearVelocity.VectorVelocity = HRP.CFrame.LookVector * Speed.Value
		game:GetService("RunService").Stepped:Wait()
	end
end)

Character.Score.Changed:Connect(function(newScore)
	ScoreGUI.TextLabel.Text = tostring(newScore)
end)

spawn(function()
	while true do 
		game:GetService("RunService").Stepped:Wait()
		local asteroids = {}
		for _, child in pairs(AsteroidFolder:GetChildren()) do
			if string.find(child.Name, LocalPlayer.UserId) then
				table.insert(asteroids, child)
			end
		end
		local closestAsteroid = asteroids[1]
		for _, asteroid in pairs(asteroids) do
			if (Character.PrimaryPart.Position - asteroid.Position).Magnitude < (Character.PrimaryPart.Position - closestAsteroid.Position).Magnitude then
				closestAsteroid = asteroid
			end
		end
		
		if QuestionInfo.asteroid ~= closestAsteroid then
			
			local success, err = pcall(function()
				
				ForAllAnswerButtons(function(answerButton)
					answerButton.Visible = true
				end)

				QuestionInfo.asteroid = closestAsteroid
				QuestionInfo.questionText = closestAsteroid.QuestionText.Value
				
				QuestionInfo.answerTextList = {}
				for _, answerText in pairs(closestAsteroid.AnswerTextList:GetChildren()) do
					table.insert(QuestionInfo.answerTextList, answerText.Value)
				end
				QuestionInfo.correctAnswer = closestAsteroid.CorrectAnswer.Value
				QuestionInfo.questionType = closestAsteroid.QuestionType.Value
				
				local connection = nil

				local asteroid = closestAsteroid
				

					local answerButtonList = {}

					for _, answerButton in pairs(AnswerChoicesGUI.Frame:GetChildren()) do
						if answerButton:IsA("TextButton") then
							table.insert(answerButtonList, answerButton)  
						end
					end

					for i = 1, #answerButtonList do
						answerButtonList[i].Text = QuestionInfo.answerTextList[i]
					end

				local function checkAsteroidOnStepped()
					if asteroid.Parent ~= AsteroidFolder then
						connection:Disconnect()
					end

					if asteroid.Parent == AsteroidFolder and asteroid.Position.Z - Character.PrimaryPart.Position.Z > -25 then
						
						DestroyAsteroidEvent:FireServer(asteroid, false, QuestionInfo.questionType)
						--asteroid:Destroy()
						

						local colorDict = {}

						spawn(function()
							for _, v in pairs(SpaceshipFolder[LocalPlayer.UserId]:GetChildren()) do
								if v:IsA("BasePart") then
									colorDict[v] = v.BrickColor

									v.BrickColor = BrickColor.new("Bright red")
								end
							end

							wait(0.3)

							for _, v in pairs(SpaceshipFolder[LocalPlayer.UserId]:GetChildren()) do
								if v:IsA("BasePart") then
									v.BrickColor = colorDict[v]
								end
							end
						end)

						connection:Disconnect()
					end

				end 

				connection = game:GetService("RunService").Stepped:Connect(checkAsteroidOnStepped)
			
			end)
			
			if not success then
				--print(err)
			end
		end
	end
end)

--SendQuestionEvent.OnClientEvent:Connect(function(asteroidName, questionText, answerTextList, correctAnswer, questionType)
--	repeat wait() print("wait") until QuestionInfo.asteroid == nil or QuestionInfo.asteroid.Parent ~= AsteroidFolder

--	print("New asteroid request received")

--	ForAllAnswerButtons(function(answerButton)
--		answerButton.Visible = true
--	end)

--	QuestionInfo.asteroid = AsteroidFolder:WaitForChild(asteroidName)
--	QuestionInfo.questionText = questionText
--	QuestionInfo.answerTextList = answerTextList
--	QuestionInfo.correctAnswer = correctAnswer
--	QuestionInfo.questionType = questionType

--	local connection = nil

--	local asteroid = AsteroidFolder:WaitForChild(asteroidName)

--	local answerButtonList = {}

--	for _, answerButton in pairs(AnswerChoicesGUI.Frame:GetChildren()) do
--		if answerButton:IsA("TextButton") then
--			table.insert(answerButtonList, answerButton)  
--		end
--	end

--	for i = 1, #answerButtonList do
--		answerButtonList[i].Text = answerTextList[i]
--	end
--	local function checkAsteroidOnStepped()
--		if asteroid.Parent ~= AsteroidFolder then
--			connection:Disconnect()
--		end
		
		

--		if asteroid.Parent == AsteroidFolder and asteroid.Position.Z - Character.PrimaryPart.Position.Z > -25 then
--			print("Destroy asteroid from touch")
--			DestroyAsteroidEvent:FireServer(asteroid, false, QuestionInfo.questionType)
--			asteroid:Destroy()
--			Speed.Value = Speed.Value - 4

--			local colorDict = {}

--			spawn(function()
--				for _, v in pairs(SpaceshipFolder[LocalPlayer.UserId]:GetChildren()) do
--					if v:IsA("BasePart") then
--						colorDict[v] = v.BrickColor

--						v.BrickColor = BrickColor.new("Bright red")
--					end
--				end

--				wait(0.3)

--				for _, v in pairs(SpaceshipFolder[LocalPlayer.UserId]:GetChildren()) do
--					if v:IsA("BasePart") then
--						v.BrickColor = colorDict[v]
--					end
--				end
--			end)

--			connection:Disconnect()
--		end

--	end 

--	connection = game:GetService("RunService").Stepped:Connect(checkAsteroidOnStepped)
--end)


script.Sound:Play()