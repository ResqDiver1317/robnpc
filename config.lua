config = {
    shouldWaitBetweenRobbing = true --Setting to true will cause a random time within the range defined below to be required before a player can rob another NPC. Setting to false will allow the player to immediately rob another NPC.
    minWaitSeconds = 60 --Minimum wait time in seconds.
    maxWaitSeconds = 180  --Maximum wait time in seconds.
    paymentType = "cash"

    robDistance = 3 --Maximum distance from the NPC to rob them. If too far away, players will receive a message saying they are too far away.
    robAnimationSeconds = 60 --Time in seconds needed for the robbery to complete.

    minMoney = 1 --Minimum amount of money to get from a robbery
    maxMoney = 200 --Maximum amount of money to get from a robbery.

    notify = true --If you want to have a chance of an alert being sent for the mugging, set as true. If not, then set as false.
    alertChance = 60 --Percent of notification chance. Default of 60 means there is a 60% chance of an alert being sent for your robbery.

    lang = {
        tooSoon = "~r~Your last robbery was too recent. Please wait to conduct your next robbery.",
        victimDead = "~r~Your victim is dead and cannot be robbed.",
        actualPlayer = "~r~You cannot use this to rob other players. You can only rob NPCs.",
        tooFar = "~r~Your target is too far away to rob. Move closer.",
        cooldown = "~y~ seconds before you can commit another robbery", --time is insterted automatically in front of the this text.
        reset = "~g~You can now rob another NPC.",
        stealAmountMessage = " You stole $", --amount stolen is insterted automatically at the end of this text.
        alertMessage = " Reported Mugging near ~w~ "
    }
}