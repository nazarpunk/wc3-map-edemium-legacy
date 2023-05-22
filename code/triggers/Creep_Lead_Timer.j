
function Trig_Creep_Lead_Timer_Actions takes nothing returns nothing
    call DestroyLightningBJ(udg_Lead)
endfunction

function InitTrig_Creep_Lead_Timer takes nothing returns nothing
    set gg_trg_Creep_Lead_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Creep_Lead_Timer, udg_TimerLead)
    call TriggerAddAction(gg_trg_Creep_Lead_Timer, function Trig_Creep_Lead_Timer_Actions)
endfunction
