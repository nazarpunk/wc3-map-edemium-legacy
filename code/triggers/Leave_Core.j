
function Trig_Leave_Core_Conditions takes nothing returns boolean
    return GetLeavingUnit() == ArctUnit
endfunction

function Trig_Leave_Core_Actions takes nothing returns nothing
    call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Workshop)
    set udg_Camera = gg_cam_Camera_Workshop
    call CameraSetupApplyForceDuration(udg_Camera, true, 0.00)
    call EnableTrigger(gg_trg_Item_Pickup)
    call DisableTrigger(gg_trg_Core_Item_Pickup)
    if udg_AutosaveBool then
        set udg_AutosaveBool = false
        call EnableTrigger(gg_trg_Core_Autosave)
        set udg_Autosave = GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_GOLD)
        call SetPlayerStateBJ(Player(0), PLAYER_STATE_RESOURCE_GOLD, 15000)
    endif
    call ClearTextMessagesBJ(GetPlayersAll())
endfunction

function InitTrig_Leave_Core takes nothing returns nothing
    set gg_trg_Leave_Core = CreateTrigger()
    call TriggerRegisterLeaveRectSimple(gg_trg_Leave_Core, gg_rct_Workshop_Core)
    call TriggerAddCondition(gg_trg_Leave_Core, Condition(function Trig_Leave_Core_Conditions))
    call TriggerAddAction(gg_trg_Leave_Core, function Trig_Leave_Core_Actions)
endfunction
