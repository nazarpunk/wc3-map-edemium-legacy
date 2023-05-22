
function Trig_Add_Ingredients_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 10
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_CC_Ingredient[bj_forLoopAIndex] = 10
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
endfunction
function InitTrig_Add_Ingredients takes nothing returns nothing
    set gg_trg_Add_Ingredients = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Add_Ingredients, Player(0), "i+", true)
    call TriggerAddAction(gg_trg_Add_Ingredients, function Trig_Add_Ingredients_Actions)
endfunction