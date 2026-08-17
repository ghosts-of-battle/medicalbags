#include "script_component.hpp"
// -------------------------------------------------------------------------------------------------
// Configurable bag contents. Format: [[classname, amount], [classname, amount], ...]
// -------------------------------------------------------------------------------------------------

[
    QGVAR(firstAidItems),
    "EDITBOX",
    ["Boo Boo Bag Contents", "Items given when a Boo Boo Bag is unpacked. Format: [[classname,amount], ...]"],
    "MEDBAG Loadouts",
    '[["ACE_fieldDressing",8],["ACE_quikClot",8],["kat_Painkiller",1],["ACE_tourniquet",4],["ACE_EarPlugs",1],["kat_chestSeal",1],["kat_aatKit",1],["ACE_salineIV_500",1],["kat_larynx",1],["kat_guedel",1],["kat_TXA",1],["kat_IV_16",1],["ACE_splint",2]]',
    1
] call CBA_fnc_addSetting;

[
    QGVAR(medicKitItems),
    "EDITBOX",
    ["Medic Bag Contents", "Items given when a Medic Bag is unpacked. Format: [[classname,amount], ...]"],
    "MEDBAG Loadouts",
    '[["ACE_fieldDressing",18],["ACE_elasticBandage",14],["ACE_packingBandage",14],["ACE_quikClot",14],["ACE_salineIV_500",8],["ACE_tourniquet",8],["kat_Painkiller",6],["kat_chestSeal",4],["kat_larynx",6],["kat_guedel",6],["ACE_splint",8],["kat_aatKit",4],["KAT_Empty_bloodIV_500",4],["ACE_fieldDressing",6],["kat_Painkiller",1],["ACE_tourniquet",4],["ACE_EarPlugs",2],["kat_IO_FAST",6],["kat_IV_16",6]]',
    1
] call CBA_fnc_addSetting;

[
    QGVAR(drugKitItems),
    "EDITBOX",
    ["Drug Kit Contents", "Items given when a Drug Kit is unpacked. Format: [[classname,amount], ...]"],
    "MEDBAG Loadouts",
    '[["kat_TXA",10],["kat_amiodarone",10],["kat_atropine",10],["kat_lidocaine",10],["kat_naloxone",10],["kat_nitroglycerin",10],["kat_norepinephrine",10],["kat_phenylephrine",10],["ACE_epinephrine",10],["ACE_morphine",16],["ACE_adenosine",8]]',
    1
] call CBA_fnc_addSetting;

[
    QGVAR(traumaKitItems),
    "EDITBOX",
    ["Trauma Kit Contents", "Items given when a Trauma Kit is unpacked. Format: [[classname,amount], ...]"],
    "MEDBAG Loadouts",
    '[["ACE_fieldDressing",18],["ACE_elasticBandage",14],["ACE_packingBandage",14],["ACE_quikClot",14],["ACE_salineIV_500",8],["ACE_epinephrine",10],["ACE_morphine",10],["ACE_tourniquet",8],["kat_Painkiller",6],["ACE_adenosine",4],["ACE_atropine",4],["kat_chestSeal",4],["kat_larynx",6],["kat_guedel",6],["ACE_splint",8],["kat_aatKit",4],["KAT_Empty_bloodIV_500",4],["ACE_fieldDressing",6],["kat_Painkiller",2],["ACE_tourniquet",4],["ACE_EarPlugs",1],["kat_accuvac",1],["kat_X_AED",1],["kat_stethoscope",1],["kat_Pulseoximeter",1],["kat_IO_FAST",6],["kat_IV_16",6],["kat_TXA",6]]',
    1
] call CBA_fnc_addSetting;
