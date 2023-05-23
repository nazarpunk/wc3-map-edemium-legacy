
function Trig_Effect_6_Periodic_Func004Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction

function Trig_Effect_6_Periodic_Func004A takes nothing returns nothing
    if(Trig_Effect_6_Periodic_Func004Func001C())then
        set udg_AbilityPower = (I2R(udg_CO_Power) + I2R(udg_CO_Combo))
        set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))
        call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        call AddSpecialEffectTargetUnitBJ("chest", GetEnumUnit(), "Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
    endif
endfunction

function Trig_Effect_6_Periodic_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(udg_Arct)
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
