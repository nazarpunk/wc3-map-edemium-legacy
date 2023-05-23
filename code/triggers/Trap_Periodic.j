
function Trig_Trap_Periodic_Func002Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x68303057))then
        return false
    endif
    return true
endfunction

function Trig_Trap_Periodic_Func002A takes nothing returns nothing
    if(Trig_Trap_Periodic_Func002Func001C())then
        call IssueImmediateOrderBJ(GetEnumUnit(), "roar")
    endif
endfunction

function Trig_Trap_Periodic_Actions takes nothing returns nothing
    set udg_UnitGroup = GetUnitsOfPlayerAll(Player(1))
    call ForGroupBJ(udg_UnitGroup, function Trig_Trap_Periodic_Func002A)
    call DestroyGroup(udg_UnitGroup)
endfunction

function InitTrig_Trap_Periodic takes nothing returns nothing
    set gg_trg_Trap_Periodic = CreateTrigger()
    call DisableTrigger(gg_trg_Trap_Periodic)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Trap_Periodic, 3.20)
    call TriggerAddAction(gg_trg_Trap_Periodic, function Trig_Trap_Periodic_Actions)
endfunction
