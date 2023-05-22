
function Trig_Effect_1_Timer_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Effect_1_Heal)
endfunction

function InitTrig_Effect_1_Timer takes nothing returns nothing
    set gg_trg_Effect_1_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Effect_1_Timer, udg_AS_TimerEffect1)
    call TriggerAddAction(gg_trg_Effect_1_Timer, function Trig_Effect_1_Timer_Actions)
endfunction
