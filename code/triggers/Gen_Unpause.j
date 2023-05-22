
function Trig_Gen_Unpause_Actions takes nothing returns nothing
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 3.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 100.00, 100.00, 100.00, 0.00)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_ANGLE_OF_ATTACK, 300.00, 0.00)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_TARGET_DISTANCE, 3500.00, 0.00)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_ROTATION, 90.00, 0.00)
    call PanCameraToTimedLocForPlayer(Player(0), GetRectCenter(gg_rct_Dungeon_Center), 0)
    call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Human\\ReviveHuman\\ReviveHuman.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    set udg_Transparent = 100.00
    call EnableTrigger(gg_trg_Edemium_Transparent)
    call StartTimerBJ(udg_PauseTimer, false, 3.00)
endfunction

function InitTrig_Gen_Unpause takes nothing returns nothing
    set gg_trg_Gen_Unpause = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Gen_Unpause, udg_D_TimerFinal)
    call TriggerAddAction(gg_trg_Gen_Unpause, function Trig_Gen_Unpause_Actions)
endfunction
