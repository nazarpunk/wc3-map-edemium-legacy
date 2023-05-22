
function Trig_Poison_Timer_Actions takes nothing returns nothing
    call DestroyGroup(udg_PoisonGroup)
    call DisableTrigger(gg_trg_Poison_Damage)
endfunction

function InitTrig_Poison_Timer takes nothing returns nothing
    set gg_trg_Poison_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Poison_Timer, udg_PoisonTimer)
    call TriggerAddAction(gg_trg_Poison_Timer, function Trig_Poison_Timer_Actions)
endfunction
