function Trig_Core_Recycle_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x4130344A
endfunction

function Trig_Core_Recycle_Actions takes nothing returns nothing
    call ClearTextMessagesBJ(GetPlayersAll())
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_CC_Ingredient[bj_forLoopAIndex] = (udg_CC_Ingredient[bj_forLoopAIndex] + udg_CC_IngredientAdded[bj_forLoopAIndex])
        set udg_CC_IngredientAdded[bj_forLoopAIndex] = 0
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call RemoveItemFromStockBJ(udg_CC_IngredientItem[bj_forLoopAIndex], gg_unit_h00F_0003)
        if udg_CC_Ingredient[bj_forLoopAIndex] > 0 then
            call AddItemToStockBJ(udg_CC_IngredientItem[bj_forLoopAIndex], gg_unit_h00F_0003, udg_CC_Ingredient[bj_forLoopAIndex], udg_CC_Ingredient[bj_forLoopAIndex])
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
endfunction

function InitTrig_Core_Recycle takes nothing returns nothing
    set gg_trg_Core_Recycle = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Core_Recycle, gg_unit_h00F_0003, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Core_Recycle, Condition(function Trig_Core_Recycle_Conditions))
    call TriggerAddAction(gg_trg_Core_Recycle, function Trig_Core_Recycle_Actions)
endfunction