#include "..\script_component.hpp"
// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};

// -------------------------------------------------------------------------------------------------

[_unit] spawn {

    params ["_unit"];

    _unit playAction "Gear";

    if (vehicle _unit != _unit) then {
        playSound QPATHTOF(data\sounds\medickit_open_1.ogg);
    } else {
        playSound3D [QPATHTOF(data\sounds\medickit_open_1.ogg), _unit, false, getPosASL player, 1, 1, 0]
    };

    MEDBAG_MEDICAL_SUPPLIES_UNPACK_SUCCESS = false;
    MEDBAG_MEDICAL_SUPPLIES_UNPACK_FAILURE = false;

    [
        2,
        [], { MEDBAG_MEDICAL_SUPPLIES_UNPACK_SUCCESS = true; }, { MEDBAG_MEDICAL_SUPPLIES_UNPACK_FAILURE = true; },
        localize "Unpack Trauma Kit....",
 {true},
        ["isNotInside", "isNotSitting", "isNotSwimming"]
    ] call ACE_common_fnc_progressBar;

    waitUntil {if ((MEDBAG_MEDICAL_SUPPLIES_UNPACK_SUCCESS) || (MEDBAG_MEDICAL_SUPPLIES_UNPACK_FAILURE)) exitWith {true}; false};

    if (MEDBAG_MEDICAL_SUPPLIES_UNPACK_SUCCESS) exitWith {

        _unit removeItem QGVAR(Trauma);

        private _order = [3,2,1];
        private _overflow = true;

        {
            _x params ["_item", "_amount"];
            [_unit, _item, _amount, _order, _overflow] call FUNC(addItem);
        } forEach (parseSimpleArray GVAR(traumaKitItems));

        _unit playActionNow "Stand";
    };
};
