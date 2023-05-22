
function Trig_Orbs_Spawn_Func002C takes nothing returns boolean
    if(not(udg_LightIterations > 0))then
        return false
    endif
    return true
endfunction

function Trig_Orbs_Spawn_Actions takes nothing returns nothing
    set udg_LightIterations = (udg_LightIterations - 1)
    if(Trig_Orbs_Spawn_Func002C())then
        set udg_Point = GetUnitLoc(udg_Arct)
        call CreateNUnitsAtLoc(1, 0x68303034, Player(0), udg_Point, bj_UNIT_FACING)
        set udg_Point2 = PolarProjectionBJ(udg_Point, GetRandomReal(100.00, 120.00), GetRandomReal(0, 360.00))
        call IssuePointOrderLocBJ(GetLastCreatedUnit(), "breathoffire", udg_Point2)
        call RemoveLocation(udg_Point)
        call RemoveLocation(udg_Point2)
    else
        call DisableTrigger(GetTriggeringTrigger())
    endif
endfunction

function InitTrig_Orbs_Spawn takes nothing returns nothing
    set gg_trg_Orbs_Spawn = CreateTrigger()
    call DisableTrigger(gg_trg_Orbs_Spawn)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Orbs_Spawn, 0.25)
    call TriggerAddAction(gg_trg_Orbs_Spawn, function Trig_Orbs_Spawn_Actions)
endfunction
