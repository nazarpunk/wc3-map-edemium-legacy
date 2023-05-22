
function Trig_Dungeon_Dark_Periodic_Actions takes nothing returns nothing
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 1.00, "ReplaceableTextures\\CameraMasks\\Scope_Mask.blp", 0, 0, 0, 0)
    call SetUnitOwner(udg_Arct, Player(1), false)
    set udg_Point = GetUnitLoc(udg_Arct)
    set udg_Point2 = PolarProjectionBJ(udg_Point, 1200.00, GetRandomDirectionDeg())
    call IssuePointOrderLocBJ(udg_Arct, "move", udg_Point2)
    call RemoveLocation(udg_Point)
    call RemoveLocation(udg_Point2)
    call TriggerSleepAction(5.00)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 1.00, "ReplaceableTextures\\CameraMasks\\HazeAndFogFilter_Mask.blp", 0, 0, 0, 0)
    call SetUnitOwner(udg_Arct, Player(0), false)
    call SelectUnitForPlayerSingle(udg_Arct, Player(0))
endfunction
function InitTrig_Dungeon_Dark_Periodic takes nothing returns nothing
    set gg_trg_Dungeon_Dark_Periodic = CreateTrigger()
    call DisableTrigger(gg_trg_Dungeon_Dark_Periodic)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Dungeon_Dark_Periodic, 30.00)
    call TriggerAddAction(gg_trg_Dungeon_Dark_Periodic, function Trig_Dungeon_Dark_Periodic_Actions)
endfunction