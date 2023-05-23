function Trig_Combo_Disappear_Conditions takes nothing returns boolean
    return GetOwningPlayer(GetTriggerUnit()) == Player(9)
endfunction

function Trig_Combo_Disappear_Actions takes nothing returns nothing
    call RemoveUnit(GetTriggerUnit())
endfunction

function InitTrig_Combo_Disappear takes nothing returns nothing
    set gg_trg_Combo_Disappear = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Combo_Disappear, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Combo_Disappear, Condition(function Trig_Combo_Disappear_Conditions))
    call TriggerAddAction(gg_trg_Combo_Disappear, function Trig_Combo_Disappear_Actions)
endfunction