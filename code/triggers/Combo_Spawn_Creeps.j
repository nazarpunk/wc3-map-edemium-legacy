
function Trig_Combo_Spawn_Creeps_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(GetAttacker()) != 0x6F687764))then
        return false
    endif
    if(not(GetUnitTypeId(GetAttacker()) != 0x6E303038))then
        return false
    endif
    if(not(udg_ComboSpawnAllowed == true))then
        return false
    endif
    return true
endfunction

function Trig_Combo_Spawn_Creeps_Func006Func004C takes nothing returns boolean
    if(not(GetUnitAbilityLevelSwapped(0x41303559, GetAttacker()) == 1))then
        return false
    endif
    return true
endfunction

function Trig_Combo_Spawn_Creeps_Func006Func006C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction

function Trig_Combo_Spawn_Creeps_Func006Func007C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction

function Trig_Combo_Spawn_Creeps_Func006Func008C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction

function Trig_Combo_Spawn_Creeps_Func006C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_CO_Point, udg_CO_Point2) <= 300.00))then
        return false
    endif
    return true
endfunction

function Trig_Combo_Spawn_Creeps_Actions takes nothing returns nothing
    set udg_CO_Point = GetUnitLoc(GetAttacker())
    set udg_CO_Point2 = GetUnitLoc(GetAttackedUnitBJ())
    if(Trig_Combo_Spawn_Creeps_Func006C())then
        call RemoveLocation(udg_CO_Point)
        call RemoveLocation(udg_CO_Point2)
        set udg_CO_Point = GetUnitLoc(GetAttacker())
        if(Trig_Combo_Spawn_Creeps_Func006Func004C())then
            set udg_RandomNumber = GetRandomInt(2, 3)
        else
            set udg_RandomNumber = GetRandomInt(1, 2)
        endif
        call RemoveUnit(udg_CO_OpportunityUnit[GetUnitUserData(GetAttacker())])
        if(Trig_Combo_Spawn_Creeps_Func006Func006C())then
            call CreateNUnitsAtLoc(1, 0x6830304F, Player(9), udg_CO_Point, bj_UNIT_FACING)
        else
        endif
        if(Trig_Combo_Spawn_Creeps_Func006Func007C())then
            call CreateNUnitsAtLoc(1, 0x68303050, Player(9), udg_CO_Point, bj_UNIT_FACING)
        else
        endif
        if(Trig_Combo_Spawn_Creeps_Func006Func008C())then
            call CreateNUnitsAtLoc(1, 0x68303051, Player(9), udg_CO_Point, bj_UNIT_FACING)
        else
        endif
        call SetUnitUserData(GetLastCreatedUnit(), GetUnitUserData(GetAttacker()))
        call UnitApplyTimedLifeBJ(udg_CO_Time, 0x42544C46, GetLastCreatedUnit())
        set udg_CO_AttackingUnit[GetUnitUserData(GetLastCreatedUnit())] = GetAttacker()
        set udg_CO_OpportunityUnit[GetUnitUserData(GetLastCreatedUnit())] = GetLastCreatedUnit()
        call RemoveLocation(udg_CO_Point)
    else
    endif
endfunction

function InitTrig_Combo_Spawn_Creeps takes nothing returns nothing
    set gg_trg_Combo_Spawn_Creeps = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Combo_Spawn_Creeps, gg_unit_H000_0004, EVENT_UNIT_ATTACKED)
    call TriggerAddCondition(gg_trg_Combo_Spawn_Creeps, Condition(function Trig_Combo_Spawn_Creeps_Conditions))
    call TriggerAddAction(gg_trg_Combo_Spawn_Creeps, function Trig_Combo_Spawn_Creeps_Actions)
endfunction
