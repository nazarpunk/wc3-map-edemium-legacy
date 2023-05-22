
function Trig_Attributes_Func001C takes nothing returns boolean
    return SubStringBJ(GetEventPlayerChatString(), 2, 2) == "a"
endfunction
function Trig_Attributes_Func002C takes nothing returns boolean
    return SubStringBJ(GetEventPlayerChatString(), 2, 2) == "f"
endfunction
function Trig_Attributes_Func003C takes nothing returns boolean
    return SubStringBJ(GetEventPlayerChatString(), 2, 2) == "w"
endfunction
function Trig_Attributes_Actions takes nothing returns nothing
    if(Trig_Attributes_Func001C())then
        call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_SET, S2I(SubStringBJ(GetEventPlayerChatString(), 4, 5)))
    else
    endif
    if(Trig_Attributes_Func002C())then
        call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_SET, S2I(SubStringBJ(GetEventPlayerChatString(), 4, 5)))
    else
    endif
    if(Trig_Attributes_Func003C())then
        call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_SET, S2I(SubStringBJ(GetEventPlayerChatString(), 4, 5)))
    else
    endif
endfunction
function InitTrig_Attributes takes nothing returns nothing
    set gg_trg_Attributes = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Attributes, Player(0), "-a", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_Attributes, Player(0), "-f", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_Attributes, Player(0), "-w", false)
    call TriggerAddAction(gg_trg_Attributes, function Trig_Attributes_Actions)
endfunction