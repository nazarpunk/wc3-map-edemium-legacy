
function Trig_Check_Lvl_Actions takes nothing returns nothing
    call DisplayTimedTextToForce(GetPlayersAll(), 1.00, I2S(GetHeroLevel(udg_Arct)))
endfunction

function InitTrig_Check_Lvl takes nothing returns nothing
    set gg_trg_Check_Lvl = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Check_Lvl, Player(0), "cl", true)
    call TriggerAddAction(gg_trg_Check_Lvl, function Trig_Check_Lvl_Actions)
endfunction
