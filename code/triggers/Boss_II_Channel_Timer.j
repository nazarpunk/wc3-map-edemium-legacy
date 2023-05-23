function Trig_Boss_II_Channel_Timer_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Boss_II_Channel_Periodic)
endfunction

function InitTrig_Boss_II_Channel_Timer takes nothing returns nothing
    set gg_trg_Boss_II_Channel_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Boss_II_Channel_Timer, udg_Boss2Timer)
    call TriggerAddAction(gg_trg_Boss_II_Channel_Timer, function Trig_Boss_II_Channel_Timer_Actions)
endfunction
