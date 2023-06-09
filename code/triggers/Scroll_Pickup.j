function Trig_Scroll_Pickup_Actions takes nothing returns nothing
    if GetItemTypeId(GetManipulatedItem()) == 0x49303055 then
        call UnitAddAbilityBJ(0x41303648, GetTriggerUnit())
        call IssueTargetOrderBJ(GetTriggerUnit(), "lightningshield", GetTriggerUnit())
        call RemoveItem(GetManipulatedItem())
    else
        if GetItemTypeId(GetManipulatedItem()) == 0x49303131 then
            call UnitAddAbilityBJ(0x41303645, GetTriggerUnit())
            call IssueTargetOrderBJ(GetTriggerUnit(), "unholyfrenzy", GetTriggerUnit())
            call RemoveItem(GetManipulatedItem())
        else
            if GetItemTypeId(GetManipulatedItem()) == 0x49303143 then
                call UnitAddAbilityBJ(0x41303646, GetTriggerUnit())
                call IssueTargetOrderBJ(GetTriggerUnit(), "bloodlust", GetTriggerUnit())
                call StartTimerBJ(udg_ScrollTimer, false, 40.00)
                call EnableTrigger(gg_trg_Scroll_Periodic)
                call RemoveItem(GetManipulatedItem())
            endif
        endif
    endif
endfunction

function InitTrig_Scroll_Pickup takes nothing returns nothing
    set gg_trg_Scroll_Pickup = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Scroll_Pickup, ArctUnit, EVENT_UNIT_PICKUP_ITEM)
    call TriggerAddAction(gg_trg_Scroll_Pickup, function Trig_Scroll_Pickup_Actions)
endfunction
