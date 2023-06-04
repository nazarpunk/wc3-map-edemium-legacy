function Trig_Cinematic_Transparent_Actions takes nothing returns nothing
    set udg_Transparent = (udg_Transparent + 1.40)
    call SetUnitVertexColorBJ(ArctUnit, 100, 100, 100, udg_Transparent)
endfunction

function InitTrig_Cinematic_Transparent takes nothing returns nothing
    set gg_trg_Cinematic_Transparent = CreateTrigger()
    call DisableTrigger(gg_trg_Cinematic_Transparent)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Cinematic_Transparent, 0.10)
    call TriggerAddAction(gg_trg_Cinematic_Transparent, function Trig_Cinematic_Transparent_Actions)
endfunction