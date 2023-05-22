
function Trig_Onkie_Sells_Func001Func001Func001C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303057))then
        return false
    endif
    return true
endfunction
function Trig_Onkie_Sells_Func001Func001C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303056))then
        return false
    endif
    return true
endfunction
function Trig_Onkie_Sells_Func001C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303156))then
        return false
    endif
    return true
endfunction
function Trig_Onkie_Sells_Func002Func003Func003C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303053))then
        return false
    endif
    return true
endfunction
function Trig_Onkie_Sells_Func002Func003C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303052))then
        return false
    endif
    return true
endfunction
function Trig_Onkie_Sells_Func002C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303051))then
        return false
    endif
    return true
endfunction
function Trig_Onkie_Sells_Actions takes nothing returns nothing
    if(Trig_Onkie_Sells_Func001C())then
        set udg_IG_ItemQuality = 1
        set udg_IG_Point = GetUnitLoc(udg_Arct)
        call ConditionalTriggerExecute(gg_trg_IG_Generate)
    else
        if(Trig_Onkie_Sells_Func001Func001C())then
            set udg_IG_ItemQuality = 2
            set udg_IG_Point = GetUnitLoc(udg_Arct)
            call ConditionalTriggerExecute(gg_trg_IG_Generate)
        else
            if(Trig_Onkie_Sells_Func001Func001Func001C())then
                set udg_IG_ItemQuality = 3
                set udg_IG_Point = GetUnitLoc(udg_Arct)
                call ConditionalTriggerExecute(gg_trg_IG_Generate)
            else
            endif
        endif
    endif
    if(Trig_Onkie_Sells_Func002C())then
        set udg_IG_Point = GetUnitLoc(udg_Arct)
        call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(1, 3)], udg_IG_Point)
    else
        if(Trig_Onkie_Sells_Func002Func003C())then
            set udg_IG_Point = GetUnitLoc(udg_Arct)
            call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(4, 5)], udg_IG_Point)
        else
            if(Trig_Onkie_Sells_Func002Func003Func003C())then
                set udg_IG_Point = GetUnitLoc(udg_Arct)
                call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(6, 9)], udg_IG_Point)
            else
            endif
        endif
    endif
    call RemoveLocation(udg_IG_Point)
endfunction
function InitTrig_Onkie_Sells takes nothing returns nothing
    set gg_trg_Onkie_Sells = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Onkie_Sells, gg_unit_n009_0061, EVENT_UNIT_SELL_ITEM)
    call TriggerAddAction(gg_trg_Onkie_Sells, function Trig_Onkie_Sells_Actions)
endfunction