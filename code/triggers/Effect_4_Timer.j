
function Trig_Effect_4_Timer_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Effect_4_Vampirism)
endfunction
function InitTrig_Effect_4_Timer takes nothing returns nothing
    set gg_trg_Effect_4_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Effect_4_Timer, udg_AS_TimerEffect4)
    call TriggerAddAction(gg_trg_Effect_4_Timer, function Trig_Effect_4_Timer_Actions)
endfunction