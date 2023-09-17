local QuestionService = {}

QuestionService.VerbQuestions = {
	"Jon _ at the red light.",
	"Samuel _ from the trampoline.",
	"Timmy _ Sarah on the phone.",
	"Alexis _ on her test.",
	"George _ dinner for his family.",
	"Kelly _ the fence white.",
	"Sara _ through the park.",
	"Bill _ a book in the library.",
	"Emily _ to music.",
	"Alice _ in the ballroom.",
	"Kevin _ soccer with his friends.",
	"Elaine _ in the lake.",
	"Robert _ up his assignment.",
	"Diana _ a movie.",
	"Steve _ the garage.",
	"Paula _ a song.",
	"Linda _ some flowers.",
	"Jenny _ a scarf.",
	"Oscar _ the door.",
	"Nancy _ at the joke.",
}

-- Used chatgpt to get the other answer choices. Did not check how fitting they are yet.
QuestionService.ListOfVerbAnswers = {
	[1] = {
		"danced",
		"sang",
		"jumped",
		"stopped" -- Corrected choice
	},
	[2] = {
		"climbed",
		"laughed",
		"bounced",
		"jumped" -- Corrected choice
	},
	[3] = {
		"painted",
		"visited",
		"called", -- Corrected choice
		"wrote"
	},
	[4] = {
		"focised",
		"slept",
		"jogged",
		"focused" -- Corrected choice
	},
	[5] = {
		"founded",
		"built",
		"cleaned",
		"cooked" -- Corrected choice
	},
	[6] = {
		"jumped",
		"danced",
		"read",
		"painted" -- Corrected choice
	},
	[7] = {
		"walkd",
		"skipt",
		"bikeded",
		"biked" -- Corrected choice
	},
	[8] = {
		"read",
		"listened",
		"ate",
		"red" -- Corrected choice
	},
	[9] = {
		"song",
		"dancd",
		"jumpd",
		"listened" -- Corrected choice
	},
	[10] = {
		"swam",
		"painted",
		"biked",
		"danced" -- Corrected choice
	},
	[11] = {
		"read",
		"jumped",
		"painted",
		"played" -- Corrected choice
	},
	[12] = {
		"sang",
		"jumpd",
		"painted",
		"swam" -- Corrected choice
	},
	[13] = {
		"painted",
		"swam",
		"red",
		"typed" -- Corrected choice
	},
	[14] = {
		"cleaned",
		"cooked",
		"painted",
		"watched" -- Corrected choice
	},
	[15] = {
		"planted",
		"jumped",
		"danced",
		"cleaned" -- Corrected choice
	},
	[16] = {
		"rote",
		"jumped",
		"painted",
		"sang" -- Corrected choice
	},
	[17] = {
		"read",
		"painted",
		"wrote",
		"planted" -- Corrected choice
	},
	[18] = {
		"jumped",
		"danced",
		"painted",
		"knitted" -- Corrected choice
	},
	[19] = {
		"danced",
		"painted",
		"read",
		"opened" -- Corrected choice
	},
	[20] = {
		"jumped",
		"painted",
		"danced",
		"laughed" -- Corrected choice
	},
}

QuestionService.ListOfCorrectVerbAnswers = {
	[1] = "stopped",
	[2] = "jumped",
	[3] = "called",
	[4] = "focused",
	[5] = "cooked",
	[6] = "painted",
	[7] = "biked",
	[8] = "read",
	[9] = "listened",
	[10] = "danced",
	[11] = "played",
	[12] = "swam",
	[13] = "typed",
	[14] = "watched",
	[15] = "cleaned",
	[16] = "sang",
	[17] = "planted",
	[18] = "knitted",
	[19] = "opened",
	[20] = "laughed",
}

