
function Trig_Camera_Boss_Actions takes nothing returns nothing
    call SetCameraTargetController(udg_Arct, 0, 0, false)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_TARGET_DISTANCE, I2R(udg_CameraDistance), 0.32)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_ANGLE_OF_ATTACK, 316.00, 0.32)
    set udg_Point = GetUnitLoc(udg_Arct)
    set udg_Point2 = GetUnitLoc(udg_EM_BossUnit)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_ROTATION, AngleBetweenPoints(udg_Point, udg_Point2), 0.32)
    call RemoveLocation(udg_Point)
    call RemoveLocation(udg_Point2)
endfunction
function InitTrig_Camera_Boss takes nothing returns nothing
    set gg_trg_Camera_Boss = CreateTrigger()
    call DisableTrigger(gg_trg_Camera_Boss)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Camera_Boss, 0.04)
    call TriggerAddAction(gg_trg_Camera_Boss, function Trig_Camera_Boss_Actions)
endfunction