function Trig_Game_Save_Actions takes nothing returns nothing
    call DialogDisplayBJ(true, udg_TeleportDialog, Player(0))
    call StartTimerBJ(udg_SaveTimer, false, 0.00)
endfunction
function InitTrig_Game_Save takes nothing returns nothing
    set gg_trg_Game_Save = CreateTrigger()
    call TriggerRegisterGameSavedEventBJ(gg_trg_Game_Save)
    call TriggerAddAction(gg_trg_Game_Save, function Trig_Game_Save_Actions)
endfunction