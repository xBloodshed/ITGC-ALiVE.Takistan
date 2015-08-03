//LOP_Tak_Civ_XEH.hpp
class CfgPatches {
 
        class LOP_Tak_Civ_XEH {
                units[] = {
                        "LOP_Tak_Civ_Man_01",
                        "LOP_Tak_Civ_Man_02",
                        "LOP_Tak_Civ_Man_04",
                        "LOP_TAK_Civ_Landrover",
                        "LOP_TAK_Civ_Offroad",
                        "LOP_TAK_Civ_Hatchback",
                        "LOP_TAK_Civ_Ural",
                        "LOP_TAK_Civ_Ural_open",
                        "LOP_TAK_Civ_UAZ",
                        "LOP_TAK_Civ_UAZ_Open"
                };
                weapons[] = {};
                requiredVersion = 1;
                requiredAddons[] = {
                        "cba_xeh",
                        "lop_faction_tak_civ",
                        "A3_Soft_F",
                        "A3_Characters_F",
                        "rhs_c_bmp",
                        "rhs_c_bmd",
                        "rhs_c_t72",
                        "rhs_c_troops",
                        "rhs_c_btr",
                        "rhs_c_weapons",
                        "rhs_c_a2port_air",
                        "rhs_c_a2port_car",
                        "rhs_c_a2port_armor",
                        "rhs_cti_insurgents",
                        "rhs_c_heavyweapons",
                        "rhsusf_c_troops",
                        "rhsusf_c_weapons",
                        "rhsusf_c_m1a1",
                        "rhsusf_c_m113",
                        "RHS_US_A2_AirImport",
                        "rhsusf_c_hmmwv"
                };
                version = "1.0";
                versionStr = "1.0";
                versionAr[] = {1, 0};
                versionDesc = "LOP Takistan Civilians XEH";
                author[] = {"DaVidoSS"};
        };
};
 
class CfgVehicles {
 
        /*extern*/ class LOP_LandRover_base_02;
        /*extern*/ class C_Offroad_01_F;
        /*extern*/ class C_Hatchback_01_F;
        /*extern*/ class RHS_Ural_Civ_Base;
        /*extern*/ class RHS_Ural_Open_Civ_01;
        /*extern*/ class RHS_UAZ_Base;
        /*extern*/ class rhs_uaz_open_Base;
 
        class LOP_TAK_Civ_Landrover: LOP_LandRover_base_02 {
 
                class EventHandlers {
                        init = "_this call SLX_XEH_EH_Init";
                        fired = "_this call SLX_XEH_EH_Fired";
                        animChanged = "_this call SLX_XEH_EH_AnimChanged";
                        animDone = "_this call SLX_XEH_EH_AnimDone";
                        animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
                        containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
                        containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
                        controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
                        dammaged = "_this call SLX_XEH_EH_Dammaged";
                        engine = "_this call SLX_XEH_EH_Engine";
                        epeContact = "_this call SLX_XEH_EH_EpeContact";
                        epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
                        epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
                        explosion = "_this call SLX_XEH_EH_Explosion";
                        firedNear = "_this call SLX_XEH_EH_FiredNear";
                        fuel = "_this call SLX_XEH_EH_Fuel";
                        gear = "_this call SLX_XEH_EH_Gear";
                        getIn = "_this call SLX_XEH_EH_GetIn";
                        getOut = "_this call SLX_XEH_EH_GetOut";
                        handleHeal = "_this call SLX_XEH_EH_HandleHeal";
                        hit = "_this call SLX_XEH_EH_Hit";
                        hitPart = "_this call SLX_XEH_EH_HitPart";
                        incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
                        inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
                        inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
                        killed = "_this call SLX_XEH_EH_Killed";
                        landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
                        landedStopped = "_this call SLX_XEH_EH_LandedStopped";
                        local = "_this call SLX_XEH_EH_Local";
                        respawn = "_this call SLX_XEH_EH_Respawn";
                        put = "_this call SLX_XEH_EH_Put";
                        take = "_this call SLX_XEH_EH_Take";
                        soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
                        weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
                        weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
                };
        };
 
