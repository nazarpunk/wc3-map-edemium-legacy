function Trig_Keeper_Look_Actions takes nothing returns nothing
    call SetUnitFacingToFaceUnitTimed(gg_unit_n006_0028, udg_Arct, 1.00)
endfunction

function InitTrig_Keeper_Look takes nothing returns nothing
    set gg_trg_Keeper_Look = CreateTrigger()
    call DisableTrigger(gg_trg_Keeper_Look)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Keeper_Look, 0.50)
    call TriggerAddAction(gg_trg_Keeper_Look, function Trig_Keeper_Look_Actions)
endfunction