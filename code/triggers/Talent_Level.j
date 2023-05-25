function Trig_Talent_Level_Actions takes nothing returns nothing
    set udg_ART[S2I(SubStringBJ(GetEventPlayerChatString(), 2, 3))] = S2I(SubStringBJ(GetEventPlayerChatString(), 4, 5))
endfunction

function InitTrig_Talent_Level takes nothing returns nothing
    set gg_trg_Talent_Level = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Talent_Level, Player(0), "t", false)
    call TriggerAddAction(gg_trg_Talent_Level, function Trig_Talent_Level_Actions)
endfunction