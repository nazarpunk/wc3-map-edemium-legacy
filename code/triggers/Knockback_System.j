
function Trig_Knockback_System_Func001Func001Func001Func005Func001Func001C takes nothing returns boolean
    if((GetDestructableMaxLife(GetEnumDestructable()) == 10))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x4230304A))then
        return true
    endif
    return false
endfunction

function Trig_Knockback_System_Func001Func001Func001Func005Func001C takes nothing returns boolean
    if(not Trig_Knockback_System_Func001Func001Func001Func005Func001Func001C())then
        return false
    endif
    return true
endfunction

function Trig_Knockback_System_Func001Func001Func001Func005A takes nothing returns nothing
    if(Trig_Knockback_System_Func001Func001Func001Func005Func001C())then
        set udg_KB_Bool = false
    endif
endfunction

function Trig_Knockback_System_Func001Func001Func001Func006C takes nothing returns boolean
    if(not(udg_KB_Bool == true))then
        return false
    endif
    return true
endfunction

function Trig_Knockback_System_Func001Func001Func001Func009C takes nothing returns boolean
    if(not(udg_KB_Spam[udg_KB] >= 5))then
        return false
    endif
    return true
endfunction

function Trig_Knockback_System_Func001Func001Func001Func014C takes nothing returns boolean
    if(not(udg_KB < udg_KB_Times))then
        return false
    endif
    return true
endfunction

function Trig_Knockback_System_Func001Func001Func001Func018C takes nothing returns boolean
    if(not(udg_KB_Times == 0))then
        return false
    endif
    return true
endfunction

function Trig_Knockback_System_Func001Func001Func001C takes nothing returns boolean
    if(not(udg_KB_Distance[udg_KB] <= 0.00))then
        return false
    endif
    return true
endfunction

function Trig_Knockback_System_Func001Func001C takes nothing returns boolean
    if(not(udg_KB_Off[udg_KB] == true))then
        return false
    endif
    return true
endfunction

function Trig_Knockback_System_Actions takes nothing returns nothing
    set udg_KB = 1
    loop
        exitwhen udg_KB > udg_KB_Times
        if(Trig_Knockback_System_Func001Func001C())then
            if(Trig_Knockback_System_Func001Func001Func001C())then
                call PauseUnitBJ(false, udg_KB_Target[udg_KB])
                set udg_KB_Off[udg_KB] = false
                if(Trig_Knockback_System_Func001Func001Func001Func014C())then
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
                if(Trig_Knockback_System_Func001Func001Func001Func018C())then
                    call DisableTrigger(GetTriggeringTrigger())
                endif
            else
                set udg_KB_Point[2] = GetUnitLoc(udg_KB_Target[udg_KB])
                set udg_KB_Point[3] = PolarProjectionBJ(udg_KB_Point[2], udg_KB_Speed[udg_KB], udg_KB_Angle[udg_KB])
                set udg_KB_Bool = true
                call EnumDestructablesInCircleBJ(250.00, udg_KB_Point[3], function Trig_Knockback_System_Func001Func001Func001Func005A)
                if(Trig_Knockback_System_Func001Func001Func001Func006C())then
                    call SetUnitX(udg_KB_Target[udg_KB], GetLocationX(udg_KB_Point[3]))
                    call SetUnitY(udg_KB_Target[udg_KB], GetLocationY(udg_KB_Point[3]))
                else
                    set udg_KB_Distance[udg_KB] = 0.00
                endif
                set udg_KB_Distance[udg_KB] = (udg_KB_Distance[udg_KB] - udg_KB_Speed[udg_KB])
                set udg_KB_Spam[udg_KB] = (udg_KB_Spam[udg_KB] + 1)
                if(Trig_Knockback_System_Func001Func001Func001Func009C())then
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
