
function Trig_Item_Clear_Func001A takes nothing returns nothing
    call RemoveItem(GetEnumItem())
endfunction

function Trig_Item_Clear_Actions takes nothing returns nothing
    call EnumItemsInRectBJ(gg_rct_Ambient_Portal_Room, function Trig_Item_Clear_Func001A)
endfunction

function InitTrig_Item_Clear takes nothing returns nothing
    set gg_trg_Item_Clear = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Item_Clear, Player(0), "//", true)
    call TriggerAddAction(gg_trg_Item_Clear, function Trig_Item_Clear_Actions)
endfunction
