
function Trig_Combo_Spawn_Hero_Conditions takes nothing returns boolean
    if(not(udg_DamageEventSource == udg_Arct))then
        return false
    endif
    if(not(GetUnitAbilityLevelSwapped(0x41303559, udg_DamageEventTarget) == 1))then
        return false
    endif
    if(not(udg_ComboSpawnAllowed == true))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Hero_Func006Func005C takes nothing returns boolean
    if(not(GetUnitAbilityLevelSwapped(0x41303559, udg_DamageEventTarget) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Hero_Func006Func006C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Hero_Func006Func007C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Hero_Func006Func008C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Hero_Func006C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_CO_Point, udg_CO_Point2) <= 250.00))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Hero_Actions takes nothing returns nothing
    set udg_CO_Point = GetUnitLoc(udg_DamageEventSource)
    set udg_CO_Point2 = GetUnitLoc(udg_DamageEventTarget)
    if(Trig_Combo_Spawn_Hero_Func006C())then
        call RemoveLocation(udg_CO_Point)
        call RemoveLocation(udg_CO_Point2)
        set udg_CO_Point = GetUnitLoc(udg_DamageEventSource)
        call RemoveUnit(udg_CO_OpportunityUnit[71])
        if(Trig_Combo_Spawn_Hero_Func006Func005C())then
            set udg_RandomNumber = GetRandomInt(1, 3)
        else
            set udg_RandomNumber = GetRandomInt(1, 2)
        endif
        if(Trig_Combo_Spawn_Hero_Func006Func006C())then
            call CreateNUnitsAtLoc(1, 0x68303050, Player(9), udg_CO_Point, bj_UNIT_FACING)
        else
        endif
        if(Trig_Combo_Spawn_Hero_Func006Func007C())then
            call CreateNUnitsAtLoc(1, 0x68303050, Player(9), udg_CO_Point, bj_UNIT_FACING)
        else
        endif
        if(Trig_Combo_Spawn_Hero_Func006Func008C())then
            call CreateNUnitsAtLoc(1, 0x68303051, Player(9), udg_CO_Point, bj_UNIT_FACING)
        else
        endif
        call SetUnitUserData(GetLastCreatedUnit(), 71)
        call UnitApplyTimedLifeBJ(1.50, 0x42544C46, GetLastCreatedUnit())
        set udg_CO_AttackingUnit[71] = udg_DamageEventTarget
        set udg_CO_OpportunityUnit[71] = GetLastCreatedUnit()
        call RemoveLocation(udg_CO_Point)
    else
    endif
    call StartTimerBJ(udg_CO_Timer, false, 2.00)
    call DisableTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Combo_Spawn_Hero takes nothing returns nothing
    set gg_trg_Combo_Spawn_Hero = CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Combo_Spawn_Hero, "udg_DamageModifierEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Combo_Spawn_Hero, Condition(function Trig_Combo_Spawn_Hero_Conditions))
    call TriggerAddAction(gg_trg_Combo_Spawn_Hero, function Trig_Combo_Spawn_Hero_Actions)
endfunction