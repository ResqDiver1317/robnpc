Config = {}

Config.ShouldWaitBetweenRobbing = true --Setting to true will cause a random time within the range defined below to be required before a player can rob another NPC. Setting to false will allow the player to immediately rob another NPC.
Config.MinWaitSeconds = 60 --Minimum wait time in seconds.
Config.MaxWaitSeconds = 180  --Maximum wait time in seconds.

Config.RobDistance = 3 --Maximum distance from the NPC to rob them. If too far away, players will receive a message saying they are too far away.
Config.RobTimeMinSeconds = 60 --Minimum time in seconds needed for the robbery to complete.
Config.RobTimeMaxSeconds = 120 --Maximum time in seconds needed for the robbery to complete.

Config.MinMoney = 1 --Minimum amount of money to get from a robbery
Config.MaxMoney = 200 --Maximum amount of money to get from a robbery.

Config.Notify = true --If you want to have a chance of an alert being sent for the mugging, set as true. If not, then set as false.
Config.AlertChance = 60 --Percent of notification chance. Default of 60 means there is a 60(ish)% chance of an alert being sent for your robbery.


--NOTICE ABOUT THE LANGUAGE CONFIG!! At the moment, the settings below will not actually affect the messages in game. This is a coming feature that should be released in the next day or 2 but at the moment, all the text for messages and notifications is set manually in the server and client lua files.
--[[The section below is where you can edit the text to your liking. A few things to note about the layout.
1. All text MUST start and end with quotes.
2. ~r~, ~y~, ~g~, ~w~, etc set colors. If you want other colors, you can change the letter inside the ~'s.
~r~ = Red
~b~ = Blue
~g~ = Green
~y~ = Yellow
~p~ = Purple
~c~ = Grey
~m~ = Dark Grey
~u~ = Black
~o~ = Orange
6. RobNPC: and POLICE ALERT: both have : in them. This is not required, just makes a nice break in the text between the title and text (basically like sender: message being sent)
]]
Config.TooSoon = "~r~Your last robbery was too recent. Please wait to conduct your next robbery."
Config.VictimDead = "~r~Your victim is dead and cannot be robbed."
Config.ActualPlayer = "~r~You cannot use this to rob other players. You can only rob NPCs."
Config.TooFar = "~r~Your target is too far away to rob. Move closer."
Config.Cooldown = "~y~ seconds before you can commit another robbery" --time is insterted automatically in front of the this text.
Config.Reset = "~g~You can now rob another NPC."
Config.StealAmountTitle = "RobNPC"
Config.StealAmountMessage = " You stole $" --amount stolen is insterted automatically at the end of this text.
Config.AlertTitle = "POLICE ALERT"
Config.AlertMessage = " Reported Mugging near ~w~ "
