function Trig_Follower_Movement_Func001A takes nothing returns nothing
    if CountUnitsInGroup(udg_FollowersGroup) > 0 then
        set udg_Point = GetUnitLoc(udg_Arct)
        set udg_Point2 = GetUnitLoc(GetEnumUnit())
        if DistanceBetweenPoints(udg_Point, udg_Point2) >= 400.00 then
            call RemoveLocation(udg_Point2)
            set udg_Point2 = OffsetLocation(udg_Point, GetRandomReal(120.00, 150.00), GetRandomReal(50.00, 100.00))
            call IssuePointOrderLoc(GetEnumUnit(), "attack", udg_Point2)
        endif
        call RemoveLocation(udg_Point)
        call RemoveLocation(udg_Point2)
    endif
endfunction

function Trig_Follower_Movement_Actions takes nothing returns nothing
    call ForGroupBJ(udg_FollowersGroup, function Trig_Follower_Movement_Func001A)
endfunction

function InitTrig_Follower_Movement takes nothing returns nothing
    set gg_trg_Follower_Movement = CreateTrigger()
    call DisableTrigger(gg_trg_Follower_Movement)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Follower_Movement, 1.00)
    call TriggerAddAction(gg_trg_Follower_Movement, function Trig_Follower_Movement_Actions)
endfunction