
function Trig_Camera_Decrease_Func001C takes nothing returns boolean
    if(not(udg_CameraDistance > udg_CameraMin))then
        return false
    endif
    return true
endfunction
function Trig_Camera_Decrease_Actions takes nothing returns nothing
    if(Trig_Camera_Decrease_Func001C())then
        set udg_CameraDistance = (udg_CameraDistance - 100)
    else
    endif
endfunction
function InitTrig_Camera_Decrease takes nothing returns nothing
    set gg_trg_Camera_Decrease = CreateTrigger()
    call DisableTrigger(gg_trg_Camera_Decrease)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_Camera_Decrease, Player(0), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP)
    call TriggerAddAction(gg_trg_Camera_Decrease, function Trig_Camera_Decrease_Actions)
endfunction