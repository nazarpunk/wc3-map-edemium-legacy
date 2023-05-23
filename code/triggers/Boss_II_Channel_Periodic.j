function Trig_Boss_II_Channel_Periodic_Actions takes nothing returns nothing
    set udg_Point = GetRectCenter(gg_rct_Boss_2_Zone)
    set udg_Point2 = PolarProjectionBJ(udg_Point, 700.00, GetRandomDirectionDeg())
    call CreateNUnitsAtLoc(1, 0x68303134, Player(11), udg_Point2, bj_UNIT_FACING)
    call SetUnitUserData(GetLastCreatedUnit(), 22)
    call UnitAddAbilityBJ(0x4130354B, GetLastCreatedUnit())
    call UnitApplyTimedLifeBJ(5.00, 0x42544C46, GetLastCreatedUnit())
    call RemoveLocation(udg_Point)
    call RemoveLocation(udg_Point2)
    set udg_Point = GetUnitLoc(udg_Arct)
    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "carrionswarm", udg_Point)
    call RemoveLocation(udg_Point)
endfunction

function InitTrig_Boss_II_Channel_Periodic takes nothing returns nothing
    set gg_trg_Boss_II_Channel_Periodic = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_II_Channel_Periodic)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_II_Channel_Periodic, 0.50)
    call TriggerAddAction(gg_trg_Boss_II_Channel_Periodic, function Trig_Boss_II_Channel_Periodic_Actions)
endfunction
