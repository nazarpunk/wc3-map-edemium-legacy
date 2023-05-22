
function Trig_Camera_Increase_Func001C takes nothing returns boolean
    if(not(udg_CameraDistance < udg_CameraMax))then
        return false
    endif
    return true
endfunction

function Trig_Camera_Increase_Actions takes nothing returns nothing
    if(Trig_Camera_Increase_Func001C())then
        set udg_CameraDistance = (udg_CameraDistance + 100)
    else
    endif
endfunction

function InitTrig_Camera_Increase takes nothing returns nothing
    set gg_trg_Camera_Increase = CreateTrigger()
    call DisableTrigger(gg_trg_Camera_Increase)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_Camera_Increase, Player(0), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_DOWN)
    call TriggerAddAction(gg_trg_Camera_Increase, function Trig_Camera_Increase_Actions)
endfunction
