
function Trig_Camera_Tree_Actions takes nothing returns nothing
    call PanCameraToTimed(GetLocationX(udg_TargetPoint), GetLocationY(udg_TargetPoint), 0.32)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_TARGET_DISTANCE, I2R(udg_CameraDistance), 0.32)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_ANGLE_OF_ATTACK, I2R(udg_CameraAngle), 0.32)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_ROTATION, 90.00, 0.32)
endfunction
function InitTrig_Camera_Tree takes nothing returns nothing
    set gg_trg_Camera_Tree = CreateTrigger()
    call DisableTrigger(gg_trg_Camera_Tree)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Camera_Tree, 0.04)
    call TriggerAddAction(gg_trg_Camera_Tree, function Trig_Camera_Tree_Actions)
endfunction