
function Trig_Orbs_System_1_Func001C takes nothing returns boolean
    if(not(udg_JD_Integers[1] == 0))then
        return false
    endif
    return true
endfunction
function Trig_Orbs_System_1_Actions takes nothing returns nothing
    if(Trig_Orbs_System_1_Func001C())then
        call EnableTrigger(gg_trg_Orbs_System_2)
    else
    endif
    set udg_JD_Integers[1] = (udg_JD_Integers[1] + 1)
    set udg_JD_Integers[2] = (udg_JD_Integers[2] + 1)
    set udg_JD_TempPoint[1] = GetUnitLoc(udg_JDA_Unit)
    set udg_JD_Distances[udg_JD_Integers[2]] = DistanceBetweenPoints(udg_JD_TempPoint[1], udg_JDA_TargetPoint)
    set udg_JD_ReachedDistance[udg_JD_Integers[2]] = 0.00
    set udg_JD_SpeedUnits[udg_JD_Integers[2]] = udg_JDA_Speed
    set udg_JD_Unit[udg_JD_Integers[2]] = udg_JDA_Unit
    set udg_JD_Angle[udg_JD_Integers[2]] = AngleBetweenPoints(udg_JD_TempPoint[1], udg_JDA_TargetPoint)
    set udg_JD_Animations[udg_JD_Integers[2]] = udg_JDA_Animation
    set udg_JD_HighSettings[udg_JD_Integers[2]] = (udg_JDA_JumpHigh_Distance * udg_JD_Distances[udg_JD_Integers[2]])
    call SetUnitPathing(udg_JDA_Unit, true)
    call SetUnitTimeScalePercent(udg_JDA_Unit, (udg_JDA_AnimationSpeed * 100.00))
    call SetUnitAnimation(udg_JDA_Unit, udg_JDA_Animation)
    call GroupAddUnitSimple(udg_JDA_Unit, udg_JD_Group)
    call UnitAddAbilityBJ(0x41726176, udg_JDA_Unit)
    call UnitRemoveAbilityBJ(0x41726176, udg_JDA_Unit)
    call RemoveLocation(udg_JD_TempPoint[1])
    call RemoveLocation(udg_JDA_TargetPoint)
endfunction
function InitTrig_Orbs_System_1 takes nothing returns nothing
    set gg_trg_Orbs_System_1 = CreateTrigger()
    call TriggerAddAction(gg_trg_Orbs_System_1, function Trig_Orbs_System_1_Actions)
endfunction