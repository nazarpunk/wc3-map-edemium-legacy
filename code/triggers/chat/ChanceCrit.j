function Trig_ChanceCrit_Actions takes nothing returns nothing
    call ClearTextMessagesBJ(GetPlayersAll())
    call DisplayTimedTextToForce(GetPlayersAll(), 1.00, R2S(udg_ChanceCrit))
endfunction

function InitTrig_ChanceCrit takes nothing returns nothing
    set gg_trg_ChanceCrit = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_ChanceCrit, Player(0), "cr", true)
    call TriggerAddAction(gg_trg_ChanceCrit, function Trig_ChanceCrit_Actions)
endfunction