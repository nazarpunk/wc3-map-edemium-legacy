function Trig_Scroll_Timer_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Scroll_Periodic)
endfunction

function InitTrig_Scroll_Timer takes nothing returns nothing
    set gg_trg_Scroll_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Scroll_Timer, udg_ScrollTimer)
    call TriggerAddAction(gg_trg_Scroll_Timer, function Trig_Scroll_Timer_Actions)
endfunction