/*
	Developed by Armitxes ( https://armitxes.net ).
	Copyright © 2019 by Armitxes. All rights reserved.
*/

params ["_unit", "_role", "_vehicle", "_turret"];

disableSerialization;
_icon = uiNamespace getVariable "IGUI_Vehicle_Seatbelt";
if (isNil "_icon") then { _w = [] spawn ARMI_fnc_ResetIcon; waitUntil { scriptDone _w; }; };
if (isNull _icon) then { _w = [] spawn ARMI_fnc_ResetIcon; waitUntil { scriptDone _w; }; };

false call ARMI_fnc_Seatbelt;