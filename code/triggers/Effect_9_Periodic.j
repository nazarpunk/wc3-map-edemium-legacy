
function Trig_Effect_9_Periodic_Func001Func006Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Effect_9_Periodic_Func001Func006A takes nothing returns nothing
    if(Trig_Effect_9_Periodic_Func001Func006Func001C())then
        call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        call CreateTextTagUnitBJ(I2S(R2I(udg_AbilityPower)), GetEnumUnit(), 0, 8.00, 100.00, 0.00, 0.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.70)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.40)
    else
    endif
endfunction
function Trig_Effect_9_Periodic_Func001A takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetEnumUnit())
    set udg_UnitGroup = GetUnitsInRangeOfLocAll(250.00, udg_Point)
    call RemoveLocation(udg_Point)
    set udg_AbilityPower = (I2R(udg_CO_Power) + (I2R(udg_CO_Combo) + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true))))
    set udg_AbilityPower = (udg_AbilityPower / 2.00)
    call ForGroupBJ(udg_UnitGroup, function Trig_Effect_9_Periodic_Func001Func006A)
    call DestroyGroup(udg_UnitGroup)
endfunction
function Trig_Effect_9_Periodic_Actions takes nothing returns nothing
    call ForGroupBJ(udg_AS_Effect9Group, function Trig_Effect_9_Periodic_Func001A)
endfunction
function InitTrig_Effect_9_Periodic takes nothing returns nothing
    set gg_trg_Effect_9_Periodic = CreateTrigger()
    call DisableTrigger(gg_trg_Effect_9_Periodic)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Effect_9_Periodic, 1.00)
    call TriggerAddAction(gg_trg_Effect_9_Periodic, function Trig_Effect_9_Periodic_Actions)
endfunction