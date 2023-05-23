
function Trig_Damage_Actions takes nothing returns nothing
    call SetUnitLifePercentBJ(udg_Arct, 50.00)
    call SetUnitManaPercentBJ(udg_Arct, 0.00)
endfunction

function InitTrig_Damage takes nothing returns nothing
    set gg_trg_Damage = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Damage, Player(0), "d", true)
    call TriggerAddAction(gg_trg_Damage, function Trig_Damage_Actions)
endfunction
