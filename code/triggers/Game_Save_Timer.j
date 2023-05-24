function Trig_Game_Save_Timer_Actions takes nothing returns nothing
    call DialogDisplayBJ(false, udg_TeleportDialog, Player(0))
    call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "|cFFE30000Прогресс сохраняется автоматически.|r")
endfunction

function InitTrig_Game_Save_Timer takes nothing returns nothing
    set gg_trg_Game_Save_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Game_Save_Timer, udg_SaveTimer)
    call TriggerAddAction(gg_trg_Game_Save_Timer, function Trig_Game_Save_Timer_Actions)
endfunction