function Trig_Artefactorium_Damage_Conditions takes nothing returns boolean
    return udg_DamageEventTarget == ArctUnit or udg_DamageEventTarget == gg_unit_h007_0065
endfunction

function Trig_Artefactorium_Damage_Actions takes nothing returns nothing
    set udg_DamageEventAmount = 0.00
endfunction

function InitTrig_Artefactorium_Damage takes nothing returns nothing
    set gg_trg_Artefactorium_Damage = CreateTrigger()
    // damage register
    call TriggerAddCondition(gg_trg_Artefactorium_Damage, Condition(function Trig_Artefactorium_Damage_Conditions))
    call TriggerAddAction(gg_trg_Artefactorium_Damage, function Trig_Artefactorium_Damage_Actions)
endfunction
