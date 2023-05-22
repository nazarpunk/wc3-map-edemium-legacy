
function Trig_Boss_Creep_Spawn_Func003Func001Func001Func002C takes nothing returns boolean
    return udg_RandomNumber == 2
endfunction

function Trig_Boss_Creep_Spawn_Func003Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction

function Trig_Boss_Creep_Spawn_Func003Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(udg_EM_BossUnit) == 0x6E303047))then
        return false
    endif
    return true
endfunction

function Trig_Boss_Creep_Spawn_Func003Func002Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction

function Trig_Boss_Creep_Spawn_Func003Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction

function Trig_Boss_Creep_Spawn_Func003C takes nothing returns boolean
    if(not(GetUnitTypeId(udg_EM_BossUnit) == 0x6E30304C))then
        return false
    endif
    return true
endfunction

function Trig_Boss_Creep_Spawn_Actions takes nothing returns nothing
    set udg_RandomNumber = GetRandomInt(1, 3)
    set udg_CustomValues = (udg_CustomValues + 1)
    if(Trig_Boss_Creep_Spawn_Func003C())then
        if(Trig_Boss_Creep_Spawn_Func003Func002C())then
            set udg_CO_Point = GetRectCenter(gg_rct_Boss_Creep_Spawn_1)
        else
            if(Trig_Boss_Creep_Spawn_Func003Func002Func002C())then
                set udg_CO_Point = GetRectCenter(gg_rct_Boss_Creep_Spawn_2)
            else
                set udg_CO_Point = GetRectCenter(gg_rct_Boss_Creep_Spawn_3)
            endif
        endif
    else
        if(Trig_Boss_Creep_Spawn_Func003Func001C())then
            if(Trig_Boss_Creep_Spawn_Func003Func001Func001C())then
                set udg_CO_Point = GetRectCenter(gg_rct_Boss_2_Spawn)
            else
                if(Trig_Boss_Creep_Spawn_Func003Func001Func001Func002C())then
                    set udg_CO_Point = GetRectCenter(gg_rct_Boss_2_Spawn_2)
                else
                    set udg_CO_Point = GetRectCenter(gg_rct_Boss_2_Spawn_3)
                endif
            endif
        else
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
