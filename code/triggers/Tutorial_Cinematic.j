
function Trig_Tutorial_Cinematic_Actions takes nothing returns nothing
    call StopMusicBJ(false)
    call ClearMapMusicBJ()
    set udg_Transparent = 0.00
    call SetUnitPositionLocFacingBJ(gg_unit_H000_0004, udg_CinematicPosition, 90.00)
    call CameraSetSmoothingFactorBJ(0.00)
    call CinematicModeBJ(true, GetPlayersAll())
    call TriggerSleepAction(3.00)
    call SetCameraBoundsToRect(GetPlayableMapRect())
    call CameraSetupApplyForceDuration(gg_cam_Camera02, true, 0.00)
    call PlaySoundBJ(gg_snd_EdemiumHit)
    call TriggerSleepAction(0.25)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 0.00, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 100.00, 100.00, 100.00, 0)
    call TriggerSleepAction(6.00)
    call CameraSetupApplyForceDuration(gg_cam_Camera03, true, 0.00)
    call TriggerSleepAction(4.00)
    call SetUnitTimeScalePercent(udg_Arct, 25.00)
    set udg_Point = GetRectCenter(gg_rct_Edemium)
    call IssuePointOrderLocBJ(udg_Arct, "move", udg_Point)
    call RemoveLocation(udg_Point)
    call TriggerSleepAction(1.60)
    call CameraSetupApplyForceDuration(gg_cam_Camera01, true, 0.00)
    call TriggerSleepAction(3.00)
    call CameraSetupApplyForceDuration(gg_cam_Camera02, true, 0.00)
    call PlaySoundBJ(gg_snd_EdemiumRiser)
    call SetUnitTimeScalePercent(udg_Arct, 10.00)
    call SetUnitAnimation(udg_Arct, "spell")
    call CameraSetupApplyForceDuration(gg_cam_Camera04, true, 20.00)
    call TriggerSleepAction(4.00)
    call EnableTrigger(gg_trg_Cinematic_Transparent)
    call TriggerSleepAction(3.50)
    call CameraSetupApplyForceDuration(gg_cam_Camera05, true, 0.00)
    call TriggerSleepAction(4.00)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 0.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 100.00, 100.00, 100.00, 0)
    call DestroyTrigger(gg_trg_Cinematic_Transparent)
    call TriggerSleepAction(3.00)
    call ConditionalTriggerExecute(gg_trg_Music_Edemium)
    call DestroyFogModifier(GetLastCreatedFogModifier())
    call FogEnableOn()
    call FogMaskEnableOn()
    call SetUnitVertexColorBJ(udg_Arct, 100, 100, 100, 0.00)
    call SetUnitTimeScalePercent(udg_Arct, 100.00)
    call TriggerExecute(gg_trg_Map_Enter)
    call EnableTrigger(gg_trg_Enter_Dialog)
    call EnableTrigger(gg_trg_Enter_Regions)
    call CinematicModeBJ(false, bj_FORCE_PLAYER[0])
    set udg_TutorialHint[1] = false
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Tutorial_Cinematic takes nothing returns nothing
    set gg_trg_Tutorial_Cinematic = CreateTrigger()
    call TriggerAddAction(gg_trg_Tutorial_Cinematic, function Trig_Tutorial_Cinematic_Actions)
endfunction
