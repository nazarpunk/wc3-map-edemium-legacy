function Trig_Core_Autosave_Actions takes nothing returns nothing
    call SetPlayerStateBJ(Player(0), PLAYER_STATE_RESOURCE_GOLD, udg_Autosave)
    call ExecuteFunc("Autosave")
    call DisableTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Core_Autosave takes nothing returns nothing
    set gg_trg_Core_Autosave = CreateTrigger()
    call DisableTrigger(gg_trg_Core_Autosave)
    call TriggerRegisterPlayerStateEvent(gg_trg_Core_Autosave, Player(0), PLAYER_STATE_RESOURCE_GOLD, GREATER_THAN_OR_EQUAL, 15000.00)
    call TriggerAddAction(gg_trg_Core_Autosave, function Trig_Core_Autosave_Actions)
endfunction