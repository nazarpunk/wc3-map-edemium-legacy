function Trig_Camera_Hero_Actions takes nothing returns nothing
    call SetCameraTargetController(udg_Arct, 0, 0, false)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_TARGET_DISTANCE, I2R(udg_CameraDistance), 0.32)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_ANGLE_OF_ATTACK, I2R(udg_CameraAngle), 0.32)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_ROTATION, udg_CameraTurn, 0.32)
endfunction

function InitTrig_Camera_Hero takes nothing returns nothing
    set gg_trg_Camera_Hero = CreateTrigger()
    call DisableTrigger(gg_trg_Camera_Hero)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Camera_Hero, 0.32)
    call TriggerAddAction(gg_trg_Camera_Hero, function Trig_Camera_Hero_Actions)
endfunction