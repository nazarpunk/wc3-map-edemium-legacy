function Trig_Gen_Hall_Walls_Func002A takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetEnumUnit())
    set udg_D_Pick2 = GetUnitsInRangeOfLocAll(1200.00, udg_D_Point1)
    set udg_D_Pick3 = GetUnitsOfTypeIdAll(0x68303054)
    call GroupRemoveGroup(udg_D_Pick3, udg_D_Pick2)
    call DestroyGroup(udg_D_Pick3)
    if CountUnitsInGroup(udg_D_Pick2) == 9 then
        set udg_RandomNumber = GetRandomInt(1, 2)
        if udg_RandomNumber == 1 then
            set udg_D_PointOffset = OffsetLocation(udg_D_Point1, 400.00, 0)
            call CreateDestructableLoc(udg_D_WallTierType[2], udg_D_PointOffset, 0.00, 1.40, 0)
            call RemoveLocation(udg_D_PointOffset)
        endif
        if udg_RandomNumber == 2 then
            set udg_D_PointOffset = OffsetLocation(udg_D_Point1, 0.00, - 400.00)
            call CreateDestructableLoc(udg_D_WallTierType[4], udg_D_PointOffset, 0.00, 1.40, 0)
            call RemoveLocation(udg_D_PointOffset)
        endif
    endif
    call DestroyGroup(udg_D_Pick2)
    call RemoveLocation(udg_D_Point1)
endfunction

function Trig_Gen_Hall_Walls_Actions takes nothing returns nothing
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304D)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Hall_Walls_Func002A)
    call DestroyGroup(udg_D_Pick)
    call ConditionalTriggerExecute(gg_trg_Gen_Tiles)
endfunction

function InitTrig_Gen_Hall_Walls takes nothing returns nothing
    set gg_trg_Gen_Hall_Walls = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Hall_Walls, function Trig_Gen_Hall_Walls_Actions)
endfunction
