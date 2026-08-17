#include "..\script_component.hpp"
// -------------------------------------------------------------------------------------------------

params [["_target", objNull, [objNull]], ["_player", objNull, [objNull]]];

if (isNull _target || {isNull _player} || {_target == _player}) exitWith {false};

// -------------------------------------------------------------------------------------------------

private _bagClasses = [QGVAR(FirstAid), QGVAR(MedicKit), QGVAR(DrugKit), QGVAR(Trauma)];
private _targetItems = items _target;

(
    (!alive _target || {_target getVariable ["ace_isUnconscious", false]}) &&
    {(_bagClasses findIf {_x in _targetItems}) != -1} &&
    (alive _player) &&
    !(_player getVariable ["ace_isUnconscious", false]) &&
    !(_player getVariable ["ace_captives_isHandcuffed", false])
);
