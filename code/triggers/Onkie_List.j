
function Trig_Onkie_List_Func004C takes nothing returns boolean
    if(not(udg_CC_SecretUnlocked[udg_RandomNumber] == false))then
        return false
    endif
    return true
endfunction
function Trig_Onkie_List_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 20
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call RemoveItemFromStockBJ(udg_SecretsList[bj_forLoopAIndex], gg_unit_n009_0061)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_RandomNumber = GetRandomInt(1, 20)
    if(Trig_Onkie_List_Func004C())then
        call AddItemToStockBJ(udg_SecretsList[udg_RandomNumber], gg_unit_n009_0061, 1, 1)
    else
    endif
endfunction
function InitTrig_Onkie_List takes nothing returns nothing
    set gg_trg_Onkie_List = CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_Onkie_List, 300.00)
    call TriggerAddAction(gg_trg_Onkie_List, function Trig_Onkie_List_Actions)
endfunction