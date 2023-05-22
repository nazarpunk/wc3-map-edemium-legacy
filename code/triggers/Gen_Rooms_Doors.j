function Trig_Gen_Rooms_Doors_Func002Func009Func002Func002A takes nothing returns nothing
    call RemoveDestructable(GetEnumDestructable())
endfunction
function Trig_Gen_Rooms_Doors_Func002Func009Func002Func003C takes nothing returns boolean
    if(not(GetRandomInt(1, 20) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Rooms_Doors_Func002Func009Func002C takes nothing returns boolean
    if(not(AngleBetweenPoints(udg_D_Point1, udg_D_Point2) == 180.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Rooms_Doors_Func002Func009Func003Func002A takes nothing returns nothing
    call RemoveDestructable(GetEnumDestructable())
endfunction
function Trig_Gen_Rooms_Doors_Func002Func009Func003Func003C takes nothing returns boolean
    if(not(GetRandomInt(1, 20) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Rooms_Doors_Func002Func009Func003C takes nothing returns boolean
    if(not(AngleBetweenPoints(udg_D_Point1, udg_D_Point2) == 90.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Rooms_Doors_Func002Func009Func004Func002A takes nothing returns nothing
    call RemoveDestructable(GetEnumDestructable())
endfunction
function Trig_Gen_Rooms_Doors_Func002Func009Func004Func003C takes nothing returns boolean
    if(not(GetRandomInt(1, 20) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Rooms_Doors_Func002Func009Func004C takes nothing returns boolean
    if(not(AngleBetweenPoints(udg_D_Point1, udg_D_Point2) == 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Rooms_Doors_Func002Func009Func005Func002A takes nothing returns nothing
    call RemoveDestructable(GetEnumDestructable())
endfunction
function Trig_Gen_Rooms_Doors_Func002Func009Func005Func003C takes nothing returns boolean
    if(not(GetRandomInt(1, 20) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Rooms_Doors_Func002Func009Func005C takes nothing returns boolean
    if(not(AngleBetweenPoints(udg_D_Point1, udg_D_Point2) ==- 90.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Rooms_Doors_Func002Func009A takes nothing returns nothing
    set udg_D_Point2 = GetUnitLoc(GetEnumUnit())
    if(Trig_Gen_Rooms_Doors_Func002Func009Func002C())then
        set udg_D_PointOffset = OffsetLocation(udg_D_Point2, 400.00, 0)
        call EnumDestructablesInCircleBJ(256.00, udg_D_PointOffset, function Trig_Gen_Rooms_Doors_Func002Func009Func002Func002A)
        if(Trig_Gen_Rooms_Doors_Func002Func009Func002Func003C())then
            call CreateDestructableLoc(0x42303159, udg_D_PointOffset, 0.00, 1.60, 0)
        else
            call CreateDestructableLoc(0x4230314C, udg_D_PointOffset, 0.00, 1.60, 0)
        endif
        set udg_D_PointOffsetDoors = OffsetLocation(udg_D_PointOffset, 0.00, 150.00)
        call CreateDestructableLoc(udg_D_WallTierTypeDoor[3], udg_D_PointOffsetDoors, 0.00, 1.40, 0)
        call RemoveLocation(udg_D_PointOffsetDoors)
        set udg_D_PointOffsetDoors = OffsetLocation(udg_D_PointOffset, 0.00, - 200.00)
        call CreateDestructableLoc(udg_D_WallTierTypeDoor[4], udg_D_PointOffsetDoors, 0.00, 1.39, 0)
        call RemoveLocation(udg_D_PointOffsetDoors)
        call RemoveLocation(udg_D_PointOffset)
    else
    endif
    if(Trig_Gen_Rooms_Doors_Func002Func009Func003C())then
        set udg_D_PointOffset = OffsetLocation(udg_D_Point2, 0.00, - 400.00)
        call EnumDestructablesInCircleBJ(256.00, udg_D_PointOffset, function Trig_Gen_Rooms_Doors_Func002Func009Func003Func002A)
        if(Trig_Gen_Rooms_Doors_Func002Func009Func003Func003C())then
            call CreateDestructableLoc(0x4230315A, udg_D_PointOffset, 0.00, 1.60, 0)
        else
            call CreateDestructableLoc(0x4230314B, udg_D_PointOffset, 0.00, 1.60, 0)
        endif
        set udg_D_PointOffsetDoors = OffsetLocation(udg_D_PointOffset, 200.00, 0)
        call CreateDestructableLoc(udg_D_WallTierTypeDoor[2], udg_D_PointOffsetDoors, 0.00, 1.40, 0)
        call RemoveLocation(udg_D_PointOffsetDoors)
        set udg_D_PointOffsetDoors = OffsetLocation(udg_D_PointOffset, - 150.00, 0)
        call CreateDestructableLoc(udg_D_WallTierTypeDoor[1], udg_D_PointOffsetDoors, 0.00, 1.39, 0)
        call RemoveLocation(udg_D_PointOffsetDoors)
        call RemoveLocation(udg_D_PointOffset)
    else
    endif
    if(Trig_Gen_Rooms_Doors_Func002Func009Func004C())then
        set udg_D_PointOffset = OffsetLocation(udg_D_Point2, - 350.00, 0.00)
        call EnumDestructablesInCircleBJ(256.00, udg_D_PointOffset, function Trig_Gen_Rooms_Doors_Func002Func009Func004Func002A)
        if(Trig_Gen_Rooms_Doors_Func002Func009Func004Func003C())then
            call CreateDestructableLoc(0x42303159, udg_D_PointOffset, 0.00, 1.60, 0)
        else
            call CreateDestructableLoc(0x4230314C, udg_D_PointOffset, 0.00, 1.60, 0)
        endif
        set udg_D_PointOffsetDoors = OffsetLocation(udg_D_PointOffset, 0.00, 150.00)
        call CreateDestructableLoc(udg_D_WallTierTypeDoor[3], udg_D_PointOffsetDoors, 0.00, 1.40, 0)
        call RemoveLocation(udg_D_PointOffsetDoors)
        set udg_D_PointOffsetDoors = OffsetLocation(udg_D_PointOffset, 0.00, - 200.00)
        call CreateDestructableLoc(udg_D_WallTierTypeDoor[4], udg_D_PointOffsetDoors, 0.00, 1.39, 0)
        call RemoveLocation(udg_D_PointOffsetDoors)
        call RemoveLocation(udg_D_PointOffset)
    else
    endif
    if(Trig_Gen_Rooms_Doors_Func002Func009Func005C())then
        set udg_D_PointOffset = OffsetLocation(udg_D_Point2, 0.00, 350.00)
        call EnumDestructablesInCircleBJ(256.00, udg_D_PointOffset, function Trig_Gen_Rooms_Doors_Func002Func009Func005Func002A)
        if(Trig_Gen_Rooms_Doors_Func002Func009Func005Func003C())then
            call CreateDestructableLoc(0x4230315A, udg_D_PointOffset, 0.00, 1.60, 0)
        else
            call CreateDestructableLoc(0x4230314B, udg_D_PointOffset, 0.00, 1.60, 0)
        endif
        set udg_D_PointOffsetDoors = OffsetLocation(udg_D_PointOffset, 200.00, 0)
        call CreateDestructableLoc(udg_D_WallTierTypeDoor[2], udg_D_PointOffsetDoors, 0.00, 1.40, 0)
        call RemoveLocation(udg_D_PointOffsetDoors)
        set udg_D_PointOffsetDoors = OffsetLocation(udg_D_PointOffset, - 150.00, 0)
        call CreateDestructableLoc(udg_D_WallTierTypeDoor[1], udg_D_PointOffsetDoors, 0.00, 1.39, 0)
        call RemoveLocation(udg_D_PointOffsetDoors)
        call RemoveLocation(udg_D_PointOffset)
    else
    endif
    call RemoveLocation(udg_D_Point2)
endfunction
function Trig_Gen_Rooms_Doors_Func002A takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetEnumUnit())
    set udg_D_Pick2 = GetUnitsInRangeOfLocAll(800.00, GetUnitLoc(GetEnumUnit()))
    set udg_D_Pick3 = GetUnitsOfTypeIdAll(0x6830304C)
    call GroupRemoveGroup(udg_D_Pick3, udg_D_Pick2)
    call DestroyGroup(udg_D_Pick3)
    set udg_D_Pick3 = GetUnitsOfTypeIdAll(0x68303054)
    call GroupRemoveGroup(udg_D_Pick3, udg_D_Pick2)
    call DestroyGroup(udg_D_Pick3)
    call ForGroupBJ(GetRandomSubGroup(1, udg_D_Pick2), function Trig_Gen_Rooms_Doors_Func002Func009A)
    call RemoveLocation(udg_D_Point1)
    call DestroyGroup(udg_D_Pick2)
endfunction
function Trig_Gen_Rooms_Doors_Actions takes nothing returns nothing
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x68303054)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Rooms_Doors_Func002A)
    call DestroyGroup(udg_D_Pick)
    call StartTimerBJ(udg_D_Timer, false, 0.10)
endfunction
function InitTrig_Gen_Rooms_Doors takes nothing returns nothing
    set gg_trg_Gen_Rooms_Doors = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Rooms_Doors, function Trig_Gen_Rooms_Doors_Actions)
endfunction