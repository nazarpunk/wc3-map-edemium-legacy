
function Trig_Effect_8_Loop_Func001Func001Func016C takes nothing returns boolean
    if(not(udg_BE_MaxIndex == 0))then
        return false
    endif
    return true
endfunction

function Trig_Effect_8_Loop_Func001Func001Func030Func001C takes nothing returns boolean
    if(not(IsUnitAlly(udg_BE_Target[udg_BE_TempIndex], udg_BE_Player[udg_BE_TempIndex]) == true))then
        return false
    endif
    return true
endfunction

function Trig_Effect_8_Loop_Func001Func001Func030Func004Func002Func005C takes nothing returns boolean
    if((GetOwningPlayer(udg_BE_PickedUnits) == Player(0)))then
        return true
    endif
    if((GetOwningPlayer(udg_BE_PickedUnits) == Player(11)))then
        return true
    endif
    return false
endfunction

function Trig_Effect_8_Loop_Func001Func001Func030Func004Func002C takes nothing returns boolean
    if(not(IsUnitType(udg_BE_PickedUnits, UNIT_TYPE_STRUCTURE) == false))then
        return false
    endif
    if(not(IsUnitAliveBJ(udg_BE_PickedUnits) == true))then
        return false
    endif
    if(not(udg_BE_PickedUnits != udg_BE_Target[udg_BE_TempIndex]))then
        return false
    endif
    if(not Trig_Effect_8_Loop_Func001Func001Func030Func004Func002Func005C())then
        return false
    endif
    return true
endfunction

function Trig_Effect_8_Loop_Func001Func001Func030Func004A takes nothing returns nothing
    set udg_BE_PickedUnits = GetEnumUnit()
    if(Trig_Effect_8_Loop_Func001Func001Func030Func004Func002C())then
    else
        call GroupRemoveUnitSimple(udg_BE_PickedUnits, udg_BE_Group)
    endif
endfunction

function Trig_Effect_8_Loop_Func001Func001Func030Func006C takes nothing returns boolean
    if(not(CountUnitsInGroup(udg_BE_Group) == 0))then
        return false
    endif
    return true
endfunction

function Trig_Effect_8_Loop_Func001Func001Func030C takes nothing returns boolean
    if(not(udg_BE_Distance[udg_BE_TempIndex] <= 50.00))then
        return false
    endif
    return true
endfunction

function Trig_Effect_8_Loop_Func001Func001C takes nothing returns boolean
    if(not(udg_BE_CurrentBounces[udg_BE_TempIndex] <= udg_BE_Bounces[udg_BE_AbilityIndex[udg_BE_TempIndex]]))then
        return false
    endif
    return true
endfunction

