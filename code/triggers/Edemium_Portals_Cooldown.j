
function Trig_Edemium_Portals_Cooldown_Actions takes nothing returns nothing
    call EnableTrigger(gg_trg_Edemium_Portals)
endfunction
function InitTrig_Edemium_Portals_Cooldown takes nothing returns nothing
    set gg_trg_Edemium_Portals_Cooldown = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Edemium_Portals_Cooldown, udg_D_TimerPortals)
    call TriggerAddAction(gg_trg_Edemium_Portals_Cooldown, function Trig_Edemium_Portals_Cooldown_Actions)
endfunction