function Trig_Boss_Creep_Spawn_Actions takes nothing returns nothing
    set udg_RandomNumber = GetRandomInt(1, 3)
    set udg_CustomValues = (udg_CustomValues + 1)
    if GetUnitTypeId(udg_EM_BossUnit) == 0x6E30304C then
        if udg_RandomNumber == 1 then
            set udg_CO_Point = GetRectCenter(gg_rct_Boss_Creep_Spawn_1)
        else
            if udg_RandomNumber == 2 then
                set udg_CO_Point = GetRectCenter(gg_rct_Boss_Creep_Spawn_2)
            else
                set udg_CO_Point = GetRectCenter(gg_rct_Boss_Creep_Spawn_3)
            endif
        endif
    else
        if GetUnitTypeId(udg_EM_BossUnit) == 0x6E303047 then
            if udg_RandomNumber == 1 then
                set udg_CO_Point = GetRectCenter(gg_rct_Boss_2_Spawn)
            else
                if udg_RandomNumber == 2 then
                    set udg_CO_Point = GetRectCenter(gg_rct_Boss_2_Spawn_2)
                else
                    set udg_CO_Point = GetRectCenter(gg_rct_Boss_2_Spawn_3)
                endif
            endif
        endif
    endif
    call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 5)], Player(11), udg_CO_Point, bj_UNIT_FACING)
    call SetUnitUserData(GetLastCreatedUnit(), udg_CustomValues)
    call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", udg_Arct)
    call RemoveLocation(udg_CO_Point)
    call ConditionalTriggerExecute(gg_trg_Gen_Creeps_Skills)
endfunction

function InitTrig_Boss_Creep_Spawn takes nothing returns nothing
    set gg_trg_Boss_Creep_Spawn = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_Creep_Spawn)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_Creep_Spawn, 6.00)
    call TriggerAddAction(gg_trg_Boss_Creep_Spawn, function Trig_Boss_Creep_Spawn_Actions)
endfunction
