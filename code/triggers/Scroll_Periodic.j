function Trig_Scroll_Periodic_Func017A takes nothing returns nothing
    if GetOwningPlayer(GetEnumUnit()) == Player(11) then
        set udg_AbilityPower = ((I2R(udg_CO_Power) * 1.00) + I2R(udg_CO_Combo))
        set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, ArctUnit, true)))
        set udg_AbilityPower = (udg_AbilityPower * 3.00)
        call UnitDamageTargetBJ(ArctUnit, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        set udg_CO_Point = GetUnitLoc(GetEnumUnit())
        call AddSpecialEffectLocBJ(udg_CO_Point, "war3mapImported\\Blue Lightning.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call RemoveLocation(udg_CO_Point)
    endif
endfunction

function Trig_Scroll_Periodic_Actions takes nothing returns nothing
    set udg_CO_Point = GetUnitLoc(ArctUnit)
    set udg_CO_UnitGroup = GetUnitsInRangeOfLocAll(400.00, udg_CO_Point)
    call RemoveLocation(udg_CO_Point)
    set udg_CO_UnitGroup2 = GetUnitsOfPlayerAll(Player(0))
    call GroupRemoveGroup(udg_CO_UnitGroup2, udg_CO_UnitGroup)
    call DestroyGroup(udg_CO_UnitGroup2)
    set udg_CO_UnitGroup2 = GetUnitsOfPlayerAll(Player(1))
    call GroupRemoveGroup(udg_CO_UnitGroup2, udg_CO_UnitGroup)
    call DestroyGroup(udg_CO_UnitGroup2)
    set udg_CO_UnitGroup2 = GetUnitsOfPlayerAll(Player(9))
    call GroupRemoveGroup(udg_CO_UnitGroup2, udg_CO_UnitGroup)
    call DestroyGroup(udg_CO_UnitGroup2)
    call ForGroupBJ(GetRandomSubGroup(1, udg_CO_UnitGroup), function Trig_Scroll_Periodic_Func017A)
    call GroupClear(udg_CO_UnitGroup)
    call DestroyGroup(udg_CO_UnitGroup)
endfunction

function InitTrig_Scroll_Periodic takes nothing returns nothing
    set gg_trg_Scroll_Periodic = CreateTrigger()
    call DisableTrigger(gg_trg_Scroll_Periodic)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Scroll_Periodic, 3.00)
    call TriggerAddAction(gg_trg_Scroll_Periodic, function Trig_Scroll_Periodic_Actions)
endfunction
