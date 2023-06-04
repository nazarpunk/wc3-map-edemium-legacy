function Trig_Item_Type_System_Conditions takes nothing returns boolean
    return GetIssuedOrderIdBJ() != String2OrderIdBJ("creepheal") and GetItemType(GetOrderTargetItem()) == ITEM_TYPE_CHARGED
endfunction

function Trig_Item_Type_System_Actions takes nothing returns nothing
    if GetItemLevel(GetOrderTargetItem()) == 1 then
        set udg_ItemInt = 0
        set udg_Slot_Integer = 1
        loop
            exitwhen udg_Slot_Integer > 6
            if GetItemLevel(UnitItemInSlotBJ(GetTriggerUnit(), udg_Slot_Integer)) == 1 then
                set udg_ItemInt = (udg_ItemInt + 1)
            endif
            set udg_Slot_Integer = udg_Slot_Integer + 1
        endloop
        if udg_ItemInt > 0 then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 6
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                if GetItemLevel(UnitItemInSlotBJ(ArctUnit, bj_forLoopAIndex)) == 1 then
                    call UnitRemoveItemSwapped(UnitItemInSlotBJ(ArctUnit, bj_forLoopAIndex), ArctUnit)
                    call UnitAddItemSwapped(GetOrderTargetItem(), ArctUnit)
                endif
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        endif
    else
        if GetItemLevel(GetOrderTargetItem()) == 2 then
            set udg_ItemInt = 0
            set udg_Slot_Integer = 1
            loop
                exitwhen udg_Slot_Integer > 6
                if GetItemLevel(UnitItemInSlotBJ(GetTriggerUnit(), udg_Slot_Integer)) == 2 then
                    set udg_ItemInt = (udg_ItemInt + 1)
                endif
                set udg_Slot_Integer = udg_Slot_Integer + 1
            endloop
            if udg_ItemInt > 0 then
                set bj_forLoopAIndex = 1
                set bj_forLoopAIndexEnd = 6
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    if GetItemLevel(UnitItemInSlotBJ(ArctUnit, bj_forLoopAIndex)) == 2 then
                        call UnitRemoveItemSwapped(UnitItemInSlotBJ(ArctUnit, bj_forLoopAIndex), ArctUnit)
                        call UnitAddItemSwapped(GetOrderTargetItem(), ArctUnit)
                    endif
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
            endif
        else
            if GetItemLevel(GetOrderTargetItem()) == 3 then
                set udg_ItemInt = 0
                set udg_Slot_Integer = 1
                loop
                    exitwhen udg_Slot_Integer > 6
                    if GetItemLevel(UnitItemInSlotBJ(GetTriggerUnit(), udg_Slot_Integer)) == 3 then
                        set udg_ItemInt = (udg_ItemInt + 1)
                    endif
                    set udg_Slot_Integer = udg_Slot_Integer + 1
                endloop
                if udg_ItemInt > 0 then
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 6
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        if GetItemLevel(UnitItemInSlotBJ(ArctUnit, bj_forLoopAIndex)) == 3 then
                            call UnitRemoveItemSwapped(UnitItemInSlotBJ(ArctUnit, bj_forLoopAIndex), ArctUnit)
                            call UnitAddItemSwapped(GetOrderTargetItem(), ArctUnit)
                        endif
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                endif
            else
                if GetItemLevel(GetOrderTargetItem()) == 4 then
                    set udg_ItemInt = 0
                    set udg_Slot_Integer = 1
                    loop
                        exitwhen udg_Slot_Integer > 6
                        if GetItemLevel(UnitItemInSlotBJ(GetTriggerUnit(), udg_Slot_Integer)) == 4 then
                            set udg_ItemInt = (udg_ItemInt + 1)
                        endif
                        set udg_Slot_Integer = udg_Slot_Integer + 1
                    endloop
                    if udg_ItemInt > 0 then
                        set bj_forLoopAIndex = 1
                        set bj_forLoopAIndexEnd = 6
                        loop
                            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                            if GetItemLevel(UnitItemInSlotBJ(ArctUnit, bj_forLoopAIndex)) == 4 then
                                call UnitRemoveItemSwapped(UnitItemInSlotBJ(ArctUnit, bj_forLoopAIndex), ArctUnit)
                                call UnitAddItemSwapped(GetOrderTargetItem(), ArctUnit)
                            endif
                            set bj_forLoopAIndex = bj_forLoopAIndex + 1
                        endloop
                    endif
                endif
            endif
        endif
    endif
endfunction

function InitTrig_Item_Type_System takes nothing returns nothing
    set gg_trg_Item_Type_System = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Item_Type_System, ArctUnit, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Item_Type_System, Condition(function Trig_Item_Type_System_Conditions))
    call TriggerAddAction(gg_trg_Item_Type_System, function Trig_Item_Type_System_Actions)
endfunction