        class LOP_TAK_Civ_Offroad: C_Offroad_01_F {
 
                class EventHandlers {
                        init = "_this call SLX_XEH_EH_Init";
                        fired = "_this call SLX_XEH_EH_Fired";
                        animChanged = "_this call SLX_XEH_EH_AnimChanged";
                        animDone = "_this call SLX_XEH_EH_AnimDone";
                        animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
                        containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
                        containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
                        controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
                        dammaged = "_this call SLX_XEH_EH_Dammaged";
                        engine = "_this call SLX_XEH_EH_Engine";
                        epeContact = "_this call SLX_XEH_EH_EpeContact";
                        epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
                        epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
                        explosion = "_this call SLX_XEH_EH_Explosion";
                        firedNear = "_this call SLX_XEH_EH_FiredNear";
                        fuel = "_this call SLX_XEH_EH_Fuel";
                        gear = "_this call SLX_XEH_EH_Gear";
                        getIn = "_this call SLX_XEH_EH_GetIn";
                        getOut = "_this call SLX_XEH_EH_GetOut";
                        handleHeal = "_this call SLX_XEH_EH_HandleHeal";
                        hit = "_this call SLX_XEH_EH_Hit";
                        hitPart = "_this call SLX_XEH_EH_HitPart";
                        incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
                        inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
                        inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
                        killed = "_this call SLX_XEH_EH_Killed";
                        landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
                        landedStopped = "_this call SLX_XEH_EH_LandedStopped";
                        local = "_this call SLX_XEH_EH_Local";
                        respawn = "_this call SLX_XEH_EH_Respawn";
                        put = "_this call SLX_XEH_EH_Put";
                        take = "_this call SLX_XEH_EH_Take";
                        soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
                        weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
                        weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
                };
        };
 
        class LOP_TAK_Civ_Hatchback: C_Hatchback_01_F {
 
                class EventHandlers {
                        init = "_this call SLX_XEH_EH_Init";
                        fired = "_this call SLX_XEH_EH_Fired";
                        animChanged = "_this call SLX_XEH_EH_AnimChanged";
                        animDone = "_this call SLX_XEH_EH_AnimDone";
                        animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
                        containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
                        containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
                        controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
                        dammaged = "_this call SLX_XEH_EH_Dammaged";
                        engine = "_this call SLX_XEH_EH_Engine";
                        epeContact = "_this call SLX_XEH_EH_EpeContact";
                        epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
                        epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
                        explosion = "_this call SLX_XEH_EH_Explosion";
                        firedNear = "_this call SLX_XEH_EH_FiredNear";
                        fuel = "_this call SLX_XEH_EH_Fuel";
                        gear = "_this call SLX_XEH_EH_Gear";
                        getIn = "_this call SLX_XEH_EH_GetIn";
                        getOut = "_this call SLX_XEH_EH_GetOut";
                        handleHeal = "_this call SLX_XEH_EH_HandleHeal";
                        hit = "_this call SLX_XEH_EH_Hit";
                        hitPart = "_this call SLX_XEH_EH_HitPart";
                        incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
                        inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
                        inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
                        killed = "_this call SLX_XEH_EH_Killed";
                        landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
                        landedStopped = "_this call SLX_XEH_EH_LandedStopped";
                        local = "_this call SLX_XEH_EH_Local";
                        respawn = "_this call SLX_XEH_EH_Respawn";
                        put = "_this call SLX_XEH_EH_Put";
                        take = "_this call SLX_XEH_EH_Take";
                        soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
                        weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
                        weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
                };
        };
 
        class LOP_TAK_Civ_Ural: RHS_Ural_Civ_Base {
 
