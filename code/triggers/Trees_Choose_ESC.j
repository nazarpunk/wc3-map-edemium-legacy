function Trig_Trees_Choose_ESC_Actions takes nothing returns nothing
    call CameraSetSmoothingFactorBJ(10.00)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 1.50, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
    call ClearTextMessagesBJ(GetPlayersAll())
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call ResetTerrainFogBJ()
    call EnableTrigger(gg_trg_Trees_Camera_Off)
    call DisableTrigger(gg_trg_Camera_Fix)
    set udg_Point = GetRectCenter(gg_rct_Stop_Unit)
    call SetUnitPositionLoc(ArctUnit, udg_Point)
    call RemoveLocation(udg_Point)
    call DisableTrigger(gg_trg_Camera_Increase)
    call DisableTrigger(gg_trg_Camera_Hero)
    call DisableTrigger(gg_trg_Camera_Boss)
    call DisableTrigger(gg_trg_Camera_Fix)
    call DisableTrigger(gg_trg_Camera_Decrease)
    call SetCameraBoundsToRect(gg_rct_Abilities)
    call EnableTrigger(gg_trg_Camera_Tree)
    set udg_Target = gg_unit_h006_0035
    call RemoveLocation(udg_TargetPoint)
    set udg_TargetPoint = GetUnitLoc(udg_Target)
    call DisableTrigger(gg_trg_Leave_Hero_Regions)
    set udg_Camera = gg_cam_Abilities_Tree
    call CameraSetupApplyForceDuration(udg_Camera, true, 0.00)
    call SelectUnitSingle(gg_unit_h006_0035)
    set udg_CameraDistance = 1400
    set udg_CameraAngle = 270
    call TriggerExecute(gg_trg_Trees_Specialeffects)
    call DisableTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Trees_Choose_ESC takes nothing returns nothing
    set gg_trg_Trees_Choose_ESC = CreateTrigger()
    call DisableTrigger(gg_trg_Trees_Choose_ESC)
    call TriggerRegisterPlayerEventEndCinematic(gg_trg_Trees_Choose_ESC, Player(0))
    call TriggerAddAction(gg_trg_Trees_Choose_ESC, function Trig_Trees_Choose_ESC_Actions)
endfunction