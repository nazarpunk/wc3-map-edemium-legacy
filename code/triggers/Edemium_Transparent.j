
function Trig_Edemium_Transparent_Func004C takes nothing returns boolean
    if(not(udg_Transparent <= 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Transparent_Actions takes nothing returns nothing
    set udg_Transparent = (udg_Transparent - 4.00)
    call SetUnitVertexColorBJ(udg_Arct, 100, 100, 100, udg_Transparent)
    if(Trig_Edemium_Transparent_Func004C())then
        call DisableTrigger(GetTriggeringTrigger())
    else
    endif
endfunction
function InitTrig_Edemium_Transparent takes nothing returns nothing
    set gg_trg_Edemium_Transparent = CreateTrigger()
    call DisableTrigger(gg_trg_Edemium_Transparent)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Edemium_Transparent, 0.10)
    call TriggerAddAction(gg_trg_Edemium_Transparent, function Trig_Edemium_Transparent_Actions)
endfunction