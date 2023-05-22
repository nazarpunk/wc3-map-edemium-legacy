
function Trig_Follower_Movement_Func001Func001Func003C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_Point, udg_Point2) >= 400.00))then
        return false
    endif
    return true
endfunction
function Trig_Follower_Movement_Func001Func001C takes nothing returns boolean
    if(not(CountUnitsInGroup(udg_FollowersGroup) > 0))then
        return false
    endif
    return true
endfunction
function Trig_Follower_Movement_Func001A takes nothing returns nothing
    if(Trig_Follower_Movement_Func001Func001C())then
        set udg_Point = GetUnitLoc(udg_Arct)
        set udg_Point2 = GetUnitLoc(GetEnumUnit())
        if(Trig_Follower_Movement_Func001Func001Func003C())then
            call RemoveLocation(udg_Point2)
            set udg_Point2 = OffsetLocation(udg_Point, GetRandomReal(120.00, 150.00), GetRandomReal(50.00, 100.00))
            call IssuePointOrderLoc(GetEnumUnit(), "attack", udg_Point2)
        else
        endif
        call RemoveLocation(udg_Point)
        call RemoveLocation(udg_Point2)
    else
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