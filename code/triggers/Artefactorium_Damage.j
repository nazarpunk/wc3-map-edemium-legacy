
function Trig_Artefactorium_Damage_Func001C takes nothing returns boolean
    if((udg_DamageEventTarget == gg_unit_H000_0004))then
        return true
    endif
    if((udg_DamageEventTarget == gg_unit_h007_0065))then
        return true
    endif
    return false
endfunction

function Trig_Artefactorium_Damage_Conditions takes nothing returns boolean
    if(not Trig_Artefactorium_Damage_Func001C())then
        return false
    endif
    return true
endfunction

function Trig_Artefactorium_Damage_Actions takes nothing returns nothing
    set udg_DamageEventAmount = 0.00
endfunction

function InitTrig_Artefactorium_Damage takes nothing returns nothing
    set gg_trg_Artefactorium_Damage = CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Artefactorium_Damage, "udg_DamageModifierEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Artefactorium_Damage, Condition(function Trig_Artefactorium_Damage_Conditions))
    call TriggerAddAction(gg_trg_Artefactorium_Damage, function Trig_Artefactorium_Damage_Actions)
endfunction
