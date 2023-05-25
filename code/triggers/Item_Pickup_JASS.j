function ItemPickup_FilterItem takes unit picker, item whichItem returns boolean
    return GetItemType(GetFilterItem()) == ITEM_TYPE_POWERUP
endfunction

function ItemPickup_EnumItems takes nothing returns nothing
    local item i = GetFilterItem()
    if GetWidgetLife(i) > 0.405 and ItemPickup_FilterItem(udg_ItemPickup_Unit[udg_ItemPickup_Index], i)then
        call UnitAddItem(udg_Arct, i)
        call SetUnitState(udg_Arct, UNIT_STATE_LIFE, (GetUnitState(udg_Arct, UNIT_STATE_LIFE) + 10.00))
    endif
    if udg_ART[1] > 0 then
        set udg_AbilityPower = (I2R(udg_ART[1]) * 1.00)
        call SetUnitState(udg_Arct, UNIT_STATE_MANA, (GetUnitState(udg_Arct, UNIT_STATE_MANA) + udg_AbilityPower))
    endif
    set i = null
endfunction

function ItemPickup_GetIndexByUnit takes unit whichUnit returns integer
    local integer index = 0
    loop
        exitwhen index == udg_ItemPickup_Max
        if udg_ItemPickup_Unit[index] == whichUnit then
            return index
        endif
        set index = index + 1
    endloop
    return - 1
endfunction

function ItemPickup_Clear takes unit whichUnit returns nothing
    local integer index = ItemPickup_GetIndexByUnit(whichUnit)
    if index !=- 1 then
        set udg_ItemPickup_Max = udg_ItemPickup_Max - 1
        set udg_ItemPickup_Unit[index] = udg_ItemPickup_Unit[udg_ItemPickup_Max]
        set udg_ItemPickup_Rect[index] = udg_ItemPickup_Rect[udg_ItemPickup_Max]
        call RemoveRect(udg_ItemPickup_Rect[udg_ItemPickup_Max])
        set udg_ItemPickup_Rect[udg_ItemPickup_Max] = null
        set udg_ItemPickup_Unit[udg_ItemPickup_Max] = null
        if udg_ItemPickup_Max == 0 then
            call PauseTimer(udg_ItemPickup_Timer)
        endif
    endif
endfunction

function ItemPickup_OnPeriodic takes nothing returns nothing
    local integer index = 0
    loop
        exitwhen index == udg_ItemPickup_Max
        if GetUnitTypeId(udg_ItemPickup_Unit[index]) == 0 then
            call ItemPickup_Clear(udg_ItemPickup_Unit[index])
        elseif not IsUnitType(udg_ItemPickup_Unit[index], UNIT_TYPE_DEAD)then
            call MoveRectTo(udg_ItemPickup_Rect[index], GetUnitX(udg_ItemPickup_Unit[index]), GetUnitY(udg_ItemPickup_Unit[index]))
            set udg_ItemPickup_Index = index
            call EnumItemsInRect(udg_ItemPickup_Rect[index], null, function ItemPickup_EnumItems)
        endif
        set index = index + 1
    endloop
endfunction

function ItemPickup_TriggerResponse takes nothing returns nothing
    call ItemPickup_Clear(udg_ItemPickup__Unit)
    if not udg_ItemPickup__AddUnit or GetUnitTypeId(udg_ItemPickup__Unit) == 0 or udg_ItemPickup__Radius < 0.00 then
        return
    endif
    if udg_ItemPickup_Max == 0 then
        call TimerStart(udg_ItemPickup_Timer, 0.2, true, function ItemPickup_OnPeriodic)
    endif
    set udg_ItemPickup_Unit[udg_ItemPickup_Max] = udg_ItemPickup__Unit
    set udg_ItemPickup_Rect[udg_ItemPickup_Max] = Rect(- udg_ItemPickup__Radius, - udg_ItemPickup__Radius, udg_ItemPickup__Radius, udg_ItemPickup__Radius)
    set udg_ItemPickup_Max = udg_ItemPickup_Max + 1
endfunction

function InitTrig_Item_Pickup_JASS takes nothing returns nothing
    set gg_trg_Item_Pickup_JASS = CreateTrigger()
    call TriggerAddAction(gg_trg_Item_Pickup_JASS, function ItemPickup_TriggerResponse)
endfunction
