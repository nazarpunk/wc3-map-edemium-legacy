
function Trig_Trees_Camera_Off_Func009Func002Func002Func005Func004Func002C takes nothing returns boolean
    if(not(udg_EM_BossCreate[2] == true))then
        return false
    endif
    return true
endfunction
function Trig_Trees_Camera_Off_Func009Func002Func002Func005Func004C takes nothing returns boolean
    if(not(udg_EM_BossCreate[3] == true))then
        return false
    endif
    return true
endfunction
function Trig_Trees_Camera_Off_Func009Func002Func002Func005Func006C takes nothing returns boolean
    if(not(udg_ER_Logic == true))then
        return false
    endif
    return true
endfunction
function Trig_Trees_Camera_Off_Func009Func002Func002Func005C takes nothing returns boolean
    if(not(udg_EM_BossRoom == true))then
        return false
    endif
    return true
endfunction
function Trig_Trees_Camera_Off_Func009Func002Func002C takes nothing returns boolean
    if(not(udg_CS_Bool == true))then
        return false
    endif
    return true
endfunction
function Trig_Trees_Camera_Off_Func009Func002C takes nothing returns boolean
    if(not(udg_OnkieRoom == true))then
        return false
    endif
    return true
endfunction
function Trig_Trees_Camera_Off_Func009C takes nothing returns boolean
    if(not(udg_EnchantingRoom == true))then
        return false
    endif
    return true
endfunction
function Trig_Trees_Camera_Off_Func018C takes nothing returns boolean
    if(not(udg_Tutorial[3] == true))then
        return false
    endif
    return true
endfunction
function Trig_Trees_Camera_Off_Actions takes nothing returns nothing
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 1.50, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
    call CameraSetSmoothingFactorBJ(0.00)
    call SelectUnitSingle(udg_Arct)
    call ClearTextMessagesBJ(GetPlayersAll())
    call DisableTrigger(gg_trg_Camera_Tree)
    call EnableTrigger(gg_trg_Camera_Fix)
    call EnableTrigger(gg_trg_Leave_Hero_Regions)
    call AddUnitAnimationPropertiesBJ(false, "gold", gg_unit_H000_0004)
    if(Trig_Trees_Camera_Off_Func009C())then
        call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Cavern)
        set udg_Point = GetRectCenter(gg_rct_Enchanting_Room_Enter)
        set udg_Camera = gg_cam_Enchanting_Cavern
    else
        if(Trig_Trees_Camera_Off_Func009Func002C())then
            call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Onkie)
            set udg_Point = GetRectCenter(gg_rct_Onkie_Room_Enter)
            set udg_Camera = gg_cam_Onkie_Room
        else
            call SetCameraBoundsToRect(GetPlayableMapRect())
            if(Trig_Trees_Camera_Off_Func009Func002Func002C())then
                call ConditionalTriggerExecute(gg_trg_Coliseum_Start)
                set udg_Point = GetRectCenter(gg_rct_Coliseum_Enter)
                call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 3.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
            else
                if(Trig_Trees_Camera_Off_Func009Func002Func002Func005C())then
                    call SetCameraBoundsToRect(GetPlayableMapRect())
                    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 0.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
                    set udg_Point = GetRectCenter(gg_rct_Boss_Room_Enter)
                    if(Trig_Trees_Camera_Off_Func009Func002Func002Func005Func004C())then
                        call RemoveLocation(udg_Point)
                        set udg_Point = GetRectCenter(gg_rct_Boss_3_Room_Enter)
                        call EnableTrigger(gg_trg_Camera_Boss)
                    else
                        call EnableTrigger(gg_trg_Camera_Hero)
                        if(Trig_Trees_Camera_Off_Func009Func002Func002Func005Func004Func002C())then
                            call RemoveLocation(udg_Point)
                            set udg_Point = GetRectCenter(gg_rct_Boss_2_Room_Enter)
                        else
                        endif
                    endif
                    call DisableTrigger(gg_trg_Camera_Fix)
                else
                    if(Trig_Trees_Camera_Off_Func009Func002Func002Func005Func006C())then
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
    if(Trig_Trees_Camera_Off_Func018C())then
        call ConditionalTriggerExecute(gg_trg_Tutorial02)
    else
    endif
    call DisableTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Trees_Camera_Off takes nothing returns nothing
    set gg_trg_Trees_Camera_Off = CreateTrigger()
    call DisableTrigger(gg_trg_Trees_Camera_Off)
    call TriggerRegisterPlayerEventEndCinematic(gg_trg_Trees_Camera_Off, Player(0))
    call TriggerAddAction(gg_trg_Trees_Camera_Off, function Trig_Trees_Camera_Off_Actions)
endfunction