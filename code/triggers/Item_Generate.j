
function Trig_Item_Generate_Actions takes nothing returns nothing
    set udg_IG_ItemQuality = GetRandomInt(1, 3)
    set udg_IG_Point = GetUnitLoc(udg_Arct)
    call ConditionalTriggerExecute(gg_trg_IG_Generate)
endfunction
function InitTrig_Item_Generate takes nothing returns nothing
    set gg_trg_Item_Generate = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Item_Generate, Player(0), "/", true)
    call TriggerAddAction(gg_trg_Item_Generate, function Trig_Item_Generate_Actions)
endfunction