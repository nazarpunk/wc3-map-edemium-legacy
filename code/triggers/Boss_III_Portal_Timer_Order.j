
function Trig_Boss_III_Portal_Timer_Order_Actions takes nothing returns nothing
    call EnableTrigger(gg_trg_Boss_III_Portal_Abort)
endfunction

function InitTrig_Boss_III_Portal_Timer_Order takes nothing returns nothing
    set gg_trg_Boss_III_Portal_Timer_Order = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Boss_III_Portal_Timer_Order, udg_Boss3TimerOrder)
    call TriggerAddAction(gg_trg_Boss_III_Portal_Timer_Order, function Trig_Boss_III_Portal_Timer_Order_Actions)
endfunction
