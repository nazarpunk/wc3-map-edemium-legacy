function Trig_Scroll_Use_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x41303648 or GetSpellAbilityId() == 0x41303645 or GetSpellAbilityId() == 0x41303646
endfunction

function Trig_Scroll_Use_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ(GetSpellAbilityId(), GetTriggerUnit())
endfunction

function InitTrig_Scroll_Use takes nothing returns nothing
    set gg_trg_Scroll_Use = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Scroll_Use, ArctUnit, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Scroll_Use, Condition(function Trig_Scroll_Use_Conditions))
    call TriggerAddAction(gg_trg_Scroll_Use, function Trig_Scroll_Use_Actions)
endfunction