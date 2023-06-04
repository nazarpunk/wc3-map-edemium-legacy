function Trig_God_Mode_Actions takes nothing returns nothing
    call DestroyTrigger(gg_trg_WhosYourDaddy)
    call DestroyTrigger(gg_trg_GreedIsGood)
    call Cheat("whosyourdaddy")
    call SetUnitMoveSpeed(ArctUnit, 522.00)
endfunction

function InitTrig_God_Mode takes nothing returns nothing
    set gg_trg_God_Mode = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_God_Mode, Player(0), "5", true)
    call TriggerAddAction(gg_trg_God_Mode, function Trig_God_Mode_Actions)
endfunction