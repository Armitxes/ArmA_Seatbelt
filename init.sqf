/*
	Developed by Armitxes ( https://armitxes.net ).
	Copyright © 2019 by Armitxes. All rights reserved.
*/

if (hasInterface) then {
	ARMI_Seatbelt = false;

	ARMI_fnc_Seatbelt = {
		params ["_tryWear"];

		disableSerialization;
		private _ctrl = uiNamespace getVariable "IGUI_Vehicle_Seatbelt";
		if (vehicle player == player) exitWith { _ctrl ctrlSetText ""; _ctrl ctrlCommit 0; };
		_ctrl ctrlSetText "\Armitxes_Seatbelts\images\belt.paa";
		if (_tryWear) then { ARMI_Seatbelt = true; _ctrl ctrlSetTextColor [255, 255, 255, 1]; }
		else { ARMI_Seatbelt = false; _ctrl ctrlSetTextColor [1, 0, 0, 1]; };
		_ctrl ctrlCommit 0;	
	};

	ARMI_fnc_ResetIcon = {
		disableSerialization;
		private _igui_dsps = uiNamespace getVariable ["IGUI_displays", []];
		{
			private _spdbag = _x displayCtrl 1006;
			private _speed = _x displayCtrl 121;
			if (!isNil "_spdbag" && !isNil "_speed") exitWith {
				uiNamespace setVariable ["IGUI_Vehicle", _x];

				disableSerialization;
				private _dsp = uiNamespace getVariable "IGUI_Vehicle";
				private _ctrl = _dsp ctrlCreate ["RscPicture", 22];
				_ctrl ctrlSetPosition [0.115 * safezoneW + safezoneX, 0.087 * safezoneH + safezoneY, 0.025, 0.025];
				_ctrl ctrlSetText "";
				_ctrl ctrlCommit 0;
				uiNamespace setVariable ["IGUI_Vehicle_Seatbelt", _ctrl];
			};
		} forEach _igui_dsps;
	};

	/*
		Wish to handle the damage in own event handler? Remove this event handler using:
		player removeEventHandler ["handleDamage", ARMI_Seatbelt_handleDamage];
	*/
	ARMI_Seatbelt_handleDamage = player addEventHandler ["handleDamage", {
		private _selection = _this select 1;
		private _damage	= _this select 2;
		if (ARMI_Seatbelt && _damage > 0 && (_this select 4) == "") then {
			if (_selection == "") then { _selection = "body"; };
			(_damage/2);
		};
	}];

	if (vehicle player != player) then { [] execVM "\Armitxes_Seatbelts\events\onVehicleEnter.sqf"; };
	player addEventHandler ["GetInMan", { _this execVM "\Armitxes_Seatbelts\events\onVehicleEnter.sqf"; }];
	player addEventHandler ["GetOutMan", { _this execVM "\Armitxes_Seatbelts\events\onVehicleLeave.sqf"; }];
};