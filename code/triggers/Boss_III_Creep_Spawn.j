function Trig_Boss_III_Creep_Spawn_Actions takes nothing returns nothing
    set udg_RandomNumber = GetRandomInt(1, 3)
    set udg_CustomValues = (udg_CustomValues + 1)
    if udg_RandomNumber == 1 then
        set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Left)
    else
        if udg_RandomNumber == 2 then
            set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Center)
        else
            set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Right)
        endif
    endif
    call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 4)], Player(11), udg_CO_Point, bj_UNIT_FACING)
    call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", udg_Arct)
    call SetUnitUserData(GetLastCreatedUnit(), udg_CustomValues)
    call AddSpecialEffectLocBJ(udg_CO_Point, "war3mapImported\\Holy_Heal_Small.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call RemoveLocation(udg_CO_Point)
endfunction

function InitTrig_Boss_III_Creep_Spawn takes nothing returns nothing
    set gg_trg_Boss_III_Creep_Spawn = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Creep_Spawn)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_III_Creep_Spawn, 6.00)
    call TriggerAddAction(gg_trg_Boss_III_Creep_Spawn, function Trig_Boss_III_Creep_Spawn_Actions)
endfunction
