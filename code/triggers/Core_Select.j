function Trig_Core_Select_Conditions takes nothing returns boolean
    return GetTriggerUnit() == gg_unit_h00F_0003
endfunction

function Trig_Core_Select_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ(0x4130344A, GetTriggerUnit())
    call UnitRemoveAbilityBJ(0x41303449, GetTriggerUnit())
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call RemoveItemFromAllStock(udg_CC_IngredientItem[bj_forLoopAIndex])
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_CC_Ingredient[bj_forLoopAIndex] = (udg_CC_Ingredient[bj_forLoopAIndex] + udg_CC_IngredientAdded[bj_forLoopAIndex])
        set udg_CC_IngredientAdded[bj_forLoopAIndex] = 0
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call ClearTextMessagesBJ(GetPlayersAll())
    call UnitAddAbilityBJ(0x4130344A, GetTriggerUnit())
    call UnitAddAbilityBJ(0x41303449, GetTriggerUnit())
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 10
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if udg_CC_Ingredient[bj_forLoopAIndex] > 0 then
            call AddItemToStockBJ(udg_CC_IngredientItem[bj_forLoopAIndex], gg_unit_h00F_0003, udg_CC_Ingredient[bj_forLoopAIndex], udg_CC_Ingredient[bj_forLoopAIndex])
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
endfunction

function InitTrig_Core_Select takes nothing returns nothing
    set gg_trg_Core_Select = CreateTrigger()
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Core_Select, Player(0), true)
    call TriggerAddCondition(gg_trg_Core_Select, Condition(function Trig_Core_Select_Conditions))
    call TriggerAddAction(gg_trg_Core_Select, function Trig_Core_Select_Actions)
endfunction
