function Trig_Exp_Actions takes nothing returns nothing
    call AddHeroXPSwapped(100, ArctUnit, false)
endfunction

function InitTrig_Exp takes nothing returns nothing
    set gg_trg_Exp = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Exp, Player(0), "ex", true)
    call TriggerAddAction(gg_trg_Exp, function Trig_Exp_Actions)
endfunction