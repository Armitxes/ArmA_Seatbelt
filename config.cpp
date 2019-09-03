class CfgPatches
{
	class Armitxes_Seatbelts
	{
		name = "Armitxes: Vehicle Seatbelts";
		author[] = {"Armitxes"};
		url = "https://armitxes.net";
		requiredVersion = 1;
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions
{
	class Armitxes_Seatbelts
	{
		class main
		{
			class postInit
			{
				postInit = 1;
				file = "\Armitxes_Seatbelts\init.sqf";
			};
		};
	};
};
