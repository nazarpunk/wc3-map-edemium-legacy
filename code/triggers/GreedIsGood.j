
function Trig_GreedIsGood_Conditions takes nothing returns boolean
    if(not(GetPlayerState(Player(10), PLAYER_STATE_RESOURCE_GOLD) > 0))then
        return false
    endif
    return true
endfunction

function Trig_GreedIsGood_Actions takes nothing returns nothing
    call CustomDefeatBJ(Player(0), "Жадность губит твою душу.")
endfunction

function InitTrig_GreedIsGood takes nothing returns nothing
    set gg_trg_GreedIsGood = CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_GreedIsGood, 2.00)
    call TriggerAddCondition(gg_trg_GreedIsGood, Condition(function Trig_GreedIsGood_Conditions))
    call TriggerAddAction(gg_trg_GreedIsGood, function Trig_GreedIsGood_Actions)
endfunction