function Trig_Effect_8_Loop_Actions takes nothing returns nothing
    set udg_BE_TempIndex = 1
    loop
        exitwhen udg_BE_TempIndex > udg_BE_MaxIndex
        if(Trig_Effect_8_Loop_Func001Func001C())then
            set udg_BE_TempPoint3 = GetUnitLoc(udg_BE_Target[udg_BE_TempIndex])
            set udg_BE_TempPoint2 = GetUnitLoc(udg_BE_Dummy[udg_BE_TempIndex])
            set udg_BE_Distance[udg_BE_TempIndex] = DistanceBetweenPoints(udg_BE_TempPoint3, udg_BE_TempPoint2)
            set udg_BE_DistanceTravelled[udg_BE_TempIndex] = (udg_BE_DistanceTravelled[udg_BE_TempIndex] + udg_BE_Speed[udg_BE_AbilityIndex[udg_BE_TempIndex]])
            set udg_BE_TotalDistance = (udg_BE_DistanceTravelled[udg_BE_TempIndex] + udg_BE_Distance[udg_BE_TempIndex])
            set udg_BE_Angle[udg_BE_TempIndex] = AngleBetweenPoints(udg_BE_TempPoint2, udg_BE_TempPoint3)
            set udg_BE_TempPoint = PolarProjectionBJ(udg_BE_TempPoint2, udg_BE_Speed[udg_BE_AbilityIndex[udg_BE_TempIndex]], udg_BE_Angle[udg_BE_TempIndex])
            call SetUnitFlyHeightBJ(udg_BE_Dummy[udg_BE_TempIndex], ((4.00 * udg_BE_Height[udg_BE_AbilityIndex[udg_BE_TempIndex]]) * (udg_BE_DistanceTravelled[udg_BE_TempIndex] * ((udg_BE_TotalDistance - udg_BE_DistanceTravelled[udg_BE_TempIndex]) / (udg_BE_TotalDistance * udg_BE_TotalDistance)))), 0.00)
            call SetUnitPositionLocFacingBJ(udg_BE_Dummy[udg_BE_TempIndex], udg_BE_TempPoint, udg_BE_Angle[udg_BE_TempIndex])
            if(Trig_Effect_8_Loop_Func001Func001Func030C())then
                if(Trig_Effect_8_Loop_Func001Func001Func030Func001C())then
                    call SetUnitLifeBJ(udg_BE_Target[udg_BE_TempIndex], (GetUnitStateSwap(UNIT_STATE_LIFE, udg_BE_Target[udg_BE_TempIndex]) + udg_BE_Heal[udg_BE_TempIndex]))
                    call AddSpecialEffectLocBJ(udg_BE_TempPoint3, udg_BE_PosSpecialEffect)
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                    call CreateTextTagUnitBJ(("+" + I2S(R2I(udg_BE_Heal[udg_BE_TempIndex]))), udg_BE_Target[udg_BE_TempIndex], 0, 8.00, 0.00, 100.00, 0.00, 0)
                    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
                    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
                    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.60)
                else
                    call UnitDamageTargetBJ(udg_BE_Caster[udg_BE_TempIndex], udg_BE_Target[udg_BE_TempIndex], udg_BE_Damage[udg_BE_TempIndex], udg_BE_AttackType, udg_BE_DamageType)
                    call AddSpecialEffectLocBJ(udg_BE_TempPoint3, udg_BE_PosSpecialEffect)
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                    call CreateTextTagUnitBJ(I2S(R2I(udg_BE_Damage[udg_BE_TempIndex])), udg_BE_Target[udg_BE_TempIndex], 0, 8.00, 100.00, 0.00, 0.00, 0)
                    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
                    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.70)
                    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.40)
                endif
                set udg_BE_Group = GetUnitsInRangeOfLocAll(udg_BE_SearchAoE[udg_BE_AbilityIndex[udg_BE_TempIndex]], udg_BE_TempPoint2)
                call ForGroupBJ(udg_BE_Group, function Trig_Effect_8_Loop_Func001Func001Func030Func004A)
                if(Trig_Effect_8_Loop_Func001Func001Func030Func006C())then
                    set udg_BE_CurrentBounces[udg_BE_TempIndex] = udg_BE_Bounces[udg_BE_AbilityIndex[udg_BE_TempIndex]]
                else
                endif
                set udg_BE_Target[udg_BE_TempIndex] = GroupPickRandomUnit(udg_BE_Group)
                call SetUnitScalePercent(udg_BE_Dummy[udg_BE_TempIndex], (100.00 + udg_BE_SizeIncrement[udg_BE_TempIndex]), (100.00 + udg_BE_SizeIncrement[udg_BE_TempIndex]), (100.00 + udg_BE_SizeIncrement[udg_BE_TempIndex]))
                set udg_BE_Damage[udg_BE_TempIndex] = (udg_BE_Damage[udg_BE_TempIndex] + udg_BE_DamageAddition[udg_BE_AbilityIndex[udg_BE_TempIndex]])
                set udg_BE_Heal[udg_BE_TempIndex] = (udg_BE_Heal[udg_BE_TempIndex] + udg_BE_HealAddition[udg_BE_AbilityIndex[udg_BE_TempIndex]])
                set udg_BE_CurrentBounces[udg_BE_TempIndex] = (udg_BE_CurrentBounces[udg_BE_TempIndex] + 1)
                set udg_BE_SizeIncrement[udg_BE_TempIndex] = (udg_BE_SizeIncrement[udg_BE_TempIndex] + udg_BE_CSizeIncrement)
                set udg_BE_DistanceTravelled[udg_BE_TempIndex] = 0.00
                call DestroyGroup(udg_BE_Group)
            else
            endif
            call RemoveLocation(udg_BE_TempPoint)
            call RemoveLocation(udg_BE_TempPoint2)
            call RemoveLocation(udg_BE_TempPoint3)
        else
            call DestroyEffectBJ(udg_BE_FX[udg_BE_TempIndex])
            set udg_BE_FX[udg_BE_TempIndex] = udg_BE_FX[udg_BE_MaxIndex]
            call KillUnit(udg_BE_Dummy[udg_BE_TempIndex])
            set udg_BE_Dummy[udg_BE_TempIndex] = udg_BE_Dummy[udg_BE_MaxIndex]
            set udg_BE_Target[udg_BE_TempIndex] = udg_BE_Target[udg_BE_MaxIndex]
            set udg_BE_Caster[udg_BE_TempIndex] = udg_BE_Caster[udg_BE_MaxIndex]
            set udg_BE_Player[udg_BE_TempIndex] = udg_BE_Player[udg_BE_MaxIndex]
            set udg_BE_CurrentBounces[udg_BE_TempIndex] = udg_BE_CurrentBounces[udg_BE_MaxIndex]
            set udg_BE_Angle[udg_BE_TempIndex] = udg_BE_Angle[udg_BE_MaxIndex]
            set udg_BE_Distance[udg_BE_TempIndex] = udg_BE_Distance[udg_BE_MaxIndex]
            set udg_BE_DistanceTravelled[udg_BE_TempIndex] = udg_BE_DistanceTravelled[udg_BE_MaxIndex]
            set udg_BE_SizeIncrement[udg_BE_TempIndex] = udg_BE_SizeIncrement[udg_BE_MaxIndex]
            set udg_BE_TempIndex = (udg_BE_TempIndex - 1)
            set udg_BE_MaxIndex = (udg_BE_MaxIndex - 1)
            if(Trig_Effect_8_Loop_Func001Func001Func016C())then
                call DisableTrigger(gg_trg_Effect_8_Loop)
            else
            endif
        endif
        set udg_BE_TempIndex = udg_BE_TempIndex + 1
    endloop
endfunction

function InitTrig_Effect_8_Loop takes nothing returns nothing
    set gg_trg_Effect_8_Loop = CreateTrigger()
    call DisableTrigger(gg_trg_Effect_8_Loop)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Effect_8_Loop, 0.03)
    call TriggerAddAction(gg_trg_Effect_8_Loop, function Trig_Effect_8_Loop_Actions)
endfunction
