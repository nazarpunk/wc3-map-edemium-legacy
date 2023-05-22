
function Trig_Camera_Angle_Increase_Func001C takes nothing returns boolean
    if(not(R2I(udg_CameraTurn) < 360))then
        return false
    endif
    return true
endfunction
function Trig_Camera_Angle_Increase_Actions takes nothing returns nothing
    if(Trig_Camera_Angle_Increase_Func001C())then
        set udg_CameraTurn = (udg_CameraTurn + 20.00)
    else
    endif
endfunction
function InitTrig_Camera_Angle_Increase takes nothing returns nothing
    set gg_trg_Camera_Angle_Increase = CreateTrigger()
    call DisableTrigger(gg_trg_Camera_Angle_Increase)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_Camera_Angle_Increase, Player(0), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_RIGHT)
    call TriggerAddAction(gg_trg_Camera_Angle_Increase, function Trig_Camera_Angle_Increase_Actions)
endfunction