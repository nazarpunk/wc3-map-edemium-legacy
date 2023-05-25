function Trig_Onkie_Sells_Actions takes nothing returns nothing
    if GetItemTypeId(GetSoldItem()) == 0x49303156 then
        set udg_IG_ItemQuality = 1
        set udg_IG_Point = GetUnitLoc(udg_Arct)
        call ConditionalTriggerExecute(gg_trg_IG_Generate)
    endif

    if GetItemTypeId(GetSoldItem()) == 0x49303056 then
        set udg_IG_ItemQuality = 2
        set udg_IG_Point = GetUnitLoc(udg_Arct)
        call ConditionalTriggerExecute(gg_trg_IG_Generate)
    endif

    if GetItemTypeId(GetSoldItem()) == 0x49303057 then
        set udg_IG_ItemQuality = 3
        set udg_IG_Point = GetUnitLoc(udg_Arct)
        call ConditionalTriggerExecute(gg_trg_IG_Generate)
    endif

    if GetItemTypeId(GetSoldItem()) == 0x49303051 then
        set udg_IG_Point = GetUnitLoc(udg_Arct)
        call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(1, 3)], udg_IG_Point)
    endif

    if GetItemTypeId(GetSoldItem()) == 0x49303052 then
        set udg_IG_Point = GetUnitLoc(udg_Arct)
        call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(4, 5)], udg_IG_Point)
    endif

    if GetItemTypeId(GetSoldItem()) == 0x49303053 then
        set udg_IG_Point = GetUnitLoc(udg_Arct)
        call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(6, 9)], udg_IG_Point)
    endif
    call RemoveLocation(udg_IG_Point)
endfunction

function InitTrig_Onkie_Sells takes nothing returns nothing
    set gg_trg_Onkie_Sells = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Onkie_Sells, gg_unit_n009_0061, EVENT_UNIT_SELL_ITEM)
    call TriggerAddAction(gg_trg_Onkie_Sells, function Trig_Onkie_Sells_Actions)
endfunction