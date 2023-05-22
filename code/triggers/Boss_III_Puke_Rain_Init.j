
function Trig_Boss_III_Puke_Rain_Init_Actions takes nothing returns nothing
    set udg_Boss3Pukes = 0
    call EnableTrigger(gg_trg_Boss_III_Puke_Rain)
endfunction

function InitTrig_Boss_III_Puke_Rain_Init takes nothing returns nothing
    set gg_trg_Boss_III_Puke_Rain_Init = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Puke_Rain_Init)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_III_Puke_Rain_Init, 20.00)
    call TriggerAddAction(gg_trg_Boss_III_Puke_Rain_Init, function Trig_Boss_III_Puke_Rain_Init_Actions)
endfunction
