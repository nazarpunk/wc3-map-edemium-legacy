
function Trig_Core_Put_Ingredient_Conditions takes nothing returns boolean
    if(not(GetItemType(GetSoldItem()) == ITEM_TYPE_CAMPAIGN))then
        return false
    endif
    return true
endfunction

function Trig_Core_Put_Ingredient_Func005Func002C takes nothing returns boolean
    if(not(udg_CC_Ingredient[bj_forLoopAIndex] > 0))then
        return false
    endif
    return true
endfunction

function Trig_Core_Put_Ingredient_Func007Func001C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[bj_forLoopAIndex] > 0))then
        return false
    endif
    return true
endfunction

function Trig_Core_Put_Ingredient_Actions takes nothing returns nothing
    set udg_CC_ItemLevel = GetItemLevel(GetSoldItem())
    set udg_CC_Ingredient[udg_CC_ItemLevel] = (udg_CC_Ingredient[udg_CC_ItemLevel] - 1)
    set udg_CC_IngredientAdded[udg_CC_ItemLevel] = (udg_CC_IngredientAdded[udg_CC_ItemLevel] + 1)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call RemoveItemFromStockBJ(udg_CC_IngredientItem[bj_forLoopAIndex], gg_unit_h00F_0003)
        if(Trig_Core_Put_Ingredient_Func005Func002C())then
            call AddItemToStockBJ(udg_CC_IngredientItem[bj_forLoopAIndex], gg_unit_h00F_0003, udg_CC_Ingredient[bj_forLoopAIndex], udg_CC_Ingredient[bj_forLoopAIndex])
        else
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call ClearTextMessagesBJ(GetPlayersAll())
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if(Trig_Core_Put_Ingredient_Func007Func001C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 999.00, (udg_CC_IngredientName[bj_forLoopAIndex] + (": " + I2S(udg_CC_IngredientAdded[bj_forLoopAIndex]))))
        else
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call RemoveItem(GetSoldItem())
endfunction

function InitTrig_Core_Put_Ingredient takes nothing returns nothing
    set gg_trg_Core_Put_Ingredient = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Core_Put_Ingredient, gg_unit_h00F_0003, EVENT_UNIT_SELL_ITEM)
    call TriggerAddCondition(gg_trg_Core_Put_Ingredient, Condition(function Trig_Core_Put_Ingredient_Conditions))
    call TriggerAddAction(gg_trg_Core_Put_Ingredient, function Trig_Core_Put_Ingredient_Actions)
endfunction
