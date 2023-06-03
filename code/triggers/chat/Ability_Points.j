function Trig_Ability_Points_Actions takes nothing returns nothing
    set udg_AS_Points = S2I(SubStringBJ(GetEventPlayerChatString(), 2, 5))
    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 1, ("Очки навыков: " + I2S(udg_AS_Points)))
endfunction

function InitTrig_Ability_Points takes nothing returns nothing
    set gg_trg_Ability_Points = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Ability_Points, Player(0), ".", false)
    call TriggerAddAction(gg_trg_Ability_Points, function Trig_Ability_Points_Actions)
endfunction
