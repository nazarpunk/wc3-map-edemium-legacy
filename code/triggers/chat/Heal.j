function Trig_Heal_Actions takes nothing returns nothing
    call SetUnitLifePercentBJ(udg_Arct, 100)
    call SetUnitManaPercentBJ(udg_Arct, 100)
endfunction

function InitTrig_Heal takes nothing returns nothing
    set gg_trg_Heal = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Heal, Player(0), "q", true)
    call TriggerAddAction(gg_trg_Heal, function Trig_Heal_Actions)
endfunction