
function Trig_Creep_Attacking_Func001Func004C takes nothing returns boolean
    if(not(GetUnitTypeId(GetAttacker()) == 0x6E303047))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Attacking_Func001Func010C takes nothing returns boolean
    if((GetUnitTypeId(GetAttacker()) == 0x6E303056))then
        return true
    endif
    if((GetUnitTypeId(GetAttacker()) == 0x6E303047))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Attacking_Func001C takes nothing returns boolean
    if(not Trig_Creep_Attacking_Func001Func010C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Attacking_Actions takes nothing returns nothing
    if(Trig_Creep_Attacking_Func001C())then
        set udg_Point = GetUnitLoc(udg_Arct)
        set udg_Point2 = GetUnitLoc(GetAttacker())
        call CreateNUnitsAtLoc(1, 0x68303134, Player(11), udg_Point2, bj_UNIT_FACING)
        if(Trig_Creep_Attacking_Func001Func004C())then
            call SetUnitUserData(GetLastCreatedUnit(), 22)
        else
        endif
        call UnitAddAbilityBJ(0x4130354B, GetLastCreatedUnit())
        call UnitApplyTimedLifeBJ(1.20, 0x42544C46, GetLastCreatedUnit())
        call IssuePointOrderLocBJ(GetLastCreatedUnit(), "carrionswarm", udg_Point)
        call RemoveLocation(udg_Point)
        call RemoveLocation(udg_Point2)
    else
    endif
endfunction
function InitTrig_Creep_Attacking takes nothing returns nothing
    set gg_trg_Creep_Attacking = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Creep_Attacking, gg_unit_H000_0004, EVENT_UNIT_ATTACKED)
    call TriggerAddAction(gg_trg_Creep_Attacking, function Trig_Creep_Attacking_Actions)
endfunction