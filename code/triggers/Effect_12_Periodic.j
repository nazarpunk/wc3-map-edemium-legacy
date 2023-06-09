function Trig_Effect_12_Periodic_Func002Func007A takes nothing returns nothing
    set udg_Point2 = GetUnitLoc(GetEnumUnit())
    if GetOwningPlayer(GetEnumUnit()) == Player(11) and GetTerrainTypeBJ(udg_Point2) == 0x446C7663 then
        set udg_AbilityPower = (I2R(udg_CO_Power) + (I2R(udg_CO_Combo) + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, ArctUnit, true))))
        call UnitDamageTargetBJ(ArctUnit, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        call CreateTextTagUnitBJ(I2S(R2I(udg_AbilityPower)), GetEnumUnit(), 0, 8.00, 100.00, 0.00, 0.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.70)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.40)
        call AddSpecialEffectTargetUnitBJ("chest", GetEnumUnit(), "Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl")
        call DestroyEffect(GetLastCreatedEffectBJ())
    endif
    call RemoveLocation(udg_Point2)
endfunction

function Trig_Effect_12_Periodic_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(ArctUnit)
    if GetTerrainTypeBJ(udg_Point) == 0x446C7663 then
        call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
        call UnitAddAbilityBJ(0x4130334C, GetLastCreatedUnit())
        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
        call SetUnitAbilityLevelSwapped(0x4130334C, GetLastCreatedUnit(), udg_AS_AbilityLVL[12])
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "innerfire", ArctUnit)
        set udg_UnitGroup = GetUnitsInRangeOfLocAll(250.00, udg_Point)
        call ForGroupBJ(udg_UnitGroup, function Trig_Effect_12_Periodic_Func002Func007A)
        call DestroyGroup(udg_UnitGroup)
    endif
    call RemoveLocation(udg_Point)
endfunction

function InitTrig_Effect_12_Periodic takes nothing returns nothing
    set gg_trg_Effect_12_Periodic = CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_Effect_12_Periodic, 1.00)
    call TriggerAddAction(gg_trg_Effect_12_Periodic, function Trig_Effect_12_Periodic_Actions)
endfunction
