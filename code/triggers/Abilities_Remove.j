function Trig_Abilities_Remove_Actions takes nothing returns nothing
    call AddSpecialEffectTargetUnitBJ("origin", udg_Target, "Abilities\\Spells\\Undead\\ReplenishMana\\ReplenishManaCasterOverhead.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call UnitRemoveAbilityBJ(0x4130364A, udg_Target)
    call UnitRemoveAbilityBJ(0x4130364B, udg_Target)
    call UnitRemoveAbilityBJ(0x4130364C, udg_Target)
    call UnitRemoveAbilityBJ(0x4130364D, udg_Target)
    call UnitAddAbilityBJ(0x41303649, udg_Target)
endfunction

function InitTrig_Abilities_Remove takes nothing returns nothing
    set gg_trg_Abilities_Remove = CreateTrigger()
    call TriggerAddAction(gg_trg_Abilities_Remove, function Trig_Abilities_Remove_Actions)
endfunction