-- Noun Questions
QuestionService.NounQuestions = {
	"Lisa saw a beautiful _ in the garden.",
	"The _ in the sky is shining brightly.",
	"My pet _ loves to chase its tail.",
	"We visited the _ at the zoo.",
	"The _ in the school is full of interesting books.",
	"I found a copper _ on the beach.",
	"The _ in the kitchen is making a delicious meal.",
	"She planted a row of pretty _ in her garden.",
	"The _ in the park is covered in snow in winter.",
	"The _ in the classroom is very friendly.",
	"We watched a movie about a brave _.",
	"My dad fixed the broken _ in the garage.",
	"The _ at the museum is ancient and valuable.",
	"I love to play with my toy _ in the backyard.",
	"The _ on the mountain was covered in snow.",
	"She wore a beautiful _ to the party.",
	"The _ in the pond are swimming gracefully.",
	"He found a silver _ on the beach.",
	"Our neighbor has a friendly _ named Max.",
	"The _ in the forest have colorful leaves in the fall."
}

-- List of Noun Answer Choices
QuestionService.ListOfNounAnswers = {
	[1] = {
		"flower",
		"moon",
		"flour",
		"chree"
	},
	[2] = {
		"sun",
		"bird",
		"kite",
		"cloud"
	},
	[3] = {
		"dog",
		"library",
		"book",
		"teacher"
	},
	[4] = {
		"seals",
		"park",
		"aquarium",
		"museum"
	},
	[5] = {
		"library",
		"libarry",
		"school",
		"office"
	},
	[6] = {
		"coin",
		"sandcastle",
		"umbrella",
		"crab"
	},
	[7] = {
		"chef",
		"dog",
		"ham",
		"artist"
	},
	[8] = {
		"flowers",
		"books",
		"paintings",
		"cakes"
	},
	[9] = {
		"pleyground",
		"plaground",
		"playground",
		"playgrewnd"
	},
	[10] = {
		"marker",
		"eraser",
		"hamster",
		"pencil"
	},
	[11] = {
		"hero",
		"coward",
		"hiro",
		"cowerd"
	},
	[12] = {
		"car",
		"cor",
		"sun",
		"moon"
	},
	[13] = {
		"artifacts",
		"bathrooms",
		"trash",
		"closets"
	},
	[14] = {
		"car",
		"cor",
		"roket",
		"roccet"
	},
	[15] = {
		"sun",
		"moon",
		"cave",
		"son"
	},
	[16] = {
		"dress",
		"hamster",
		"ham",
		"son"
	},
	[17] = {
		"ducks",
		"dogs",
		"wolves",
		"hamsters"
	},
	[18] = {
		"coin",
		"treasure",
		"shell",
		"rock"
	},
	[19] = {
		"dog",
		"computer",
		"laptop",
		"table"
	},
	[20] = {
		"trees",
		"chrees",
		"birds",
		"dogs"
	}
}

-- List of Correct Noun Answers
QuestionService.ListOfCorrectNounAnswers = {
	[1] = "flower",
	[2] = "sun",
	[3] = "dog",
	[4] = "seals",
	[5] = "library",
	[6] = "coin",
	[7] = "chef",
	[8] = "flowers",
	[9] = "playground",
	[10] = "hamster",
	[11] = "hero",
	[12] = "car",
	[13] = "artifacts",
	[14] = "car",
	[15] = "cave",
	[16] = "dress",
	[17] = "ducks",
	[18] = "coin",
	[19] = "dog",
	[20] = "trees"
}
-- Adjective Questions
QuestionService.AdjectiveQuestions = {
	"The _ cat slept on the windowsill.",
	"Her _ dress was quite lovely.",
	"The _ flowers smelled really nice.",
	"His _ smile brightened the room.",
	"The _ mountain is covered in snow.",
	"The _ pizza was absolutely delicious.",
	"The _ sky was clear and blue.",
	"The _ dog chased its tail joyfully.",
	"She found a _ seashell on the beach. It was different.",
	"The _ book had an exciting story.",
	"The _ sunsets over the ocean are breathtaking.",
	"Their _ house is cozy and warm.",
	"The _ butterfly landed on the flower gently.",
	"The _ movie made everyone laugh heartily.",
	"His _ drawings were truly impressive.",
	"The _ song brought tears to her eyes.",
	"The _ garden gave her comfort.",
	"The _ scarf kept her warm in winter.",
	"The _ door was locked securely.",
	"The _ joke made everyone laugh heartily."
}

