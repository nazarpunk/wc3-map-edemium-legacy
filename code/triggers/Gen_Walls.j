function Trig_Gen_Walls_Func005Func009A takes nothing returns nothing
    if CountUnitsInGroup(udg_D_Pick) != 0 then
        set udg_D_Point2 = GetUnitLoc(GetEnumUnit())
        if AngleBetweenPoints(udg_D_Point1, udg_D_Point2) == 180.00 then
            set udg_D_PointOffset = OffsetLocation(udg_D_Point2, 400.00, 0)
            call CreateDestructableLoc(udg_D_WallTierType[2], udg_D_PointOffset, 0.00, 1.40, 0)
            call RemoveLocation(udg_D_PointOffset)
        endif
        if AngleBetweenPoints(udg_D_Point1, udg_D_Point2) == 90.00 then
            set udg_D_PointOffset = OffsetLocation(udg_D_Point2, 0.00, - 400.00)
            call CreateDestructableLoc(udg_D_WallTierType[4], udg_D_PointOffset, 0.00, 1.40, 0)
            call RemoveLocation(udg_D_PointOffset)
        endif
        if AngleBetweenPoints(udg_D_Point1, udg_D_Point2) == 0.00 then
            set udg_D_PointOffset = OffsetLocation(udg_D_Point2, - 350.00, 0.00)
            call CreateDestructableLoc(udg_D_WallTierType[1], udg_D_PointOffset, 0.00, 1.40, 0)
            call RemoveLocation(udg_D_PointOffset)
        endif
        if AngleBetweenPoints(udg_D_Point1, udg_D_Point2) ==- 90.00 then
            set udg_D_PointOffset = OffsetLocation(udg_D_Point2, 0.00, 350.00)
            call CreateDestructableLoc(udg_D_WallTierType[3], udg_D_PointOffset, 0.00, 1.40, 0)
            call RemoveLocation(udg_D_PointOffset)
        endif
        call RemoveLocation(udg_D_Point2)
    endif
endfunction

function Trig_Gen_Walls_Func005Func011Func002A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Gen_Walls_Actions takes nothing returns nothing
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304D)
    set udg_D_Walls = CountUnitsInGroup(udg_D_Pick)
    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Ячеек: " + I2S(udg_D_Walls)))
    call DestroyGroup(udg_D_Pick)
    set bj_forLoopBIndex = 0
    set bj_forLoopBIndexEnd = udg_D_Rooms
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set udg_D_Pick = GetUnitsInRangeOfLocAll(800.00, GetUnitLoc(udg_D_CellNumber[bj_forLoopBIndex]))
        set udg_D_Pick2 = GetUnitsOfTypeIdAll(0x6830304D)
        set udg_D_Point1 = GetUnitLoc(udg_D_CellNumber[bj_forLoopBIndex])
        call GroupRemoveGroup(udg_D_Pick2, udg_D_Pick)
        call DestroyGroup(udg_D_Pick2)
        set udg_D_Pick2 = GetUnitsOfTypeIdAll(0x68303054)
        call GroupRemoveGroup(udg_D_Pick2, udg_D_Pick)
        call DestroyGroup(udg_D_Pick2)
        call ForGroupBJ(udg_D_Pick, function Trig_Gen_Walls_Func005Func009A)
        call RemoveUnit(GetEnumUnit())
        if bj_forLoopBIndex == udg_D_Rooms then
            set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304C)
            call ForGroupBJ(udg_D_Pick, function Trig_Gen_Walls_Func005Func011Func002A)
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Количество порталов: " + I2S(udg_D_Portals)))
            call DestroyGroup(udg_D_Pick)
            call ConditionalTriggerExecute(gg_trg_Gen_Hall_Walls)
        endif
        call RemoveLocation(udg_D_Point1)
        call DestroyGroup(udg_D_Pick)
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
endfunction

function InitTrig_Gen_Walls takes nothing returns nothing
    set gg_trg_Gen_Walls = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Gen_Walls, udg_D_Timer)
    call TriggerAddAction(gg_trg_Gen_Walls, function Trig_Gen_Walls_Actions)
endfunction