                class EventHandlers {
                        init = "_this call SLX_XEH_EH_Init";
                        fired = "_this call SLX_XEH_EH_Fired";
                        animChanged = "_this call SLX_XEH_EH_AnimChanged";
                        animDone = "_this call SLX_XEH_EH_AnimDone";
                        animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
                        containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
                        containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
                        controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
                        dammaged = "_this call SLX_XEH_EH_Dammaged";
                        engine = "_this call SLX_XEH_EH_Engine";
                        epeContact = "_this call SLX_XEH_EH_EpeContact";
                        epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
                        epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
                        explosion = "_this call SLX_XEH_EH_Explosion";
                        firedNear = "_this call SLX_XEH_EH_FiredNear";
                        fuel = "_this call SLX_XEH_EH_Fuel";
                        gear = "_this call SLX_XEH_EH_Gear";
                        getIn = "_this call SLX_XEH_EH_GetIn";
                        getOut = "_this call SLX_XEH_EH_GetOut";
                        handleHeal = "_this call SLX_XEH_EH_HandleHeal";
                        hit = "_this call SLX_XEH_EH_Hit";
                        hitPart = "_this call SLX_XEH_EH_HitPart";
                        incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
                        inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
                        inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
                        killed = "_this call SLX_XEH_EH_Killed";
                        landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
                        landedStopped = "_this call SLX_XEH_EH_LandedStopped";
                        local = "_this call SLX_XEH_EH_Local";
                        respawn = "_this call SLX_XEH_EH_Respawn";
                        put = "_this call SLX_XEH_EH_Put";
                        take = "_this call SLX_XEH_EH_Take";
                        soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
                        weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
                        weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
                };
        };
       
        class LOP_TAK_Civ_Ural_open: RHS_Ural_Open_Civ_01 {
 
                class EventHandlers {
                        init = "_this call SLX_XEH_EH_Init";
                        fired = "_this call SLX_XEH_EH_Fired";
                        animChanged = "_this call SLX_XEH_EH_AnimChanged";
                        animDone = "_this call SLX_XEH_EH_AnimDone";
                        animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
                        containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
                        containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
                        controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
                        dammaged = "_this call SLX_XEH_EH_Dammaged";
                        engine = "_this call SLX_XEH_EH_Engine";
                        epeContact = "_this call SLX_XEH_EH_EpeContact";
                        epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
                        epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
                        explosion = "_this call SLX_XEH_EH_Explosion";
                        firedNear = "_this call SLX_XEH_EH_FiredNear";
                        fuel = "_this call SLX_XEH_EH_Fuel";
                        gear = "_this call SLX_XEH_EH_Gear";
                        getIn = "_this call SLX_XEH_EH_GetIn";
                        getOut = "_this call SLX_XEH_EH_GetOut";
                        handleHeal = "_this call SLX_XEH_EH_HandleHeal";
                        hit = "_this call SLX_XEH_EH_Hit";
                        hitPart = "_this call SLX_XEH_EH_HitPart";
                        incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
                        inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
                        inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
                        killed = "_this call SLX_XEH_EH_Killed";
                        landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
                        landedStopped = "_this call SLX_XEH_EH_LandedStopped";
                        local = "_this call SLX_XEH_EH_Local";
                        respawn = "_this call SLX_XEH_EH_Respawn";
                        put = "_this call SLX_XEH_EH_Put";
                        take = "_this call SLX_XEH_EH_Take";
                        soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
                        weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
                        weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
                };
        };
       
        class LOP_TAK_Civ_UAZ: RHS_UAZ_Base {
 
