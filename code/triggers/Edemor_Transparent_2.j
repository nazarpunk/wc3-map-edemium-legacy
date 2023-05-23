
function Trig_Edemor_Transparent_2_Func004C takes nothing returns boolean
    return udg_Transparent >= 100.00
endfunction

function Trig_Edemor_Transparent_2_Actions takes nothing returns nothing
    set udg_Transparent = (udg_Transparent + 3.00)
    call SetUnitVertexColorBJ(gg_unit_h00V_0029, 100, 100, 100, udg_Transparent)
    call SetUnitVertexColorBJ(gg_unit_H000_0004, 100, 100, 100, udg_Transparent)
    if(Trig_Edemor_Transparent_2_Func004C())then
        call ShowUnitHide(gg_unit_h00V_0029)
        call ShowUnitHide(gg_unit_H000_0004)
        set udg_Transparent = 0.00
        call DestroyTrigger(GetTriggeringTrigger())
    endif
endfunction

function InitTrig_Edemor_Transparent_2 takes nothing returns nothing
    set gg_trg_Edemor_Transparent_2 = CreateTrigger()
    call DisableTrigger(gg_trg_Edemor_Transparent_2)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Edemor_Transparent_2, 0.10)
    call TriggerAddAction(gg_trg_Edemor_Transparent_2, function Trig_Edemor_Transparent_2_Actions)
endfunction
