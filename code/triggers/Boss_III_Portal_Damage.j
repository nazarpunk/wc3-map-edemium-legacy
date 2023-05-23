function Trig_Boss_III_Portal_Damage_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x41303545 and GetUnitTypeId(GetTriggerUnit()) == 0x68303039
endfunction

function Trig_Boss_III_Portal_Damage_Actions takes nothing returns nothing
    call TriggerSleepAction(0.70)
    set udg_AbilityPower = (100.00 * I2R(udg_Difficulty))
    call UnitDamageTargetBJ(udg_Arct, udg_EM_BossUnit, udg_AbilityPower, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
endfunction

function InitTrig_Boss_III_Portal_Damage takes nothing returns nothing
    set gg_trg_Boss_III_Portal_Damage = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Boss_III_Portal_Damage, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Boss_III_Portal_Damage, Condition(function Trig_Boss_III_Portal_Damage_Conditions))
    call TriggerAddAction(gg_trg_Boss_III_Portal_Damage, function Trig_Boss_III_Portal_Damage_Actions)
endfunction
