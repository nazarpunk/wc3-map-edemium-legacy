
function Trig_Boss_III_Attacks_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(GetAttacker()) == 0x6E303038))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Attacks_Func007Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Attacks_Func007C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Attacks_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetAttacker())
    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
    call UnitAddAbilityBJ(0x41303634, GetLastCreatedUnit())
    call RemoveLocation(udg_Point)
    call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
    set udg_RandomNumber = GetRandomInt(1, 3)
    if(Trig_Boss_III_Attacks_Func007C())then
        set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Left)
    else
        if(Trig_Boss_III_Attacks_Func007Func002C())then
            set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Center)
        else
            set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Right)
        endif
    endif
    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "clusterrockets", udg_CO_Point)
    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_CO_Point, bj_UNIT_FACING)
    call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
    call UnitAddAbilityBJ(0x41303635, GetLastCreatedUnit())
    call IssueImmediateOrderBJ(GetLastCreatedUnit(), "stomp")
    call RemoveLocation(udg_CO_Point)
endfunction
function InitTrig_Boss_III_Attacks takes nothing returns nothing
    set gg_trg_Boss_III_Attacks = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Boss_III_Attacks, EVENT_PLAYER_UNIT_ATTACKED)
    call TriggerAddCondition(gg_trg_Boss_III_Attacks, Condition(function Trig_Boss_III_Attacks_Conditions))
    call TriggerAddAction(gg_trg_Boss_III_Attacks, function Trig_Boss_III_Attacks_Actions)
endfunction