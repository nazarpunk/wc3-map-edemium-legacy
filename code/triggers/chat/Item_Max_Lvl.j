function Trig_Item_Max_Lvl_Actions takes nothing returns nothing
    set udg_IG_ItemLVL_Max = S2I(SubStringBJ(GetEventPlayerChatString(), 2, 2))
endfunction

function InitTrig_Item_Max_Lvl takes nothing returns nothing
    set gg_trg_Item_Max_Lvl = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Item_Max_Lvl, Player(0), "+", false)
    call TriggerAddAction(gg_trg_Item_Max_Lvl, function Trig_Item_Max_Lvl_Actions)
endfunction
