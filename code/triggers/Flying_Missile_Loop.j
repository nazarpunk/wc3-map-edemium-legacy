function Trig_Flying_Missile_Loop_GroupConditionFunc takes nothing returns boolean
    if not UnitAlive(GetFilterUnit()) then
        return false
    endif
    if IsUnitAlly(GetFilterUnit(), GetOwningPlayer(udg_BL_Hero[udg_BL])) then
        return false
    endif
    if IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) then
        return false
    endif
    if IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING) then
        return false
    endif
    if IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) then
        return false
    endif
    if IsUnitType(GetFilterUnit(), UNIT_TYPE_MECHANICAL) then
        return false
    endif
    return true
endfunction

function Trig_Flying_Missile_Loop_Func002Func001Func006Func003A takes nothing returns nothing
    call UnitDamageTargetBJ(udg_BL_Hero[udg_BL], GetEnumUnit(), udg_BL_Dmg[udg_BL], ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
    set udg_BL_Distance[udg_BL] = 0.00
endfunction

function Trig_Flying_Missile_Loop_Actions takes nothing returns nothing
    set udg_BL = 1
    loop
        exitwhen udg_BL > udg_BL_Times
        if udg_BL_Off[udg_BL] then
            set udg_BL_Point[2] = GetUnitLoc(udg_BL_Missile[udg_BL])
            set udg_BL_Point[3] = PolarProjectionBJ(udg_BL_Point[2], udg_BL_Speed[udg_BL], udg_BL_Angle[udg_BL])
            call SetUnitPositionLoc(udg_BL_Missile[udg_BL], udg_BL_Point[3])
            set udg_BL_Distance[udg_BL] = (udg_BL_Distance[udg_BL] - udg_BL_Speed[udg_BL])
            set udg_BL_Group = GetUnitsInRangeOfLocMatching(udg_BL_Collision[udg_BL], udg_BL_Point[3], Condition(function Trig_Flying_Missile_Loop_GroupConditionFunc))
            if CountUnitsInGroup(udg_BL_Group) > 0 then
                call DestroyGroup(udg_BL_Group)
                set udg_BL_Group = GetUnitsInRangeOfLocMatching(udg_BL_AoE[udg_BL], udg_BL_Point[3], Condition(function Trig_Flying_Missile_Loop_GroupConditionFunc))
                call ForGroupBJ(udg_BL_Group, function Trig_Flying_Missile_Loop_Func002Func001Func006Func003A)
            endif
            call RemoveLocation(udg_BL_Point[2])
            call RemoveLocation(udg_BL_Point[3])
            call DestroyGroup(udg_BL_Group)
            if udg_BL_Distance[udg_BL] <= 0.00 then
                call DestroyEffectBJ(udg_BL_Effect1[udg_BL])
                call DestroyEffectBJ(udg_BL_Effect2[udg_BL])
                call KillUnit(udg_BL_Missile[udg_BL])
                set udg_BL_Skip = (udg_BL_Skip - 1)
                set udg_BL_Off[udg_BL] = false
                if udg_BL_Skip == 0 then
                    set udg_BL_Times = 0
                    call DisableTrigger(GetTriggeringTrigger())
                endif
            endif
        endif
        set udg_BL = udg_BL + 1
    endloop
endfunction

function InitTrig_Flying_Missile_Loop takes nothing returns nothing
    set gg_trg_Flying_Missile_Loop = CreateTrigger()
    call DisableTrigger(gg_trg_Flying_Missile_Loop)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Flying_Missile_Loop, 0.03)
    call TriggerAddAction(gg_trg_Flying_Missile_Loop, function Trig_Flying_Missile_Loop_Actions)
endfunction
