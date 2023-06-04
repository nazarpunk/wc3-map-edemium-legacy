function Trig_Effect_6_Periodic_Func004A takes nothing returns nothing
    if GetOwningPlayer(GetEnumUnit()) == Player(11) then
        set udg_AbilityPower = (I2R(udg_CO_Power) + I2R(udg_CO_Combo))
        set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, ArctUnit, true)))
        call UnitDamageTargetBJ(ArctUnit, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        call AddSpecialEffectTargetUnitBJ("chest", GetEnumUnit(), "Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl")
        call DestroyEffect(GetLastCreatedEffectBJ())
    endif
endfunction

function Trig_Effect_6_Periodic_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(ArctUnit)
    set udg_UnitGroup = GetUnitsInRangeOfLocAll(300.00, udg_Point)
    call RemoveLocation(udg_Point)
    call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Effect_6_Periodic_Func004A)
    call DestroyGroup(udg_UnitGroup)
endfunction

function InitTrig_Effect_6_Periodic takes nothing returns nothing
    set gg_trg_Effect_6_Periodic = CreateTrigger()
    call DisableTrigger(gg_trg_Effect_6_Periodic)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Effect_6_Periodic, 5.00)
    call TriggerAddAction(gg_trg_Effect_6_Periodic, function Trig_Effect_6_Periodic_Actions)
endfunction