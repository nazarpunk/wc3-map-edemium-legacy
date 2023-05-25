function Trig_Knockback_System_Func001Func001Func001Func005A takes nothing returns nothing
    if GetDestructableMaxLife(GetEnumDestructable()) == 10 or GetDestructableTypeId(GetEnumDestructable()) == 0x4230304A then
        set udg_KB_Bool = false
    endif
endfunction

function Trig_Knockback_System_Actions takes nothing returns nothing
    set udg_KB = 1
    loop
        exitwhen udg_KB > udg_KB_Times
        if udg_KB_Off[udg_KB] then
            if udg_KB_Distance[udg_KB] <= 0.00 then
                call PauseUnitBJ(false, udg_KB_Target[udg_KB])
                set udg_KB_Off[udg_KB] = false
                if udg_KB < udg_KB_Times then
                    set udg_KB_Off[udg_KB] = udg_KB_Off[udg_KB_Times]
                    set udg_KB_Target[udg_KB] = udg_KB_Target[udg_KB_Times]
                    set udg_KB_Distance[udg_KB] = udg_KB_Distance[udg_KB_Times]
                    set udg_KB_Speed[udg_KB] = udg_KB_Speed[udg_KB_Times]
                    set udg_KB_Spam[udg_KB] = udg_KB_Spam[udg_KB_Times]
                    set udg_KB_Angle[udg_KB] = udg_KB_Angle[udg_KB_Times]
                endif
                set udg_KB_Times = (udg_KB_Times - 1)
                set udg_KB = (udg_KB - 1)
                set udg_KB_Skip = (udg_KB_Skip - 1)
                if udg_KB_Times == 0 then
                    call DisableTrigger(GetTriggeringTrigger())
                endif
            else
                set udg_KB_Point[2] = GetUnitLoc(udg_KB_Target[udg_KB])
                set udg_KB_Point[3] = PolarProjectionBJ(udg_KB_Point[2], udg_KB_Speed[udg_KB], udg_KB_Angle[udg_KB])
                set udg_KB_Bool = true
                call EnumDestructablesInCircleBJ(250.00, udg_KB_Point[3], function Trig_Knockback_System_Func001Func001Func001Func005A)
                if udg_KB_Bool then
                    call SetUnitX(udg_KB_Target[udg_KB], GetLocationX(udg_KB_Point[3]))
                    call SetUnitY(udg_KB_Target[udg_KB], GetLocationY(udg_KB_Point[3]))
                else
                    set udg_KB_Distance[udg_KB] = 0.00
                endif
                set udg_KB_Distance[udg_KB] = (udg_KB_Distance[udg_KB] - udg_KB_Speed[udg_KB])
                set udg_KB_Spam[udg_KB] = (udg_KB_Spam[udg_KB] + 1)
                if udg_KB_Spam[udg_KB] >= 5 then
                    set udg_KB_Spam[udg_KB] = 0
                    call AddSpecialEffectLocBJ(udg_KB_Point[3], "Abilities\\Spells\\Human\\FlakCannons\\FlakTarget.mdl")
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                endif
                call RemoveLocation(udg_KB_Point[2])
                call RemoveLocation(udg_KB_Point[3])
            endif
        endif
        set udg_KB = udg_KB + 1
    endloop
endfunction

function InitTrig_Knockback_System takes nothing returns nothing
    set gg_trg_Knockback_System = CreateTrigger()
    call DisableTrigger(gg_trg_Knockback_System)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Knockback_System, 0.02)
    call TriggerAddAction(gg_trg_Knockback_System, function Trig_Knockback_System_Actions)
endfunction
