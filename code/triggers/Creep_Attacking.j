function Trig_Creep_Attacking_Actions takes nothing returns nothing
    if GetUnitTypeId(GetAttacker()) == 0x6E303056 or GetUnitTypeId(GetAttacker()) == 0x6E303047 then
        set udg_Point = GetUnitLoc(ArctUnit)
        set udg_Point2 = GetUnitLoc(GetAttacker())
        call CreateNUnitsAtLoc(1, 0x68303134, Player(11), udg_Point2, bj_UNIT_FACING)
        if GetUnitTypeId(GetAttacker()) == 0x6E303047 then
            call SetUnitUserData(GetLastCreatedUnit(), 22)
        endif
        call UnitAddAbilityBJ(0x4130354B, GetLastCreatedUnit())
        call UnitApplyTimedLifeBJ(1.20, 0x42544C46, GetLastCreatedUnit())
        call IssuePointOrderLocBJ(GetLastCreatedUnit(), "carrionswarm", udg_Point)
        call RemoveLocation(udg_Point)
        call RemoveLocation(udg_Point2)
    endif
endfunction

function InitTrig_Creep_Attacking takes nothing returns nothing
    set gg_trg_Creep_Attacking = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Creep_Attacking, ArctUnit, EVENT_UNIT_ATTACKED)
    call TriggerAddAction(gg_trg_Creep_Attacking, function Trig_Creep_Attacking_Actions)
endfunction