                class EventHandlers {
                        init = "_this call SLX_XEH_EH_Init";
                        fired = "_this call SLX_XEH_EH_Fired";
                        animChanged = "_this call SLX_XEH_EH_AnimChanged";
                        animDone = "_this call SLX_XEH_EH_AnimDone";
                        animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
                        containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
                        containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
                        controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
                        dammaged = "_this call SLX_XEH_EH_Dammaged";
                        engine = "_this call SLX_XEH_EH_Engine";
                        epeContact = "_this call SLX_XEH_EH_EpeContact";
                        epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
                        epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
                        explosion = "_this call SLX_XEH_EH_Explosion";
                        firedNear = "_this call SLX_XEH_EH_FiredNear";
                        fuel = "_this call SLX_XEH_EH_Fuel";
                        gear = "_this call SLX_XEH_EH_Gear";
                        getIn = "_this call SLX_XEH_EH_GetIn";
                        getOut = "_this call SLX_XEH_EH_GetOut";
                        handleHeal = "_this call SLX_XEH_EH_HandleHeal";
                        hit = "_this call SLX_XEH_EH_Hit";
                        hitPart = "_this call SLX_XEH_EH_HitPart";
                        incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
                        inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
                        inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
                        killed = "_this call SLX_XEH_EH_Killed";
                        landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
                        landedStopped = "_this call SLX_XEH_EH_LandedStopped";
                        local = "_this call SLX_XEH_EH_Local";
                        respawn = "_this call SLX_XEH_EH_Respawn";
                        put = "_this call SLX_XEH_EH_Put";
                        take = "_this call SLX_XEH_EH_Take";
                        soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
                        weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
                        weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
                };
        };
       
        class LOP_TAK_Civ_UAZ_Open: rhs_uaz_open_Base {
 
                class EventHandlers {
                        init = "_this call SLX_XEH_EH_Init";
                        fired = "_this call SLX_XEH_EH_Fired";
                        animChanged = "_this call SLX_XEH_EH_AnimChanged";
                        animDone = "_this call SLX_XEH_EH_AnimDone";
                        animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
                        containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
                        containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
                        controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
                        dammaged = "_this call SLX_XEH_EH_Dammaged";
                        engine = "_this call SLX_XEH_EH_Engine";
                        epeContact = "_this call SLX_XEH_EH_EpeContact";
                        epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
                        epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
                        explosion = "_this call SLX_XEH_EH_Explosion";
                        firedNear = "_this call SLX_XEH_EH_FiredNear";
                        fuel = "_this call SLX_XEH_EH_Fuel";
                        gear = "_this call SLX_XEH_EH_Gear";
                        getIn = "_this call SLX_XEH_EH_GetIn";
                        getOut = "_this call SLX_XEH_EH_GetOut";
                        handleHeal = "_this call SLX_XEH_EH_HandleHeal";
                        hit = "_this call SLX_XEH_EH_Hit";
                        hitPart = "_this call SLX_XEH_EH_HitPart";
                        incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
                        inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
                        inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
                        killed = "_this call SLX_XEH_EH_Killed";
                        landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
                        landedStopped = "_this call SLX_XEH_EH_LandedStopped";
                        local = "_this call SLX_XEH_EH_Local";
                        respawn = "_this call SLX_XEH_EH_Respawn";
                        put = "_this call SLX_XEH_EH_Put";
                        take = "_this call SLX_XEH_EH_Take";
                        soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
                        weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
                        weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
                };
        };
       
        /*extern*/ class Civilian_F;
       
        class LOP_Tak_Civ_Man_01 : Civilian_F {
 
                class EventHandlers {
                        init = "_this call SLX_XEH_EH_Init";
                        fired = "_this call SLX_XEH_EH_Fired";
                        animChanged = "_this call SLX_XEH_EH_AnimChanged";
                        animDone = "_this call SLX_XEH_EH_AnimDone";
                        animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
                        containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
                        containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
                        controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
                        dammaged = "_this call SLX_XEH_EH_Dammaged";
                        engine = "_this call SLX_XEH_EH_Engine";
                        epeContact = "_this call SLX_XEH_EH_EpeContact";
                        epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
                        epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
                        explosion = "_this call SLX_XEH_EH_Explosion";
                        firedNear = "_this call SLX_XEH_EH_FiredNear";
                        fuel = "_this call SLX_XEH_EH_Fuel";
                        gear = "_this call SLX_XEH_EH_Gear";
                        getIn = "_this call SLX_XEH_EH_GetIn";
                        getOut = "_this call SLX_XEH_EH_GetOut";
                        handleHeal = "_this call SLX_XEH_EH_HandleHeal";
                        hit = "_this call SLX_XEH_EH_Hit";
                        hitPart = "_this call SLX_XEH_EH_HitPart";
                        incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
                        inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
                        inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
                        killed = "_this call SLX_XEH_EH_Killed";
                        landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
                        landedStopped = "_this call SLX_XEH_EH_LandedStopped";
                        local = "_this call SLX_XEH_EH_Local";
                        respawn = "_this call SLX_XEH_EH_Respawn";
                        put = "_this call SLX_XEH_EH_Put";
                        take = "_this call SLX_XEH_EH_Take";
                        soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
                        weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
                        weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
                };
        };
 
