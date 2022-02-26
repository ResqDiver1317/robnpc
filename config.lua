Config = {}
Config.Framework = false --If using Andyyy's Framework, set to true. If just using Andyyy's currency system and NOT the full framework, set to false.

Config.ShouldWaitBetweenRobbing = true --Setting to true will cause a random time within the range defined below to be required before a player can rob another NPC. Setting to false will allow the player to immediately rob another NPC.
Config.MinWaitSeconds = 60 --Minimum wait time in seconds.
Config.MaxWaitSeconds = 180  --Maximum wait time in seconds.

Config.RobDistance = 3 --Maximum distance from the NPC to rob them. If too far away, players will receive a message saying they are too far away.
Config.RobAnimationSeconds = 60 --Time in seconds needed for the robbery to complete.

Config.MinMoney = 1 --Minimum amount of money to get from a robbery
Config.MaxMoney = 200 --Maximum amount of money to get from a robbery.

Config.Notify = true --If you want to have a chance of an alert being sent for the mugging, set as true. If not, then set as false.
Config.AlertChance = 60 --Percent of notification chance. Default of 60 means there is a 60% chance of an alert being sent for your robbery.


--[[The section below is where you can edit the text to your liking. A few things to note about the layout.
1. All text MUST start and end with quotes.
2. .. cooldowntimer .. must be OUTSIDE of the quotes ("first part " ..cooldowntimer .. " rest of statement")
3. ..amount.. must also remain OUTSIDE of the quotes ("first part $" ..amount.. " rest of statement")
3 and 4 continued. The extra space inside the quotes allows for the space to display in the text when inserting the timer and amount. Spaces outside the quotes before/after the .. cooldowntimer .. and ..amount.. will not display in the actual text in game. The spaces MUST be contained inside the quote sections.
5. ~r~, ~y~, ~g~, ~w~, etc set colors. If you want other colors, you can change the letter inside the ~'s.
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
Config.Cooldown = "~y~You must wait " .. cooldowntimer .. " seconds before you can commit another robbery"
Config.Reset = "~g~You can now rob another NPC."
Config.StealAmountTitle = "RobNPC:"
Config.StealAmountMessage = " You stole $" ..amount.. " from the NPC."
Config.AlertTitle = "POLICE ALERT:"
Config.AlertMessage = " Reported Mugging near ~w~ "
