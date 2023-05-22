
function Trig_Leave_Hero_Regions_Conditions takes nothing returns boolean
    if(not(GetLeavingUnit() == udg_Arct))then
        return false
    endif
    return true
endfunction

function Trig_Leave_Hero_Regions_Actions takes nothing returns nothing
    call SetCameraBoundsToRect(gg_rct_Camera_Bound_Portal)
    call AddUnitAnimationPropertiesBJ(false, "gold", gg_unit_H000_0004)
    set udg_Camera = gg_cam_Camera_Portal_Room
    call CameraSetupApplyForceDuration(udg_Camera, true, 0.00)
    call DisableTrigger(gg_trg_Trees_Choose_ESC)
endfunction

function InitTrig_Leave_Hero_Regions takes nothing returns nothing
    set gg_trg_Leave_Hero_Regions = CreateTrigger()
    call TriggerRegisterLeaveRectSimple(gg_trg_Leave_Hero_Regions, gg_rct_Training)
    call TriggerRegisterLeaveRectSimple(gg_trg_Leave_Hero_Regions, gg_rct_Portal)
    call TriggerAddCondition(gg_trg_Leave_Hero_Regions, Condition(function Trig_Leave_Hero_Regions_Conditions))
    call TriggerAddAction(gg_trg_Leave_Hero_Regions, function Trig_Leave_Hero_Regions_Actions)
endfunction
