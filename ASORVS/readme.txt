ASOR Vehicle Selector v1.4

Installation instructions:
Include the following in your description.ext file:
#include "ASORVS\menu.hpp"
class CfgFunctions
{
	#include "ASORVS\cfgfunctions.hpp"
};


To open the vehicle selector, 'execvm' asorvs\open.sqf. Parameters are as follows:
1 - Vehicle Types (Array of Strings). Can include "cars", "tanks", "helicopters", "planes" and/or "boats".
2 - Whitelist for this vehicle selector (Array of Strings). If this array isn't empty, allow only the class names specified.
3 - Spawn Marker (String). Name of the marker where the vehicle should be spawned. Nearby vehicles will be removed beforehand.
4 - Vehicle Height (Optional Number/Scalar, default 0). Height (Position format) for the vehicle to spawn ( so you can spawn them in/on buildings ).
5 - Spawn Radius (Optional Number/Scalar, default 5). Radius around the spawn point to clear before spawning the vehicle.

Examples of actions that can be placed on any object are as follows:
//Spawn any helicopters on the "chopperspawn" marker.
this addAction ["Spawn Helicopters" {[["helicopters"], [], "chopperspawn"] execvm "ASORVS\open.sqf";}];

//Spawn only B_MBT_01_mlrs_F and B_MBT_01_cannon_F on the "tankspawn" marker.
this addAction ["Spawn Tanks", {[["tanks"], ["B_MBT_01_mlrs_F", "B_MBT_01_cannon_F"], "tankspawn"] execvm "ASORVS\open.sqf";}];

Set up any settings you want (including blacklist) in ASORVS\config.sqf.

Usage instructions:
Select vehicle from the top of the screen.
Zoom in and out with the mouse wheel, rotate with left click/drag and move up/down (when zoomed) with right click/drag.
Click Issue Vehicle to spawn the vehicle on the spawn point. 

Features:
Choose and spawn vehicles with a preview in a customizable fullscreen interface consistent with ASOR Gear Selector.

Forums:
http://forums.bistudio.com/showthread.php?188486-ASOR-Vehicle-Selector

Supported Languages:
- English 

Credits/Thanks:
Lecks - Author
ASOR for helping to iron out most of the bugs and problems.

Legal disclaimer:
You are free to:
Share — to copy, distribute and transmit the work.
Modify — to adapt the work.

Under the following conditions:
Notification - If you improve this work, you must give Lecks a copy of the improvements and the option of including it in a new version of this work if he sees fit.
Profit - You can not use this work on monetized servers without permission from Lecks. You can use this work within Make Arma Not War entries.