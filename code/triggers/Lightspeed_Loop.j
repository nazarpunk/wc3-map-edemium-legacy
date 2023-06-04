function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003 takes nothing returns boolean
    return not IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING) and UnitAlive(GetFilterUnit()) and GetFilterUnit() != udg_SB_Hero[udg_SB]
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003 takes nothing returns boolean
    return not IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) and not IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING) and UnitAlive(GetFilterUnit()) and not IsUnitAlly(GetFilterUnit(), GetOwningPlayer(udg_SB_Hero[udg_SB])) and not IsUnitType(GetFilterUnit(), UNIT_TYPE_MECHANICAL) and not IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE)
endfunction

function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func006A takes nothing returns nothing
    call UnitDamageTargetBJ(udg_SB_Hero[udg_SB], GetEnumUnit(), udg_SB_Damage[udg_SB], ATTACK_TYPE_NORMAL, DAMAGE_TYPE_FORCE)
    if udg_KB_Skip == 0 then
        call EnableTrigger(gg_trg_Knockback_System)
    endif
    set udg_KB_Skip = (udg_KB_Skip + 1)
    set udg_KB_Times = (udg_KB_Times + 1)
    set udg_KB_Off[udg_KB_Times] = true
    set udg_KB_Target[udg_KB_Times] = GetEnumUnit()
    call DestroyEffect(udg_CreepCastEffect[GetUnitUserData(udg_KB_Target[udg_KB_Times])])
    call PauseUnitBJ(true, udg_KB_Target[udg_KB_Times])
    set udg_KB_Point[1] = GetUnitLoc(udg_KB_Target[udg_KB_Times])
    set udg_KB_Angle[udg_KB_Times] = AngleBetweenPoints(udg_KB_Point[0], udg_KB_Point[1])
    set udg_KB_Distance[udg_KB_Times] = 200.00
    set udg_KB_Speed[udg_KB_Times] = (udg_KB_Distance[udg_KB_Times] / 50.00)
    set udg_KB_Spam[udg_KB_Times] = 10
    call RemoveLocation(udg_KB_Point[1])
endfunction

function Trig_Lightspeed_Loop_Actions takes nothing returns nothing
    set udg_SB = 1
    loop
        exitwhen udg_SB > udg_SB_Times
        if udg_SB_On[udg_SB] then
            if udg_SB_Distance[udg_SB] <= 0.00 then
                call ResetUnitAnimation(udg_SB_Hero[udg_SB])
                call PauseUnitBJ(false, udg_SB_Hero[udg_SB])
                call DestroyEffect(udg_SB_Effect)
                set udg_SB_On[udg_SB] = false
                set udg_SB_Skip = (udg_SB_Skip - 1)
                if udg_SB_Skip <= 0 then
                    set udg_SB_Times = 0
                    call DisableTrigger(GetTriggeringTrigger())
                endif
            else
                if IsUnitType(udg_SB_Hero[udg_SB], UNIT_TYPE_STUNNED) or not UnitAlive(udg_SB_Hero[udg_SB]) then
                    set udg_SB_Distance[udg_SB] = 0.00
                else
                    set udg_SB_Point[2] = GetUnitLoc(udg_SB_Hero[udg_SB])
                    set udg_SB_Point[3] = PolarProjectionBJ(udg_SB_Point[2], udg_SB_Speed[udg_SB], udg_SB_Angle[udg_SB])
                    call SetUnitPositionLocFacingBJ(udg_SB_Hero[udg_SB], udg_SB_Point[3], udg_SB_Angle[udg_SB])
                    if udg_SB_Spam[udg_SB] == 0 then
                        set udg_SB_Spam[udg_SB] = 50
                        call AddSpecialEffectTargetUnitBJ("chest", ArctUnit, "war3mapImported\\Holy_Penance.mdx")
                        set udg_SB_Effect = GetLastCreatedEffectBJ()
                    else
                        set udg_SB_Spam[udg_SB] = (udg_SB_Spam[udg_SB] - 1)
                    endif
                    set udg_SB_Distance[udg_SB] = (udg_SB_Distance[udg_SB] - udg_SB_Speed[udg_SB])
                    set udg_SB_Group[udg_SB] = GetUnitsInRangeOfLocMatching(100.00, udg_SB_Point[3], Condition(function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003))
                    if CountUnitsInGroup(udg_SB_Group[udg_SB]) > 0 then
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
