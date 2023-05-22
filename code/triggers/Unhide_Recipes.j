
function Trig_Unhide_Recipes_Func002002 takes nothing returns nothing
    call ShowUnitShow(GetEnumUnit())
endfunction

function Trig_Unhide_Recipes_Actions takes nothing returns nothing
    set udg_UnitGroup = GetUnitsInRectOfPlayer(gg_rct_Secrets, Player(PLAYER_NEUTRAL_PASSIVE))
    call ForGroupBJ(udg_UnitGroup, function Trig_Unhide_Recipes_Func002002)
    call DestroyGroup(udg_UnitGroup)
endfunction

function InitTrig_Unhide_Recipes takes nothing returns nothing
    set gg_trg_Unhide_Recipes = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Unhide_Recipes, Player(0), "ur", true)
    call TriggerAddAction(gg_trg_Unhide_Recipes, function Trig_Unhide_Recipes_Actions)
endfunction
