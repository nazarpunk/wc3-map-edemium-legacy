function Trig_Creep_Fallen_End_Cast_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x41303231
endfunction

function Trig_Creep_Fallen_End_Cast_Actions takes nothing returns nothing
    call GroupRemoveUnitSimple(GetTriggerUnit(), udg_FallenGroup)
endfunction

function InitTrig_Creep_Fallen_End_Cast takes nothing returns nothing
    set gg_trg_Creep_Fallen_End_Cast = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Creep_Fallen_End_Cast, EVENT_PLAYER_UNIT_SPELL_FINISH)
    call TriggerAddCondition(gg_trg_Creep_Fallen_End_Cast, Condition(function Trig_Creep_Fallen_End_Cast_Conditions))
    call TriggerAddAction(gg_trg_Creep_Fallen_End_Cast, function Trig_Creep_Fallen_End_Cast_Actions)
endfunction