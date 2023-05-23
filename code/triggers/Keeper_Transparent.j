function Trig_Keeper_Transparent_Func003C takes nothing returns boolean
    if(not(udg_Transparent <= 0.00))then
        return false
    endif
    return true
endfunction

function Trig_Keeper_Transparent_Actions takes nothing returns nothing
    set udg_Transparent = (udg_Transparent - 3.00)
    call SetUnitVertexColorBJ(gg_unit_n006_0028, 100, 100, 100, udg_Transparent)
    if(Trig_Keeper_Transparent_Func003C())then
        call DisableTrigger(GetTriggeringTrigger())
    endif
endfunction

function InitTrig_Keeper_Transparent takes nothing returns nothing
    set gg_trg_Keeper_Transparent = CreateTrigger()
    call DisableTrigger(gg_trg_Keeper_Transparent)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Keeper_Transparent, 0.10)
    call TriggerAddAction(gg_trg_Keeper_Transparent, function Trig_Keeper_Transparent_Actions)
endfunction
