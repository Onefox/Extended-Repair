#Extended repair functions for exile

#Information -

Changes the standard EXILE repair functions to the following -

Players require the following tools (these are not consumed on use)

-- FoolBox "Exile_item_FoolBox"
-- Wrench "Exile_item_wrench"

Players require the following items (these are consumed on use)

-- DuctTape "Exile_item_ductTape"
-- Junk Metal "Exile_item_junkMetal"

This will repair every aspect of a vehicle to 100% Except for the vehicles wheels (in the case of cars only, anything else will be repaired fully for now)

To repair a cars wheels players need the afformentioned tools plus

-- CarWheel "Exile_item_carWheel" 

A random damaged wheel will be repaired (in the works, select which wheel to repair)

You will need to added this to your loot table / trades.

#Install instructions

Place the two files inside your mission file.

Inside your initPlayerLocal.sqf add this to the bottom -

JohnO_fnc_repairWheels = compileFinal preprocessFileLineNumbers "JohnO_fnc_repairWheels.sqf";
JohnO_fnc_repairRotors = compileFinal preprocessFileLineNumbers "JohnO_fnc_repairRotors.sqf";

Inside your mission config.cpp find -

			class Repair: ExileAbstractAction
			{
				title = "Repair";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_Repair";
			};
			
			ADD UNDERNEITH
			
			class RepairWheels: ExileAbstractAction
			{
				title = "Repair Wheels";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call JohnO_fnc_repairWheels";
			};
			
			SO IT LOOKS LIKE
			
			class Repair: ExileAbstractAction
			{
				title = "Repair Body";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_Repair";
			};
			class RepairWheels: ExileAbstractAction
			{
				title = "Repair Wheels";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call JohnO_fnc_repairWheels";
			};
			
			Do the same for class air and use these below.
			
			class Repair: ExileAbstractAction
			{
				title = "Repair Body";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_Repair";
			};
			class RepairRotors: ExileAbstractAction
			{
				title = "Repair Rotors";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call JohnO_fnc_repairRotors";
			};
			
			Optional -- Change the title of "Repair" to "Repair body" as you can see in the above example.
			
Inside your mission config find

			class CfgExileCustomCode 
			{
			
			ADD UNDERNEITH
			
			ExileClient_object_vehicle_repair = "ExileClient_object_vehicle_repair.sqf";
			
			SO IT LOOKS LIKE
			
			class CfgExileCustomCode 
			{
			
			ExileClient_object_vehicle_repair = "ExileClient_object_vehicle_repair.sqf";
			
			};			
					
Profit