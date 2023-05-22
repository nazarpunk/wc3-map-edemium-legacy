function Trig_Keeper_Appear_Func001C takes nothing returns boolean
    if(not(udg_CS_KeeperBool == false))then
        return false
    endif
    return true
endfunction
function Trig_Keeper_Appear_Actions takes nothing returns nothing
    if(Trig_Keeper_Appear_Func001C())then
        set udg_CS_KeeperBool = true
        call SetUnitVertexColorBJ(gg_unit_n006_0028, 100, 100, 100, 100.00)
        set udg_Transparent = 100.00
        call EnableTrigger(gg_trg_Keeper_Transparent)
        call EnableTrigger(gg_trg_Keeper_Look)
        call ShowUnitShow(gg_unit_n006_0028)
        call SetUnitAnimation(gg_unit_n006_0028, "Birth")
        call SetUnitFacingToFaceUnitTimed(gg_unit_n006_0028, udg_Arct, 1.00)
        call TriggerSleepAction(2.00)
        call ResetUnitAnimation(gg_unit_n006_0028)
    else
        call ShowUnitHide(gg_unit_n006_0028)
    endif
endfunction
function InitTrig_Keeper_Appear takes nothing returns nothing
    set gg_trg_Keeper_Appear = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Keeper_Appear, udg_CS_Timer)
    call TriggerAddAction(gg_trg_Keeper_Appear, function Trig_Keeper_Appear_Actions)
endfunction