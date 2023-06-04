function Trig_Combo_Spawn_Hero_Conditions takes nothing returns boolean
    return udg_DamageEventSource == ArctUnit and GetUnitAbilityLevelSwapped(0x41303559, udg_DamageEventTarget) == 1 and udg_ComboSpawnAllowed
endfunction

function Trig_Combo_Spawn_Hero_Actions takes nothing returns nothing
    set udg_CO_Point = GetUnitLoc(udg_DamageEventSource)
    set udg_CO_Point2 = GetUnitLoc(udg_DamageEventTarget)
    if DistanceBetweenPoints(udg_CO_Point, udg_CO_Point2) <= 250.00 then
        call RemoveLocation(udg_CO_Point)
        call RemoveLocation(udg_CO_Point2)
        set udg_CO_Point = GetUnitLoc(udg_DamageEventSource)
        call RemoveUnit(udg_CO_OpportunityUnit[71])
        if GetUnitAbilityLevelSwapped(0x41303559, udg_DamageEventTarget) == 1 then
            set udg_RandomNumber = GetRandomInt(1, 3)
        else
            set udg_RandomNumber = GetRandomInt(1, 2)
        endif
        if udg_RandomNumber == 1 then
            call CreateNUnitsAtLoc(1, 0x68303050, Player(9), udg_CO_Point, bj_UNIT_FACING)
        endif
        if udg_RandomNumber == 2 then
            call CreateNUnitsAtLoc(1, 0x68303050, Player(9), udg_CO_Point, bj_UNIT_FACING)
        endif
        if udg_RandomNumber == 3 then
            call CreateNUnitsAtLoc(1, 0x68303051, Player(9), udg_CO_Point, bj_UNIT_FACING)
        endif
        call SetUnitUserData(GetLastCreatedUnit(), 71)
        call UnitApplyTimedLifeBJ(1.50, 0x42544C46, GetLastCreatedUnit())
        set udg_CO_AttackingUnit[71] = udg_DamageEventTarget
        set udg_CO_OpportunityUnit[71] = GetLastCreatedUnit()
        call RemoveLocation(udg_CO_Point)
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