-- List of Adjective Answer Choices
QuestionService.ListOfAdjectiveAnswers = {
	[1] = {
		"sleepy",
		"playful",
		"furry",
		"quiet"
	},
	[2] = {
		"ugly",
		"elegant",
		"unattractive",
		"bland"
	},
	[3] = {
		"fragrant",
		"vivid",
		"smelly",
		"weird"
	},
	[4] = {
		"dark",
		"happy",
		"sad",
		"evil"
	},
	[5] = {
		"majestic",
		"evil",
		"weird",
		"ugly"
	},
	[6] = {
		"repulsive",
		"nasty",
		"disgusting",
		"scrumptious"
	},
	[7] = {
		"nice",
		"dark",
		"sad",
		"bad"
	},
	[8] = {
		"playful",
		"evil",
		"shy",
		"calm"
	},
	[9] = {
		"common",
		"plain",
		"smooth",
		"unique"
	},
	[10] = {
		"boring",
		"thrilling",
		"obvious",
		"simple"
	},
	[11] = {
		"common",
		"boring",
		"scenic",
		"simple"
	},
	[12] = {
		"cozy",
		"dark",
		"cold",
		"noisy"
	},
	[13] = {
		"graceful",
		"jittery",
		"spasmodic",
		"hyper"
	},
	[14] = {
		"boring",
		"provocative",
		"weird",
		"amusing"
	},
	[15] = {
		"common",
		"plain",
		"artistic",
		"silly"
	},
	[16] = {
		"melodious",
		"loud",
		"quiet",
		"fast"
	},
	[17] = {
		"pieceful",
		"peaceful",
		"scary",
		"weird"
	},
	[18] = {
		"rough",
		"hard",
		"uncomfortable",
		"fuzzy"
	},
	[19] = {
		"unreliable",
		"strong",
		"unrepaired",
		"broken"
	},
	[20] = {
		"funny",
		"funnee",
		"unfunny",
		"weird"
	}
}

-- List of Correct Adjective Answers
QuestionService.ListOfCorrectAdjectiveAnswers = {
	[1] = "sleepy",
	[2] = "elegant",
	[3] = "fragrant",
	[4] = "happy",
	[5] = "majestic",
	[6] = "scrumptious",
	[7] = "nice",
	[8] = "playful",
	[9] = "unique",
	[10] = "thrilling",
	[11] = "scenic",
	[12] = "cozy",
	[13] = "graceful",
	[14] = "amusing",
	[15] = "artistic",
	[16] = "melodious",
	[17] = "peaceful",
	[18] = "fuzzy",
	[19] = "strong",
	[20] = "funny"
}

QuestionService.ListOfQuestions = {
	Verb = QuestionService.VerbQuestions,
	Noun = QuestionService.NounQuestions,
	Adjective = QuestionService.AdjectiveQuestions,
}

QuestionService.ListOfAnswers = {
	Verb = QuestionService.ListOfCorrectVerbAnswers,
	Noun = QuestionService.ListOfCorrectNounAnswers,
	Adjective = QuestionService.ListOfCorrectAdjectiveAnswers,
}

QuestionService.ListOfAnswerChoices = {
	Verb = QuestionService.ListOfVerbAnswers,
	Noun = QuestionService.ListOfNounAnswers,
	Adjective = QuestionService.ListOfAdjectiveAnswers,
}

function QuestionService:GetQuestion(index, category)
	return QuestionService.ListOfQuestions[category][index]
end

function QuestionService:GetAnswer(index, category)
	return QuestionService.ListOfAnswers[category][index]
end

function QuestionService:GetAnswerChoices(index, category)
	return QuestionService.ListOfAnswerChoices[category][index]
end



return QuestionService