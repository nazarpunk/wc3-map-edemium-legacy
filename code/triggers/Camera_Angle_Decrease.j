
function Trig_Camera_Angle_Decrease_Func001C takes nothing returns boolean
    if(not(R2I(udg_CameraTurn) > 0))then
        return false
    endif
    return true
endfunction
function Trig_Camera_Angle_Decrease_Actions takes nothing returns nothing
    if(Trig_Camera_Angle_Decrease_Func001C())then
        set udg_CameraTurn = (udg_CameraTurn - 20.00)
    else
    endif
endfunction
function InitTrig_Camera_Angle_Decrease takes nothing returns nothing
    set gg_trg_Camera_Angle_Decrease = CreateTrigger()
    call DisableTrigger(gg_trg_Camera_Angle_Decrease)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_Camera_Angle_Decrease, Player(0), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerAddAction(gg_trg_Camera_Angle_Decrease, function Trig_Camera_Angle_Decrease_Actions)
endfunction