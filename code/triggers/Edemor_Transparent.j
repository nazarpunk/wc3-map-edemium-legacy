function Trig_Edemor_Transparent_Func003C takes nothing returns boolean
    if(not(udg_Transparent >= 100.00))then
        return false
    endif
    return true
endfunction
function Trig_Edemor_Transparent_Actions takes nothing returns nothing
    set udg_Transparent = (udg_Transparent + 2.00)
    call SetUnitVertexColorBJ(gg_unit_h00V_0063, 100, 100, 100, udg_Transparent)
    if(Trig_Edemor_Transparent_Func003C())then
        call ShowUnitHide(gg_unit_h00V_0063)
        set udg_Transparent = 0.00
        call DisableTrigger(GetTriggeringTrigger())
    else
    endif
endfunction
function InitTrig_Edemor_Transparent takes nothing returns nothing
    set gg_trg_Edemor_Transparent = CreateTrigger()
    call DisableTrigger(gg_trg_Edemor_Transparent)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Edemor_Transparent, 0.10)
    call TriggerAddAction(gg_trg_Edemor_Transparent, function Trig_Edemor_Transparent_Actions)
endfunction