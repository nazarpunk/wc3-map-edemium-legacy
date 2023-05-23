function Trig_Creep_Fallen_Spawn_Func001A takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetEnumUnit())
    set udg_Point2 = PolarProjectionBJ(udg_Point, GetRandomReal(100.00, 200.00), GetRandomDirectionDeg())
    call CreateNUnitsAtLoc(1, 0x68303133, Player(11), udg_Point2, bj_UNIT_FACING)
    call UnitAddAbilityBJ(0x4130354B, GetLastCreatedUnit())
    call UnitApplyTimedLifeBJ(1.20, 0x42544C46, GetLastCreatedUnit())
    call RemoveLocation(udg_Point)
    call RemoveLocation(udg_Point2)
    set udg_Point = GetUnitLoc(udg_Arct)
    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "carrionswarm", udg_Point)
    call RemoveLocation(udg_Point)
endfunction

function Trig_Creep_Fallen_Spawn_Actions takes nothing returns nothing
    call ForGroupBJ(udg_FallenGroup, function Trig_Creep_Fallen_Spawn_Func001A)
    if CountUnitsInGroup(udg_FallenGroup) == 0 then
        call DisableTrigger(GetTriggeringTrigger())
    endif
endfunction

function InitTrig_Creep_Fallen_Spawn takes nothing returns nothing
    set gg_trg_Creep_Fallen_Spawn = CreateTrigger()
    call DisableTrigger(gg_trg_Creep_Fallen_Spawn)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Creep_Fallen_Spawn, 0.50)
    call TriggerAddAction(gg_trg_Creep_Fallen_Spawn, function Trig_Creep_Fallen_Spawn_Actions)
endfunction