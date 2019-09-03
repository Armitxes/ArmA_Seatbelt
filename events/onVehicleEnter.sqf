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
if !(isNil "ARMI_action_Seatbelt_Wear") then { ARMI_Seatbelt_Vehicle removeAction ARMI_action_Seatbelt_Wear; };
if !(isNil "ARMI_action_Seatbelt_Remove") then { ARMI_Seatbelt_Vehicle removeAction ARMI_action_Seatbelt_Remove; };

ARMI_Seatbelt_Vehicle = vehicle player;
ARMI_action_Seatbelt_Wear = ARMI_Seatbelt_Vehicle addAction ["Wear Seatbelt", {true call ARMI_fnc_Seatbelt}, [], 40, false, true, "", "vehicle player != player and !ARMI_Seatbelt"];
ARMI_action_Seatbelt_Remove = ARMI_Seatbelt_Vehicle addAction ["Remove Seatbelt", {false call ARMI_fnc_Seatbelt}, [], 40, false, true, "", "vehicle player != player and ARMI_Seatbelt"];
