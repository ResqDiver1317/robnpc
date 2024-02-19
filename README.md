RobNPC

Credit for original script to c0deina. https://github.com/c0deina/esx_robnpc
Modified by ResqDiver1317 (Resq#1317) to work with Andyyy7666's framework system, ND_Core
Basic functions for the notification system from SpikE-Odets's port of c0deina's original script. https://github.com/SpikE-Odets/esx_mugging

Link to the Framework (ND_Core) from Andyyy7666.
Framework link - [https://github.com/Andyyy7666/ND_Framework](https://github.com/ND-Framework/ND_Core/releases)

DEMO VIDEO - https://youtu.be/Rqqu9m1yo4U -- outdated as it reflects the old version but not really outdated as the robbery event itself is still functionally the same except now it has a random time for the robbery length. 

CONFIG NOTES:
You can define:
The range of time a player must wait between robberies (Config.MinWaitSeconds and Config.MaxWaitSeconds)
Maximum range from the target NPC to initiate a robbery (Config.RobDistance)
Time for the robbery to occur (Config.RobAnimationMinSeconds and Config.RobAnimationMinSeconds). Script uses random math function using these min/max times to determine the length of the robbery.
The range of cash received from robbing an NPC (Config.MinMoney and Config.MaxMoney)
If you want to send an alert when a robbery is occurring and what percentage of chance you want for that alert to be sent (Config.Notify and Config.AlertChance). The higher the value (1-100), the higher chance of an alert being sent. 

NOTES ABOUT THE ALERTS:
Currently, this script is designed to trigger an emergency call in Night's MDT system (https://store.nights-software.com/package/5667103). During the robbery, the math function is ran to decide if a call should be sent or not to emergency services. If so, the robbery itself triggers a Server Event. This Server Event then triggers a seperate Client Event that handles sending the emergency call. Yes, I realize this is extra (and mostly unneeded steps) but I did this simply because I know some people use 911 systems that utilize server side exports/events to trigger and some use 911 systems that use client side events. This was the simplest way to create events that can be easily edited for either. If yours uses Server side activation, then simply edit the event in the server.lua and either comment out or replace the TriggerClientEvent in the server lua that is triggering the client 911 event. If your script uses Client side events/exports, then you should be able to leave the server.lua alone and edit the event at the bottom of the client.lua to fit your needs. 

I tested this for a few hours while making tweaks and adjustments and haven't found any major issues but if you find any, please create an issue and I'll see what I can do. The only real issue I have with this is when the robbery finishes, the victim will just casually walk away. This is due to a sample fix that was in the post on the CFX Forum for the original script that was shared to resolve an issue where the victims would stand there with their hands up running in place and then run off with their hands still up after the robbery completes. Now they will cower in place while being robbed and then just walk away casually after it completes. I'm not sure a good way to resolve this so if anyone has any ideas, I'm open to input. 

Last but not least, how to actually rob the NPC's. Get within the defined range of the NPC, point a weapon at them and press E. After the random time (based on the range defined in the config) you will get the cash from the robbery. 
