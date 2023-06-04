function Trig_Map_Enter_Conditions takes nothing returns boolean
    return GetClickedButton() == udg_DialogButton[1]
endfunction

function Trig_Map_Enter_Actions takes nothing returns nothing
    call VolumeGroupSetVolumeBJ(SOUND_VOLUMEGROUP_FIRE, 0.00)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 2.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
    call ClearTextMessagesBJ(GetPlayersAll())
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call ResetTerrainFogBJ()
    call EnableTrigger(gg_trg_Trees_Camera_Off)
    set udg_Point = GetRectCenter(gg_rct_Stop_Unit)
    call SetUnitPositionLoc(ArctUnit, udg_Point)
    call RemoveLocation(udg_Point)
    call DisableTrigger(gg_trg_Camera_Increase)
    call DisableTrigger(gg_trg_Camera_Hero)
    call DisableTrigger(gg_trg_Camera_Fix)
    call DisableTrigger(gg_trg_Camera_Decrease)
    call DisableTrigger(gg_trg_Leave_Hero_Regions)
    call EnableTrigger(gg_trg_Camera_Tree)
    set udg_Target = udg_EM_Target
    call RemoveLocation(udg_TargetPoint)
    set udg_TargetPoint = GetUnitLoc(udg_Target)
    set udg_Camera = gg_cam_Dungeon_Camera
    if udg_EM_Boss[2] then
        call SetCameraBoundsToRect(gg_rct_Tier_3_Camera)
    else
        if udg_EM_Boss[1] then
            call SetCameraBoundsToRect(gg_rct_Tier_2_Camera)
        else
            call SetCameraBoundsToRect(gg_rct_Tier_1_Camera)
        endif
    endif
    call CameraSetSmoothingFactor(10.00)
    call CameraSetupApplyForceDuration(gg_cam_Dungeon_Camera, true, 0.00)
    call PanCameraToTimed(GetLocationX(udg_TargetPoint), GetLocationY(udg_TargetPoint), 0.0)
    call SelectUnitSingle(udg_EM_Target)
    set udg_CameraDistance = 1150
    set udg_CameraAngle = 275
    call UnitAddAbilityBJ(0x4130354D, udg_EM_Target)
endfunction


function InitTrig_Map_Enter takes nothing returns nothing
    set gg_trg_Map_Enter = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Map_Enter, udg_TeleportDialog)
    call TriggerAddCondition(gg_trg_Map_Enter, Condition(function Trig_Map_Enter_Conditions))
    call TriggerAddAction(gg_trg_Map_Enter, function Trig_Map_Enter_Actions)
endfunction
