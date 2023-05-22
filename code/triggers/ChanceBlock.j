
function Trig_ChanceBlock_Actions takes nothing returns nothing
    call ClearTextMessagesBJ(GetPlayersAll())
    call DisplayTimedTextToForce(GetPlayersAll(), 1.00, R2S(udg_ChanceBlock))
endfunction

function InitTrig_ChanceBlock takes nothing returns nothing
    set gg_trg_ChanceBlock = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_ChanceBlock, Player(0), "bl", true)
    call TriggerAddAction(gg_trg_ChanceBlock, function Trig_ChanceBlock_Actions)
endfunction
