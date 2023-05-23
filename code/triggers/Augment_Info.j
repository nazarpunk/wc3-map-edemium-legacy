function Trig_Augment_Info_Actions takes nothing returns nothing
    if GetUnitTypeId(GetTriggerUnit()) == 0x68303132 then
        set udg_Target = GetTriggerUnit()
        call RemoveLocation(udg_TargetPoint)
        set udg_TargetPoint = GetUnitLoc(udg_Target)
        call ClearTextMessagesBJ(GetPlayersAll())
        set udg_AugmentValue = GetUnitUserData(udg_Target)
        if GetTriggerUnit() == gg_unit_h012_0012 then
            call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Повышает ловкость на |cFF00D8001|r.")
        else
            if GetTriggerUnit() == gg_unit_h012_0011 then
                call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Повышает стойкость на |cFF00D8001|r.")
            else
                if GetTriggerUnit() == gg_unit_h012_0013 then
                    call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Повышает мудрость на |cFF00D8001|r.")
                endif
            endif
        endif
        call DisplayTimedTextToForce(GetPlayersAll(), 5.00, ("Стоимость: " + I2S(udg_AugmentCost[udg_AugmentValue])))
    else
        if GetTriggerUnit() == gg_unit_n009_0061 then
            call ClearTextMessagesBJ(GetPlayersAll())
        endif
    endif
endfunction

function InitTrig_Augment_Info takes nothing returns nothing
    set gg_trg_Augment_Info = CreateTrigger()
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Augment_Info, Player(0), true)
    call TriggerAddAction(gg_trg_Augment_Info, function Trig_Augment_Info_Actions)
endfunction
