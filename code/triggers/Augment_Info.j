
function Trig_Augment_Info_Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_n009_0061))then
        return false
    endif
    return true
endfunction
function Trig_Augment_Info_Func001Func007Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h012_0013))then
        return false
    endif
    return true
endfunction
function Trig_Augment_Info_Func001Func007Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h012_0011))then
        return false
    endif
    return true
endfunction
function Trig_Augment_Info_Func001Func007C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h012_0012))then
        return false
    endif
    return true
endfunction
function Trig_Augment_Info_Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303132))then
        return false
    endif
    return true
endfunction
function Trig_Augment_Info_Actions takes nothing returns nothing
    if(Trig_Augment_Info_Func001C())then
        set udg_Target = GetTriggerUnit()
        call RemoveLocation(udg_TargetPoint)
        set udg_TargetPoint = GetUnitLoc(udg_Target)
        call ClearTextMessagesBJ(GetPlayersAll())
        set udg_AugmentValue = GetUnitUserData(udg_Target)
        if(Trig_Augment_Info_Func001Func007C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Повышает ловкость на |cFF00D8001|r.")
        else
            if(Trig_Augment_Info_Func001Func007Func001C())then
                call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Повышает стойкость на |cFF00D8001|r.")
            else
                if(Trig_Augment_Info_Func001Func007Func001Func001C())then
                    call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Повышает мудрость на |cFF00D8001|r.")
                else
                endif
            endif
        endif
        call DisplayTimedTextToForce(GetPlayersAll(), 5.00, ("Стоимость: " + I2S(udg_AugmentCost[udg_AugmentValue])))
    else
        if(Trig_Augment_Info_Func001Func001C())then
            call ClearTextMessagesBJ(GetPlayersAll())
        else
        endif
    endif
endfunction
function InitTrig_Augment_Info takes nothing returns nothing
    set gg_trg_Augment_Info = CreateTrigger()
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Augment_Info, Player(0), true)
    call TriggerAddAction(gg_trg_Augment_Info, function Trig_Augment_Info_Actions)
endfunction