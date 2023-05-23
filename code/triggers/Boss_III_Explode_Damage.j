function Trig_Boss_III_Explode_Damage_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x41303635
endfunction

function Trig_Boss_III_Explode_Damage_Func002A takes nothing returns nothing
    if GetOwningPlayer(GetEnumUnit()) == Player(0) or GetOwningPlayer(GetEnumUnit()) == Player(1) or GetOwningPlayer(GetEnumUnit()) == Player(11) then
        set udg_AbilityPower = (100.00 * I2R(udg_Difficulty))
        call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
    endif
endfunction

function Trig_Boss_III_Explode_Damage_Actions takes nothing returns nothing
    set udg_UnitGroup = GetUnitsInRangeOfLocAll(150.00, GetUnitLoc(GetTriggerUnit()))
    call ForGroupBJ(udg_UnitGroup, function Trig_Boss_III_Explode_Damage_Func002A)
    call DestroyGroup(udg_UnitGroup)
endfunction

function InitTrig_Boss_III_Explode_Damage takes nothing returns nothing
    set gg_trg_Boss_III_Explode_Damage = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Boss_III_Explode_Damage, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Boss_III_Explode_Damage, Condition(function Trig_Boss_III_Explode_Damage_Conditions))
    call TriggerAddAction(gg_trg_Boss_III_Explode_Damage, function Trig_Boss_III_Explode_Damage_Actions)
endfunction
