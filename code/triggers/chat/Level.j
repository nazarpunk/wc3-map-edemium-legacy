function Trig_Level_Actions takes nothing returns nothing
    call SetHeroLevelBJ(udg_Arct, S2I(SubStringBJ(GetEventPlayerChatString(), 5, 6)), false)
endfunction

function InitTrig_Level takes nothing returns nothing
    set gg_trg_Level = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Level, Player(0), "lvl", false)
    call TriggerAddAction(gg_trg_Level, function Trig_Level_Actions)
endfunction