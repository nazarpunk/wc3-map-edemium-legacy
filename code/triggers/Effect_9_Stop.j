
function Trig_Effect_9_Stop_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Effect_9_Periodic)
    call GroupClear(udg_AS_Effect9Group)
endfunction
function InitTrig_Effect_9_Stop takes nothing returns nothing
    set gg_trg_Effect_9_Stop = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Effect_9_Stop, udg_AS_TimerEffect9)
    call TriggerAddAction(gg_trg_Effect_9_Stop, function Trig_Effect_9_Stop_Actions)
endfunction