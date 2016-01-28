/**
 * ExileClient_object_vehicle_repair
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicle","_availableHitpoints","_fixable","_equippedMagazines","_wheels","_brokenWheels","_randomWheel","_repairable"];
_vehicle = _this select 0;
/*if (ExileClientPlayerIsInCombat) exitWith
{
	["RepairFailedWarning", ["You are in combat!"]] call ExileClient_gui_notification_event_addNotification;
};*/
if (vehicle player isEqualTo _vehicle) exitWith 
{
	["RepairFailedWarning", ["Are you serious?"]] call ExileClient_gui_notification_event_addNotification;
};
_availableHitpoints = (getAllHitPointsDamage _vehicle) select 0;
{
	if((_vehicle getHitPointDamage _x) > 0)exitWith
	{
		_fixable = "potato";
	};
}
forEach _availableHitpoints;

_wheels = ["HitLF2Wheel","HitLFWheel","HitRFWheel","HitRF2Wheel"]; 
_broken = [];
{
	if ((_vehicle getHitPointDamage _x) > 0) then
	{	
		_broken = _broken + [_x]; 
	};
} forEach _wheels;

if (isNil "_broken") exitWith
{
	["RepairFailedWarning", ["The wheels do not need repair"]] call ExileClient_gui_notification_event_addNotification;
};	
if (isNil "_fixable") exitWith 
{
	["RepairFailedWarning", ["This vehicle already looks fine."]] call ExileClient_gui_notification_event_addNotification;
};
if (!local _vehicle) then
{
	["RepairFailedWarning", ["Please get in as driver/pilot first."]] call ExileClient_gui_notification_event_addNotification;
}
else 
{
	_equippedMagazines = magazines player;
	_randomWheel = _broken call BIS_fnc_selectRandom;
	if ("Exile_Item_Foolbox" in _equippedMagazines) then
	{	
		if ("Exile_Item_Wrench" in _equippedMagazines) then
		{
			
			if ("Exile_Item_CarWheel" in _equippedMagazines) then
			{				
				player playMove "AinvPknlMstpSnonWnonDr_medic3";		
				sleep 10;
				_vehicle setHitPointDamage [_randomWheel,0];
				player removeItem "Exile_Item_DuctTape";
				player removeItem "Exile_Item_JunkMetal";
				["Success",["You have repaired a wheel"]] call ExileClient_gui_notification_event_addNotification;
			}
			else
			{
				["RepairFailedWarning", ["You need a wheel"]] call ExileClient_gui_notification_event_addNotification;
			};	
				
		}
		else
		{
			["RepairFailedWarning", ["You need a wrench"]] call ExileClient_gui_notification_event_addNotification;
		};	
	}
	else
	{
		["RepairFailedWarning", ["You need a toolbox"]] call ExileClient_gui_notification_event_addNotification;
	};
	
};
true

/*
 
_availableHitpoints = (getAllHitPointsDamage bob) select 0;
_wheels = ["HitLF2Wheel","HitLFWheel","HitRFWheel","HitRF2Wheel"]; 
_broken = [];

{
	if ((bob getHitPointDamage _x) > 0) then
	{	
		_broken = _broken + [_x]; 
	};
} forEach _wheels;	
if (isNil "_broken") then
{
	hint "good";
};
_randomWheel = _broken call BIS_fnc_selectRandom;

bob setHitPointDamage [_randomWheel,0];


{
	if((bob getHitPointDamage _x) > 0) then
	{
		_repairable = _repairable - _x;
	};
} forEach _repairable; 
hint str _repairable;



_availableHitpoints = (getAllHitPointsDamage bob) select 0;
{
	if((bob getHitPointDamage _x) > 0)exitWith
	{
		_fixable = "potato";
	};
}
forEach _availableHitpoints;
_repairable = [];
_brokenWheels = [];
if (bob isKindOf "car") then
{	
	_wheels = ["HitLF2Wheel","HitLFWheel","HitRFWheel","HitRF2Wheel"];
	_repairable = _wheels -_availableHitpoints;
};
hint str _repairable;

{
	if((bob getHitPointDamage _x) > 0)
	{
		_brokenWheels pushBack _x;
	};
} forEach _repairable;


_wheels = ["HitLF2Wheel","HitLFWheel","HitRFWheel","HitRF2Wheel"];
{
	_availableHitpoints = bob getHitPointDamage _x;
} forEach _wheels;
hint str _availableHitpoints