function Trig_Boss_III_Portal_Abort_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ(0x41303631, ArctUnit)
    call DestroyLightningBJ(udg_Boss3PortalEffect)
    call DisableTrigger(gg_trg_Boss_III_Portal_Timer)
    call DisableTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Boss_III_Portal_Abort takes nothing returns nothing
    set gg_trg_Boss_III_Portal_Abort = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Portal_Abort)
    call TriggerRegisterUnitEvent(gg_trg_Boss_III_Portal_Abort, ArctUnit, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerRegisterUnitEvent(gg_trg_Boss_III_Portal_Abort, ArctUnit, EVENT_UNIT_ISSUED_POINT_ORDER)
    call TriggerRegisterUnitEvent(gg_trg_Boss_III_Portal_Abort, ArctUnit, EVENT_UNIT_ISSUED_ORDER)
    call TriggerAddAction(gg_trg_Boss_III_Portal_Abort, function Trig_Boss_III_Portal_Abort_Actions)
endfunction