        class LOP_Tak_Civ_Man_02 : Civilian_F {
 
                class EventHandlers {
                        init = "_this call SLX_XEH_EH_Init";
                        fired = "_this call SLX_XEH_EH_Fired";
                        animChanged = "_this call SLX_XEH_EH_AnimChanged";
                        animDone = "_this call SLX_XEH_EH_AnimDone";
                        animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
                        containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
                        containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
                        controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
                        dammaged = "_this call SLX_XEH_EH_Dammaged";
                        engine = "_this call SLX_XEH_EH_Engine";
                        epeContact = "_this call SLX_XEH_EH_EpeContact";
                        epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
                        epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
                        explosion = "_this call SLX_XEH_EH_Explosion";
                        firedNear = "_this call SLX_XEH_EH_FiredNear";
                        fuel = "_this call SLX_XEH_EH_Fuel";
                        gear = "_this call SLX_XEH_EH_Gear";
                        getIn = "_this call SLX_XEH_EH_GetIn";
                        getOut = "_this call SLX_XEH_EH_GetOut";
                        handleHeal = "_this call SLX_XEH_EH_HandleHeal";
                        hit = "_this call SLX_XEH_EH_Hit";
                        hitPart = "_this call SLX_XEH_EH_HitPart";
                        incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
                        inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
                        inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
                        killed = "_this call SLX_XEH_EH_Killed";
                        landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
                        landedStopped = "_this call SLX_XEH_EH_LandedStopped";
                        local = "_this call SLX_XEH_EH_Local";
                        respawn = "_this call SLX_XEH_EH_Respawn";
                        put = "_this call SLX_XEH_EH_Put";
                        take = "_this call SLX_XEH_EH_Take";
                        soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
                        weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
                        weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
                };
        };
 
        class LOP_Tak_Civ_Man_04 : Civilian_F {
 
                class EventHandlers {
                        init = "_this call SLX_XEH_EH_Init";
                        fired = "_this call SLX_XEH_EH_Fired";
                        animChanged = "_this call SLX_XEH_EH_AnimChanged";
                        animDone = "_this call SLX_XEH_EH_AnimDone";
                        animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
                        containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
                        containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
                        controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
                        dammaged = "_this call SLX_XEH_EH_Dammaged";
                        engine = "_this call SLX_XEH_EH_Engine";
                        epeContact = "_this call SLX_XEH_EH_EpeContact";
                        epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
                        epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
                        explosion = "_this call SLX_XEH_EH_Explosion";
                        firedNear = "_this call SLX_XEH_EH_FiredNear";
                        fuel = "_this call SLX_XEH_EH_Fuel";
                        gear = "_this call SLX_XEH_EH_Gear";
                        getIn = "_this call SLX_XEH_EH_GetIn";
                        getOut = "_this call SLX_XEH_EH_GetOut";
                        handleHeal = "_this call SLX_XEH_EH_HandleHeal";
                        hit = "_this call SLX_XEH_EH_Hit";
                        hitPart = "_this call SLX_XEH_EH_HitPart";
                        incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
                        inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
                        inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
                        killed = "_this call SLX_XEH_EH_Killed";
                        landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
                        landedStopped = "_this call SLX_XEH_EH_LandedStopped";
                        local = "_this call SLX_XEH_EH_Local";
                        respawn = "_this call SLX_XEH_EH_Respawn";
                        put = "_this call SLX_XEH_EH_Put";
                        take = "_this call SLX_XEH_EH_Take";
                        soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
                        weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
                        weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
                };
        };
};