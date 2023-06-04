function Trig_Combo_Spawn_Creeps_Conditions takes nothing returns boolean
    return GetUnitTypeId(GetAttacker()) != 0x6F687764 and GetUnitTypeId(GetAttacker()) != 0x6E303038 and udg_ComboSpawnAllowed
endfunction

function Trig_Combo_Spawn_Creeps_Actions takes nothing returns nothing
    set udg_CO_Point = GetUnitLoc(GetAttacker())
    set udg_CO_Point2 = GetUnitLoc(GetTriggerUnit())
    if DistanceBetweenPoints(udg_CO_Point, udg_CO_Point2) <= 300.00 then
        call RemoveLocation(udg_CO_Point)
        call RemoveLocation(udg_CO_Point2)
        set udg_CO_Point = GetUnitLoc(GetAttacker())
        if GetUnitAbilityLevelSwapped(0x41303559, GetAttacker()) == 1 then
            set udg_RandomNumber = GetRandomInt(2, 3)
        else
            set udg_RandomNumber = GetRandomInt(1, 2)
        endif
        call RemoveUnit(udg_CO_OpportunityUnit[GetUnitUserData(GetAttacker())])
        if udg_RandomNumber == 1 then
            call CreateNUnitsAtLoc(1, 0x6830304F, Player(9), udg_CO_Point, bj_UNIT_FACING)
        endif
        if udg_RandomNumber == 2 then
            call CreateNUnitsAtLoc(1, 0x68303050, Player(9), udg_CO_Point, bj_UNIT_FACING)
        endif
        if udg_RandomNumber == 3 then
            call CreateNUnitsAtLoc(1, 0x68303051, Player(9), udg_CO_Point, bj_UNIT_FACING)
        endif
        call SetUnitUserData(GetLastCreatedUnit(), GetUnitUserData(GetAttacker()))
        call UnitApplyTimedLifeBJ(udg_CO_Time, 0x42544C46, GetLastCreatedUnit())
        set udg_CO_AttackingUnit[GetUnitUserData(GetLastCreatedUnit())] = GetAttacker()
        set udg_CO_OpportunityUnit[GetUnitUserData(GetLastCreatedUnit())] = GetLastCreatedUnit()
        call RemoveLocation(udg_CO_Point)
    endif
endfunction

function InitTrig_Combo_Spawn_Creeps takes nothing returns nothing
    set gg_trg_Combo_Spawn_Creeps = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Combo_Spawn_Creeps, ArctUnit, EVENT_UNIT_ATTACKED)
    call TriggerAddCondition(gg_trg_Combo_Spawn_Creeps, Condition(function Trig_Combo_Spawn_Creeps_Conditions))
    call TriggerAddAction(gg_trg_Combo_Spawn_Creeps, function Trig_Combo_Spawn_Creeps_Actions)
endfunction
