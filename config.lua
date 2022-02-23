Config = {}
Config.Framework = false --If using Andyyy's Framework, set to true. If just using Andyyy's currency system and NOT the full framework, set to false.

Config.Locale = 'en' --irrelevant due to Locale file being removed as it was for ESX

Config.ShouldWaitBetweenRobbing = true --Setting to true will cause a random time within the range defined below to be required before a player can rob another NPC. Setting to false will allow the player to immediately rob another NPC.
Config.MinWaitSeconds = 60 --Minimum wait time in seconds.
Config.MaxWaitSeconds = 180  --Maximum wait time in seconds.

Config.RobDistance = 3 --Maximum distance from the NPC to rob them. If too far away, players will receive a message saying they are too far away.
Config.RobAnimationSeconds = 60 --Time in seconds needed for the robbery to complete.

Config.MinMoney = 1 --Minimum amount of money to get from a robbery
Config.MaxMoney = 200 --Maximum amount of money to get from a robbery.

Config.Notify = true --If you want to have a chance of an alert being sent for the mugging, set as true. If not, then set as false.
Config.AlertChance = 60 --Percent of notification chance. Default of 60 means there is a 60% chance of an alert being sent for your robbery.
