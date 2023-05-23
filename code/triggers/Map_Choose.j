function Trig_Map_Choose_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x6830304B))then
        return false
    endif
    return true
endfunction

function Trig_Map_Choose_Func015Func001C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_D_Point1, udg_D_Point2) >= 180.00))then
        return false
    endif
    if(not(GetUnitUserData(GetTriggerUnit()) != 10))then
        return false
    endif
    if(not(udg_Difficulty_Unlocked[1] == true))then
        return false
    endif
    return true
endfunction

function Trig_Map_Choose_Func015Func003C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_D_Point1, udg_D_Point2) <= 180.00))then
        return false
    endif
    if(not(GetTriggerUnit() != udg_EM_Target))then
        return false
    endif
    if(not(GetUnitUserData(GetTriggerUnit()) != 10))then
        return false
    endif
    return true
endfunction

function Trig_Map_Choose_Func015C takes nothing returns boolean
    if(not Trig_Map_Choose_Func015Func003C())then
        return false
    endif
    return true
endfunction

function Trig_Map_Choose_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ(0x4130345A, udg_Target)
    call UnitRemoveAbilityBJ(0x4130354E, udg_Target)
    set udg_Target = GetTriggerUnit()
    call RemoveLocation(udg_TargetPoint)
    set udg_TargetPoint = GetUnitLoc(udg_Target)
    call ClearTextMessagesBJ(GetPlayersAll())
    set udg_D_Point1 = GetUnitLoc(udg_EM_Target)
    set udg_D_Point2 = GetUnitLoc(GetTriggerUnit())
    call UnitAddAbilityBJ(0x4130354D, udg_EM_Target)
    if(Trig_Map_Choose_Func015C())then
        call UnitAddAbilityBJ(0x4130345A, GetTriggerUnit())
    else
        if(Trig_Map_Choose_Func015Func001C())then
            call UnitAddAbilityBJ(0x4130354E, GetTriggerUnit())
        endif
    endif
    call RemoveLocation(udg_D_Point1)
    call RemoveLocation(udg_D_Point2)
endfunction

function InitTrig_Map_Choose takes nothing returns nothing
    set gg_trg_Map_Choose = CreateTrigger()
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Map_Choose, Player(0), true)
    call TriggerAddCondition(gg_trg_Map_Choose, Condition(function Trig_Map_Choose_Conditions))
    call TriggerAddAction(gg_trg_Map_Choose, function Trig_Map_Choose_Actions)
endfunction
