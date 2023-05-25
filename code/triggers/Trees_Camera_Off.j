function Trig_Trees_Camera_Off_Actions takes nothing returns nothing
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 1.50, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
    call CameraSetSmoothingFactorBJ(0.00)
    call SelectUnitSingle(udg_Arct)
    call ClearTextMessagesBJ(GetPlayersAll())
    call DisableTrigger(gg_trg_Camera_Tree)
    call EnableTrigger(gg_trg_Camera_Fix)
    call EnableTrigger(gg_trg_Leave_Hero_Regions)
    call AddUnitAnimationPropertiesBJ(false, "gold", gg_unit_H000_0004)
    if udg_EnchantingRoom then
        call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Cavern)
        set udg_Point = GetRectCenter(gg_rct_Enchanting_Room_Enter)
        set udg_Camera = gg_cam_Enchanting_Cavern
    else
        if udg_OnkieRoom then
            call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Onkie)
            set udg_Point = GetRectCenter(gg_rct_Onkie_Room_Enter)
            set udg_Camera = gg_cam_Onkie_Room
        else
            call SetCameraBoundsToRect(bj_mapInitialPlayableArea)
            if udg_CS_Bool then
                call ConditionalTriggerExecute(gg_trg_Coliseum_Start)
                set udg_Point = GetRectCenter(gg_rct_Coliseum_Enter)
                call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 3.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
            else
                if udg_EM_BossRoom then
                    call SetCameraBoundsToRect(bj_mapInitialPlayableArea)
                    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 0.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
                    set udg_Point = GetRectCenter(gg_rct_Boss_Room_Enter)
                    if udg_EM_BossCreate[3] then
                        call RemoveLocation(udg_Point)
                        set udg_Point = GetRectCenter(gg_rct_Boss_3_Room_Enter)
                        call EnableTrigger(gg_trg_Camera_Boss)
                    else
                        call EnableTrigger(gg_trg_Camera_Hero)
                        if udg_EM_BossCreate[2] then
                            call RemoveLocation(udg_Point)
                            set udg_Point = GetRectCenter(gg_rct_Boss_2_Room_Enter)
                        endif
                    endif
                    call DisableTrigger(gg_trg_Camera_Fix)
                else
                    if udg_ER_Logic then
                        set udg_Point = GetRectCenter(gg_rct_Arena_Enter)
                        call EnableTrigger(gg_trg_Camera_Hero)
                        call DisableTrigger(gg_trg_Camera_Fix)
                    else
                        call SetCameraBoundsToRect(gg_rct_Camera_Bound_Portal)
                        set udg_Point = GetRectCenter(gg_rct_Trees_Leave)
                        set udg_Camera = gg_cam_Camera_Portal_Room
                    endif
                endif
            endif
        endif
    endif
    call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
    call SetTerrainFogExBJ(0, 1100.00, 15000.00, 0.50, 0.00, 20.00, 100)
    call SetUnitPositionLoc(udg_Arct, udg_Point)
    call RemoveLocation(udg_Point)
    call CameraSetupApplyForceDuration(udg_Camera, true, 0.00)
    set udg_CameraDistance = 1700
    set udg_CameraAngle = 300
    call TriggerSleepAction(0.10)
    if udg_Tutorial[3] then
        call ConditionalTriggerExecute(gg_trg_Tutorial02)
    endif
    call DisableTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Trees_Camera_Off takes nothing returns nothing
    set gg_trg_Trees_Camera_Off = CreateTrigger()
    call DisableTrigger(gg_trg_Trees_Camera_Off)
    call TriggerRegisterPlayerEventEndCinematic(gg_trg_Trees_Camera_Off, Player(0))
    call TriggerAddAction(gg_trg_Trees_Camera_Off, function Trig_Trees_Camera_Off_Actions)
endfunction
