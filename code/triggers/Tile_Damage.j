
function Trig_Tile_Damage_Func002Func003C takes nothing returns boolean
    if(not(GetTerrainTypeBJ(udg_Point) == 0x446C6176))then
        return false
    endif
    return true
endfunction
function Trig_Tile_Damage_Func002C takes nothing returns boolean
    if(not(UnitHasBuffBJ(udg_Arct, 0x42486473) == false))then
        return false
    endif
    if(not(GetTerrainTypeBJ(udg_Point) == 0x43706F73))then
        return false
    endif
    return true
endfunction
function Trig_Tile_Damage_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(udg_Arct)
    if(Trig_Tile_Damage_Func002C())then
        set udg_AbilityPower = 15.00
        set udg_AbilityPower = (udg_AbilityPower * I2R(udg_Difficulty))
        call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) - udg_AbilityPower))
        call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "Abilities\\Weapons\\snapMissile\\snapMissile.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
    else
        if(Trig_Tile_Damage_Func002Func003C())then
            set udg_AbilityPower = 25.00
            set udg_AbilityPower = (udg_AbilityPower * I2R(udg_Difficulty))
            call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) - udg_AbilityPower))
            call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "Abilities\\Weapons\\LavaSpawnMissile\\LavaSpawnMissile.mdl")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
        else
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