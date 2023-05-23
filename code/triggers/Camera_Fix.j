function Trig_Camera_Fix_Actions takes nothing returns nothing
    call CameraSetupApplyForceDuration(udg_Camera, true, 0.00)
endfunction

function InitTrig_Camera_Fix takes nothing returns nothing
    set gg_trg_Camera_Fix = CreateTrigger()
    call DisableTrigger(gg_trg_Camera_Fix)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Camera_Fix, 0.04)
    call TriggerAddAction(gg_trg_Camera_Fix, function Trig_Camera_Fix_Actions)
endfunction