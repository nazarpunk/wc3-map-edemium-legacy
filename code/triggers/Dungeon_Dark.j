function Trig_Dungeon_Dark_Actions takes nothing returns nothing
    call DestroyTimerDialogBJ(udg_DungeonDarkTimerWindow)
    call EnableTrigger(gg_trg_Dungeon_Dark_Periodic)
endfunction

function InitTrig_Dungeon_Dark takes nothing returns nothing
    set gg_trg_Dungeon_Dark = CreateTrigger()
    call DisableTrigger(gg_trg_Dungeon_Dark)
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Dungeon_Dark, udg_DungeonDarkTimer)
    call TriggerAddAction(gg_trg_Dungeon_Dark, function Trig_Dungeon_Dark_Actions)
endfunction