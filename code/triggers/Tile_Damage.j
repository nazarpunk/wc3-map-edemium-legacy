function Trig_Tile_Damage_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(ArctUnit)
    if not UnitHasBuffBJ(ArctUnit, 0x42486473) and GetTerrainTypeBJ(udg_Point) == 0x43706F73 then
        set udg_AbilityPower = 15.00
        set udg_AbilityPower = (udg_AbilityPower * I2R(udg_Difficulty))
        call SetUnitLifeBJ(ArctUnit, (GetUnitStateSwap(UNIT_STATE_LIFE, ArctUnit) - udg_AbilityPower))
        call AddSpecialEffectTargetUnitBJ("chest", ArctUnit, "Abilities\\Weapons\\snapMissile\\snapMissile.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
    else
        if GetTerrainTypeBJ(udg_Point) == 0x446C6176 then
            set udg_AbilityPower = 25.00
            set udg_AbilityPower = (udg_AbilityPower * I2R(udg_Difficulty))
            call SetUnitLifeBJ(ArctUnit, (GetUnitStateSwap(UNIT_STATE_LIFE, ArctUnit) - udg_AbilityPower))
            call AddSpecialEffectTargetUnitBJ("chest", ArctUnit, "Abilities\\Weapons\\LavaSpawnMissile\\LavaSpawnMissile.mdl")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
        endif
    endif
    call RemoveLocation(udg_Point)
endfunction

function InitTrig_Tile_Damage takes nothing returns nothing
    set gg_trg_Tile_Damage = CreateTrigger()
    call DisableTrigger(gg_trg_Tile_Damage)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Tile_Damage, 0.75)
    call TriggerAddAction(gg_trg_Tile_Damage, function Trig_Tile_Damage_Actions)
endfunction