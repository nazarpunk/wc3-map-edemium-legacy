
function Trig_Scroll_Use_Func001C takes nothing returns boolean
    if((GetSpellAbilityId() == 0x41303648))then
        return true
    endif
    if((GetSpellAbilityId() == 0x41303645))then
        return true
    endif
    if((GetSpellAbilityId() == 0x41303646))then
        return true
    endif
    return false
endfunction
function Trig_Scroll_Use_Conditions takes nothing returns boolean
    if(not Trig_Scroll_Use_Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Scroll_Use_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ(GetSpellAbilityId(), GetTriggerUnit())
endfunction
function InitTrig_Scroll_Use takes nothing returns nothing
    set gg_trg_Scroll_Use = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Scroll_Use, gg_unit_H000_0004, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Scroll_Use, Condition(function Trig_Scroll_Use_Conditions))
    call TriggerAddAction(gg_trg_Scroll_Use, function Trig_Scroll_Use_Actions)
endfunction