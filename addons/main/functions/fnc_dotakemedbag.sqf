#include "..\script_component.hpp"
// -------------------------------------------------------------------------------------------------

params [["_target", objNull, [objNull]], ["_player", objNull, [objNull]]];

if (isNull _target || {isNull _player}) exitWith {};

// -------------------------------------------------------------------------------------------------

[_target, _player] spawn {

    params ["_target", "_player"];

    _player playAction "Gear";

    MEDBAG_MEDICAL_SUPPLIES_TAKE_SUCCESS = false;
    MEDBAG_MEDICAL_SUPPLIES_TAKE_FAILURE = false;

    [
        2,
        [],
        { MEDBAG_MEDICAL_SUPPLIES_TAKE_SUCCESS = true; },
        { MEDBAG_MEDICAL_SUPPLIES_TAKE_FAILURE = true; },
        localize "Taking Medical Supplies....",
        {true},
        ["isNotInside", "isNotSitting", "isNotSwimming"]
    ] call ACE_common_fnc_progressBar;

    waitUntil {if ((MEDBAG_MEDICAL_SUPPLIES_TAKE_SUCCESS) || (MEDBAG_MEDICAL_SUPPLIES_TAKE_FAILURE)) exitWith {true}; false};

    if (MEDBAG_MEDICAL_SUPPLIES_TAKE_SUCCESS) exitWith {

        private _bagClasses = [QGVAR(FirstAid), QGVAR(MedicKit), QGVAR(DrugKit), QGVAR(Trauma)];

        {
            private _class = _x;
            private _count = {_x == _class} count (items _target);

            for "_i" from 1 to _count do {
                _target removeItem _class;
                [_player, _class, 1, [1,2,3], true] call FUNC(addItem);
            };
        } forEach _bagClasses;
    };
};
