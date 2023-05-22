
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func004C takes nothing returns boolean
    if(not(udg_SB_Spam[udg_SB] == 0))then
        return false
    endif
    return true
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003001001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING) == false)
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003001002 takes nothing returns boolean
    return(IsUnitDeadBJ(GetFilterUnit()) == false)
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003001 takes nothing returns boolean
    return GetBooleanAnd(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003001001(), Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003001002())
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003002 takes nothing returns boolean
    return(GetFilterUnit() != udg_SB_Hero[udg_SB])
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003 takes nothing returns boolean
    return GetBooleanAnd(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003001(), Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003002())
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false)
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING) == false)
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002001 takes nothing returns boolean
    return(IsUnitDeadBJ(GetFilterUnit()) == false)
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002001 takes nothing returns boolean
    return(IsUnitAlly(GetFilterUnit(), GetOwningPlayer(udg_SB_Hero[udg_SB])) == false)
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002002001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_MECHANICAL) == false)
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002002002 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false)
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002002001(), Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002002002())
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002001(), Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002002())
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002001(), Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002())
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002001(), Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002())
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003 takes nothing returns boolean
    return GetBooleanAnd(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003001(), Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002())
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func006Func002C takes nothing returns boolean
    if(not(udg_KB_Skip == 0))then
        return false
    endif
    return true
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func006A takes nothing returns nothing
    call UnitDamageTargetBJ(udg_SB_Hero[udg_SB], GetEnumUnit(), udg_SB_Damage[udg_SB], ATTACK_TYPE_NORMAL, DAMAGE_TYPE_FORCE)
    if(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func006Func002C())then
        call EnableTrigger(gg_trg_Knockback_System)
    else
    endif
    set udg_KB_Skip = (udg_KB_Skip + 1)
    set udg_KB_Times = (udg_KB_Times + 1)
    set udg_KB_Off[udg_KB_Times] = true
    set udg_KB_Target[udg_KB_Times] = GetEnumUnit()
    call DestroyEffectBJ(udg_CreepCastEffect[GetUnitUserData(udg_KB_Target[udg_KB_Times])])
    call PauseUnitBJ(true, udg_KB_Target[udg_KB_Times])
    set udg_KB_Point[1] = GetUnitLoc(udg_KB_Target[udg_KB_Times])
    set udg_KB_Angle[udg_KB_Times] = AngleBetweenPoints(udg_KB_Point[0], udg_KB_Point[1])
    set udg_KB_Distance[udg_KB_Times] = 200.00
    set udg_KB_Speed[udg_KB_Times] = (udg_KB_Distance[udg_KB_Times] / 50.00)
    set udg_KB_Spam[udg_KB_Times] = 10
    call RemoveLocation(udg_KB_Point[1])
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007C takes nothing returns boolean
    if(not(CountUnitsInGroup(udg_SB_Group[udg_SB]) > 0))then
        return false
    endif
    return true
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func011C takes nothing returns boolean
    if((IsUnitType(udg_SB_Hero[udg_SB], UNIT_TYPE_STUNNED) == true))then
        return true
    endif
    if((IsUnitDeadBJ(udg_SB_Hero[udg_SB]) == true))then
        return true
    endif
    return false
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001C takes nothing returns boolean
    if(not Trig_Lightspeed_Loop_Func001Func001Func001Func001Func011C())then
        return false
    endif
    return true
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func007C takes nothing returns boolean
    if(not(udg_SB_Skip <= 0))then
        return false
    endif
    return true
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001C takes nothing returns boolean
    if(not(udg_SB_Distance[udg_SB] <= 0.00))then
        return false
    endif
    return true
endfunction

function Trig_Lightspeed_Loop_Func001Func001C takes nothing returns boolean
    if(not(udg_SB_On[udg_SB] == true))then
        return false
    endif
    return true
endfunction

function Trig_Lightspeed_Loop_Actions takes nothing returns nothing
    set udg_SB = 1
    loop
        exitwhen udg_SB > udg_SB_Times
        if(Trig_Lightspeed_Loop_Func001Func001C())then
            if(Trig_Lightspeed_Loop_Func001Func001Func001C())then
                call ResetUnitAnimation(udg_SB_Hero[udg_SB])
                call PauseUnitBJ(false, udg_SB_Hero[udg_SB])
                call DestroyEffectBJ(udg_SB_Effect)
                set udg_SB_On[udg_SB] = false
                set udg_SB_Skip = (udg_SB_Skip - 1)
                if(Trig_Lightspeed_Loop_Func001Func001Func001Func007C())then
                    set udg_SB_Times = 0
                    call DisableTrigger(GetTriggeringTrigger())
                else
                endif
            else
                if(Trig_Lightspeed_Loop_Func001Func001Func001Func001C())then
                    set udg_SB_Distance[udg_SB] = 0.00
                else
                    set udg_SB_Point[2] = GetUnitLoc(udg_SB_Hero[udg_SB])
                    set udg_SB_Point[3] = PolarProjectionBJ(udg_SB_Point[2], udg_SB_Speed[udg_SB], udg_SB_Angle[udg_SB])
                    call SetUnitPositionLocFacingBJ(udg_SB_Hero[udg_SB], udg_SB_Point[3], udg_SB_Angle[udg_SB])
                    if(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func004C())then
                        set udg_SB_Spam[udg_SB] = 50
                        call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "war3mapImported\\Holy_Penance.mdx")
                        set udg_SB_Effect = GetLastCreatedEffectBJ()
                    else
                        set udg_SB_Spam[udg_SB] = (udg_SB_Spam[udg_SB] - 1)
                    endif
                    set udg_SB_Distance[udg_SB] = (udg_SB_Distance[udg_SB] - udg_SB_Speed[udg_SB])
                    set udg_SB_Group[udg_SB] = GetUnitsInRangeOfLocMatching(100.00, udg_SB_Point[3], Condition(function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003))
                    if(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007C())then
                        call DestroyGroup(udg_SB_Group[udg_SB])
                        set udg_SB_Distance[udg_SB] = 0.00
                        set udg_KB_Point[0] = udg_SB_Point[3]
                        set udg_SB_Group[udg_SB] = GetUnitsInRangeOfLocMatching(150.00, udg_SB_Point[3], Condition(function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003))
                        call ForGroupBJ(udg_SB_Group[udg_SB], function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func006A)
                        call RemoveLocation(udg_KB_Point[0])
                    else
                        call DestroyGroup(udg_SB_Group[udg_SB])
                    endif
                    call RemoveLocation(udg_SB_Point[2])
                    call RemoveLocation(udg_SB_Point[3])
                endif
            endif
        else
        endif
        set udg_SB = udg_SB + 1
    endloop
endfunction

function InitTrig_Lightspeed_Loop takes nothing returns nothing
    set gg_trg_Lightspeed_Loop = CreateTrigger()
    call DisableTrigger(gg_trg_Lightspeed_Loop)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Lightspeed_Loop, 0.02)
    call TriggerAddAction(gg_trg_Lightspeed_Loop, function Trig_Lightspeed_Loop_Actions)
endfunction
