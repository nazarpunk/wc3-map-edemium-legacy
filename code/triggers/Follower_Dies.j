
function Trig_Follower_Dies_Conditions takes nothing returns boolean
    if(not(IsUnitInGroup(GetTriggerUnit(), udg_FollowersGroup) == true))then
        return false
    endif
    return true
endfunction
function Trig_Follower_Dies_Actions takes nothing returns nothing
    call GroupRemoveUnitSimple(GetTriggerUnit(), udg_FollowersGroup)
endfunction
function InitTrig_Follower_Dies takes nothing returns nothing
    set gg_trg_Follower_Dies = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Follower_Dies, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Follower_Dies, Condition(function Trig_Follower_Dies_Conditions))
    call TriggerAddAction(gg_trg_Follower_Dies, function Trig_Follower_Dies_Actions)
endfunction