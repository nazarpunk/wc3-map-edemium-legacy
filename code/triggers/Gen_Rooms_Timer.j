function Trig_Gen_Rooms_Timer_Actions takes nothing returns nothing
    call ConditionalTriggerExecute(gg_trg_Gen_Rooms)
endfunction
function InitTrig_Gen_Rooms_Timer takes nothing returns nothing
    set gg_trg_Gen_Rooms_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Gen_Rooms_Timer, udg_D_Timer3)
    call TriggerAddAction(gg_trg_Gen_Rooms_Timer, function Trig_Gen_Rooms_Timer_Actions)
endfunction