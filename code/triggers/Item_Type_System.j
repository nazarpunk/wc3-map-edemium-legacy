
function Trig_Item_Type_System_Conditions takes nothing returns boolean
    if(not(GetIssuedOrderIdBJ() != String2OrderIdBJ("creepheal")))then
        return false
    endif
    if(not(GetItemType(GetOrderTargetItem()) == ITEM_TYPE_CHARGED))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Func004Func001Func001Func001Func002Func001C takes nothing returns boolean
    if(not(GetItemLevel(UnitItemInSlotBJ(GetTriggerUnit(), udg_Slot_Integer)) == 4))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Func004Func001Func001Func001Func003Func002Func001C takes nothing returns boolean
    if(not(GetItemLevel(UnitItemInSlotBJ(udg_Arct, bj_forLoopAIndex)) == 4))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Func004Func001Func001Func001Func003C takes nothing returns boolean
    if(not(udg_ItemInt > 0))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Func004Func001Func001Func001C takes nothing returns boolean
    if(not(GetItemLevel(GetOrderTargetItem()) == 4))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Func004Func001Func001Func003Func001C takes nothing returns boolean
    if(not(GetItemLevel(UnitItemInSlotBJ(GetTriggerUnit(), udg_Slot_Integer)) == 3))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Func004Func001Func001Func004Func002Func001C takes nothing returns boolean
    if(not(GetItemLevel(UnitItemInSlotBJ(udg_Arct, bj_forLoopAIndex)) == 3))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Func004Func001Func001Func004C takes nothing returns boolean
    if(not(udg_ItemInt > 0))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Func004Func001Func001C takes nothing returns boolean
    if(not(GetItemLevel(GetOrderTargetItem()) == 3))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Func004Func001Func003Func001C takes nothing returns boolean
    if(not(GetItemLevel(UnitItemInSlotBJ(GetTriggerUnit(), udg_Slot_Integer)) == 2))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Func004Func001Func004Func002Func001C takes nothing returns boolean
    if(not(GetItemLevel(UnitItemInSlotBJ(udg_Arct, bj_forLoopAIndex)) == 2))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Func004Func001Func004C takes nothing returns boolean
    if(not(udg_ItemInt > 0))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Func004Func001C takes nothing returns boolean
    if(not(GetItemLevel(GetOrderTargetItem()) == 2))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Func004Func003Func001C takes nothing returns boolean
    if(not(GetItemLevel(UnitItemInSlotBJ(GetTriggerUnit(), udg_Slot_Integer)) == 1))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Func004Func004Func002Func001C takes nothing returns boolean
    if(not(GetItemLevel(UnitItemInSlotBJ(udg_Arct, bj_forLoopAIndex)) == 1))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Func004Func004C takes nothing returns boolean
    if(not(udg_ItemInt > 0))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Func004C takes nothing returns boolean
    if(not(GetItemLevel(GetOrderTargetItem()) == 1))then
        return false
    endif
    return true
endfunction

function Trig_Item_Type_System_Actions takes nothing returns nothing
    if(Trig_Item_Type_System_Func004C())then
        set udg_ItemInt = 0
        set udg_Slot_Integer = 1
        loop
            exitwhen udg_Slot_Integer > 6
            if(Trig_Item_Type_System_Func004Func003Func001C())then
                set udg_ItemInt = (udg_ItemInt + 1)
            endif
            set udg_Slot_Integer = udg_Slot_Integer + 1
        endloop
        if(Trig_Item_Type_System_Func004Func004C())then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 6
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                if(Trig_Item_Type_System_Func004Func004Func002Func001C())then
                    call UnitRemoveItemSwapped(UnitItemInSlotBJ(udg_Arct, bj_forLoopAIndex), udg_Arct)
                    call UnitAddItemSwapped(GetOrderTargetItem(), udg_Arct)
                endif
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        endif
    else
        if(Trig_Item_Type_System_Func004Func001C())then
            set udg_ItemInt = 0
            set udg_Slot_Integer = 1
            loop
                exitwhen udg_Slot_Integer > 6
                if(Trig_Item_Type_System_Func004Func001Func003Func001C())then
                    set udg_ItemInt = (udg_ItemInt + 1)
                endif
                set udg_Slot_Integer = udg_Slot_Integer + 1
            endloop
            if(Trig_Item_Type_System_Func004Func001Func004C())then
                set bj_forLoopAIndex = 1
                set bj_forLoopAIndexEnd = 6
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    if(Trig_Item_Type_System_Func004Func001Func004Func002Func001C())then
                        call UnitRemoveItemSwapped(UnitItemInSlotBJ(udg_Arct, bj_forLoopAIndex), udg_Arct)
                        call UnitAddItemSwapped(GetOrderTargetItem(), udg_Arct)
                    endif
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
            endif
        else
            if(Trig_Item_Type_System_Func004Func001Func001C())then
                set udg_ItemInt = 0
                set udg_Slot_Integer = 1
                loop
                    exitwhen udg_Slot_Integer > 6
                    if(Trig_Item_Type_System_Func004Func001Func001Func003Func001C())then
                        set udg_ItemInt = (udg_ItemInt + 1)
                    endif
                    set udg_Slot_Integer = udg_Slot_Integer + 1
                endloop
                if(Trig_Item_Type_System_Func004Func001Func001Func004C())then
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 6
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        if(Trig_Item_Type_System_Func004Func001Func001Func004Func002Func001C())then
                            call UnitRemoveItemSwapped(UnitItemInSlotBJ(udg_Arct, bj_forLoopAIndex), udg_Arct)
                            call UnitAddItemSwapped(GetOrderTargetItem(), udg_Arct)
                        endif
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                endif
            else
                if(Trig_Item_Type_System_Func004Func001Func001Func001C())then
                    set udg_ItemInt = 0
                    set udg_Slot_Integer = 1
                    loop
                        exitwhen udg_Slot_Integer > 6
                        if(Trig_Item_Type_System_Func004Func001Func001Func001Func002Func001C())then
                            set udg_ItemInt = (udg_ItemInt + 1)
                        endif
                        set udg_Slot_Integer = udg_Slot_Integer + 1
                    endloop
                    if(Trig_Item_Type_System_Func004Func001Func001Func001Func003C())then
                        set bj_forLoopAIndex = 1
                        set bj_forLoopAIndexEnd = 6
                        loop
                            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                            if(Trig_Item_Type_System_Func004Func001Func001Func001Func003Func002Func001C())then
                                call UnitRemoveItemSwapped(UnitItemInSlotBJ(udg_Arct, bj_forLoopAIndex), udg_Arct)
                                call UnitAddItemSwapped(GetOrderTargetItem(), udg_Arct)
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
    call TriggerRegisterUnitEvent(gg_trg_Item_Type_System, gg_unit_H000_0004, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Item_Type_System, Condition(function Trig_Item_Type_System_Conditions))
    call TriggerAddAction(gg_trg_Item_Type_System, function Trig_Item_Type_System_Actions)
endfunction
