function Trig_Camera_Disable_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Camera_Fix)
    call DisableTrigger(gg_trg_Camera_Hero)
    call DisableTrigger(gg_trg_Camera_Tree)
    call SetCameraBoundsToRectForPlayerBJ(Player(0), GetPlayableMapRect())
    call CameraSetupApplyForceDuration(gg_cam_Center, true, 0.00)
endfunction

function InitTrig_Camera_Disable takes nothing returns nothing
    set gg_trg_Camera_Disable = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Camera_Disable, Player(0), "cd", true)
    call TriggerAddAction(gg_trg_Camera_Disable, function Trig_Camera_Disable_Actions)
endfunction
