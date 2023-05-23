function Trig_Combo_Spawn_Timer_Expires_Actions takes nothing returns nothing
    set udg_ComboSpawnAllowed = false
endfunction

function InitTrig_Combo_Spawn_Timer_Expires takes nothing returns nothing
    set gg_trg_Combo_Spawn_Timer_Expires = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Combo_Spawn_Timer_Expires, udg_ComboSpawnTimer)
    call TriggerAddAction(gg_trg_Combo_Spawn_Timer_Expires, function Trig_Combo_Spawn_Timer_Expires_Actions)
endfunction