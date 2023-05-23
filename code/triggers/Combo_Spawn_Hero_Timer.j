function Trig_Combo_Spawn_Hero_Timer_Actions takes nothing returns nothing
    call EnableTrigger(gg_trg_Combo_Spawn_Hero)
endfunction

function InitTrig_Combo_Spawn_Hero_Timer takes nothing returns nothing
    set gg_trg_Combo_Spawn_Hero_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Combo_Spawn_Hero_Timer, udg_CO_Timer)
    call TriggerAddAction(gg_trg_Combo_Spawn_Hero_Timer, function Trig_Combo_Spawn_Hero_Timer_Actions)
endfunction
