function Trig_Orbs_System_2_Actions takes nothing returns nothing
    set udg_JD_Integers[3] = 1
    loop
        exitwhen udg_JD_Integers[3] > udg_JD_Integers[2]
        if IsUnitInGroup(udg_JD_Unit[udg_JD_Integers[3]], udg_JD_Group) then
            if udg_JD_ReachedDistance[udg_JD_Integers[3]] < udg_JD_Distances[udg_JD_Integers[3]] then
                call QueueUnitAnimationBJ(udg_JD_Unit[udg_JD_Integers[3]], udg_JD_Animations[udg_JD_Integers[3]])
                set udg_JD_TempPoint[1] = GetUnitLoc(udg_JD_Unit[udg_JD_Integers[3]])
                set udg_JD_TempPoint[2] = PolarProjectionBJ(udg_JD_TempPoint[1], udg_JD_SpeedUnits[udg_JD_Integers[3]], udg_JD_Angle[udg_JD_Integers[3]])
                call SetUnitPositionLoc(udg_JD_Unit[udg_JD_Integers[3]], udg_JD_TempPoint[2])
                set udg_JD_ReachedDistance[udg_JD_Integers[3]] = (udg_JD_ReachedDistance[udg_JD_Integers[3]] + udg_JD_SpeedUnits[udg_JD_Integers[3]])
                if GetRandomInt(1, 5) == 1 then
                    call AddSpecialEffectTargetUnitBJ("chest", udg_JD_Unit[udg_JD_Integers[3]], udg_JD_Effect[udg_JD_Integers[3]])
                    call DestroyEffect(GetLastCreatedEffectBJ())
                endif
                set udg_JD_RealTimer[udg_JD_Integers[3]] = (udg_JD_RealTimer[udg_JD_Integers[3]] + (180.00 / (udg_JD_Distances[udg_JD_Integers[3]] / udg_JD_SpeedUnits[udg_JD_Integers[3]])))
                set udg_JD_JumpHigh[udg_JD_Integers[3]] = (SinBJ(udg_JD_RealTimer[udg_JD_Integers[3]]) * udg_JD_HighSettings[udg_JD_Integers[3]])
                call SetUnitFlyHeightBJ(udg_JD_Unit[udg_JD_Integers[3]], udg_JD_JumpHigh[udg_JD_Integers[3]], 1000000000.00)
                call RemoveLocation(udg_JD_TempPoint[1])
                call RemoveLocation(udg_JD_TempPoint[2])
            else
                call SetUnitPathing(udg_JD_Unit[udg_JD_Integers[3]], true)
                call GroupRemoveUnitSimple(udg_JD_Unit[udg_JD_Integers[3]], udg_JD_Group)
                call SetUnitTimeScalePercent(udg_JD_Unit[udg_JD_Integers[3]], 100.00)
                call ResetUnitAnimation(udg_JD_Unit[udg_JD_Integers[3]])
                set udg_JD_RealTimer[udg_JD_Integers[3]] = 0.00
                set udg_JD_Integers[1] = (udg_JD_Integers[1] - 1)
                set udg_Point = GetUnitLoc(udg_JD_Unit[udg_JD_Integers[3]])
                if udg_LightOrbs[3] > 0 then
                    set udg_LightOrbs[3] = (udg_LightOrbs[3] - 1)
                    call CreateItemLoc(0x49303059, udg_Point)
                else
                    if udg_LightOrbs[2] > 0 then
                        set udg_LightOrbs[2] = (udg_LightOrbs[2] - 1)
                        call CreateItemLoc(0x49303058, udg_Point)
                    else
                        if udg_LightOrbs[1] > 0 then
                            set udg_LightOrbs[1] = (udg_LightOrbs[1] - 1)
                            call CreateItemLoc(0x72686532, udg_Point)
                        endif
                    endif
                endif
                call RemoveUnit(udg_JD_Unit[udg_JD_Integers[3]])
                call RemoveLocation(udg_Point)
                if udg_JD_Integers[1] == 0 then
                    set udg_JD_Integers[2] = 0
                    call DisableTrigger(GetTriggeringTrigger())
                endif
            endif
        endif
        set udg_JD_Integers[3] = udg_JD_Integers[3] + 1
    endloop
endfunction

function InitTrig_Orbs_System_2 takes nothing returns nothing
    set gg_trg_Orbs_System_2 = CreateTrigger()
    call DisableTrigger(gg_trg_Orbs_System_2)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Orbs_System_2, 0.02)
    call TriggerAddAction(gg_trg_Orbs_System_2, function Trig_Orbs_System_2_Actions)
endfunction