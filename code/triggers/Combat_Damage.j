function Trig_Combat_Damage_Actions takes nothing returns nothing
    if udg_CO_Damage then
        set udg_CO_Damage = false
        set udg_CO_Power = (GetHeroStatBJ(bj_HEROSTAT_AGI, ArctUnit, true) + GetHeroStatBJ(bj_HEROSTAT_STR, ArctUnit, true) + GetHeroStatBJ(bj_HEROSTAT_INT, ArctUnit, true))
        set udg_CO_Power = (udg_CO_Power / 3)
        set udg_AbilityPower = (I2R(udg_CO_Power) + I2R(udg_CO_Combo))
        call UnitDamageTargetBJ(ArctUnit, udg_AS_EnemyTarget, udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        set udg_AbilityPower = (udg_AbilityPower / 2.00)
        call SetUnitLifeBJ(ArctUnit, (GetUnitStateSwap(UNIT_STATE_LIFE, ArctUnit) + udg_AbilityPower))
    endif
endfunction

function InitTrig_Combat_Damage takes nothing returns nothing
    set gg_trg_Combat_Damage = CreateTrigger()
    call TriggerAddAction(gg_trg_Combat_Damage, function Trig_Combat_Damage_Actions)
endfunction
