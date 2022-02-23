RobNPC

Credit for original script to c0deina. https://github.com/c0deina/esx_robnpc
Modified by ResqDiver1317 (Resq#1317) to work with Andyyy7666's currency system and/or framework system.
Basic functions for the notification system from SpikE-Odets's port of c0deina's original script. https://github.com/SpikE-Odets/esx_mugging

Links to the Currency Script and Framework from Andyyy7666.
Currency System link - https://github.com/Andyyy7666/Currency-System
Framework link - https://github.com/Andyyy7666/ND_Framework

DEMO VIDEO - https://youtu.be/Rqqu9m1yo4U

CONFIG NOTES:
The Framework and Currency System use different database table names so you need to define which you are using.
If using the Framwork, set the Config.Framework on line 2 of the config.lua to true.
If using the standalone Currency System, set the Config.Frameowrk to false. (default setting)

Additionally, you can define:
The range of time a player must wait between robberies (Config.MinWaitSeconds and Config.MaxWaitSeconds)
Maximum range from the target NPC to initiate a robbery (Config.RobDistance)
Time for the robbery to occur (Config.RobAnimationSeconds)
The range of cash received from robbing an NPC (Config.MinMoney and Config.MaxMoney)
If you want to send an alert when a robbery is occurring and what percentage of chance you want for that alert to be sent (Config.Notify and Config.AlertChance). The higher the value (1-100), the higher chance of an alert being sent. 

NOTES ABOUT THE ALERTS:
The alert simply posts a message in chat that a robbery is occurring and gives the street and cross street (if at/near an intersection) and will put a ring around the area where the robbery is occuring that will fade out over a couple minutes. I did not bother trying to tie this into a 911 system or anything along those lines as there are way too many 911 scripts out there so this message and map marker circle will show for everyone. If you are using the framework, it MAY be possible to also capture some identifying traits of the person commiting the robbery HOWEVER, I did not include any of this as I am not using the framework. If you want to tackle that, you can take a look at SpikE-Odets's port of the original script. The original as well as SpikE's version are both for ESX so you would have to modify it to get the information needed for the framework and MAY need to move that part to the server.lua (I'm may be wrong but I think you need to be server sided to hit the OxMySQL exports to access the database information). If someone was to take this on and get it working properly, they can make a pull request and I'll be happy to include it into this version but it would need to be done in such a way that the script still works if not using the framework. (IE, tuck it into an `if Config.Framework then`)

I tested this for a few hours while making tweaks and adjustments and haven't found any major issues but if you find any, please create an issue and I'll see what I can do. The only real issue I have with this is when the robbery finishes, the victim will just casually walk away. This is due to a sample fix that was in the post on the CFX Forum for the original script that was shared to resolve an issue where the victims would stand there with their hands up running in place and then run off with their hands still up after the robbery completes. Now they will cower in place while being robbed and then just walk away casually after it completes. I'm not sure a good way to resolve this so if anyone has any ideas, I'm open to input. 

Last but not least, how to actually rob the NPC's. Get within the defined range of the NPC, point a weapon at them and press E. After the random time (based on the range defined in the config) you will get the cash from the robbery. 
