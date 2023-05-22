
function Trig_Set_Ingredients_Actions takes nothing returns nothing
    set udg_CC_Ingredient[S2I(SubStringBJ(GetEventPlayerChatString(), 2, 2))] = S2I(SubStringBJ(GetEventPlayerChatString(), 4, 5))
endfunction

function InitTrig_Set_Ingredients takes nothing returns nothing
    set gg_trg_Set_Ingredients = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Set_Ingredients, Player(0), "i", false)
    call TriggerAddAction(gg_trg_Set_Ingredients, function Trig_Set_Ingredients_Actions)
endfunction
