function Trig_Suicide_Actions takes nothing returns nothing
    call KillUnit(gg_unit_H000_0004)
endfunction

function InitTrig_Suicide takes nothing returns nothing
    set gg_trg_Suicide = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Suicide, Player(0), "8", true)
    call TriggerAddAction(gg_trg_Suicide, function Trig_Suicide_Actions)
endfunction