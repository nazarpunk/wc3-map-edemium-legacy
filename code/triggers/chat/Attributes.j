function Trig_Attributes_Actions takes nothing returns nothing
    if SubStringBJ(GetEventPlayerChatString(), 2, 2) == "a" then
        call ModifyHeroStat(bj_HEROSTAT_AGI, ArctUnit, bj_MODIFYMETHOD_SET, S2I(SubStringBJ(GetEventPlayerChatString(), 4, 5)))
    endif
    if SubStringBJ(GetEventPlayerChatString(), 2, 2) == "f" then
        call ModifyHeroStat(bj_HEROSTAT_STR, ArctUnit, bj_MODIFYMETHOD_SET, S2I(SubStringBJ(GetEventPlayerChatString(), 4, 5)))
    endif
    if SubStringBJ(GetEventPlayerChatString(), 2, 2) == "w" then
        call ModifyHeroStat(bj_HEROSTAT_INT, ArctUnit, bj_MODIFYMETHOD_SET, S2I(SubStringBJ(GetEventPlayerChatString(), 4, 5)))
    endif
endfunction

function InitTrig_Attributes takes nothing returns nothing
    set gg_trg_Attributes = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Attributes, Player(0), "-a", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_Attributes, Player(0), "-f", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_Attributes, Player(0), "-w", false)
    call TriggerAddAction(gg_trg_Attributes, function Trig_Attributes_Actions)
endfunction
