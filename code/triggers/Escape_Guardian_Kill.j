function Trig_Escape_Guardian_Kill_Conditions takes nothing returns boolean
    return GetTriggerUnit() == udg_D_Guardian
endfunction

function Trig_Escape_Guardian_Kill_Actions takes nothing returns nothing
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 2.00, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 100.00, 100.00, 100.00, 20.00)
    call EnableWeatherEffect(GetLastCreatedWeatherEffect(), true)
    call DisableTrigger(gg_trg_Dungeon_Dark)
    call DisableTrigger(gg_trg_Dungeon_Dark_Periodic)
    call DestroyTimerDialogBJ(udg_DungeonDarkTimerWindow)
    call DestroyFogModifier(GetLastCreatedFogModifier())
    call FogEnableOff()
    call FogMaskEnableOff()
    call CreateFogModifierRectBJ(true, Player(0), FOG_OF_WAR_VISIBLE, bj_mapInitialPlayableArea)
    call DisplayTimedTextToForce(GetPlayersAll(), 30.00, "Для выхода нажмите ESC.")
    call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
    call EnableTrigger(gg_trg_Escape_Dialog_Dummy)
    call EnableTrigger(gg_trg_Escape_Dialog)
endfunction

function InitTrig_Escape_Guardian_Kill takes nothing returns nothing
    set gg_trg_Escape_Guardian_Kill = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Escape_Guardian_Kill, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Escape_Guardian_Kill, Condition(function Trig_Escape_Guardian_Kill_Conditions))
    call TriggerAddAction(gg_trg_Escape_Guardian_Kill, function Trig_Escape_Guardian_Kill_Actions)
endfunction
