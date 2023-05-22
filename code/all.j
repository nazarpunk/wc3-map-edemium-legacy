function Trig_Gen_Walls_Func005Func009Func001Func002C takes nothing returns boolean
    if(not(AngleBetweenPoints(udg_D_Point1, udg_D_Point2) == 180.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Walls_Func005Func009Func001Func003C takes nothing returns boolean
    if(not(AngleBetweenPoints(udg_D_Point1, udg_D_Point2) == 90.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Walls_Func005Func009Func001Func004C takes nothing returns boolean
    if(not(AngleBetweenPoints(udg_D_Point1, udg_D_Point2) == 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Walls_Func005Func009Func001Func005C takes nothing returns boolean
    if(not(AngleBetweenPoints(udg_D_Point1, udg_D_Point2) ==- 90.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Walls_Func005Func009Func001C takes nothing returns boolean
    if(not(CountUnitsInGroup(udg_D_Pick) == 0))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Walls_Func005Func009A takes nothing returns nothing
    if(Trig_Gen_Walls_Func005Func009Func001C())then
    else
        set udg_D_Point2 = GetUnitLoc(GetEnumUnit())
        if(Trig_Gen_Walls_Func005Func009Func001Func002C())then
            set udg_D_PointOffset = OffsetLocation(udg_D_Point2, 400.00, 0)
            call CreateDestructableLoc(udg_D_WallTierType[2], udg_D_PointOffset, 0.00, 1.40, 0)
            call RemoveLocation(udg_D_PointOffset)
        else
        endif
        if(Trig_Gen_Walls_Func005Func009Func001Func003C())then
            set udg_D_PointOffset = OffsetLocation(udg_D_Point2, 0.00, - 400.00)
            call CreateDestructableLoc(udg_D_WallTierType[4], udg_D_PointOffset, 0.00, 1.40, 0)
            call RemoveLocation(udg_D_PointOffset)
        else
        endif
        if(Trig_Gen_Walls_Func005Func009Func001Func004C())then
            set udg_D_PointOffset = OffsetLocation(udg_D_Point2, - 350.00, 0.00)
            call CreateDestructableLoc(udg_D_WallTierType[1], udg_D_PointOffset, 0.00, 1.40, 0)
            call RemoveLocation(udg_D_PointOffset)
        else
        endif
        if(Trig_Gen_Walls_Func005Func009Func001Func005C())then
            set udg_D_PointOffset = OffsetLocation(udg_D_Point2, 0.00, 350.00)
            call CreateDestructableLoc(udg_D_WallTierType[3], udg_D_PointOffset, 0.00, 1.40, 0)
            call RemoveLocation(udg_D_PointOffset)
        else
        endif
        call RemoveLocation(udg_D_Point2)
    endif
endfunction
function Trig_Gen_Walls_Func005Func011Func002A takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Gen_Walls_Func005Func011C takes nothing returns boolean
    if(not(GetForLoopIndexB() == udg_D_Rooms))then
        return false
    endif
    return true
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
        set udg_D_Pick = GetUnitsInRangeOfLocAll(800.00, GetUnitLoc(udg_D_CellNumber[GetForLoopIndexB()]))
        set udg_D_Pick2 = GetUnitsOfTypeIdAll(0x6830304D)
        set udg_D_Point1 = GetUnitLoc(udg_D_CellNumber[GetForLoopIndexB()])
        call GroupRemoveGroup(udg_D_Pick2, udg_D_Pick)
        call DestroyGroup(udg_D_Pick2)
        set udg_D_Pick2 = GetUnitsOfTypeIdAll(0x68303054)
        call GroupRemoveGroup(udg_D_Pick2, udg_D_Pick)
        call DestroyGroup(udg_D_Pick2)
        call ForGroupBJ(udg_D_Pick, function Trig_Gen_Walls_Func005Func009A)
        call RemoveUnit(GetEnumUnit())
        if(Trig_Gen_Walls_Func005Func011C())then
            set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304C)
            call ForGroupBJ(udg_D_Pick, function Trig_Gen_Walls_Func005Func011Func002A)
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Количество порталов: " + I2S(udg_D_Portals)))
            call DestroyGroup(udg_D_Pick)
            call ConditionalTriggerExecute(gg_trg_Gen_Hall_Walls)
        else
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
function Trig_Gen_Hall_Walls_Func002Func006Func002C takes nothing returns boolean
    return udg_RandomNumber == 1
endfunction
function Trig_Gen_Hall_Walls_Func002Func006Func003C takes nothing returns boolean
    return udg_RandomNumber == 2
endfunction
function Trig_Gen_Hall_Walls_Func002Func006C takes nothing returns boolean
    return CountUnitsInGroup(udg_D_Pick2) == 9
endfunction
function Trig_Gen_Hall_Walls_Func002A takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetEnumUnit())
    set udg_D_Pick2 = GetUnitsInRangeOfLocAll(1200.00, udg_D_Point1)
    set udg_D_Pick3 = GetUnitsOfTypeIdAll(0x68303054)
    call GroupRemoveGroup(udg_D_Pick3, udg_D_Pick2)
    call DestroyGroup(udg_D_Pick3)
    if(Trig_Gen_Hall_Walls_Func002Func006C())then
        set udg_RandomNumber = GetRandomInt(1, 2)
        if(Trig_Gen_Hall_Walls_Func002Func006Func002C())then
            set udg_D_PointOffset = OffsetLocation(udg_D_Point1, 400.00, 0)
            call CreateDestructableLoc(udg_D_WallTierType[2], udg_D_PointOffset, 0.00, 1.40, 0)
            call RemoveLocation(udg_D_PointOffset)
        else
        endif
        if(Trig_Gen_Hall_Walls_Func002Func006Func003C())then
            set udg_D_PointOffset = OffsetLocation(udg_D_Point1, 0.00, - 400.00)
            call CreateDestructableLoc(udg_D_WallTierType[4], udg_D_PointOffset, 0.00, 1.40, 0)
            call RemoveLocation(udg_D_PointOffset)
        else
        endif
    else
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
function Trig_Gen_Tiles_Func002Func002Func004C takes nothing returns boolean
    return udg_RandomNumber == 1
endfunction
function Trig_Gen_Tiles_Func002Func002C takes nothing returns boolean
    return GetRandomInt(0, 100) >= 95
endfunction
function Trig_Gen_Tiles_Func003Func002Func001Func004C takes nothing returns boolean
    return udg_RandomNumber == 1
endfunction
function Trig_Gen_Tiles_Func003Func002Func001Func005Func002Func004C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Tiles_Func003Func002Func001Func005Func002C takes nothing returns boolean
    if(not(GetRandomInt(0, 100) >= 95))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Tiles_Func003Func002Func001C takes nothing returns boolean
    if(not(GetTerrainTypeBJ(udg_D_Point1) != 0x4F616279))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Tiles_Func003Func002C takes nothing returns boolean
    if(not(GetRandomInt(0, 100) >= 95))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Tiles_Func003Func004C takes nothing returns boolean
    if(not(GetUnitUserData(udg_EM_Target) == 74))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Tiles_Func003Func005Func002C takes nothing returns boolean
    if(not(GetUnitUserData(udg_EM_Target) == 74))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Tiles_Func003Func005C takes nothing returns boolean
    if(not(udg_D_DungeonTier == 1))then
        return false
    endif
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Tiles_Func003Func007C takes nothing returns boolean
    if(not(GetUnitUserData(udg_EM_Target) == 74))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Tiles_Func003Func008Func001C takes nothing returns boolean
    if((udg_D_DungeonTier == 2))then
        return true
    endif
    if((udg_D_DungeonTier == 3))then
        return true
    endif
    return false
endfunction
function Trig_Gen_Tiles_Func003Func008Func003C takes nothing returns boolean
    if(not(GetUnitUserData(udg_EM_Target) == 74))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Tiles_Func003Func008C takes nothing returns boolean
    if(not Trig_Gen_Tiles_Func003Func008Func001C())then
        return false
    endif
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Tiles_Func003A takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetEnumUnit())
    if(Trig_Gen_Tiles_Func003Func002C())then
        if(Trig_Gen_Tiles_Func003Func002Func001C())then
            set udg_RandomNumber = GetRandomInt(1, 2)
            call CreateNUnitsAtLoc(1, 0x68303057, Player(1), udg_D_Point1, bj_UNIT_FACING)
            call SetUnitVertexColorBJ(GetLastCreatedUnit(), 100, 100, 100, 100.00)
            if(Trig_Gen_Tiles_Func003Func002Func001Func004C())then
                call UnitAddAbilityBJ(0x41303051, GetLastCreatedUnit())
            else
                call UnitAddAbilityBJ(0x41303052, GetLastCreatedUnit())
            endif
            call GroupRemoveUnitSimple(GetEnumUnit(), udg_D_Pick)
        else
        endif
    else
    endif
    if(Trig_Gen_Tiles_Func003Func004C())then
        set udg_RandomNumber = GetRandomInt(1, 2)
    else
        set udg_RandomNumber = GetRandomInt(1, 3)
    endif
    if(Trig_Gen_Tiles_Func003Func005C())then
        set udg_Point = OffsetLocation(udg_D_Point1, GetRandomReal(0, 300.00), GetRandomReal(0, 300.00))
        if(Trig_Gen_Tiles_Func003Func005Func002C())then
            set udg_RandomNumber = GetRandomInt(3, 4)
        else
            set udg_RandomNumber = GetRandomInt(1, 2)
        endif
        call SetTerrainTypeBJ(udg_Point, 0x43706F73, - 1, udg_RandomNumber, 0)
        call RemoveLocation(udg_Point)
    else
    endif
    if(Trig_Gen_Tiles_Func003Func007C())then
        set udg_RandomNumber = GetRandomInt(1, 2)
    else
        set udg_RandomNumber = GetRandomInt(1, 3)
    endif
    if(Trig_Gen_Tiles_Func003Func008C())then
        set udg_Point = OffsetLocation(udg_D_Point1, GetRandomReal(0, 300.00), GetRandomReal(0, 300.00))
        if(Trig_Gen_Tiles_Func003Func008Func003C())then
            set udg_RandomNumber = GetRandomInt(3, 4)
        else
            set udg_RandomNumber = GetRandomInt(1, 2)
        endif
        call SetTerrainTypeBJ(udg_Point, 0x446C6176, - 1, udg_RandomNumber, 0)
        call RemoveLocation(udg_Point)
    else
    endif
    call RemoveLocation(udg_D_Point1)
endfunction
function Trig_Gen_Tiles_Func006Func003C takes nothing returns boolean
    if(not(GetRandomInt(0, 100) >= 50))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Tiles_Func006A takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetEnumUnit())
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = GetRandomInt(1, 3)
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_Point = OffsetLocation(udg_D_Point1, GetRandomReal(0, 300.00), GetRandomReal(0, 300.00))
        call SetTerrainTypeBJ(udg_Point, 0x58626C6D, - 1, 2, 0)
        call RemoveLocation(udg_Point)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    if(Trig_Gen_Tiles_Func006Func003C())then
        set udg_Point = OffsetLocation(udg_D_Point1, GetRandomReal(0, 300.00), GetRandomReal(0, 300.00))
        call SetTerrainTypeBJ(udg_Point, 0x43706F73, - 1, 2, 0)
        call RemoveLocation(udg_Point)
    else
    endif
    call RemoveLocation(udg_D_Point1)
endfunction
function Trig_Gen_Tiles_Actions takes nothing returns nothing
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304D)
    call GroupRemoveUnitSimple(udg_D_CellNumber[0], udg_D_Pick)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Tiles_Func003A)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x68303054)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Tiles_Func006A)
    call DestroyGroup(udg_D_Pick)
    call ConditionalTriggerExecute(gg_trg_Gen_Decor_Tiles)
endfunction
function InitTrig_Gen_Tiles takes nothing returns nothing
    set gg_trg_Gen_Tiles = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Tiles, function Trig_Gen_Tiles_Actions)
endfunction
function Trig_Gen_Decor_Tiles_Func002Func002Func004Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 8))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Tiles_Func002Func002Func004Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 7))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Tiles_Func002Func002Func004Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 6))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Tiles_Func002Func002Func004Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 5))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Tiles_Func002Func002Func004Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Tiles_Func002Func002Func004Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Tiles_Func002Func002Func004Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Tiles_Func002Func002Func004C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Tiles_Func002Func002A takes nothing returns nothing
    set udg_D_Point2 = GetUnitLoc(GetEnumUnit())
    set udg_D_Point1 = OffsetLocation(udg_D_Point2, GetRandomReal(- 300.00, 300.00), GetRandomReal(- 300.00, 300.00))
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_D_Pick)
    if(Trig_Gen_Decor_Tiles_Func002Func002Func004C())then
        call CreateDestructableLoc(0x42303056, udg_D_Point1, GetRandomReal(0, 360.00), 2.50, 0)
    else
        if(Trig_Gen_Decor_Tiles_Func002Func002Func004Func001C())then
            call CreateDestructableLoc(0x42303057, udg_D_Point1, GetRandomReal(0, 360.00), 2.50, 0)
        else
            if(Trig_Gen_Decor_Tiles_Func002Func002Func004Func001Func001C())then
                call CreateDestructableLoc(0x42303058, udg_D_Point1, GetRandomReal(0, 360.00), 2.30, 0)
            else
                if(Trig_Gen_Decor_Tiles_Func002Func002Func004Func001Func001Func001C())then
                    call CreateDestructableLoc(0x42303059, udg_D_Point1, GetRandomReal(0, 360.00), 2.20, 0)
                else
                    if(Trig_Gen_Decor_Tiles_Func002Func002Func004Func001Func001Func001Func001C())then
                        call CreateDestructableLoc(0x4230305A, udg_D_Point1, GetRandomReal(0, 360.00), 2.30, 0)
                    else
                        if(Trig_Gen_Decor_Tiles_Func002Func002Func004Func001Func001Func001Func001Func001C())then
                            call CreateDestructableLoc(0x4230304E, udg_D_Point1, GetRandomReal(0, 360.00), 1.00, 0)
                        else
                            if(Trig_Gen_Decor_Tiles_Func002Func002Func004Func001Func001Func001Func001Func001Func001C())then
                                call CreateDestructableLoc(0x4230304F, udg_D_Point1, GetRandomReal(0, 360.00), 1.30, 0)
                            else
                                if(Trig_Gen_Decor_Tiles_Func002Func002Func004Func001Func001Func001Func001Func001Func001Func001C())then
                                    call CreateDestructableLoc(0x42303050, udg_D_Point1, GetRandomReal(0, 360.00), 1.30, 0)
                                else
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
    call RemoveLocation(udg_D_Point1)
endfunction
function Trig_Gen_Decor_Tiles_Func004Func001Func001C takes nothing returns boolean
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303235))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303244))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x44546737))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303256))then
        return true
    endif
    return false
endfunction
function Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func001C takes nothing returns boolean
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303232))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303243))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303133))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303255))then
        return true
    endif
    return false
endfunction
function Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func001C takes nothing returns boolean
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303233))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303241))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303132))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303251))then
        return true
    endif
    return false
endfunction
function Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func002Func001Func001C takes nothing returns boolean
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303236))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303245))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x4230314A))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303253))then
        return true
    endif
    return false
endfunction
function Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func002Func001Func002Func001C takes nothing returns boolean
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303239))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303248))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303152))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303258))then
        return true
    endif
    return false
endfunction
function Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func002Func001Func002Func002Func001C takes nothing returns boolean
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303237))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303246))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303151))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303254))then
        return true
    endif
    return false
endfunction
function Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func002Func001Func002Func002C takes nothing returns boolean
    if(not Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func002Func001Func002Func002Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func002Func001Func002C takes nothing returns boolean
    if(not Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func002Func001Func002Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func002Func001C takes nothing returns boolean
    if(not Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func002Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func002Func007C takes nothing returns boolean
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303238))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303247))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303149))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303257))then
        return true
    endif
    return false
endfunction
function Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func002C takes nothing returns boolean
    if(not Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func002Func007C())then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002C takes nothing returns boolean
    if(not Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Tiles_Func004Func001Func002Func001C takes nothing returns boolean
    if(not Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Tiles_Func004Func001Func002Func007C takes nothing returns boolean
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303234))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303242))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x44546735))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303252))then
        return true
    endif
    return false
endfunction
function Trig_Gen_Decor_Tiles_Func004Func001Func002C takes nothing returns boolean
    if(not Trig_Gen_Decor_Tiles_Func004Func001Func002Func007C())then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Tiles_Func004Func001C takes nothing returns boolean
    if(not Trig_Gen_Decor_Tiles_Func004Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Tiles_Func004A takes nothing returns nothing
    if(Trig_Gen_Decor_Tiles_Func004Func001C())then
        set udg_D_WallType = 1
        set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
        set udg_D_PointOffset = OffsetLocation(udg_D_Point1, 60.00, udg_Offset[GetRandomInt(1, 5)])
        call RemoveLocation(udg_D_Point1)
        call ConditionalTriggerExecute(gg_trg_Gen_Decor_Walls)
    else
        if(Trig_Gen_Decor_Tiles_Func004Func001Func002C())then
            set udg_D_WallType = 2
            set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
            set udg_D_PointOffset = OffsetLocation(udg_D_Point1, udg_Offset[GetRandomInt(1, 5)], - 60.00)
            call RemoveLocation(udg_D_Point1)
            call ConditionalTriggerExecute(gg_trg_Gen_Decor_Walls)
        else
            if(Trig_Gen_Decor_Tiles_Func004Func001Func002Func001C())then
                set udg_D_WallType = 3
                set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
                set udg_D_PointOffset = OffsetLocation(udg_D_Point1, - 60.00, udg_Offset[GetRandomInt(1, 5)])
                call RemoveLocation(udg_D_Point1)
                call ConditionalTriggerExecute(gg_trg_Gen_Decor_Walls)
            else
                if(Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002C())then
                    set udg_D_WallType = 4
                    set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
                    set udg_D_PointOffset = OffsetLocation(udg_D_Point1, udg_Offset[GetRandomInt(1, 5)], 60.00)
                    call RemoveLocation(udg_D_Point1)
                    call ConditionalTriggerExecute(gg_trg_Gen_Decor_Walls)
                else
                    if(Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func002C())then
                        set udg_D_WallType = 5
                        set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
                        set udg_D_PointOffset = OffsetLocation(udg_D_Point1, - 60.00, udg_Offset[GetRandomInt(2, 4)])
                        call RemoveLocation(udg_D_Point1)
                        call ConditionalTriggerExecute(gg_trg_Gen_Decor_Rooms)
                    else
                        if(Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func002Func001C())then
                            set udg_D_WallType = 6
                            set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
                            set udg_D_PointOffset = OffsetLocation(udg_D_Point1, udg_Offset[GetRandomInt(2, 4)], 60.00)
                            call RemoveLocation(udg_D_Point1)
                            call ConditionalTriggerExecute(gg_trg_Gen_Decor_Rooms)
                        else
                            if(Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func002Func001Func002C())then
                                set udg_D_WallType = 7
                                set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
                                set udg_D_PointOffset = OffsetLocation(udg_D_Point1, 60.00, udg_Offset[GetRandomInt(2, 4)])
                                call RemoveLocation(udg_D_Point1)
                                call ConditionalTriggerExecute(gg_trg_Gen_Decor_Rooms)
                            else
                                if(Trig_Gen_Decor_Tiles_Func004Func001Func002Func001Func002Func002Func001Func002Func002C())then
                                    set udg_D_WallType = 8
                                    set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
                                    set udg_D_PointOffset = OffsetLocation(udg_D_Point1, udg_Offset[GetRandomInt(2, 4)], - 60.00)
                                    call RemoveLocation(udg_D_Point1)
                                    call ConditionalTriggerExecute(gg_trg_Gen_Decor_Rooms)
                                else
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endfunction
function Trig_Gen_Decor_Tiles_Actions takes nothing returns nothing
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304D)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 30
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_RandomNumber = GetRandomInt(1, 8)
        call ForGroupBJ(GetRandomSubGroup(1, udg_D_Pick), function Trig_Gen_Decor_Tiles_Func002Func002A)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call DestroyGroup(udg_D_Pick)
    call EnumDestructablesInRectAll(gg_rct_Dungeon, function Trig_Gen_Decor_Tiles_Func004A)
    call ConditionalTriggerExecute(gg_trg_Gen_Creeps_List)
endfunction
function InitTrig_Gen_Decor_Tiles takes nothing returns nothing
    set gg_trg_Gen_Decor_Tiles = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Decor_Tiles, function Trig_Gen_Decor_Tiles_Actions)
endfunction
function Trig_Gen_Decor_Walls_Func002Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 8))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func002Func001Func001Func001Func001Func001Func001Func005001 takes nothing returns boolean
    return(udg_RandomNumber == 6)
endfunction
function Trig_Gen_Decor_Walls_Func002Func001Func001Func001Func001Func001Func001Func005002 takes nothing returns boolean
    return(udg_RandomNumber == 7)
endfunction
function Trig_Gen_Decor_Walls_Func002Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not GetBooleanOr(Trig_Gen_Decor_Walls_Func002Func001Func001Func001Func001Func001Func001Func005001(), Trig_Gen_Decor_Walls_Func002Func001Func001Func001Func001Func001Func001Func005002()))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func002Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 5))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func002Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func002Func001Func001Func001Func003C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func002Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func002Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func002Func001Func002C takes nothing returns boolean
    if(not(udg_D_Torches == 5))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func002Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func002C takes nothing returns boolean
    if(not(udg_D_WallType == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func003Func002Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 8))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func003Func002Func001Func001Func001Func001Func001Func005001 takes nothing returns boolean
    return(udg_RandomNumber == 6)
endfunction
function Trig_Gen_Decor_Walls_Func003Func002Func001Func001Func001Func001Func001Func005002 takes nothing returns boolean
    return(udg_RandomNumber == 7)
endfunction
function Trig_Gen_Decor_Walls_Func003Func002Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not GetBooleanOr(Trig_Gen_Decor_Walls_Func003Func002Func001Func001Func001Func001Func001Func005001(), Trig_Gen_Decor_Walls_Func003Func002Func001Func001Func001Func001Func001Func005002()))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func003Func002Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 5))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func003Func002Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func003Func002Func001Func001Func003C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func003Func002Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func003Func002Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func003Func002Func002C takes nothing returns boolean
    if(not(udg_D_Torches == 5))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func003Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func003C takes nothing returns boolean
    if(not(udg_D_WallType == 2))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func004Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 8))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func004Func001Func001Func001Func001Func001Func001Func005001 takes nothing returns boolean
    return(udg_RandomNumber == 6)
endfunction
function Trig_Gen_Decor_Walls_Func004Func001Func001Func001Func001Func001Func001Func005002 takes nothing returns boolean
    return(udg_RandomNumber == 7)
endfunction
function Trig_Gen_Decor_Walls_Func004Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not GetBooleanOr(Trig_Gen_Decor_Walls_Func004Func001Func001Func001Func001Func001Func001Func005001(), Trig_Gen_Decor_Walls_Func004Func001Func001Func001Func001Func001Func001Func005002()))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func004Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 5))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func004Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func004Func001Func001Func001Func003C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func004Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func004Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func004Func001Func002C takes nothing returns boolean
    if(not(udg_D_Torches == 5))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func004Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func004C takes nothing returns boolean
    if(not(udg_D_WallType == 3))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func005Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 8))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func005Func001Func001Func001Func001Func001Func001Func005001 takes nothing returns boolean
    return(udg_RandomNumber == 6)
endfunction
function Trig_Gen_Decor_Walls_Func005Func001Func001Func001Func001Func001Func001Func005002 takes nothing returns boolean
    return(udg_RandomNumber == 7)
endfunction
function Trig_Gen_Decor_Walls_Func005Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not GetBooleanOr(Trig_Gen_Decor_Walls_Func005Func001Func001Func001Func001Func001Func001Func005001(), Trig_Gen_Decor_Walls_Func005Func001Func001Func001Func001Func001Func001Func005002()))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func005Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 5))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func005Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func005Func001Func001Func001Func003C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func005Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func005Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func005Func001Func002C takes nothing returns boolean
    if(not(udg_D_Torches == 5))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func005Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Func005C takes nothing returns boolean
    if(not(udg_D_WallType == 4))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Walls_Actions takes nothing returns nothing
    set udg_RandomNumber = GetRandomInt(1, 9)
    if(Trig_Gen_Decor_Walls_Func002C())then
        if(Trig_Gen_Decor_Walls_Func002Func001C())then
            if(Trig_Gen_Decor_Walls_Func002Func001Func002C())then
            else
                set udg_D_Torches = (udg_D_Torches + 1)
                call CreateDestructableLoc(0x42303051, udg_D_PointOffset, 0.00, 1.80, 0)
            endif
        else
            if(Trig_Gen_Decor_Walls_Func002Func001Func001C())then
                call CreateDestructableLoc(0x4230304C, udg_D_PointOffset, 90.00, 2.30, 0)
            else
                if(Trig_Gen_Decor_Walls_Func002Func001Func001Func001C())then
                    call CreateDestructableLoc(0x4230304D, udg_D_PointOffset, 90.00, 2.70, 0)
                    if(Trig_Gen_Decor_Walls_Func002Func001Func001Func001Func003C())then
                        call CreateDestructableLoc(0x4230304F, udg_D_PointOffset, GetRandomReal(0, 360.00), 1.30, 0)
                    else
                        call CreateDestructableLoc(0x4230304E, udg_D_PointOffset, GetRandomReal(0, 360.00), 1.00, 0)
                    endif
                else
                    if(Trig_Gen_Decor_Walls_Func002Func001Func001Func001Func001C())then
                        call CreateDestructableLoc(0x4230304B, udg_D_PointOffset, 0.00, 2.40, 0)
                    else
                        if(Trig_Gen_Decor_Walls_Func002Func001Func001Func001Func001Func001C())then
                            call CreateDestructableLoc(0x42303052, udg_D_PointOffset, 90.00, 2.40, 0)
                        else
                            if(Trig_Gen_Decor_Walls_Func002Func001Func001Func001Func001Func001Func001C())then
                                set udg_Point = OffsetLocation(udg_D_PointOffset, 30.00, 0.00)
                                call CreateDestructableLoc(0x42303053, udg_Point, 0.00, 0.90, 0)
                                call RemoveLocation(udg_Point)
                            else
                                if(Trig_Gen_Decor_Walls_Func002Func001Func001Func001Func001Func001Func001Func001C())then
                                    call CreateDestructableLoc(0x42303135, udg_D_PointOffset, 90.00, 1.50, 0)
                                else
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
    endif
    if(Trig_Gen_Decor_Walls_Func003C())then
        if(Trig_Gen_Decor_Walls_Func003Func002C())then
            if(Trig_Gen_Decor_Walls_Func003Func002Func002C())then
            else
                set udg_D_Torches = (udg_D_Torches + 1)
                call CreateDestructableLoc(0x42303051, udg_D_PointOffset, 270.00, 1.80, 0)
            endif
        else
            if(Trig_Gen_Decor_Walls_Func003Func002Func001C())then
                call CreateDestructableLoc(0x4230304C, udg_D_PointOffset, 0.00, 2.30, 0)
            else
                if(Trig_Gen_Decor_Walls_Func003Func002Func001Func001C())then
                    call CreateDestructableLoc(0x4230304D, udg_D_PointOffset, 0.00, 2.70, 0)
                    if(Trig_Gen_Decor_Walls_Func003Func002Func001Func001Func003C())then
                        call CreateDestructableLoc(0x4230304F, udg_D_PointOffset, GetRandomReal(0, 360.00), 1.30, 0)
                    else
                        call CreateDestructableLoc(0x4230304E, udg_D_PointOffset, GetRandomReal(0, 360.00), 1.00, 0)
                    endif
                else
                    if(Trig_Gen_Decor_Walls_Func003Func002Func001Func001Func001C())then
                        call CreateDestructableLoc(0x4230304B, udg_D_PointOffset, 270.00, 2.40, 0)
                    else
                        if(Trig_Gen_Decor_Walls_Func003Func002Func001Func001Func001Func001C())then
                            call CreateDestructableLoc(0x42303052, udg_D_PointOffset, 180.00, 2.40, 0)
                        else
                            if(Trig_Gen_Decor_Walls_Func003Func002Func001Func001Func001Func001Func001C())then
                                set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, - 30.00)
                                call CreateDestructableLoc(0x42303053, udg_Point, 270.00, 0.90, 0)
                                call RemoveLocation(udg_Point)
                            else
                                if(Trig_Gen_Decor_Walls_Func003Func002Func001Func001Func001Func001Func001Func001C())then
                                    call CreateDestructableLoc(0x42303135, udg_D_PointOffset, 0.00, 1.50, 0)
                                else
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
    endif
    if(Trig_Gen_Decor_Walls_Func004C())then
        if(Trig_Gen_Decor_Walls_Func004Func001C())then
            if(Trig_Gen_Decor_Walls_Func004Func001Func002C())then
            else
                set udg_D_Torches = (udg_D_Torches + 1)
                call CreateDestructableLoc(0x42303051, udg_D_PointOffset, 180.00, 1.80, 0)
            endif
        else
            if(Trig_Gen_Decor_Walls_Func004Func001Func001C())then
                call CreateDestructableLoc(0x4230304C, udg_D_PointOffset, 270.00, 2.30, 0)
            else
                if(Trig_Gen_Decor_Walls_Func004Func001Func001Func001C())then
                    call CreateDestructableLoc(0x4230304D, udg_D_PointOffset, 270.00, 2.70, 0)
                    if(Trig_Gen_Decor_Walls_Func004Func001Func001Func001Func003C())then
                        call CreateDestructableLoc(0x4230304F, udg_D_PointOffset, GetRandomReal(0, 360.00), 1.30, 0)
                    else
                        call CreateDestructableLoc(0x4230304E, udg_D_PointOffset, GetRandomReal(0, 360.00), 1.00, 0)
                    endif
                else
                    if(Trig_Gen_Decor_Walls_Func004Func001Func001Func001Func001C())then
                        call CreateDestructableLoc(0x4230304B, udg_D_PointOffset, 180.00, 2.40, 0)
                    else
                        if(Trig_Gen_Decor_Walls_Func004Func001Func001Func001Func001Func001C())then
                            call CreateDestructableLoc(0x42303052, udg_D_PointOffset, 270.00, 2.40, 0)
                        else
                            if(Trig_Gen_Decor_Walls_Func004Func001Func001Func001Func001Func001Func001C())then
                                set udg_Point = OffsetLocation(udg_D_PointOffset, - 30.00, 0.00)
                                call CreateDestructableLoc(0x42303053, udg_Point, 180.00, 0.90, 0)
                                call RemoveLocation(udg_Point)
                            else
                                if(Trig_Gen_Decor_Walls_Func004Func001Func001Func001Func001Func001Func001Func001C())then
                                    call CreateDestructableLoc(0x42303135, udg_D_PointOffset, 270.00, 1.50, 0)
                                else
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
    endif
    if(Trig_Gen_Decor_Walls_Func005C())then
        if(Trig_Gen_Decor_Walls_Func005Func001C())then
            if(Trig_Gen_Decor_Walls_Func005Func001Func002C())then
            else
                set udg_D_Torches = (udg_D_Torches + 1)
                call CreateDestructableLoc(0x42303051, udg_D_PointOffset, 90.00, 1.80, 0)
            endif
        else
            if(Trig_Gen_Decor_Walls_Func005Func001Func001C())then
                call CreateDestructableLoc(0x4230304C, udg_D_PointOffset, 190.00, 2.30, 0)
            else
                if(Trig_Gen_Decor_Walls_Func005Func001Func001Func001C())then
                    call CreateDestructableLoc(0x4230304D, udg_D_PointOffset, 180.00, 2.70, 0)
                    if(Trig_Gen_Decor_Walls_Func005Func001Func001Func001Func003C())then
                        call CreateDestructableLoc(0x4230304F, udg_D_PointOffset, GetRandomReal(0, 360.00), 1.30, 0)
                    else
                        call CreateDestructableLoc(0x4230304E, udg_D_PointOffset, GetRandomReal(0, 360.00), 1.00, 0)
                    endif
                else
                    if(Trig_Gen_Decor_Walls_Func005Func001Func001Func001Func001C())then
                        call CreateDestructableLoc(0x4230304B, udg_D_PointOffset, 90.00, 2.40, 0)
                    else
                        if(Trig_Gen_Decor_Walls_Func005Func001Func001Func001Func001Func001C())then
                            call CreateDestructableLoc(0x42303052, udg_D_PointOffset, 0.00, 2.40, 0)
                        else
                            if(Trig_Gen_Decor_Walls_Func005Func001Func001Func001Func001Func001Func001C())then
                                set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, 30.00)
                                call CreateDestructableLoc(0x42303053, udg_Point, 90.00, 0.90, 0)
                                call RemoveLocation(udg_Point)
                            else
                                if(Trig_Gen_Decor_Walls_Func005Func001Func001Func001Func001Func001Func001Func001C())then
                                    call CreateDestructableLoc(0x42303135, udg_D_PointOffset, 180.00, 1.50, 0)
                                else
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
    endif
    call RemoveLocation(udg_D_PointOffset)
endfunction
function InitTrig_Gen_Decor_Walls takes nothing returns nothing
    set gg_trg_Gen_Decor_Walls = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Decor_Walls, function Trig_Gen_Decor_Walls_Actions)
endfunction
function Trig_Gen_Decor_Rooms_Func002Func001Func001Func002Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 8))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func002Func001Func001Func002Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 7))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func002Func001Func001Func002Func001Func001Func003001 takes nothing returns boolean
    return(udg_RandomNumber == 5)
endfunction
function Trig_Gen_Decor_Rooms_Func002Func001Func001Func002Func001Func001Func003002 takes nothing returns boolean
    return(udg_RandomNumber == 6)
endfunction
function Trig_Gen_Decor_Rooms_Func002Func001Func001Func002Func001Func001C takes nothing returns boolean
    if(not GetBooleanOr(Trig_Gen_Decor_Rooms_Func002Func001Func001Func002Func001Func001Func003001(), Trig_Gen_Decor_Rooms_Func002Func001Func001Func002Func001Func001Func003002()))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func002Func001Func001Func002Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func002Func001Func001Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func002Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func002Func001Func002Func001Func002C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) >= 91))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func002Func001Func002Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) >= 97))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func002Func001Func002Func006C takes nothing returns boolean
    if(not(GetRandomInt(1, 20) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func002Func001Func002C takes nothing returns boolean
    if(not(udg_D_Chests == udg_D_ChestsMax))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func002Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func002C takes nothing returns boolean
    if(not(udg_D_WallType == 5))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func003Func001Func001Func002Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 8))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func003Func001Func001Func002Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 7))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func003Func001Func001Func002Func001Func001Func003001 takes nothing returns boolean
    return(udg_RandomNumber == 5)
endfunction
function Trig_Gen_Decor_Rooms_Func003Func001Func001Func002Func001Func001Func003002 takes nothing returns boolean
    return(udg_RandomNumber == 6)
endfunction
function Trig_Gen_Decor_Rooms_Func003Func001Func001Func002Func001Func001C takes nothing returns boolean
    if(not GetBooleanOr(Trig_Gen_Decor_Rooms_Func003Func001Func001Func002Func001Func001Func003001(), Trig_Gen_Decor_Rooms_Func003Func001Func001Func002Func001Func001Func003002()))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func003Func001Func001Func002Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func003Func001Func001Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func003Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func003Func001Func002Func001Func002C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) >= 91))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func003Func001Func002Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) >= 97))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func003Func001Func002Func006C takes nothing returns boolean
    if(not(GetRandomInt(1, 20) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func003Func001Func002C takes nothing returns boolean
    if(not(udg_D_Chests == udg_D_ChestsMax))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func003Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func003C takes nothing returns boolean
    if(not(udg_D_WallType == 6))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func004Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 8))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func004Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 7))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func004Func001Func001Func001Func001Func001Func002001 takes nothing returns boolean
    return(udg_RandomNumber == 5)
endfunction
function Trig_Gen_Decor_Rooms_Func004Func001Func001Func001Func001Func001Func002002 takes nothing returns boolean
    return(udg_RandomNumber == 6)
endfunction
function Trig_Gen_Decor_Rooms_Func004Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not GetBooleanOr(Trig_Gen_Decor_Rooms_Func004Func001Func001Func001Func001Func001Func002001(), Trig_Gen_Decor_Rooms_Func004Func001Func001Func001Func001Func001Func002002()))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func004Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func004Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func004Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func004Func001Func002Func001Func002C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) >= 91))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func004Func001Func002Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) >= 97))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func004Func001Func002Func006C takes nothing returns boolean
    if(not(GetRandomInt(1, 20) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func004Func001Func002C takes nothing returns boolean
    if(not(udg_D_Chests == udg_D_ChestsMax))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func004Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func004C takes nothing returns boolean
    if(not(udg_D_WallType == 7))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func005Func001Func001Func002Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 8))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func005Func001Func001Func002Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 7))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func005Func001Func001Func002Func001Func001Func003001 takes nothing returns boolean
    return(udg_RandomNumber == 5)
endfunction
function Trig_Gen_Decor_Rooms_Func005Func001Func001Func002Func001Func001Func003002 takes nothing returns boolean
    return(udg_RandomNumber == 6)
endfunction
function Trig_Gen_Decor_Rooms_Func005Func001Func001Func002Func001Func001C takes nothing returns boolean
    if(not GetBooleanOr(Trig_Gen_Decor_Rooms_Func005Func001Func001Func002Func001Func001Func003001(), Trig_Gen_Decor_Rooms_Func005Func001Func001Func002Func001Func001Func003002()))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func005Func001Func001Func002Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func005Func001Func001Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func005Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func005Func001Func002Func001Func002C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) >= 91))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func005Func001Func002Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) >= 97))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func005Func001Func002Func006C takes nothing returns boolean
    if(not(GetRandomInt(1, 20) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func005Func001Func002C takes nothing returns boolean
    if(not(udg_D_Chests == udg_D_ChestsMax))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func005Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Func005C takes nothing returns boolean
    if(not(udg_D_WallType == 8))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Decor_Rooms_Actions takes nothing returns nothing
    set udg_RandomNumber = GetRandomInt(1, 8)
    if(Trig_Gen_Decor_Rooms_Func002C())then
        if(Trig_Gen_Decor_Rooms_Func002Func001C())then
            if(Trig_Gen_Decor_Rooms_Func002Func001Func002C())then
            else
                if(Trig_Gen_Decor_Rooms_Func002Func001Func002Func001C())then
                    set udg_D_ChestType = 0x6E303046
                else
                    if(Trig_Gen_Decor_Rooms_Func002Func001Func002Func001Func002C())then
                        set udg_D_ChestType = 0x6E303045
                    else
                        set udg_D_ChestType = 0x6E303044
                    endif
                endif
                set udg_D_Chests = (udg_D_Chests + 1)
                set udg_D_PointChest = OffsetLocation(udg_D_PointOffset, - 60.00, 0.00)
                call CreateNUnitsAtLoc(1, udg_D_ChestType, Player(PLAYER_NEUTRAL_PASSIVE), udg_D_PointChest, 180.00)
                call RemoveLocation(udg_D_PointChest)
                if(Trig_Gen_Decor_Rooms_Func002Func001Func002Func006C())then
                    call SetUnitUserData(GetLastCreatedUnit(), 10)
                else
                endif
            endif
        else
            if(Trig_Gen_Decor_Rooms_Func002Func001Func001C())then
                set udg_Point = OffsetLocation(udg_D_PointOffset, - 60.00, 0.00)
                call CreateDestructableLoc(udg_D_RoomDecorType[2], udg_Point, 180.00, udg_D_RoomDecorScale[2], 0)
                call RemoveLocation(udg_Point)
            else
                if(Trig_Gen_Decor_Rooms_Func002Func001Func001Func002C())then
                    set udg_Point = OffsetLocation(udg_D_PointOffset, - 60.00, 0.00)
                    call CreateDestructableLoc(udg_D_RoomDecorType[3], udg_Point, 180.00, udg_D_RoomDecorScale[3], 0)
                    call RemoveLocation(udg_Point)
                else
                    if(Trig_Gen_Decor_Rooms_Func002Func001Func001Func002Func001C())then
                        call CreateDestructableLoc(udg_D_RoomDecorType[4], udg_D_PointOffset, 180.00, udg_D_RoomDecorScale[4], 0)
                    else
                        if(Trig_Gen_Decor_Rooms_Func002Func001Func001Func002Func001Func001C())then
                            set udg_Point = OffsetLocation(udg_D_PointOffset, - 30.00, 0.00)
                            call CreateDestructableLoc(0x42303156, udg_Point, GetRandomReal(0, 360.00), 1.30, 0)
                            call RemoveLocation(udg_Point)
                        else
                            if(Trig_Gen_Decor_Rooms_Func002Func001Func001Func002Func001Func001Func001C())then
                                set udg_Point = OffsetLocation(udg_D_PointOffset, - 60.00, 0.00)
                                call CreateDestructableLoc(udg_D_RoomDecorType[7], udg_Point, GetRandomReal(0, 360.00), udg_D_RoomDecorScale[7], 0)
                                call RemoveLocation(udg_Point)
                            else
                                if(Trig_Gen_Decor_Rooms_Func002Func001Func001Func002Func001Func001Func001Func001C())then
                                    set udg_Point = OffsetLocation(udg_D_PointOffset, - 25.00, 0.00)
                                    call CreateDestructableLoc(0x42303231, udg_Point, 90.00, 2.30, 0)
                                    call RemoveLocation(udg_Point)
                                else
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
    endif
    if(Trig_Gen_Decor_Rooms_Func003C())then
        if(Trig_Gen_Decor_Rooms_Func003Func001C())then
            if(Trig_Gen_Decor_Rooms_Func003Func001Func002C())then
            else
                if(Trig_Gen_Decor_Rooms_Func003Func001Func002Func001C())then
                    set udg_D_ChestType = 0x6E303046
                else
                    if(Trig_Gen_Decor_Rooms_Func003Func001Func002Func001Func002C())then
                        set udg_D_ChestType = 0x6E303045
                    else
                        set udg_D_ChestType = 0x6E303044
                    endif
                endif
                set udg_D_Chests = (udg_D_Chests + 1)
                set udg_D_PointChest = OffsetLocation(udg_D_PointOffset, 0.00, 60.00)
                call CreateNUnitsAtLoc(1, udg_D_ChestType, Player(PLAYER_NEUTRAL_PASSIVE), udg_D_PointChest, 90.00)
                call RemoveLocation(udg_D_PointChest)
                if(Trig_Gen_Decor_Rooms_Func003Func001Func002Func006C())then
                    call SetUnitUserData(GetLastCreatedUnit(), 10)
                else
                endif
            endif
        else
            if(Trig_Gen_Decor_Rooms_Func003Func001Func001C())then
                set udg_Point = OffsetLocation(udg_D_PointOffset, udg_Offset[GetRandomInt(1, 5)], 60.00)
                call CreateDestructableLoc(udg_D_RoomDecorType[2], udg_Point, 90.00, udg_D_RoomDecorScale[2], 0)
                call RemoveLocation(udg_Point)
            else
                if(Trig_Gen_Decor_Rooms_Func003Func001Func001Func002C())then
                    set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, 60.00)
                    call CreateDestructableLoc(udg_D_RoomDecorType[3], udg_Point, 90.00, udg_D_RoomDecorScale[3], 0)
                    call RemoveLocation(udg_Point)
                else
                    if(Trig_Gen_Decor_Rooms_Func003Func001Func001Func002Func001C())then
                        call CreateDestructableLoc(udg_D_RoomDecorType[4], udg_D_PointOffset, 90.00, udg_D_RoomDecorScale[4], 0)
                    else
                        if(Trig_Gen_Decor_Rooms_Func003Func001Func001Func002Func001Func001C())then
                            set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, 30.00)
                            call CreateDestructableLoc(0x42303156, udg_Point, GetRandomReal(0, 360.00), 1.30, 0)
                            call RemoveLocation(udg_Point)
                        else
                            if(Trig_Gen_Decor_Rooms_Func003Func001Func001Func002Func001Func001Func001C())then
                                set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, 60.00)
                                call CreateDestructableLoc(udg_D_RoomDecorType[7], udg_Point, GetRandomReal(0, 360.00), udg_D_RoomDecorScale[7], 0)
                                call RemoveLocation(udg_Point)
                            else
                                if(Trig_Gen_Decor_Rooms_Func003Func001Func001Func002Func001Func001Func001Func001C())then
                                    set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, 25.00)
                                    call CreateDestructableLoc(0x42303231, udg_Point, 180.00, 2.30, 0)
                                    call RemoveLocation(udg_Point)
                                else
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
    endif
    if(Trig_Gen_Decor_Rooms_Func004C())then
        if(Trig_Gen_Decor_Rooms_Func004Func001C())then
            if(Trig_Gen_Decor_Rooms_Func004Func001Func002C())then
            else
                if(Trig_Gen_Decor_Rooms_Func004Func001Func002Func001C())then
                    set udg_D_ChestType = 0x6E303046
                else
                    if(Trig_Gen_Decor_Rooms_Func004Func001Func002Func001Func002C())then
                        set udg_D_ChestType = 0x6E303045
                    else
                        set udg_D_ChestType = 0x6E303044
                    endif
                endif
                set udg_D_Chests = (udg_D_Chests + 1)
                set udg_D_PointChest = OffsetLocation(udg_D_PointOffset, 60.00, 0.00)
                call CreateNUnitsAtLoc(1, udg_D_ChestType, Player(PLAYER_NEUTRAL_PASSIVE), udg_D_PointChest, 0.00)
                call RemoveLocation(udg_D_PointChest)
                if(Trig_Gen_Decor_Rooms_Func004Func001Func002Func006C())then
                    call SetUnitUserData(GetLastCreatedUnit(), 10)
                else
                endif
            endif
        else
            if(Trig_Gen_Decor_Rooms_Func004Func001Func001C())then
                set udg_Point = OffsetLocation(udg_D_PointOffset, 60.00, 0.00)
                call CreateDestructableLoc(udg_D_RoomDecorType[2], udg_Point, 0.00, udg_D_RoomDecorScale[2], 0)
                call RemoveLocation(udg_Point)
            else
                if(Trig_Gen_Decor_Rooms_Func004Func001Func001Func001C())then
                    set udg_Point = OffsetLocation(udg_D_PointOffset, 60.00, 0.00)
                    call CreateDestructableLoc(udg_D_RoomDecorType[3], udg_Point, 0.00, udg_D_RoomDecorScale[3], 0)
                    call RemoveLocation(udg_Point)
                else
                    if(Trig_Gen_Decor_Rooms_Func004Func001Func001Func001Func001C())then
                        call CreateDestructableLoc(udg_D_RoomDecorType[4], udg_D_PointOffset, 0.00, udg_D_RoomDecorScale[4], 0)
                    else
                        if(Trig_Gen_Decor_Rooms_Func004Func001Func001Func001Func001Func001C())then
                            set udg_Point = OffsetLocation(udg_D_PointOffset, 30.00, 0.00)
                            call CreateDestructableLoc(0x42303156, udg_Point, GetRandomReal(0, 360.00), 1.30, 0)
                            call RemoveLocation(udg_Point)
                        else
                            if(Trig_Gen_Decor_Rooms_Func004Func001Func001Func001Func001Func001Func001C())then
                                set udg_Point = OffsetLocation(udg_D_PointOffset, 60.00, 0.00)
                                call CreateDestructableLoc(udg_D_RoomDecorType[7], udg_Point, GetRandomReal(0, 360.00), udg_D_RoomDecorScale[7], 0)
                                call RemoveLocation(udg_Point)
                            else
                                if(Trig_Gen_Decor_Rooms_Func004Func001Func001Func001Func001Func001Func001Func001C())then
                                    set udg_Point = OffsetLocation(udg_D_PointOffset, 25.00, 0.00)
                                    call CreateDestructableLoc(0x42303231, udg_Point, 90.00, 2.30, 0)
                                    call RemoveLocation(udg_Point)
                                else
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
    endif
    if(Trig_Gen_Decor_Rooms_Func005C())then
        if(Trig_Gen_Decor_Rooms_Func005Func001C())then
            if(Trig_Gen_Decor_Rooms_Func005Func001Func002C())then
            else
                if(Trig_Gen_Decor_Rooms_Func005Func001Func002Func001C())then
                    set udg_D_ChestType = 0x6E303046
                else
                    if(Trig_Gen_Decor_Rooms_Func005Func001Func002Func001Func002C())then
                        set udg_D_ChestType = 0x6E303045
                    else
                        set udg_D_ChestType = 0x6E303044
                    endif
                endif
                set udg_D_Chests = (udg_D_Chests + 1)
                set udg_D_PointChest = OffsetLocation(udg_D_PointOffset, 0.00, - 60.00)
                call CreateNUnitsAtLoc(1, udg_D_ChestType, Player(PLAYER_NEUTRAL_PASSIVE), udg_D_PointChest, 270.00)
                call RemoveLocation(udg_D_PointChest)
                if(Trig_Gen_Decor_Rooms_Func005Func001Func002Func006C())then
                    call SetUnitUserData(GetLastCreatedUnit(), 10)
                else
                endif
            endif
        else
            if(Trig_Gen_Decor_Rooms_Func005Func001Func001C())then
                set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, - 60.00)
                call CreateDestructableLoc(udg_D_RoomDecorType[2], udg_Point, 270.00, udg_D_RoomDecorScale[2], 0)
                call RemoveLocation(udg_Point)
            else
                if(Trig_Gen_Decor_Rooms_Func005Func001Func001Func002C())then
                    set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, - 60.00)
                    call CreateDestructableLoc(udg_D_RoomDecorType[3], udg_Point, 270.00, udg_D_RoomDecorScale[3], 0)
                    call RemoveLocation(udg_Point)
                else
                    if(Trig_Gen_Decor_Rooms_Func005Func001Func001Func002Func001C())then
                        call CreateDestructableLoc(udg_D_RoomDecorType[4], udg_D_PointOffset, 270.00, udg_D_RoomDecorScale[4], 0)
                    else
                        if(Trig_Gen_Decor_Rooms_Func005Func001Func001Func002Func001Func001C())then
                            set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, - 30.00)
                            call CreateDestructableLoc(0x42303156, udg_Point, GetRandomReal(0, 360.00), 1.30, 0)
                            call RemoveLocation(udg_Point)
                        else
                            if(Trig_Gen_Decor_Rooms_Func005Func001Func001Func002Func001Func001Func001C())then
                                set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, - 60.00)
                                call CreateDestructableLoc(udg_D_RoomDecorType[7], udg_Point, GetRandomReal(0, 360.00), udg_D_RoomDecorScale[7], 0)
                                call RemoveLocation(udg_Point)
                            else
                                if(Trig_Gen_Decor_Rooms_Func005Func001Func001Func002Func001Func001Func001Func001C())then
                                    set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, - 25.00)
                                    call CreateDestructableLoc(0x42303231, udg_Point, 180.00, 2.30, 0)
                                    call RemoveLocation(udg_Point)
                                else
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
    endif
    call RemoveLocation(udg_D_PointOffset)
endfunction
function InitTrig_Gen_Decor_Rooms takes nothing returns nothing
    set gg_trg_Gen_Decor_Rooms = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Decor_Rooms, function Trig_Gen_Decor_Rooms_Actions)
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006Func006Func006Func006Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 17.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006Func006Func006Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 16.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006Func006Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 15.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 14.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 13.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 12.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 11.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 10.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 9.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 8.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 7.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 6.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 5.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 4.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 3.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Func006C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) == 2.00))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_List_Actions takes nothing returns nothing
    if(Trig_Gen_Creeps_List_Func006C())then
        set udg_D_CreepType[1] = 0x6E303032
        set udg_D_CreepType[2] = 0x6E303030
        set udg_D_CreepType[3] = 0x6E303033
        set udg_D_CreepType[4] = 0x6E30304A
        set udg_D_CreepType[5] = 0x6E30304A
        set udg_CC_IngredientDrop = 2
        set udg_IG_ItemLVL_Max = 4
    else
        if(Trig_Gen_Creeps_List_Func006Func001C())then
            set udg_D_CreepType[1] = 0x6E303030
            set udg_D_CreepType[2] = 0x6E303031
            set udg_D_CreepType[3] = 0x6E303035
            set udg_D_CreepType[4] = 0x6E30304A
            set udg_D_CreepType[5] = 0x6E30304A
            set udg_CC_IngredientDrop = 3
            set udg_IG_ItemLVL_Max = 4
        else
            if(Trig_Gen_Creeps_List_Func006Func001Func001C())then
                set udg_D_CreepType[1] = 0x6E303030
                set udg_D_CreepType[2] = 0x6E303031
                set udg_D_CreepType[3] = 0x6E303035
                set udg_D_CreepType[4] = 0x6E30304A
                set udg_D_CreepType[5] = 0x6E30304B
                set udg_CC_IngredientDrop = 3
                set udg_IG_ItemLVL_Max = 4
            else
                if(Trig_Gen_Creeps_List_Func006Func001Func001Func001C())then
                    set udg_D_CreepType[1] = 0x6E303034
                    set udg_D_CreepType[2] = 0x6E303031
                    set udg_D_CreepType[3] = 0x6E303035
                    set udg_D_CreepType[4] = 0x6E30304B
                    set udg_D_CreepType[5] = 0x6E30304B
                    set udg_CC_IngredientDrop = 3
                    set udg_IG_ItemLVL_Max = 5
                else
                    if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001C())then
                        set udg_D_CreepType[1] = 0x6E303043
                        set udg_D_CreepType[2] = 0x6E303043
                        set udg_D_CreepType[3] = 0x6E30304E
                        set udg_D_CreepType[4] = 0x6E303050
                        set udg_D_CreepType[5] = 0x6E303050
                        set udg_CC_IngredientDrop = 4
                        set udg_IG_ItemLVL_Max = 5
                    else
                        if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001C())then
                            set udg_D_CreepType[1] = 0x6E303043
                            set udg_D_CreepType[2] = 0x6E303059
                            set udg_D_CreepType[3] = 0x6E30304E
                            set udg_D_CreepType[4] = 0x6E303050
                            set udg_D_CreepType[5] = 0x6E303050
                            set udg_CC_IngredientDrop = 4
                            set udg_IG_ItemLVL_Max = 6
                        else
                            if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006C())then
                                set udg_D_CreepType[1] = 0x6E303043
                                set udg_D_CreepType[2] = 0x6E303059
                                set udg_D_CreepType[3] = 0x6E30304E
                                set udg_D_CreepType[4] = 0x6E303057
                                set udg_D_CreepType[5] = 0x6E303050
                                set udg_CC_IngredientDrop = 4
                                set udg_IG_ItemLVL_Max = 6
                            else
                                if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006C())then
                                    set udg_D_CreepType[1] = 0x6E303043
                                    set udg_D_CreepType[2] = 0x6E303059
                                    set udg_D_CreepType[3] = 0x6E30304E
                                    set udg_D_CreepType[4] = 0x6E303057
                                    set udg_D_CreepType[5] = 0x6E30304F
                                    set udg_CC_IngredientDrop = 5
                                    set udg_IG_ItemLVL_Max = 7
                                else
                                    if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006C())then
                                        set udg_D_CreepType[1] = 0x6E303043
                                        set udg_D_CreepType[2] = 0x6E303059
                                        set udg_D_CreepType[3] = 0x6E30304E
                                        set udg_D_CreepType[4] = 0x6E303057
                                        set udg_D_CreepType[5] = 0x6E30304F
                                        set udg_CC_IngredientDrop = 5
                                        set udg_IG_ItemLVL_Max = 7
                                    else
                                        if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006C())then
                                            set udg_D_CreepType[1] = 0x6E303041
                                            set udg_D_CreepType[2] = 0x6E303051
                                            set udg_D_CreepType[3] = 0x6E303051
                                            set udg_D_CreepType[4] = 0x6E30305A
                                            set udg_D_CreepType[5] = 0x6E30305A
                                            set udg_CC_IngredientDrop = 6
                                            set udg_IG_ItemLVL_Max = 7
                                        else
                                            if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001C())then
                                                set udg_D_CreepType[1] = 0x6E303041
                                                set udg_D_CreepType[2] = 0x6E303051
                                                set udg_D_CreepType[3] = 0x6E303051
                                                set udg_D_CreepType[4] = 0x6E303052
                                                set udg_D_CreepType[5] = 0x6E30305A
                                                set udg_CC_IngredientDrop = 6
                                                set udg_IG_ItemLVL_Max = 8
                                            else
                                                if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006C())then
                                                    set udg_D_CreepType[1] = 0x6E303041
                                                    set udg_D_CreepType[2] = 0x6E303051
                                                    set udg_D_CreepType[3] = 0x6E303130
                                                    set udg_D_CreepType[4] = 0x6E303052
                                                    set udg_D_CreepType[5] = 0x6E30305A
                                                    set udg_CC_IngredientDrop = 6
                                                    set udg_IG_ItemLVL_Max = 8
                                                else
                                                    if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006Func006C())then
                                                        set udg_D_CreepType[1] = 0x6E303041
                                                        set udg_D_CreepType[2] = 0x6E303051
                                                        set udg_D_CreepType[3] = 0x6E303130
                                                        set udg_D_CreepType[4] = 0x6E303054
                                                        set udg_D_CreepType[5] = 0x6E303052
                                                        set udg_CC_IngredientDrop = 7
                                                        set udg_IG_ItemLVL_Max = 8
                                                    else
                                                        if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006Func006Func006C())then
                                                            set udg_D_CreepType[1] = 0x6E303041
                                                            set udg_D_CreepType[2] = 0x6E303051
                                                            set udg_D_CreepType[3] = 0x6E303130
                                                            set udg_D_CreepType[4] = 0x6E303054
                                                            set udg_D_CreepType[5] = 0x6E303052
                                                            set udg_CC_IngredientDrop = 7
                                                            set udg_IG_ItemLVL_Max = 9
                                                        else
                                                            if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006Func006Func006Func006C())then
                                                                set udg_D_CreepType[1] = 0x6E303041
                                                                set udg_D_CreepType[2] = 0x6E303056
                                                                set udg_D_CreepType[3] = 0x6E303130
                                                                set udg_D_CreepType[4] = 0x6E303054
                                                                set udg_D_CreepType[5] = 0x6E303052
                                                                set udg_CC_IngredientDrop = 9
                                                                set udg_IG_ItemLVL_Max = 9
                                                            else
                                                                if(Trig_Gen_Creeps_List_Func006Func001Func001Func001Func001Func001Func006Func006Func006Func006Func001Func006Func006Func006Func006Func001C())then
                                                                    set udg_D_CreepType[1] = 0x6E303041
                                                                    set udg_D_CreepType[2] = 0x6E303056
                                                                    set udg_D_CreepType[3] = 0x6E303130
                                                                    set udg_D_CreepType[4] = 0x6E303054
                                                                    set udg_D_CreepType[5] = 0x6E303055
                                                                    set udg_CC_IngredientDrop = 9
                                                                    set udg_IG_ItemLVL_Max = 9
                                                                else
                                                                endif
                                                            endif
                                                        endif
                                                    endif
                                                endif
                                            endif
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
    call ConditionalTriggerExecute(gg_trg_Gen_Creeps)
endfunction
function InitTrig_Gen_Creeps_List takes nothing returns nothing
    set gg_trg_Gen_Creeps_List = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Creeps_List, function Trig_Gen_Creeps_List_Actions)
endfunction
function Trig_Gen_Creeps_Func003002 takes nothing returns nothing
    call SetUnitUserData(GetEnumUnit(), 0)
endfunction
function Trig_Gen_Creeps_Func005Func002Func004C takes nothing returns boolean
    if(not(udg_RandomNumber <= 50))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Func005Func002Func005Func003001 takes nothing returns boolean
    return(udg_RandomNumber > 50)
endfunction
function Trig_Gen_Creeps_Func005Func002Func005Func003002 takes nothing returns boolean
    return(udg_RandomNumber <= 91)
endfunction
function Trig_Gen_Creeps_Func005Func002Func005C takes nothing returns boolean
    if(not GetBooleanAnd(Trig_Gen_Creeps_Func005Func002Func005Func003001(), Trig_Gen_Creeps_Func005Func002Func005Func003002()))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Func005Func002Func006C takes nothing returns boolean
    if(not(udg_RandomNumber > 91))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Func005Func002Func007C takes nothing returns boolean
    if(not(GetUnitUserData(GetEnumUnit()) == 2))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Func005Func002A takes nothing returns nothing
    set udg_CO_CustomValue = (udg_CO_CustomValue + 1)
    set udg_D_Point2 = GetUnitLoc(GetEnumUnit())
    set udg_D_Point1 = OffsetLocation(udg_D_Point2, GetRandomReal(- 300.00, 300.00), GetRandomReal(- 300.00, 300.00))
    if(Trig_Gen_Creeps_Func005Func002Func004C())then
        call CreateNUnitsAtLoc(1, udg_D_CreepType[1], Player(11), udg_D_Point1, GetRandomReal(0, 360.00))
        call SetUnitUserData(GetEnumUnit(), (GetUnitUserData(GetEnumUnit()) + 1))
    else
    endif
    if(Trig_Gen_Creeps_Func005Func002Func005C())then
        call CreateNUnitsAtLoc(1, udg_D_CreepType[2], Player(11), udg_D_Point1, GetRandomReal(0, 360.00))
        call SetUnitUserData(GetEnumUnit(), (GetUnitUserData(GetEnumUnit()) + 1))
    else
    endif
    if(Trig_Gen_Creeps_Func005Func002Func006C())then
        call CreateNUnitsAtLoc(1, udg_D_CreepType[3], Player(11), udg_D_Point1, GetRandomReal(0, 360.00))
        call SetUnitUserData(GetEnumUnit(), (GetUnitUserData(GetEnumUnit()) + 1))
    else
    endif
    if(Trig_Gen_Creeps_Func005Func002Func007C())then
        call GroupRemoveUnitSimple(GetEnumUnit(), udg_D_Pick)
    else
    endif
    call SetUnitManaPercentBJ(GetLastCreatedUnit(), 100)
    call SetUnitUserData(GetLastCreatedUnit(), udg_CO_CustomValue)
    call UnitAddAbilityBJ(0x41303345, GetLastCreatedUnit())
    call RemoveLocation(udg_D_Point1)
endfunction
function Trig_Gen_Creeps_Func007Func002C takes nothing returns boolean
    if(not(udg_D_Rooms < 45))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Func007C takes nothing returns boolean
    if(not(udg_EM_Encounter == false))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Func008Func005C takes nothing returns boolean
    if(not(udg_D_CreepType[udg_RandomNumber] == 0x6E30304F))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Func008A takes nothing returns nothing
    set udg_RandomNumber = GetRandomInt(4, 5)
    call ReplaceUnitBJ(GetEnumUnit(), udg_D_CreepType[udg_RandomNumber], bj_UNIT_STATE_METHOD_RELATIVE)
    call SetUnitOwner(GetLastReplacedUnitBJ(), Player(11), false)
    call SetUnitManaPercentBJ(GetLastReplacedUnitBJ(), 100)
    if(Trig_Gen_Creeps_Func008Func005C())then
        set udg_Point = GetUnitLoc(GetLastReplacedUnitBJ())
        call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
        call RemoveLocation(udg_Point)
        call UnitAddAbilityBJ(0x4130315A, GetLastCreatedUnit())
        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "firebolt", GetLastReplacedUnitBJ())
        call SetUnitUserData(GetLastReplacedUnitBJ(), 70)
        call SetUnitAnimation(GetLastReplacedUnitBJ(), "death")
    else
    endif
endfunction
function Trig_Gen_Creeps_Func010Func001A takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetEnumUnit())
    call CreateNUnitsAtLoc(1, 0x6E726174, Player(PLAYER_NEUTRAL_PASSIVE), udg_D_Point1, bj_UNIT_FACING)
    call RemoveLocation(udg_D_Point1)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_D_Pick)
endfunction
function Trig_Gen_Creeps_Actions takes nothing returns nothing
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304D)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Creeps_Func003002)
    call GroupRemoveUnitSimple(udg_D_CellLast, udg_D_Pick)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = udg_D_CreepsTotal
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_RandomNumber = GetRandomInt(1, 100)
        call ForGroupBJ(GetRandomSubGroup(1, udg_D_Pick), function Trig_Gen_Creeps_Func005Func002A)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    if(Trig_Gen_Creeps_Func007C())then
        if(Trig_Gen_Creeps_Func007Func002C())then
            set udg_RandomNumber = GetRandomInt(2, 4)
        else
            set udg_RandomNumber = GetRandomInt(4, 6)
        endif
    else
        set udg_RandomNumber = GetRandomInt(1, 2)
    endif
    call ForGroupBJ(GetRandomSubGroup(udg_RandomNumber, udg_D_Pick), function Trig_Gen_Creeps_Func008A)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = GetRandomInt(5, 9)
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call ForGroupBJ(GetRandomSubGroup(1, udg_D_Pick), function Trig_Gen_Creeps_Func010Func001A)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call DestroyGroup(udg_D_Pick)
    call ConditionalTriggerExecute(gg_trg_Gen_Final)
endfunction
function InitTrig_Gen_Creeps takes nothing returns nothing
    set gg_trg_Gen_Creeps = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Creeps, function Trig_Gen_Creeps_Actions)
endfunction
function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x6E303055))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x6E303054))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x6E303052))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x6E303051))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x6E303050))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x6E30304F))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x6E303043))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func003C takes nothing returns boolean
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E303033))then
        return true
    endif
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E303035))then
        return true
    endif
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E30304A))then
        return true
    endif
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E30304E))then
        return true
    endif
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E303041))then
        return true
    endif
    return false
endfunction
function Trig_Gen_Creeps_Skills_Func002Func002Func001Func001C takes nothing returns boolean
    if(not Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func003C())then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Skills_Func002Func002Func001Func003C takes nothing returns boolean
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E303032))then
        return true
    endif
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E303030))then
        return true
    endif
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E303034))then
        return true
    endif
    if((GetUnitTypeId(GetEnumUnit()) == 0x6E30304B))then
        return true
    endif
    return false
endfunction
function Trig_Gen_Creeps_Skills_Func002Func002Func001C takes nothing returns boolean
    if(not Trig_Gen_Creeps_Skills_Func002Func002Func001Func003C())then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Skills_Func002Func002C takes nothing returns boolean
    if(not(udg_Difficulty != 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Creeps_Skills_Func002A takes nothing returns nothing
    call UnitAddAbilityBJ(0x4177616E, GetEnumUnit())
    if(Trig_Gen_Creeps_Skills_Func002Func002C())then
        if(Trig_Gen_Creeps_Skills_Func002Func002Func001C())then
            call UnitAddAbilityBJ(0x41303232, GetEnumUnit())
        else
            if(Trig_Gen_Creeps_Skills_Func002Func002Func001Func001C())then
                call UnitAddAbilityBJ(0x41303139, GetEnumUnit())
            else
                if(Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001C())then
                    call UnitAddAbilityBJ(0x41303456, GetEnumUnit())
                else
                    if(Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001C())then
                        call UnitAddAbilityBJ(0x41303541, GetEnumUnit())
                    else
                        if(Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001C())then
                            call UnitAddAbilityBJ(0x41303544, GetEnumUnit())
                        else
                            if(Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001Func001C())then
                                call UnitAddAbilityBJ(0x4130354C, GetEnumUnit())
                            else
                                if(Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001Func001Func001C())then
                                    call UnitAddAbilityBJ(0x41303232, GetEnumUnit())
                                    call UnitAddAbilityBJ(0x4130354A, GetEnumUnit())
                                else
                                    if(Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                        call UnitAddAbilityBJ(0x41303546, GetEnumUnit())
                                        call UnitAddAbilityBJ(0x41303551, GetEnumUnit())
                                    else
                                        if(Trig_Gen_Creeps_Skills_Func002Func002Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                            call UnitAddAbilityBJ(0x4130354A, GetEnumUnit())
                                        else
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
    endif
endfunction
function Trig_Gen_Creeps_Skills_Actions takes nothing returns nothing
    set udg_UnitGroup = GetUnitsOfPlayerAll(Player(11))
    call ForGroupBJ(udg_UnitGroup, function Trig_Gen_Creeps_Skills_Func002A)
    call DestroyGroup(udg_UnitGroup)
endfunction
function InitTrig_Gen_Creeps_Skills takes nothing returns nothing
    set gg_trg_Gen_Creeps_Skills = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Creeps_Skills, function Trig_Gen_Creeps_Skills_Actions)
endfunction
function Trig_Gen_Final_Func003Func001A takes nothing returns nothing
    set udg_ChestKeyOwner[GetForLoopIndexB()] = GetEnumUnit()
    call AddSpecialEffectTargetUnitBJ("chest", GetEnumUnit(), "war3mapImported\\LootEFFECT.mdx")
    set udg_ChestKeyEffect[GetForLoopIndexB()] = GetLastCreatedEffectBJ()
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_D_Pick)
endfunction
function Trig_Gen_Final_Func007Func001A takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetEnumUnit())
    set udg_D_Point2 = OffsetLocation(udg_D_Point1, GetRandomReal(0, 150.00), GetRandomReal(0, 150.00))
    call CreateNUnitsAtLoc(1, 0x68303044, Player(0), udg_D_Point2, bj_UNIT_FACING)
    set udg_Secrets_Rune[bj_forLoopAIndex] = GetLastCreatedUnit()
    call RemoveLocation(udg_D_Point1)
    call RemoveLocation(udg_D_Point2)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_D_Pick)
endfunction
function Trig_Gen_Final_Func011Func001Func001C takes nothing returns boolean
    if((GetDestructableTypeId(GetEnumDestructable()) != 0x42303156))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) != 0x42303053))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) != 0x4230314B))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) != 0x4230314C))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) != 0x4230315A))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) != 0x42303159))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) != 0x42303231))then
        return true
    endif
    return false
endfunction
function Trig_Gen_Final_Func011Func001Func003C takes nothing returns boolean
    if(not(GetDestructableTypeId(GetEnumDestructable()) == 0x42303134))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Final_Func011Func001C takes nothing returns boolean
    if(not Trig_Gen_Final_Func011Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Gen_Final_Func011A takes nothing returns nothing
    if(Trig_Gen_Final_Func011Func001C())then
        call SetDestructableInvulnerableBJ(GetEnumDestructable(), true)
        if(Trig_Gen_Final_Func011Func001Func003C())then
            set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
            call RemoveDestructable(GetEnumDestructable())
            call CreateNUnitsAtLoc(1, 0x6E303049, Player(PLAYER_NEUTRAL_PASSIVE), udg_D_Point1, bj_UNIT_FACING)
            call RemoveLocation(udg_D_Point1)
        else
        endif
    else
    endif
endfunction
function Trig_Gen_Final_Func012Func001Func001C takes nothing returns boolean
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303156))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303053))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x4230314B))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x4230314C))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x4230315A))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303159))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303231))then
        return true
    endif
    return false
endfunction
function Trig_Gen_Final_Func012Func001C takes nothing returns boolean
    if(not Trig_Gen_Final_Func012Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Gen_Final_Func012A takes nothing returns nothing
    if(Trig_Gen_Final_Func012Func001C())then
        call SetDestructableInvulnerableBJ(GetEnumDestructable(), false)
    else
    endif
endfunction
function Trig_Gen_Final_Func018002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Gen_Final_Func021002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Gen_Final_Actions takes nothing returns nothing
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Dungeon, Player(11))
    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = (udg_D_Chests + 2)
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        call ForGroupBJ(GetRandomSubGroup(1, udg_D_Pick), function Trig_Gen_Final_Func003Func001A)
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304D)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = GetRandomInt(1, (2 + (1 * udg_ART[17])))
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call ForGroupBJ(GetRandomSubGroup(1, udg_D_Pick), function Trig_Gen_Final_Func007Func001A)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call DestroyGroup(udg_D_Pick)
    call EnableTrigger(gg_trg_Secret_Search)
    call EnumDestructablesInRectAll(gg_rct_Dungeon, function Trig_Gen_Final_Func011A)
    call EnumDestructablesInRectAll(gg_rct_Dungeon, function Trig_Gen_Final_Func012A)
    set udg_D_Point1 = GetUnitLoc(udg_D_CellNumber[0])
    call SetUnitPositionLoc(udg_Arct, udg_D_Point1)
    call RemoveLocation(udg_D_Point1)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304D)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Final_Func018002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x68303054)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Final_Func021002)
    call DestroyGroup(udg_D_Pick)
    set udg_CameraDistance = 1400
    call EnableTrigger(gg_trg_Camera_Hero)
    call EnableTrigger(gg_trg_Camera_Angle_Increase)
    call EnableTrigger(gg_trg_Camera_Angle_Decrease)
    call EnableTrigger(gg_trg_Camera_Increase)
    call EnableTrigger(gg_trg_Camera_Decrease)
    call EnableTrigger(gg_trg_Escape_Initiate)
    call ConditionalTriggerExecute(gg_trg_Music_Edemium)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 0.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
    set udg_CO_CustomValue = (udg_CO_CustomValue + 1)
    set udg_Training = false
    call SetPlayerHandicapBJ(Player(11), (100.00 * I2R(udg_Difficulty)))
    call SetUnitLifePercentBJ(udg_Arct, 100)
    call SetUnitManaPercentBJ(udg_Arct, 100)
    call EnableTrigger(gg_trg_Edemium_Hero_Dies)
    call EnableTrigger(gg_trg_Creep_Kill)
    call EnableTrigger(gg_trg_Armor_Use)
    call EnableTrigger(gg_trg_Talisman_Use)
    call EnableTrigger(gg_trg_Chest_Unlock)
    call DisableTrigger(gg_trg_Artefactorium_Creep_Kill)
    call DisableTrigger(gg_trg_Artefactorium_Damage)
    call ConditionalTriggerExecute(gg_trg_Gen_Creeps_Skills)
    call EnableTrigger(gg_trg_ISeeDeadPeople)
    call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
    call DestroyFogModifier(GetLastCreatedFogModifier())
    call FogEnableOn()
    call FogMaskEnableOn()
    call CreateFogModifierRectBJ(false, Player(0), FOG_OF_WAR_MASKED, gg_rct_Dungeon)
    call LeaderboardDisplayBJ(true, udg_CO_ComboBoard)
    call ClearTextMessagesBJ(GetPlayersAll())
    call SetPlayerAbilityAvailableBJ(true, 0x41303138, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303537, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303530, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303147, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303555, Player(0))
    call EnableTrigger(gg_trg_Meditation_Cast)
    set udg_Point = GetRectCenter(gg_rct_WhosYourDaddy)
    call CreateNUnitsAtLoc(1, 0x68666F6F, Player(0), udg_Point, bj_UNIT_FACING)
    set udg_AntiCheatUnit[1] = GetLastCreatedUnit()
    call CreateNUnitsAtLoc(1, 0x686B6E69, Player(10), udg_Point, bj_UNIT_FACING)
    set udg_AntiCheatUnit[2] = GetLastCreatedUnit()
    call RemoveLocation(udg_Point)
    set udg_Point = GetRectCenter(gg_rct_Artefactorium_Spawn)
    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
    call UnitAddAbilityBJ(udg_DifficultyDamage[udg_Difficulty], GetLastCreatedUnit())
    call UnitAddAbilityBJ(udg_DifficultySpeed[udg_Difficulty], GetLastCreatedUnit())
    call RemoveLocation(udg_Point)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 24
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_AS_AbilityEXP_Base[bj_forLoopAIndex] = udg_AS_AbilityEXP[bj_forLoopAIndex]
        set udg_AS_AbilityLVL_Base[bj_forLoopAIndex] = udg_AS_AbilityLVL[bj_forLoopAIndex]
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_AS_AbilityCountLVL_Base = udg_AS_AbilityCountLVL
    set udg_AS_Points_Base = udg_AS_Points
    set udg_EX_Level_Base = GetHeroLevel(udg_Arct)
    set udg_EX_Exp_Base = GetHeroXP(udg_Arct)
    call ConditionalTriggerExecute(gg_trg_Gen_Events)
    call SetCameraBoundsToRect(gg_rct_Dungeon_Camera)
    call CameraSetSmoothingFactor(10.00)
    call PauseAllUnitsBJ(true)
    call EnablePreSelect(true, true)
    call StartTimerBJ(udg_D_TimerFinal, false, 2.50)
endfunction
function InitTrig_Gen_Final takes nothing returns nothing
    set gg_trg_Gen_Final = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Final, function Trig_Gen_Final_Actions)
endfunction
function Trig_Gen_Events_Func002Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitUserData(udg_EM_Target) == 74))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Events_Func002Func001Func001Func005A takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetEnumUnit())
    call CreateNUnitsAtLoc(1, 0x6E303048, Player(PLAYER_NEUTRAL_PASSIVE), udg_Point, bj_UNIT_FACING)
    call SetUnitUserData(GetLastCreatedUnit(), 100)
    call RemoveLocation(udg_Point)
endfunction
function Trig_Gen_Events_Func002Func001Func001C takes nothing returns boolean
    if(not(GetUnitUserData(udg_EM_Target) == 73))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Events_Func002Func001Func005A takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetEnumUnit())
    call CreateNUnitsAtLoc(1, 0x6E303134, Player(PLAYER_NEUTRAL_PASSIVE), udg_Point, bj_UNIT_FACING)
    call RemoveLocation(udg_Point)
endfunction
function Trig_Gen_Events_Func002Func001C takes nothing returns boolean
    if(not(GetUnitUserData(udg_EM_Target) == 72))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Events_Func002C takes nothing returns boolean
    if(not(GetUnitUserData(udg_EM_Target) == 71))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Events_Func003C takes nothing returns boolean
    if(not(GetHeroLevel(udg_Arct) == 3))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Events_Func004C takes nothing returns boolean
    if(not(udg_EdemEventBool[udg_EdemEventType] == false))then
        return false
    endif
    if(not(udg_EdemEventType != 0))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Events_Actions takes nothing returns nothing
    if(Trig_Gen_Events_Func002C())then
        call SetDayNightModels("", "")
        call SetTerrainFogExBJ(0, 0.00, 4000.00, 0.50, 0.00, 0.00, 0.00)
        call StartTimerBJ(udg_DungeonDarkTimer, false, (120.00 + I2R(GetHeroStatBJ(bj_HEROSTAT_STR, udg_Arct, true))))
        call CreateTimerDialogBJ(GetLastCreatedTimerBJ(), "Бесстрашие: ")
        set udg_DungeonDarkTimerWindow = GetLastCreatedTimerDialogBJ()
        call EnableTrigger(gg_trg_Dungeon_Dark)
    else
        if(Trig_Gen_Events_Func002Func001C())then
            call SetTerrainFogExBJ(0, 500.00, 8000.00, 0.50, 0.00, 100.00, 100.00)
            set udg_UnitGroup = GetUnitsInRectOfPlayer(gg_rct_Dungeon_Camera, Player(11))
            call ForGroupBJ(GetRandomSubGroup(GetRandomInt(5, 7), udg_UnitGroup), function Trig_Gen_Events_Func002Func001Func005A)
            call StartTimerBJ(udg_DungeonColdTimer, false, 30)
            set udg_DungeonColdLevel = 0
            call ShowTextTagForceBJ(true, udg_DungeonColdText, bj_FORCE_PLAYER[0])
            call EnableTrigger(gg_trg_Dungeon_Cold)
            call EnableTrigger(gg_trg_Dungeon_Cold_Text)
            call EnableTrigger(gg_trg_Dungeon_Cold_Hearth)
        else
            if(Trig_Gen_Events_Func002Func001Func001C())then
                set udg_UnitGroup = GetUnitsInRectOfPlayer(gg_rct_Dungeon_Camera, Player(11))
                call ForGroupBJ(GetRandomSubGroup(GetRandomInt(4, 5), udg_UnitGroup), function Trig_Gen_Events_Func002Func001Func001Func005A)
                call EnableTrigger(gg_trg_Dungeon_Battle_Portal)
            else
                if(Trig_Gen_Events_Func002Func001Func001Func001C())then
                    set udg_DungeonDeadlyCleansing = 3
                    call UnitAddAbilityBJ(0x41303348, udg_Arct)
                    call EnableTrigger(gg_trg_Dungeon_Deadly)
                else
                endif
            endif
        endif
    endif
    if(Trig_Gen_Events_Func003C())then
        set udg_EdemEventType = 1
    else
        set udg_EdemEventType = 0
    endif
    if(Trig_Gen_Events_Func004C())then
        call EnableTrigger(gg_trg_Events_Elapsed)
    else
    endif
endfunction
function InitTrig_Gen_Events takes nothing returns nothing
    set gg_trg_Gen_Events = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Events, function Trig_Gen_Events_Actions)
endfunction
function Trig_Gen_Unpause_Actions takes nothing returns nothing
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 3.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 100.00, 100.00, 100.00, 0.00)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_ANGLE_OF_ATTACK, 300.00, 0.00)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_TARGET_DISTANCE, 3500.00, 0.00)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_ROTATION, 90.00, 0.00)
    call PanCameraToTimedLocForPlayer(Player(0), GetRectCenter(gg_rct_Dungeon_Center), 0)
    call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Human\\ReviveHuman\\ReviveHuman.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    set udg_Transparent = 100.00
    call EnableTrigger(gg_trg_Edemium_Transparent)
    call StartTimerBJ(udg_PauseTimer, false, 3.00)
endfunction
function InitTrig_Gen_Unpause takes nothing returns nothing
    set gg_trg_Gen_Unpause = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Gen_Unpause, udg_D_TimerFinal)
    call TriggerAddAction(gg_trg_Gen_Unpause, function Trig_Gen_Unpause_Actions)
endfunction
function Trig_Gen_Exit_Conditions takes nothing returns boolean
    if(not(GetClickedButton() == udg_LeaveButton))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func010002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Gen_Exit_Func013002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Gen_Exit_Func016002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Gen_Exit_Func019002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Gen_Exit_Func022002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Gen_Exit_Func025002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Gen_Exit_Func028002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Gen_Exit_Func031002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Gen_Exit_Func035002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Gen_Exit_Func038002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Gen_Exit_Func041002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Gen_Exit_Func046002 takes nothing returns nothing
    call RemoveItem(GetEnumItem())
endfunction
function Trig_Gen_Exit_Func047002 takes nothing returns nothing
    call RemoveItem(GetEnumItem())
endfunction
function Trig_Gen_Exit_Func048002 takes nothing returns nothing
    call RemoveItem(GetEnumItem())
endfunction
function Trig_Gen_Exit_Func049002 takes nothing returns nothing
    call RemoveItem(GetEnumItem())
endfunction
function Trig_Gen_Exit_Func050Func001Func001C takes nothing returns boolean
    if(not(GetDestructableTypeId(GetEnumDestructable()) != 0x42303131))then
        return false
    endif
    if(not(GetDestructableTypeId(GetEnumDestructable()) != 0x4230304A))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func050Func001C takes nothing returns boolean
    if(not Trig_Gen_Exit_Func050Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func050A takes nothing returns nothing
    if(Trig_Gen_Exit_Func050Func001C())then
        call RemoveDestructable(GetEnumDestructable())
    else
    endif
endfunction
function Trig_Gen_Exit_Func068C takes nothing returns boolean
    if(not(udg_AS_Effect2 == true))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func069C takes nothing returns boolean
    if(not(udg_AS_Effect11 == true))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func070Func002Func003Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func070Func002Func003C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func070Func002C takes nothing returns boolean
    if(not(udg_ARTInteger[3] == 3))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func070C takes nothing returns boolean
    if(not(udg_ART[13] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func071Func001Func001Func001Func002Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func071Func001Func001Func001Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func071Func001Func001C takes nothing returns boolean
    if(not(udg_EX_LevelUp > 0))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func071Func001Func002Func007C takes nothing returns boolean
    if((GetUnitUserData(udg_EM_Target) == 7))then
        return true
    endif
    if((GetUnitUserData(udg_EM_Target) == 71))then
        return true
    endif
    if((GetUnitUserData(udg_EM_Target) == 72))then
        return true
    endif
    if((GetUnitUserData(udg_EM_Target) == 73))then
        return true
    endif
    if((GetUnitUserData(udg_EM_Target) == 74))then
        return true
    endif
    if((GetUnitUserData(udg_EM_Target) == 5))then
        return true
    endif
    return false
endfunction
function Trig_Gen_Exit_Func071Func001Func002C takes nothing returns boolean
    if(not Trig_Gen_Exit_Func071Func001Func002Func007C())then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func071Func001C takes nothing returns boolean
    if(not(udg_EM_Encounter == false))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func071Func007C takes nothing returns boolean
    if(not(udg_EM_BossRoom == false))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func071C takes nothing returns boolean
    if(not(udg_Dead == true))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func075C takes nothing returns boolean
    if(not(R2I(udg_RewardDustReal) > 0))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func108002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Gen_Exit_Func115C takes nothing returns boolean
    if(not(udg_MeditationLogic == true))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Func116C takes nothing returns boolean
    if(not(udg_SprintLogic == true))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Exit_Actions takes nothing returns nothing
    set udg_D_Point1 = GetRectCenter(gg_rct_Edemium_Leave)
    call SetUnitPositionLocFacingBJ(udg_Arct, udg_D_Point1, 0.00)
    call RemoveLocation(udg_D_Point1)
    set udg_D_Point1 = GetRectCenter(gg_rct_Dungeon_Exit)
    call SetUnitPositionLoc(udg_D_Exit, udg_D_Point1)
    call RemoveLocation(udg_D_Point1)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304C)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func010002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304D)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func013002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x68303054)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func016002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x68303038)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func019002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfPlayerAll(Player(11))
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func022002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Dungeon, Player(PLAYER_NEUTRAL_PASSIVE))
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func025002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6E726174)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func028002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Pick_Zone, Player(0))
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func031002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Dungeon, Player(1))
    call GroupRemoveUnitSimple(gg_unit_h00N_0045, udg_D_Pick)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func035002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Boss_3_Zone, Player(PLAYER_NEUTRAL_PASSIVE))
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func038002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Boss_3_Zone, Player(1))
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func041002)
    call DestroyGroup(udg_D_Pick)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 3
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call RemoveUnit(udg_Secrets_Rune[bj_forLoopAIndex])
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 2
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call RemoveUnit(udg_AntiCheatUnit[bj_forLoopAIndex])
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call DestroyTimerDialogBJ(GetLastCreatedTimerDialogBJ())
    call EnumItemsInRectBJ(gg_rct_Dungeon, function Trig_Gen_Exit_Func046002)
    call EnumItemsInRectBJ(gg_rct_Boss_3_Zone, function Trig_Gen_Exit_Func047002)
    call EnumItemsInRectBJ(gg_rct_Boss_2_Zone, function Trig_Gen_Exit_Func048002)
    call EnumItemsInRectBJ(gg_rct_Boss_Zone, function Trig_Gen_Exit_Func049002)
    call EnumDestructablesInRectAll(gg_rct_Dungeon, function Trig_Gen_Exit_Func050A)
    call DisableTrigger(gg_trg_Camera_Hero)
    call DisableTrigger(gg_trg_Camera_Boss)
    call SetCameraBoundsToRect(gg_rct_Camera_Bound_Portal)
    call EnableTrigger(gg_trg_Camera_Fix)
    call DisableTrigger(gg_trg_Camera_Angle_Increase)
    call DisableTrigger(gg_trg_Camera_Angle_Decrease)
    call DisableTrigger(gg_trg_Camera_Increase)
    call DisableTrigger(gg_trg_Camera_Decrease)
    call EnableTrigger(gg_trg_Effect_6_Periodic)
    call ConditionalTriggerExecute(gg_trg_Music_Castle)
    call UnitRemoveAbilityBJ(0x4176756C, udg_Arct)
    call CameraSetupApplyForPlayer(true, gg_cam_Camera_Portal, Player(0), 0)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 1.50, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 100.00, 100.00, 100.00, 0)
    call ClearTextMessagesBJ(GetPlayersAll())
    call DestroyEffectBJ(udg_CO_Effect6Sweep[1])
    call DestroyEffectBJ(udg_CO_Effect6Sweep[2])
    set udg_CO_Effect6Power = 0
    if(Trig_Gen_Exit_Func068C())then
        set udg_AS_Effect2 = false
        set udg_ChanceCrit = (udg_ChanceCrit - 10.00)
    else
    endif
    if(Trig_Gen_Exit_Func069C())then
        set udg_AS_Effect11 = false
        set udg_ChanceBlock = (udg_ChanceBlock - 20.00)
        call DestroyEffectBJ(udg_AS_Effect11SE)
        call SetUnitVertexColorBJ(udg_Arct, 100.00, 100.00, 100, 0)
    else
    endif
    if(Trig_Gen_Exit_Func070C())then
        set udg_ARTInteger[3] = (udg_ARTInteger[3] + 1)
        if(Trig_Gen_Exit_Func070Func002C())then
            set udg_ARTInteger[3] = 0
            set udg_RandomNumber = GetRandomInt(1, 3)
            if(Trig_Gen_Exit_Func070Func002Func003C())then
                call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, (1 * udg_ART[13]))
            else
                if(Trig_Gen_Exit_Func070Func002Func003Func001C())then
                    call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, (1 * udg_ART[13]))
                else
                    call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, (1 * udg_ART[13]))
                endif
            endif
        else
        endif
    else
    endif
    if(Trig_Gen_Exit_Func071C())then
        set udg_Dead = false
        set udg_Point = GetUnitLoc(GetTriggerUnit())
        call ReviveHeroLoc(udg_Arct, udg_Point, false)
        call RemoveLocation(udg_Point)
        set udg_EX_LevelUp = 0
        if(Trig_Gen_Exit_Func071Func007C())then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 4
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                call RemoveItem(UnitItemInSlotBJ(udg_Arct, bj_forLoopAIndex))
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            call UnitAddItemByIdSwapped(0x4930304C, udg_Arct)
        else
            set udg_Point = GetRectCenter(gg_rct_Boss_Zone_1)
            call SetTerrainTypeBJ(udg_Point, 0x51647272, - 1, 6, 1)
            call RemoveLocation(udg_Point)
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 5
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_Point = GetRandomLocInRect(gg_rct_Boss_Zone_1)
                call SetTerrainTypeBJ(udg_Point, 0x58626C6D, - 1, 2, 0)
                call RemoveLocation(udg_Point)
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        endif
    else
        if(Trig_Gen_Exit_Func071Func001C())then
            if(Trig_Gen_Exit_Func071Func001Func001C())then
                set bj_forLoopAIndex = 1
                set bj_forLoopAIndexEnd = udg_EX_LevelUp
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    set udg_RandomNumber = GetRandomInt(1, 3)
                    if(Trig_Gen_Exit_Func071Func001Func001Func001Func002C())then
                        set udg_Target = gg_unit_h012_0011
                        call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                    else
                        if(Trig_Gen_Exit_Func071Func001Func001Func001Func002Func002C())then
                            set udg_Target = gg_unit_h012_0012
                            call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                        else
                            set udg_Target = gg_unit_h012_0013
                            call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                        endif
                    endif
                    set udg_AugmentValue = GetUnitUserData(udg_Target)
                    set udg_AugmentLevel[udg_AugmentValue] = (udg_AugmentLevel[udg_AugmentValue] + 1)
                    set udg_Point = GetUnitLoc(udg_Target)
                    call DestroyTextTagBJ(udg_GiftText[udg_AugmentValue])
                    call CreateTextTagLocBJ(I2S(udg_AugmentLevel[udg_AugmentValue]), udg_Point, 150.00, 10, 100, 100, 100, 0)
                    set udg_GiftText[udg_AugmentValue] = GetLastCreatedTextTag()
                    call RemoveLocation(udg_Point)
                    set udg_AugmentPrice = udg_AugmentCost[udg_AugmentValue]
                    set udg_AugmentCost[udg_AugmentValue] = (udg_AugmentCost[udg_AugmentValue] + 10)
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
                set udg_EX_LevelUp = 0
            else
            endif
            if(Trig_Gen_Exit_Func071Func001Func002C())then
                set udg_QG_Count[2] = (udg_QG_Count[2] + 1)
                call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
                call SetUnitUserData(udg_EM_Target, 8)
                set udg_Point = GetUnitLoc(udg_EM_Target)
                call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Pearlescence.mdl")
                call RemoveLocation(udg_Point)
            else
            endif
        else
        endif
    endif
    set udg_EM_BossRoom = false
    call SetUnitLifePercentBJ(udg_Arct, 100)
    call SetUnitManaPercentBJ(udg_Arct, 100)
    if(Trig_Gen_Exit_Func075C())then
        set udg_RewardDustReal = (udg_RewardDustReal * udg_DifficultyRate)
        set udg_RewardDustReal = (udg_RewardDustReal * udg_EX_Rate)
        call AdjustPlayerStateBJ(R2I(udg_RewardDustReal), Player(0), PLAYER_STATE_RESOURCE_GOLD)
        set udg_RewardDustReal = 0.00
    else
    endif
    call DisableTrigger(gg_trg_Escape_Dialog_Dummy)
    call DisableTrigger(gg_trg_Tile_Damage)
    call DisableTrigger(gg_trg_Combo_Ability_Use)
    call DisableTrigger(gg_trg_Creep_Kill)
    call DisableTrigger(gg_trg_Armor_Use)
    call DisableTrigger(gg_trg_Talisman_Use)
    call DisableTrigger(gg_trg_Scroll_Periodic)
    call DisableTrigger(gg_trg_Chest_Unlock)
    call DisableTrigger(gg_trg_Trap_Periodic)
    call EnableTrigger(gg_trg_Artefactorium_Creep_Kill)
    call EnableTrigger(gg_trg_Artefactorium_Damage)
    call DisableTrigger(gg_trg_ISeeDeadPeople)
    call DisableTrigger(gg_trg_Secret_Search)
    call DisableTrigger(gg_trg_Boss_Creep_Spawn)
    call DisableTrigger(gg_trg_Boss_III_Creep_Spawn)
    call DisableTrigger(gg_trg_Boss_III_Portal_Spawn)
    call DisableTrigger(gg_trg_Boss_III_Puke_Rain)
    call DisableTrigger(gg_trg_Boss_III_Phase_2_Init)
    call DisableTrigger(gg_trg_Boss_III_Phase_3_Init)
    call DisableTrigger(gg_trg_Boss_III_Puke_Rain_Init)
    call DisableTrigger(gg_trg_Boss_III_Puke_Rain)
    call DisableTrigger(gg_trg_Effect_6_Periodic)
    call DisableTrigger(gg_trg_Follower_Movement)
    call DisableTrigger(gg_trg_Dungeon_Cold)
    call DisableTrigger(gg_trg_Dungeon_Cold_Text)
    call DisableTrigger(gg_trg_Dungeon_Cold_Hearth)
    call DisableTrigger(gg_trg_Dungeon_Dark)
    call DisableTrigger(gg_trg_Dungeon_Dark_Periodic)
    call DisableTrigger(gg_trg_Dungeon_Battle_Portal)
    call DisableTrigger(gg_trg_Dungeon_Deadly)
    call ForGroupBJ(udg_FollowersGroup, function Trig_Gen_Exit_Func108002)
    call GroupClear(udg_FollowersGroup)
    call DestroyTimerDialogBJ(udg_DungeonDarkTimerWindow)
    call ShowTextTagForceBJ(false, udg_DungeonColdText, bj_FORCE_PLAYER[0])
    call UnitRemoveAbilityBJ(0x41303348, udg_Arct)
    call RemoveUnit(udg_AS_Effect10Unit)
    if(Trig_Gen_Exit_Func115C())then
        set udg_MeditationLogic = false
        call AddUnitAnimationPropertiesBJ(false, "gold", udg_Arct)
        call SetUnitMoveSpeed(udg_Arct, GetUnitDefaultMoveSpeed(udg_Arct))
        call SetUnitTurnSpeedBJ(udg_Arct, 1.00)
        call DestroyEffectBJ(udg_MeditationEffect)
        call DisableTrigger(gg_trg_Meditation_Heal)
        call DisableTrigger(gg_trg_Meditation_Cast)
        call DisableTrigger(gg_trg_Meditation_Turn_Off)
    else
    endif
    if(Trig_Gen_Exit_Func116C())then
        set udg_SprintLogic = false
        call IssueImmediateOrderBJ(udg_Arct, "manashieldoff")
        call DisableTrigger(gg_trg_Sprint_Energy)
    else
    endif
    call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_SUB, udg_AS_Effect9Count2)
    call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_SUB, udg_AS_Effect9Count2)
    call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_SUB, udg_AS_Effect9Count2)
    set udg_AS_Effect9Count2 = 0
    set udg_ARTInteger[4] = 0
    call EnableWeatherEffect(GetLastCreatedWeatherEffect(), false)
    call SetPlayerAbilityAvailableBJ(false, 0x41303138, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303537, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303530, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303147, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303555, Player(0))
    call UnitRemoveAbilityBJ(0x4130335A, udg_Arct)
    call UnitRemoveAbilityBJ(0x4130334B, udg_Arct)
    call DestroyFogModifier(GetLastCreatedFogModifier())
    call FogEnableOff()
    call FogMaskEnableOff()
    call CreateFogModifierRectBJ(true, Player(0), FOG_OF_WAR_VISIBLE, GetPlayableMapRect())
    call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
    call SetTerrainFogExBJ(0, 1100.00, 15000.00, 0.50, 0.00, 20.00, 100)
    call LeaderboardDisplayBJ(false, udg_CO_ComboBoard)
    set udg_AS_Effect10 = false
    set udg_EM_EncounterChance =- 4
    set udg_Training = true
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 4
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call DestroyEffectBJ(udg_ChestKeyEffect[bj_forLoopAIndex])
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call UnitRemoveBuffsBJ(bj_REMOVEBUFFS_ALL, udg_Arct)
    call SetUnitOwner(udg_Arct, Player(0), false)
    set udg_Point = GetRectCenter(gg_rct_Trees_Leave)
    call SetUnitFacingToFaceLocTimed(udg_Arct, udg_Point, 0)
    call SetUnitMoveSpeed(GetTriggerUnit(), GetUnitDefaultMoveSpeed(GetTriggerUnit()))
    call SetUnitTurnSpeedBJ(GetTriggerUnit(), 1.00)
    call RemoveLocation(udg_Point)
    call CameraSetSmoothingFactorBJ(0.00)
    call SelectUnitForPlayerSingle(udg_Arct, Player(0))
    call EnablePreSelect(false, false)
    call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Human\\ReviveHuman\\ReviveHuman.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    set udg_Transparent = 100.00
    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 1, ("Очки навыков: " + I2S(udg_AS_Points)))
    call EnableTrigger(gg_trg_Edemium_Transparent)
    call ExecuteFunc("Autosave")
endfunction
function InitTrig_Gen_Exit takes nothing returns nothing
    set gg_trg_Gen_Exit = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Gen_Exit, udg_LeaveDialog)
    call TriggerAddCondition(gg_trg_Gen_Exit, Condition(function Trig_Gen_Exit_Conditions))
    call TriggerAddAction(gg_trg_Gen_Exit, function Trig_Gen_Exit_Actions)
endfunction
function Trig_Gen_Boss_Func042Func001Func001C takes nothing returns boolean
    if(not(udg_EM_BossCreate[3] == true))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Boss_Func042Func001C takes nothing returns boolean
    if(not(udg_EM_BossCreate[2] == true))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Boss_Func042C takes nothing returns boolean
    if(not(udg_EM_BossCreate[1] == true))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Boss_Actions takes nothing returns nothing
    set udg_Training = false
    call SetPlayerHandicapBJ(Player(11), (100.00 * I2R(udg_Difficulty)))
    call SetUnitLifePercentBJ(udg_Arct, 100)
    call SetUnitManaPercentBJ(udg_Arct, 100)
    call EnableTrigger(gg_trg_Edemium_Hero_Dies)
    call EnableTrigger(gg_trg_Creep_Kill)
    call DisableTrigger(gg_trg_Artefactorium_Creep_Kill)
    call DisableTrigger(gg_trg_Artefactorium_Damage)
    call EnableTrigger(gg_trg_Camera_Angle_Increase)
    call EnableTrigger(gg_trg_Camera_Angle_Decrease)
    call EnableTrigger(gg_trg_Camera_Increase)
    call EnableTrigger(gg_trg_Camera_Decrease)
    call EnableTrigger(gg_trg_Armor_Use)
    call EnableTrigger(gg_trg_Talisman_Use)
    set udg_CustomValues = 1
    call LeaderboardDisplayBJ(true, udg_CO_ComboBoard)
    call ClearTextMessagesBJ(GetPlayersAll())
    call SetPlayerAbilityAvailableBJ(true, 0x41303138, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303537, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303530, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303147, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303555, Player(0))
    set udg_Point = GetRectCenter(gg_rct_WhosYourDaddy)
    call CreateNUnitsAtLoc(1, 0x68666F6F, Player(0), udg_Point, bj_UNIT_FACING)
    set udg_AntiCheatUnit[1] = GetLastCreatedUnit()
    call CreateNUnitsAtLoc(1, 0x686B6E69, Player(10), udg_Point, bj_UNIT_FACING)
    set udg_AntiCheatUnit[2] = GetLastCreatedUnit()
    call RemoveLocation(udg_Point)
    set udg_Point = GetRectCenter(gg_rct_Artefactorium_Spawn)
    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
    call UnitAddAbilityBJ(udg_DifficultyDamage[udg_Difficulty], GetLastCreatedUnit())
    call UnitAddAbilityBJ(udg_DifficultySpeed[udg_Difficulty], GetLastCreatedUnit())
    call RemoveLocation(udg_Point)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 24
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_AS_AbilityEXP_Base[bj_forLoopAIndex] = udg_AS_AbilityEXP[bj_forLoopAIndex]
        set udg_AS_AbilityLVL_Base[bj_forLoopAIndex] = udg_AS_AbilityLVL[bj_forLoopAIndex]
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_AS_AbilityCountLVL_Base = udg_AS_AbilityCountLVL
    set udg_AS_Points_Base = udg_AS_Points
    set udg_D_Point1 = GetRectCenter(gg_rct_Boss_Spawn)
    if(Trig_Gen_Boss_Func042C())then
        set udg_EM_BossCreate[1] = false
        call CreateNUnitsAtLoc(1, 0x6E30304C, Player(11), udg_D_Point1, bj_UNIT_FACING)
        call SetUnitUserData(GetLastCreatedUnit(), 111)
        call PlayMusic((("/Edemium/MusicBoss1.mp3")))
        call EnableTrigger(gg_trg_Boss_Creep_Spawn)
    else
        if(Trig_Gen_Boss_Func042Func001C())then
            set udg_EM_BossCreate[2] = false
            call RemoveLocation(udg_D_Point1)
            set udg_D_Point1 = GetRectCenter(gg_rct_Boss_2_Spawn)
            call CreateNUnitsAtLoc(1, 0x6E303047, Player(11), udg_D_Point1, bj_UNIT_FACING)
            call SetUnitUserData(GetLastCreatedUnit(), 222)
            call PlayMusic((("/Edemium/MusicBoss2.mp3")))
            call EnableTrigger(gg_trg_Boss_Creep_Spawn)
            call DisableTrigger(gg_trg_Boss_II_Channel_Periodic)
            call DisableTrigger(gg_trg_Boss_II_Channel_Init)
        else
            if(Trig_Gen_Boss_Func042Func001Func001C())then
                set udg_EM_BossCreate[3] = false
                call RemoveLocation(udg_D_Point1)
                set udg_D_Point1 = GetRectCenter(gg_rct_Boss_3_Spawn)
                call CreateNUnitsAtLoc(1, 0x6E303038, Player(11), udg_D_Point1, bj_UNIT_FACING)
                call SetUnitUserData(GetLastCreatedUnit(), 333)
                call SetUnitFlyHeightBJ(GetLastCreatedUnit(), - 220.00, 1.00)
                call PlayMusic((("/Edemium/MusicBoss3.mp3")))
            else
            endif
        endif
    endif
    call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", udg_Arct)
    call RemoveLocation(udg_D_Point1)
    set udg_EM_BossUnit = GetLastCreatedUnit()
    call CameraSetSmoothingFactorBJ(10.00)
    set udg_CameraDistance = 1400
    call PauseAllUnitsBJ(true)
    call EnablePreSelect(true, true)
    call StartTimerBJ(udg_D_TimerFinal, false, 0.30)
endfunction
function InitTrig_Gen_Boss takes nothing returns nothing
    set gg_trg_Gen_Boss = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Boss, function Trig_Gen_Boss_Actions)
endfunction
function Trig_Pause_Off_Func005Func001C takes nothing returns boolean
    if(not(udg_TutorialHint[4] == false))then
        return false
    endif
    return true
endfunction
function Trig_Pause_Off_Func005C takes nothing returns boolean
    if(not(udg_TutorialHintsOn == true))then
        return false
    endif
    if(not(udg_TutorialHint[3] == false))then
        return false
    endif
    return true
endfunction
function Trig_Pause_Off_Func006Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(udg_EM_BossUnit) == 0x6E303038))then
        return false
    endif
    return true
endfunction
function Trig_Pause_Off_Func006C takes nothing returns boolean
    if(not(udg_EM_BossRoom == true))then
        return false
    endif
    return true
endfunction
function Trig_Pause_Off_Actions takes nothing returns nothing
    call PauseAllUnitsBJ(false)
    call SuspendHeroXPBJ(true, udg_Arct)
    call EnableTrigger(gg_trg_Trap_Periodic)
    call EnableTrigger(gg_trg_Tile_Damage)
    if(Trig_Pause_Off_Func005C())then
        set udg_TutorialHint[3] = true
        call DialogClearBJ(udg_TeleportDialog)
        call DialogSetMessageBJ(udg_TeleportDialog, "Смерть для Аркта не страшна, но|nвсё равно умирая он будет терять|nвсе предметы снаряжения. Твоя |nцель: найти и убить хозяина уровня. |nВ зависимости от сложности зависит |nнаграда за прохождение уровня. |nДа пребудут с тобой Боги Эдемиума.")
        call DialogAddButtonBJ(udg_TeleportDialog, "Понятно, спасибо!")
        call DialogDisplayBJ(true, udg_TeleportDialog, Player(0))
        call TriggerSleepAction(1.00)
        set udg_TutorialHint[4] = true
        call ConditionalTriggerExecute(gg_trg_QG_Generate)
    else
        if(Trig_Pause_Off_Func005Func001C())then
            set udg_TutorialHint[4] = true
            call ConditionalTriggerExecute(gg_trg_QG_Generate)
        else
        endif
    endif
    if(Trig_Pause_Off_Func006C())then
        if(Trig_Pause_Off_Func006Func001C())then
            set udg_Boss3PortalCounter = 0
            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Бледная Королева", gg_snd_AbominationYesAttack3, "Свежее мясо!", bj_TIMETYPE_ADD, 0, false)
            call EnableTrigger(gg_trg_Boss_III_Creep_Spawn)
            call EnableTrigger(gg_trg_Boss_III_Portal_Spawn)
            call EnableTrigger(gg_trg_Boss_III_Phase_2_Init)
        else
        endif
    else
    endif
endfunction
function InitTrig_Pause_Off takes nothing returns nothing
    set gg_trg_Pause_Off = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Pause_Off, udg_PauseTimer)
    call TriggerAddAction(gg_trg_Pause_Off, function Trig_Pause_Off_Actions)
endfunction
function Trig_Events_Elapsed_Func002C takes nothing returns boolean
    if(not(udg_EdemEventType == 1))then
        return false
    endif
    return true
endfunction
function Trig_Events_Elapsed_Actions takes nothing returns nothing
    if(Trig_Events_Elapsed_Func002C())then
        set udg_EventAttribute = (10 + GetHeroLevel(udg_Arct))
        call DialogClearBJ(udg_EdemEventDialog)
        call DialogSetMessageBJ(udg_EdemEventDialog, "Бродя по Эдемиуму, его стены всегда |nказались Аркту безупречно гладкими, |nбудто вытесанный и отполированный |nмрамор, однако в одном месте Аркт|nслучайно нащупал небольшое |nотверстие, идеально подходящее для |nуказательного пальца. Стоит ли Аркту |nпросунуть в отверстие палец, или нет?")
        call DialogAddButtonBJ(udg_EdemEventDialog, "Засунуть палец.")
        set udg_EdemEventButton[1] = GetLastCreatedButtonBJ()
        call DialogAddButtonBJ(udg_EdemEventDialog, ("Осмотреться (необходимо " + (I2S(udg_EventAttribute) + " мудрости).")))
        set udg_EdemEventButton[2] = GetLastCreatedButtonBJ()
        call DialogAddButtonBJ(udg_EdemEventDialog, "Пройти мимо.")
        call DialogDisplayBJ(true, udg_EdemEventDialog, Player(0))
    else
    endif
    call DisableTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Events_Elapsed takes nothing returns nothing
    set gg_trg_Events_Elapsed = CreateTrigger()
    call DisableTrigger(gg_trg_Events_Elapsed)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Events_Elapsed, 120.00)
    call TriggerAddAction(gg_trg_Events_Elapsed, function Trig_Events_Elapsed_Actions)
endfunction
function Trig_Events_Buttons_Func002Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) <= 50))then
        return false
    endif
    return true
endfunction
function Trig_Events_Buttons_Func002Func001Func001Func001C takes nothing returns boolean
    if(not(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true) >= udg_EventAttribute))then
        return false
    endif
    return true
endfunction
function Trig_Events_Buttons_Func002Func001Func001Func002Func013C takes nothing returns boolean
    if(not(GetRandomInt(1, 20) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Events_Buttons_Func002Func001Func001Func002C takes nothing returns boolean
    if(not(udg_EventSucces == true))then
        return false
    endif
    return true
endfunction
function Trig_Events_Buttons_Func002Func001Func001C takes nothing returns boolean
    if(not(GetClickedButton() == udg_EdemEventButton[2]))then
        return false
    endif
    return true
endfunction
function Trig_Events_Buttons_Func002Func001C takes nothing returns boolean
    if(not(GetClickedButton() == udg_EdemEventButton[1]))then
        return false
    endif
    return true
endfunction
function Trig_Events_Buttons_Func002C takes nothing returns boolean
    if(not(udg_EdemEventType == 1))then
        return false
    endif
    return true
endfunction
function Trig_Events_Buttons_Actions takes nothing returns nothing
    set udg_EdemEventBool[udg_EdemEventType] = true
    if(Trig_Events_Buttons_Func002C())then
        if(Trig_Events_Buttons_Func002Func001C())then
            call DialogClearBJ(udg_EdemEventDialog)
            call DialogSetMessageBJ(udg_EdemEventDialog, "Просунув палец в отверстие, оно с |nгрохотом захлопывается, оставляя |nпалец Аркта навечно запечатанным|nв стене. Резкий крик боли разлета-|nется по залам Эдемиума, оглашая |nмонстров о присутствии незваного|nгостя. Истекая кровью и с пеленой|nна глазах, Аркт продолжает схватку|nс монстрами, с Эдемиумом и с|nсамим собой.")
            call DialogAddButtonBJ(udg_EdemEventDialog, "Замечательно!")
            call DialogDisplayBJ(true, udg_EdemEventDialog, Player(0))
            set udg_Point = GetUnitLoc(udg_Arct)
            call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
            call RemoveLocation(udg_Point)
            call UnitAddAbilityBJ(0x41303450, GetLastCreatedUnit())
            call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "acidbomb", udg_Arct)
        else
            if(Trig_Events_Buttons_Func002Func001Func001C())then
                if(Trig_Events_Buttons_Func002Func001Func001Func001C())then
                    set udg_EventSucces = true
                else
                    if(Trig_Events_Buttons_Func002Func001Func001Func001Func001C())then
                        set udg_EventSucces = true
                    else
                        set udg_EventSucces = false
                    endif
                endif
                if(Trig_Events_Buttons_Func002Func001Func001Func002C())then
                    call DialogClearBJ(udg_EdemEventDialog)
                    call DialogSetMessageBJ(udg_EdemEventDialog, "Может Аркт и опрометчив, но сейчас |nему кажется всё слишком подозри- |nтельным. Пошарив немного вокруг |nон находит небольшой кусок деревян- |nной рукояти молота. Аркт отсёк |nлишнее мечем и засунул палку в |nотверстие. Оно захлопнулось, разло- |nмав отесанную рукоять пополам, од- |nнако рядом с Арктом появился |nтяжеленный сундук.")
                    call DialogAddButtonBJ(udg_EdemEventDialog, "Замечательно!")
                    call DialogDisplayBJ(true, udg_EdemEventDialog, Player(0))
                    set udg_Point = GetUnitLoc(udg_Arct)
                    call CreateNUnitsAtLoc(1, 0x6E303046, Player(PLAYER_NEUTRAL_PASSIVE), udg_Point, 180.00)
                    if(Trig_Events_Buttons_Func002Func001Func001Func002Func013C())then
                        call SetUnitUserData(GetLastCreatedUnit(), 10)
                    else
                    endif
                else
                    call DialogClearBJ(udg_EdemEventDialog)
                    call DialogSetMessageBJ(udg_EdemEventDialog, "Может Аркт и опрометчив, но сейчас |nему кажется всё слишком подозри- |nтельным. Он решает пошарить немно- |nго вокруг, однако найти что-нибудь |nподходящее так и не получилось. |nКругом только пыль, ржавое железо |nи старые кости.")
                    call DialogAddButtonBJ(udg_EdemEventDialog, "Просунуть палец.")
                    set udg_EdemEventButton[1] = GetLastCreatedButtonBJ()
                    call DialogAddButtonBJ(udg_EdemEventDialog, "Пройти мимо.")
                    call DialogDisplayBJ(true, udg_EdemEventDialog, Player(0))
                endif
            else
            endif
        endif
    else
    endif
endfunction
function InitTrig_Events_Buttons takes nothing returns nothing
    set gg_trg_Events_Buttons = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Events_Buttons, udg_EdemEventDialog)
    call TriggerAddAction(gg_trg_Events_Buttons, function Trig_Events_Buttons_Actions)
endfunction
function Trig_Dungeon_Cold_Func001Func006Func001Func001C takes nothing returns boolean
    if(not(udg_DungeonColdLevel == 3))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Func001Func006Func001C takes nothing returns boolean
    if(not(udg_DungeonColdLevel == 2))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Func001Func006C takes nothing returns boolean
    if(not(udg_DungeonColdLevel == 1))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Func001C takes nothing returns boolean
    if(not(udg_DungeonColdLevel < 3))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Actions takes nothing returns nothing
    if(Trig_Dungeon_Cold_Func001C())then
        set udg_DungeonColdLevel = (udg_DungeonColdLevel + 1)
        set udg_Point = GetUnitLoc(udg_Arct)
        call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
        call RemoveLocation(udg_Point)
        if(Trig_Dungeon_Cold_Func001Func006C())then
            call UnitAddAbilityBJ(0x41303146, GetLastCreatedUnit())
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "faeriefire", udg_Arct)
        else
            if(Trig_Dungeon_Cold_Func001Func006Func001C())then
                call UnitAddAbilityBJ(0x41303337, GetLastCreatedUnit())
                call IssueTargetOrderBJ(GetLastCreatedUnit(), "slow", udg_Arct)
            else
                if(Trig_Dungeon_Cold_Func001Func006Func001Func001C())then
                    call UnitAddAbilityBJ(0x41303339, GetLastCreatedUnit())
                    call IssueTargetOrderBJ(GetLastCreatedUnit(), "acidbomb", udg_Arct)
                else
                endif
            endif
        endif
    else
    endif
    call StartTimerBJ(udg_DungeonColdTimer, false, 30)
endfunction
function InitTrig_Dungeon_Cold takes nothing returns nothing
    set gg_trg_Dungeon_Cold = CreateTrigger()
    call DisableTrigger(gg_trg_Dungeon_Cold)
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Dungeon_Cold, udg_DungeonColdTimer)
    call TriggerAddAction(gg_trg_Dungeon_Cold, function Trig_Dungeon_Cold_Actions)
endfunction
function Trig_Dungeon_Cold_Hearth_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303134))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Hearth_Func003Func004C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Hearth_Func003Func009Func002Func001Func001C takes nothing returns boolean
    if(not(udg_DungeonColdLevel == 0))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Hearth_Func003Func009Func002Func001C takes nothing returns boolean
    if(not(udg_DungeonColdLevel == 1))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Hearth_Func003Func009Func002C takes nothing returns boolean
    if(not(udg_DungeonColdLevel == 2))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Hearth_Func003Func009C takes nothing returns boolean
    if(not(udg_DungeonColdLevel > 0))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Hearth_Func003C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_Point, udg_Point2) < 300.00))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Hearth_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetOrderTargetUnit())
    set udg_Point2 = GetUnitLoc(udg_Arct)
    if(Trig_Dungeon_Cold_Hearth_Func003C())then
        call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\BlinkCaster.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        if(Trig_Dungeon_Cold_Hearth_Func003Func009C())then
            set udg_DungeonColdLevel = (udg_DungeonColdLevel - 1)
            if(Trig_Dungeon_Cold_Hearth_Func003Func009Func002C())then
                call UnitRemoveBuffBJ(0x4230304C, udg_Arct)
            else
                if(Trig_Dungeon_Cold_Hearth_Func003Func009Func002Func001C())then
                    call UnitRemoveBuffBJ(0x4230304B, udg_Arct)
                else
                    if(Trig_Dungeon_Cold_Hearth_Func003Func009Func002Func001Func001C())then
                        call UnitRemoveBuffBJ(0x42303047, udg_Arct)
                    else
                    endif
                endif
            endif
            call StartTimerBJ(udg_DungeonColdTimer, false, 30)
        else
        endif
        call RemoveUnit(GetOrderTargetUnit())
    else
        call IssuePointOrderLocBJ(udg_Arct, "move", udg_Point)
        if(Trig_Dungeon_Cold_Hearth_Func003Func004C())then
            call CreateTextTagUnitBJ("Поближе бы...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
        else
            call CreateTextTagUnitBJ("Слишком далеко.", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
        endif
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.50)
    endif
    call RemoveLocation(udg_Point)
    call RemoveLocation(udg_Point2)
endfunction
function InitTrig_Dungeon_Cold_Hearth takes nothing returns nothing
    set gg_trg_Dungeon_Cold_Hearth = CreateTrigger()
    call DisableTrigger(gg_trg_Dungeon_Cold_Hearth)
    call TriggerRegisterUnitEvent(gg_trg_Dungeon_Cold_Hearth, gg_unit_H000_0004, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Dungeon_Cold_Hearth, Condition(function Trig_Dungeon_Cold_Hearth_Conditions))
    call TriggerAddAction(gg_trg_Dungeon_Cold_Hearth, function Trig_Dungeon_Cold_Hearth_Actions)
endfunction
function Trig_Dungeon_Cold_Text_Func001Func001Func001C takes nothing returns boolean
    if(not(udg_DungeonColdLevel == 3))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Text_Func001Func001C takes nothing returns boolean
    if(not(udg_DungeonColdLevel == 2))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Text_Func001C takes nothing returns boolean
    if(not(udg_DungeonColdLevel == 1))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Text_Actions takes nothing returns nothing
    if(Trig_Dungeon_Cold_Text_Func001C())then
        call SetTextTagTextBJ(udg_DungeonColdText, "|cFF449EFFI|rII", 11.00)
    else
        if(Trig_Dungeon_Cold_Text_Func001Func001C())then
            call SetTextTagTextBJ(udg_DungeonColdText, "|cFF449EFFII|rI", 11.00)
        else
            if(Trig_Dungeon_Cold_Text_Func001Func001Func001C())then
                call SetTextTagTextBJ(udg_DungeonColdText, "|cFF449EFFIII|r", 11.00)
            else
                call SetTextTagTextBJ(udg_DungeonColdText, "III", 11.00)
            endif
        endif
    endif
    call SetTextTagPosUnitBJ(udg_DungeonColdText, udg_Arct, 0.00)
endfunction
function InitTrig_Dungeon_Cold_Text takes nothing returns nothing
    set gg_trg_Dungeon_Cold_Text = CreateTrigger()
    call DisableTrigger(gg_trg_Dungeon_Cold_Text)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Dungeon_Cold_Text, 0.03)
    call TriggerAddAction(gg_trg_Dungeon_Cold_Text, function Trig_Dungeon_Cold_Text_Actions)
endfunction
function Trig_Dungeon_Dark_Actions takes nothing returns nothing
    call DestroyTimerDialogBJ(udg_DungeonDarkTimerWindow)
    call EnableTrigger(gg_trg_Dungeon_Dark_Periodic)
endfunction
function InitTrig_Dungeon_Dark takes nothing returns nothing
    set gg_trg_Dungeon_Dark = CreateTrigger()
    call DisableTrigger(gg_trg_Dungeon_Dark)
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Dungeon_Dark, udg_DungeonDarkTimer)
    call TriggerAddAction(gg_trg_Dungeon_Dark, function Trig_Dungeon_Dark_Actions)
endfunction
function Trig_Dungeon_Dark_Periodic_Actions takes nothing returns nothing
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 1.00, "ReplaceableTextures\\CameraMasks\\Scope_Mask.blp", 0, 0, 0, 0)
    call SetUnitOwner(udg_Arct, Player(1), false)
    set udg_Point = GetUnitLoc(udg_Arct)
    set udg_Point2 = PolarProjectionBJ(udg_Point, 1200.00, GetRandomDirectionDeg())
    call IssuePointOrderLocBJ(udg_Arct, "move", udg_Point2)
    call RemoveLocation(udg_Point)
    call RemoveLocation(udg_Point2)
    call TriggerSleepAction(5.00)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 1.00, "ReplaceableTextures\\CameraMasks\\HazeAndFogFilter_Mask.blp", 0, 0, 0, 0)
    call SetUnitOwner(udg_Arct, Player(0), false)
    call SelectUnitForPlayerSingle(udg_Arct, Player(0))
endfunction
function InitTrig_Dungeon_Dark_Periodic takes nothing returns nothing
    set gg_trg_Dungeon_Dark_Periodic = CreateTrigger()
    call DisableTrigger(gg_trg_Dungeon_Dark_Periodic)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Dungeon_Dark_Periodic, 30.00)
    call TriggerAddAction(gg_trg_Dungeon_Dark_Periodic, function Trig_Dungeon_Dark_Periodic_Actions)
endfunction
function Trig_Dungeon_Battle_Portal_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303048))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Battle_Portal_Func003Func004C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Battle_Portal_Func003Func017Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 6))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Battle_Portal_Func003Func017Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 5))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Battle_Portal_Func003Func017Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Battle_Portal_Func003Func017Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Battle_Portal_Func003Func017Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Battle_Portal_Func003Func017C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Battle_Portal_Func003C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_Point, udg_Point2) < 300.00))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Battle_Portal_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetOrderTargetUnit())
    set udg_Point2 = GetUnitLoc(udg_Arct)
    if(Trig_Dungeon_Battle_Portal_Func003C())then
        call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\BlinkCaster.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call RemoveUnit(GetOrderTargetUnit())
        call CreateNUnitsAtLoc(1, 0x48303053, Player(1), udg_Point, bj_UNIT_FACING)
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_FollowersGroup)
        call SetHeroLevelBJ(GetLastCreatedUnit(), udg_Difficulty, false)
        call SuspendHeroXPBJ(false, GetLastCreatedUnit())
        call EnableTrigger(gg_trg_Follower_Movement)
        set udg_RandomNumber = GetRandomInt(1, 9)
        if(Trig_Dungeon_Battle_Portal_Func003Func017C())then
            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_HeroPaladinYesAttack1, "Да свершится правосудие!", bj_TIMETYPE_ADD, 0, false)
        else
            if(Trig_Dungeon_Battle_Portal_Func003Func017Func001C())then
                call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_HeroPaladinYesAttack2, "Во имя Света!", bj_TIMETYPE_ADD, 0, false)
            else
                if(Trig_Dungeon_Battle_Portal_Func003Func017Func001Func001C())then
                    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_HeroPaladinYesAttack3, "Смерть неверным!", bj_TIMETYPE_ADD, 0, false)
                else
                    if(Trig_Dungeon_Battle_Portal_Func003Func017Func001Func001Func001C())then
                        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_ArthasWhat1, "Свет даёт мне силу!", bj_TIMETYPE_ADD, 0, false)
                    else
                        if(Trig_Dungeon_Battle_Portal_Func003Func017Func001Func001Func001Func001C())then
                            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_PriestYesAttack3, "Свет испепелит тебя!", bj_TIMETYPE_ADD, 0, false)
                        else
                            if(Trig_Dungeon_Battle_Portal_Func003Func017Func001Func001Func001Func001Func001C())then
                                call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_FootmanYesAttack3, "К оружию!", bj_TIMETYPE_ADD, 0, false)
                            else
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
        call IssuePointOrderLocBJ(udg_Arct, "move", udg_Point)
        if(Trig_Dungeon_Battle_Portal_Func003Func004C())then
            call CreateTextTagUnitBJ("Поближе бы...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
        else
            call CreateTextTagUnitBJ("Слишком далеко.", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
        endif
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.50)
    endif
    call RemoveLocation(udg_Point)
    call RemoveLocation(udg_Point2)
endfunction
function InitTrig_Dungeon_Battle_Portal takes nothing returns nothing
    set gg_trg_Dungeon_Battle_Portal = CreateTrigger()
    call DisableTrigger(gg_trg_Dungeon_Battle_Portal)
    call TriggerRegisterUnitEvent(gg_trg_Dungeon_Battle_Portal, gg_unit_H000_0004, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Dungeon_Battle_Portal, Condition(function Trig_Dungeon_Battle_Portal_Conditions))
    call TriggerAddAction(gg_trg_Dungeon_Battle_Portal, function Trig_Dungeon_Battle_Portal_Actions)
endfunction
function Trig_Dungeon_Deadly_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303348))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Deadly_Func002C takes nothing returns boolean
    if(not(udg_DungeonDeadlyCleansing == 0))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Deadly_Func005Func001C takes nothing returns boolean
    if(not(udg_D_DungeonTier == 2))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Deadly_Func005C takes nothing returns boolean
    if(not(udg_D_DungeonTier == 1))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Deadly_Actions takes nothing returns nothing
    set udg_DungeonDeadlyCleansing = (udg_DungeonDeadlyCleansing - 1)
    if(Trig_Dungeon_Deadly_Func002C())then
        call UnitRemoveAbilityBJ(0x41303348, GetTriggerUnit())
    else
    endif
    set udg_PointCleansing = GetSpellTargetLoc()
    call TriggerSleepAction(0.70)
    if(Trig_Dungeon_Deadly_Func005C())then
        set udg_D_TextureType = 0x51647272
    else
        if(Trig_Dungeon_Deadly_Func005Func001C())then
            set udg_D_TextureType = 0x416C7664
        else
            set udg_D_TextureType = 0x4762726B
        endif
    endif
    call SetTerrainTypeBJ(udg_PointCleansing, udg_D_TextureType, - 1, 4, 0)
    call RemoveLocation(udg_PointCleansing)
endfunction
function InitTrig_Dungeon_Deadly takes nothing returns nothing
    set gg_trg_Dungeon_Deadly = CreateTrigger()
    call DisableTrigger(gg_trg_Dungeon_Deadly)
    call TriggerRegisterUnitEvent(gg_trg_Dungeon_Deadly, gg_unit_H000_0004, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Dungeon_Deadly, Condition(function Trig_Dungeon_Deadly_Conditions))
    call TriggerAddAction(gg_trg_Dungeon_Deadly, function Trig_Dungeon_Deadly_Actions)
endfunction
function Trig_IG_Generate_Func005Func001Func001Func003Func004Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 4))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func001Func001Func003Func004Func003Func001C takes nothing returns boolean
    if(not(GetHeroLevel(udg_Arct) >= 15))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func001Func001Func003Func004Func003C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 3))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func001Func001Func003Func004C takes nothing returns boolean
    if(not(udg_IG_ItemRandom != 12))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func001Func001Func003Func010C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 4))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func001Func001Func003C takes nothing returns boolean
    if(not(udg_IG_ItemRandom != 11))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemQuality == 3))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func001Func004Func004C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 4))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func001Func004Func008Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 4))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func001Func004Func008Func002Func001C takes nothing returns boolean
    if(not(GetHeroLevel(udg_Arct) >= 25))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func001Func004Func008Func002C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 3))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func001Func004Func008C takes nothing returns boolean
    if(not(udg_IG_ItemRandom != 8))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func001Func004C takes nothing returns boolean
    if(not(udg_IG_ItemRandom != 7))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func001C takes nothing returns boolean
    if(not(udg_IG_ItemQuality == 2))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func004Func003C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 4))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func004Func008Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 4))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func004Func008Func003C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 3))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func004Func008C takes nothing returns boolean
    if(not(udg_IG_ItemRandom != 4))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005Func004C takes nothing returns boolean
    if(not(udg_IG_ItemRandom == 3))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Func005C takes nothing returns boolean
    if(not(udg_IG_ItemQuality == 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Generate_Actions takes nothing returns nothing
    if(Trig_IG_Generate_Func005C())then
        set udg_IG_ItemRandom = GetRandomInt(1, 4)
        call CreateItemLoc(udg_IG_ItemType[udg_IG_ItemRandom], udg_IG_Point)
        if(Trig_IG_Generate_Func005Func004C())then
            set bj_forLoopBIndex = 1
            set bj_forLoopBIndexEnd = 9
            loop
                exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
                set udg_IG_ItemAtt[GetForLoopIndexB()] = "1"
                set bj_forLoopBIndex = bj_forLoopBIndex + 1
            endloop
            set udg_IG_ItemAtt[GetRandomInt(1, 8)] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
            if(Trig_IG_Generate_Func005Func004Func003C())then
                set udg_IG_ItemAtt[9] = I2S(GetRandomInt(2, 9))
            else
            endif
        else
            set bj_forLoopAIndex = 2
            set bj_forLoopAIndexEnd = 4
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                set udg_IG_ItemAtt[bj_forLoopAIndex] = "1"
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            set udg_IG_RandomNumber = GetRandomInt(2, udg_IG_ItemLVL_Max)
            set udg_IG_ItemAtt[1] = I2S(udg_IG_RandomNumber)
            set udg_IG_ItemAtt[5] = I2S(udg_IG_RandomNumber)
            if(Trig_IG_Generate_Func005Func004Func008C())then
                if(Trig_IG_Generate_Func005Func004Func008Func003C())then
                    set udg_IG_ItemAtt[6] = I2S(GetRandomInt(2, 4))
                else
                    set udg_IG_ItemAtt[6] = "1"
                endif
            else
                if(Trig_IG_Generate_Func005Func004Func008Func001C())then
                    set udg_IG_ItemAtt[6] = I2S(GetRandomInt(2, 5))
                else
                    set udg_IG_ItemAtt[6] = "1"
                endif
            endif
        endif
    else
        if(Trig_IG_Generate_Func005Func001C())then
            set udg_IG_ItemRandom = GetRandomInt(5, 8)
            call CreateItemLoc(udg_IG_ItemType[udg_IG_ItemRandom], udg_IG_Point)
            if(Trig_IG_Generate_Func005Func001Func004C())then
                set udg_IG_RandomNumber = GetRandomInt(2, udg_IG_ItemLVL_Max)
                set udg_IG_ItemAtt[1] = I2S(udg_IG_RandomNumber)
                set udg_IG_ItemAtt[5] = I2S(udg_IG_RandomNumber)
                if(Trig_IG_Generate_Func005Func001Func004Func008C())then
                    if(Trig_IG_Generate_Func005Func001Func004Func008Func002C())then
                        if(Trig_IG_Generate_Func005Func001Func004Func008Func002Func001C())then
                            set udg_IG_ItemAtt[6] = I2S(GetRandomInt(2, 6))
                        else
                            set udg_IG_ItemAtt[6] = I2S(GetRandomInt(2, 4))
                        endif
                    else
                        set udg_IG_ItemAtt[6] = "1"
                    endif
                else
                    if(Trig_IG_Generate_Func005Func001Func004Func008Func001C())then
                        set udg_IG_ItemAtt[6] = I2S(GetRandomInt(2, 5))
                    else
                        set udg_IG_ItemAtt[6] = "1"
                    endif
                endif
                set bj_forLoopAIndex = 2
                set bj_forLoopAIndexEnd = 4
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    set udg_IG_ItemAtt[bj_forLoopAIndex] = "1"
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
                set udg_IG_ItemAtt[GetRandomInt(2, 4)] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
            else
                set bj_forLoopAIndex = 1
                set bj_forLoopAIndexEnd = 9
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    set udg_IG_ItemAtt[bj_forLoopAIndex] = "1"
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
                set udg_IG_ItemAtt[GetRandomInt(1, 4)] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
                set udg_IG_ItemAtt[GetRandomInt(5, 8)] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
                if(Trig_IG_Generate_Func005Func001Func004Func004C())then
                    set udg_IG_ItemAtt[9] = I2S(GetRandomInt(2, 9))
                else
                endif
            endif
        else
            if(Trig_IG_Generate_Func005Func001Func001C())then
                set udg_IG_ItemRandom = GetRandomInt(9, 12)
                call CreateItemLoc(udg_IG_ItemType[udg_IG_ItemRandom], udg_IG_Point)
                if(Trig_IG_Generate_Func005Func001Func001Func003C())then
                    set udg_IG_RandomNumber = GetRandomInt(2, udg_IG_ItemLVL_Max)
                    set udg_IG_ItemAtt[1] = I2S(udg_IG_RandomNumber)
                    set udg_IG_ItemAtt[5] = I2S(udg_IG_RandomNumber)
                    if(Trig_IG_Generate_Func005Func001Func001Func003Func004C())then
                        if(Trig_IG_Generate_Func005Func001Func001Func003Func004Func003C())then
                            if(Trig_IG_Generate_Func005Func001Func001Func003Func004Func003Func001C())then
                                set udg_IG_ItemAtt[6] = I2S(GetRandomInt(2, 6))
                            else
                                set udg_IG_ItemAtt[6] = I2S(GetRandomInt(2, 4))
                            endif
                        else
                            set udg_IG_ItemAtt[6] = "1"
                        endif
                    else
                        if(Trig_IG_Generate_Func005Func001Func001Func003Func004Func001C())then
                            set udg_IG_ItemAtt[6] = I2S(GetRandomInt(2, 5))
                        else
                            set udg_IG_ItemAtt[6] = "1"
                        endif
                    endif
                    set bj_forLoopAIndex = 2
                    set bj_forLoopAIndexEnd = 4
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        set udg_IG_ItemAtt[bj_forLoopAIndex] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_IG_ItemAtt[GetRandomInt(2, 4)] = "1"
                else
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = 9
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        set udg_IG_ItemAtt[bj_forLoopAIndex] = "1"
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                    set udg_IG_ItemAtt[GetRandomInt(1, 2)] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
                    set udg_IG_ItemAtt[GetRandomInt(3, 4)] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
                    set udg_IG_ItemAtt[GetRandomInt(5, 6)] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
                    set udg_IG_ItemAtt[GetRandomInt(7, 8)] = I2S(GetRandomInt(2, udg_IG_ItemLVL_Max))
                    if(Trig_IG_Generate_Func005Func001Func001Func003Func010C())then
                        set udg_IG_ItemAtt[9] = I2S(GetRandomInt(2, 9))
                    else
                    endif
                endif
            else
            endif
        endif
    endif
    call RemoveLocation(udg_IG_Point)
    set udg_IG_ItemCode = (udg_IG_ItemAtt[1] + udg_IG_ItemAtt[2] + udg_IG_ItemAtt[3] + udg_IG_ItemAtt[4] + udg_IG_ItemAtt[5] + udg_IG_ItemAtt[6] + udg_IG_ItemAtt[7] + udg_IG_ItemAtt[8] + udg_IG_ItemAtt[9])
    call SetItemUserData(GetLastCreatedItem(), S2I(udg_IG_ItemCode))
endfunction
function InitTrig_IG_Generate takes nothing returns nothing
    set gg_trg_IG_Generate = CreateTrigger()
    call TriggerAddAction(gg_trg_IG_Generate, function Trig_IG_Generate_Actions)
endfunction
function Trig_IG_Take_Conditions takes nothing returns boolean
    if(not(GetItemType(GetManipulatedItem()) == ITEM_TYPE_CHARGED))then
        return false
    endif
    return true
endfunction
function Trig_IG_Take_Func009Func002Func002Func002Func002C takes nothing returns boolean
    return udg_IG_ItemValue[1] > 1
endfunction
function Trig_IG_Take_Func009Func002Func002Func002Func003C takes nothing returns boolean
    return udg_IG_ItemValue[2] > 1
endfunction
function Trig_IG_Take_Func009Func002Func002Func002Func004C takes nothing returns boolean
    return udg_IG_ItemValue[3] > 1
endfunction
function Trig_IG_Take_Func009Func002Func002Func002Func005C takes nothing returns boolean
    return udg_IG_ItemValue[4] > 1
endfunction
function Trig_IG_Take_Func009Func002Func002Func002Func006Func002C takes nothing returns boolean
    return udg_IG_ItemValue[5] == 5
endfunction
function Trig_IG_Take_Func009Func002Func002Func002Func006Func003C takes nothing returns boolean
    return udg_IG_ItemValue[5] == 6
endfunction
function Trig_IG_Take_Func009Func002Func002Func002Func006Func004C takes nothing returns boolean
    return udg_IG_ItemValue[5] == 9
endfunction
function Trig_IG_Take_Func009Func002Func002Func002Func006C takes nothing returns boolean
    return udg_IG_ItemValue[5] > 1
endfunction
function Trig_IG_Take_Func009Func002Func002Func002Func007C takes nothing returns boolean
    return udg_IG_ItemValue[6] > 1
endfunction
function Trig_IG_Take_Func009Func002Func002Func002C takes nothing returns boolean
    return GetItemLevel(GetManipulatedItem()) == 3
endfunction
function Trig_IG_Take_Func009Func002Func002Func003C takes nothing returns boolean
    return udg_IG_ItemValue[1] > 1
endfunction
function Trig_IG_Take_Func009Func002Func002Func004C takes nothing returns boolean
    return udg_IG_ItemValue[2] > 1
endfunction
function Trig_IG_Take_Func009Func002Func002Func005C takes nothing returns boolean
    return udg_IG_ItemValue[3] > 1
endfunction
function Trig_IG_Take_Func009Func002Func002Func006C takes nothing returns boolean
    return udg_IG_ItemValue[4] > 1
endfunction
function Trig_IG_Take_Func009Func002Func002Func007C takes nothing returns boolean
    return udg_IG_ItemValue[5] > 1
endfunction
function Trig_IG_Take_Func009Func002Func002Func008C takes nothing returns boolean
    return udg_IG_ItemValue[6] > 1
endfunction
function Trig_IG_Take_Func009Func002Func002C takes nothing returns boolean
    return GetItemLevel(GetManipulatedItem()) == 1
endfunction
function Trig_IG_Take_Func009Func002Func003C takes nothing returns boolean
    return udg_IG_ItemValue[1] > 1
endfunction
function Trig_IG_Take_Func009Func002Func004C takes nothing returns boolean
    return udg_IG_ItemValue[2] > 1
endfunction
function Trig_IG_Take_Func009Func002Func005C takes nothing returns boolean
    return udg_IG_ItemValue[3] > 1
endfunction
function Trig_IG_Take_Func009Func002Func006C takes nothing returns boolean
    return udg_IG_ItemValue[4] > 1
endfunction
function Trig_IG_Take_Func009Func002Func007C takes nothing returns boolean
    return udg_IG_ItemValue[5] > 1
endfunction
function Trig_IG_Take_Func009Func002Func008C takes nothing returns boolean
    return udg_IG_ItemValue[6] > 1
endfunction
function Trig_IG_Take_Func009Func002C takes nothing returns boolean
    return GetItemLevel(GetManipulatedItem()) == 2
endfunction
function Trig_IG_Take_Func009Func006C takes nothing returns boolean
    return udg_IG_ItemValue[1] > 1
endfunction
function Trig_IG_Take_Func009Func007C takes nothing returns boolean
    return udg_IG_ItemValue[2] > 1
endfunction
function Trig_IG_Take_Func009Func008C takes nothing returns boolean
    return udg_IG_ItemValue[3] > 1
endfunction
function Trig_IG_Take_Func009Func009C takes nothing returns boolean
    return udg_IG_ItemValue[4] > 1
endfunction
function Trig_IG_Take_Func009Func010C takes nothing returns boolean
    return udg_IG_ItemValue[5] > 1
endfunction
function Trig_IG_Take_Func009Func011C takes nothing returns boolean
    return udg_IG_ItemValue[6] > 1
endfunction
function Trig_IG_Take_Func009Func012C takes nothing returns boolean
    return udg_IG_ItemValue[7] > 1
endfunction
function Trig_IG_Take_Func009Func013C takes nothing returns boolean
    return udg_IG_ItemValue[8] > 1
endfunction
function Trig_IG_Take_Func009Func014Func002C takes nothing returns boolean
    return udg_IG_ItemValue[9] == 2 or udg_IG_ItemValue[9] == 3 or udg_IG_ItemValue[9] == 8
endfunction
function Trig_IG_Take_Func009Func014C takes nothing returns boolean
    return udg_IG_ItemValue[9] > 1
endfunction
function Trig_IG_Take_Func009C takes nothing returns boolean
    return GetItemLevel(GetManipulatedItem()) == 4
endfunction
function Trig_IG_Take_Actions takes nothing returns nothing
    call ClearTextMessagesBJ(GetPlayersAll())
    set udg_IG_ItemValue[1] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 1, 1))
    set udg_IG_ItemValue[2] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 2, 2))
    set udg_IG_ItemValue[3] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 3, 3))
    set udg_IG_ItemValue[4] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 4, 4))
    set udg_IG_ItemValue[5] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 5, 5))
    set udg_IG_ItemValue[6] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 6, 6))
    if(Trig_IG_Take_Func009C())then
        set udg_IG_ItemValue[7] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 7, 7))
        set udg_IG_ItemValue[8] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 8, 8))
        set udg_IG_ItemValue[9] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 9, 9))
        if(Trig_IG_Take_Func009Func006C())then
            call ModifyHeroStat(bj_HEROSTAT_STR, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[1])
        else
        endif
        if(Trig_IG_Take_Func009Func007C())then
            call ModifyHeroStat(bj_HEROSTAT_AGI, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[2])
        else
        endif
        if(Trig_IG_Take_Func009Func008C())then
            call ModifyHeroStat(bj_HEROSTAT_INT, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[3])
        else
        endif
        if(Trig_IG_Take_Func009Func009C())then
            set udg_ChanceBlock = (udg_ChanceBlock + I2R(udg_IG_ItemValue[4]))
            set udg_ChanceBlockBase = (udg_ChanceBlockBase + I2R(udg_IG_ItemValue[4]))
            call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
        else
        endif
        if(Trig_IG_Take_Func009Func010C())then
            set udg_ChanceCrit = (udg_ChanceCrit + I2R(udg_IG_ItemValue[5]))
            set udg_ChanceCritBase = (udg_ChanceCritBase + I2R(udg_IG_ItemValue[5]))
            call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
        else
        endif
        if(Trig_IG_Take_Func009Func011C())then
            call UnitAddAbilityBJ(udg_IG_ItemAT_HP_T[udg_IG_ItemValue[6]], GetManipulatingUnit())
        else
        endif
        if(Trig_IG_Take_Func009Func012C())then
            call UnitAddAbilityBJ(udg_IG_ItemAT_MP[udg_IG_ItemValue[7]], GetManipulatingUnit())
        else
        endif
        if(Trig_IG_Take_Func009Func013C())then
            call UnitAddAbilityBJ(udg_IG_ItemAT_REG[udg_IG_ItemValue[8]], GetManipulatingUnit())
        else
        endif
        if(Trig_IG_Take_Func009Func014C())then
            set udg_IG_ItemEnchant[2] = udg_IG_ItemValue[9]
            if(Trig_IG_Take_Func009Func014Func002C())then
                call UnitAddAbilityBJ(0x41303532, udg_Arct)
            else
                call UnitAddAbilityBJ(0x41303347, udg_Arct)
            endif
        else
        endif
    else
        if(Trig_IG_Take_Func009Func002C())then
            if(Trig_IG_Take_Func009Func002Func003C())then
                call UnitAddAbilityBJ(udg_IG_ItemAT_ATK_L[udg_IG_ItemValue[1]], GetManipulatingUnit())
            endif
            if(Trig_IG_Take_Func009Func002Func004C())then
                set udg_ChanceCrit = (udg_ChanceCrit + I2R(udg_IG_ItemValue[2]))
                set udg_ChanceCritBase = (udg_ChanceCritBase + I2R(udg_IG_ItemValue[2]))
                call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
            endif
            if(Trig_IG_Take_Func009Func002Func005C())then
                call UnitAddAbilityBJ(udg_IG_ItemAT_SPD[udg_IG_ItemValue[3]], GetManipulatingUnit())
            else
            endif
            if(Trig_IG_Take_Func009Func002Func006C())then
                call ModifyHeroStat(bj_HEROSTAT_AGI, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[4])
            else
            endif
            if(Trig_IG_Take_Func009Func002Func007C())then
                call UnitAddAbilityBJ(udg_IG_ItemModelW_L[udg_IG_ItemValue[5]], GetManipulatingUnit())
                set udg_CO_LeftWeapon = true
            else
            endif
            if(Trig_IG_Take_Func009Func002Func008C())then
                call DestroyEffectBJ(udg_IG_ItemEnchantEffect[2])
                call AddSpecialEffectTargetUnitBJ("foot,left", GetManipulatingUnit(), udg_IG_ItemEnchantName[udg_IG_ItemValue[6]])
                set udg_IG_ItemEnchantEffect[2] = GetLastCreatedEffectBJ()
                set udg_IG_ItemEnchantInt[udg_IG_ItemValue[6]] = (udg_IG_ItemEnchantInt[udg_IG_ItemValue[6]] + 1)
            else
            endif
        else
            if(Trig_IG_Take_Func009Func002Func002C())then
                if(Trig_IG_Take_Func009Func002Func002Func003C())then
                    call UnitAddAbilityBJ(udg_IG_ItemAT_ATK_R[udg_IG_ItemValue[1]], GetManipulatingUnit())
                else
                endif
                if(Trig_IG_Take_Func009Func002Func002Func004C())then
                    set udg_ChanceCrit = (udg_ChanceCrit + I2R(udg_IG_ItemValue[2]))
                    set udg_ChanceCritBase = (udg_ChanceCritBase + I2R(udg_IG_ItemValue[2]))
                    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
                else
                endif
                if(Trig_IG_Take_Func009Func002Func002Func005C())then
                    call UnitAddAbilityBJ(udg_IG_ItemAT_SPD[udg_IG_ItemValue[3]], GetManipulatingUnit())
                else
                endif
                if(Trig_IG_Take_Func009Func002Func002Func006C())then
                    call ModifyHeroStat(bj_HEROSTAT_AGI, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[4])
                else
                endif
                if(Trig_IG_Take_Func009Func002Func002Func007C())then
                    call UnitAddAbilityBJ(udg_IG_ItemModelW_R[udg_IG_ItemValue[5]], GetManipulatingUnit())
                else
                endif
                if(Trig_IG_Take_Func009Func002Func002Func008C())then
                    call DestroyEffectBJ(udg_IG_ItemEnchantEffect[1])
                    call AddSpecialEffectTargetUnitBJ("weapon", GetManipulatingUnit(), udg_IG_ItemEnchantName[udg_IG_ItemValue[6]])
                    set udg_IG_ItemEnchantEffect[1] = GetLastCreatedEffectBJ()
                    set udg_IG_ItemEnchantInt[udg_IG_ItemValue[6]] = (udg_IG_ItemEnchantInt[udg_IG_ItemValue[6]] + 1)
                else
                endif
            else
                if(Trig_IG_Take_Func009Func002Func002Func002C())then
                    if(Trig_IG_Take_Func009Func002Func002Func002Func002C())then
                        call UnitAddAbilityBJ(udg_IG_ItemAT_DEF[udg_IG_ItemValue[1]], GetManipulatingUnit())
                    else
                    endif
                    if(Trig_IG_Take_Func009Func002Func002Func002Func003C())then
                        set udg_ChanceBlock = (udg_ChanceBlock + I2R(udg_IG_ItemValue[2]))
                        set udg_ChanceBlockBase = (udg_ChanceBlockBase + I2R(udg_IG_ItemValue[2]))
                        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
                    else
                    endif
                    if(Trig_IG_Take_Func009Func002Func002Func002Func004C())then
                        call UnitAddAbilityBJ(udg_IG_ItemAT_HP_A[udg_IG_ItemValue[3]], GetManipulatingUnit())
                    else
                    endif
                    if(Trig_IG_Take_Func009Func002Func002Func002Func005C())then
                        call ModifyHeroStat(bj_HEROSTAT_STR, GetManipulatingUnit(), bj_MODIFYMETHOD_ADD, udg_IG_ItemValue[4])
                    else
                    endif
                    if(Trig_IG_Take_Func009Func002Func002Func002Func006C())then
                        call UnitAddAbilityBJ(udg_IG_ItemModelA[udg_IG_ItemValue[5]], GetManipulatingUnit())
                        if(Trig_IG_Take_Func009Func002Func002Func002Func006Func002C())then
                            call UnitAddAbilityBJ(0x41303354, udg_Arct)
                            set udg_IG_ItemEffect_Helmet = 0x41303354
                        else
                        endif
                        if(Trig_IG_Take_Func009Func002Func002Func002Func006Func003C())then
                            call UnitAddAbilityBJ(0x4130334F, udg_Arct)
                            set udg_IG_ItemEffect_Helmet = 0x4130334F
                        else
                        endif
                        if(Trig_IG_Take_Func009Func002Func002Func002Func006Func004C())then
                            call UnitAddAbilityBJ(0x41303351, udg_Arct)
                            set udg_IG_ItemEffect_Helmet = 0x41303351
                            call UnitAddAbilityBJ(0x41303353, udg_Arct)
                            set udg_IG_ItemEffect_Pauldrons = 0x41303353
                        else
                        endif
                    else
                    endif
                    if(Trig_IG_Take_Func009Func002Func002Func002Func007C())then
                        set udg_IG_ItemEnchant[1] = udg_IG_ItemValue[6]
                        call UnitAddAbilityBJ(0x4130334D, udg_Arct)
                    else
                    endif
                else
                endif
            endif
        endif
    endif
    set udg_IG_InfoItem = GetManipulatedItem()
    set udg_IG_InfoBool = true
    call TriggerExecute(gg_trg_IG_Text)
endfunction
function InitTrig_IG_Take takes nothing returns nothing
    set gg_trg_IG_Take = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_IG_Take, gg_unit_H000_0004, EVENT_UNIT_PICKUP_ITEM)
    call TriggerAddCondition(gg_trg_IG_Take, Condition(function Trig_IG_Take_Conditions))
    call TriggerAddAction(gg_trg_IG_Take, function Trig_IG_Take_Actions)
endfunction
function Trig_IG_Drop_Conditions takes nothing returns boolean
    if(not(GetItemType(GetManipulatedItem()) == ITEM_TYPE_CHARGED))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func001Func001Func002C takes nothing returns boolean
    if(not(udg_IG_ItemValue[1] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func001Func001Func003C takes nothing returns boolean
    if(not(udg_IG_ItemValue[2] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func001Func001Func004C takes nothing returns boolean
    if(not(udg_IG_ItemValue[3] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func001Func001Func005C takes nothing returns boolean
    if(not(udg_IG_ItemValue[4] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func001Func001Func006C takes nothing returns boolean
    if(not(udg_IG_ItemValue[5] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func001Func001Func007C takes nothing returns boolean
    if(not(udg_IG_ItemValue[6] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func001Func001C takes nothing returns boolean
    if(not(GetItemLevel(GetManipulatedItem()) == 3))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func001Func003C takes nothing returns boolean
    if(not(udg_IG_ItemValue[1] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func001Func004C takes nothing returns boolean
    if(not(udg_IG_ItemValue[2] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func001Func005C takes nothing returns boolean
    if(not(udg_IG_ItemValue[3] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func001Func006C takes nothing returns boolean
    if(not(udg_IG_ItemValue[4] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func001Func007C takes nothing returns boolean
    if(not(udg_IG_ItemValue[5] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func001Func008C takes nothing returns boolean
    if(not(udg_IG_ItemValue[6] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func001C takes nothing returns boolean
    if(not(GetItemLevel(GetManipulatedItem()) == 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func003C takes nothing returns boolean
    if(not(udg_IG_ItemValue[1] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func004C takes nothing returns boolean
    if(not(udg_IG_ItemValue[2] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func005C takes nothing returns boolean
    if(not(udg_IG_ItemValue[3] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func006C takes nothing returns boolean
    if(not(udg_IG_ItemValue[4] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func007C takes nothing returns boolean
    if(not(udg_IG_ItemValue[5] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001Func008C takes nothing returns boolean
    if(not(udg_IG_ItemValue[6] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func001C takes nothing returns boolean
    if(not(GetItemLevel(GetManipulatedItem()) == 2))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func005C takes nothing returns boolean
    if(not(udg_IG_ItemValue[1] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func006C takes nothing returns boolean
    if(not(udg_IG_ItemValue[2] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func007C takes nothing returns boolean
    if(not(udg_IG_ItemValue[3] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func008C takes nothing returns boolean
    if(not(udg_IG_ItemValue[4] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func009C takes nothing returns boolean
    if(not(udg_IG_ItemValue[5] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func010C takes nothing returns boolean
    if(not(udg_IG_ItemValue[6] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func011C takes nothing returns boolean
    if(not(udg_IG_ItemValue[7] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func012C takes nothing returns boolean
    if(not(udg_IG_ItemValue[8] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008Func013C takes nothing returns boolean
    if(not(udg_IG_ItemValue[9] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Func008C takes nothing returns boolean
    if(not(GetItemLevel(GetManipulatedItem()) == 4))then
        return false
    endif
    return true
endfunction
function Trig_IG_Drop_Actions takes nothing returns nothing
    call ClearTextMessagesBJ(GetPlayersAll())
    set udg_IG_ItemValue[1] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 1, 1))
    set udg_IG_ItemValue[2] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 2, 2))
    set udg_IG_ItemValue[3] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 3, 3))
    set udg_IG_ItemValue[4] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 4, 4))
    set udg_IG_ItemValue[5] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 5, 5))
    set udg_IG_ItemValue[6] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 6, 6))
    if(Trig_IG_Drop_Func008C())then
        set udg_IG_ItemValue[7] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 7, 7))
        set udg_IG_ItemValue[8] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 8, 8))
        set udg_IG_ItemValue[9] = S2I(SubStringBJ(I2S(GetItemUserData(GetManipulatedItem())), 9, 9))
        if(Trig_IG_Drop_Func008Func005C())then
            call ModifyHeroStat(bj_HEROSTAT_STR, GetManipulatingUnit(), bj_MODIFYMETHOD_SUB, udg_IG_ItemValue[1])
        else
        endif
        if(Trig_IG_Drop_Func008Func006C())then
            call ModifyHeroStat(bj_HEROSTAT_AGI, GetManipulatingUnit(), bj_MODIFYMETHOD_SUB, udg_IG_ItemValue[2])
        else
        endif
        if(Trig_IG_Drop_Func008Func007C())then
            call ModifyHeroStat(bj_HEROSTAT_INT, GetManipulatingUnit(), bj_MODIFYMETHOD_SUB, udg_IG_ItemValue[3])
        else
        endif
        if(Trig_IG_Drop_Func008Func008C())then
            set udg_ChanceBlock = (udg_ChanceBlock - I2R(udg_IG_ItemValue[4]))
            set udg_ChanceBlockBase = (udg_ChanceBlockBase - I2R(udg_IG_ItemValue[4]))
            call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
        else
        endif
        if(Trig_IG_Drop_Func008Func009C())then
            set udg_ChanceCrit = (udg_ChanceCrit - I2R(udg_IG_ItemValue[5]))
            set udg_ChanceCritBase = (udg_ChanceCritBase - I2R(udg_IG_ItemValue[5]))
            call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
        else
        endif
        if(Trig_IG_Drop_Func008Func010C())then
            call UnitRemoveAbilityBJ(udg_IG_ItemAT_HP_T[udg_IG_ItemValue[6]], GetManipulatingUnit())
        else
        endif
        if(Trig_IG_Drop_Func008Func011C())then
            call UnitRemoveAbilityBJ(udg_IG_ItemAT_MP[udg_IG_ItemValue[7]], GetManipulatingUnit())
        else
        endif
        if(Trig_IG_Drop_Func008Func012C())then
            call UnitRemoveAbilityBJ(udg_IG_ItemAT_REG[udg_IG_ItemValue[8]], GetManipulatingUnit())
        else
        endif
        if(Trig_IG_Drop_Func008Func013C())then
            set udg_IG_ItemEnchant[2] = 0
            call UnitRemoveAbilityBJ(0x41303532, udg_Arct)
            call UnitRemoveAbilityBJ(0x41303347, udg_Arct)
        else
        endif
    else
        if(Trig_IG_Drop_Func008Func001C())then
            if(Trig_IG_Drop_Func008Func001Func003C())then
                call UnitRemoveAbilityBJ(udg_IG_ItemAT_ATK_L[udg_IG_ItemValue[1]], GetManipulatingUnit())
            else
            endif
            if(Trig_IG_Drop_Func008Func001Func004C())then
                set udg_ChanceCrit = (udg_ChanceCrit - I2R(udg_IG_ItemValue[2]))
                set udg_ChanceCritBase = (udg_ChanceCritBase - I2R(udg_IG_ItemValue[2]))
                call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
            else
            endif
            if(Trig_IG_Drop_Func008Func001Func005C())then
                call UnitRemoveAbilityBJ(udg_IG_ItemAT_SPD[udg_IG_ItemValue[3]], GetManipulatingUnit())
            else
            endif
            if(Trig_IG_Drop_Func008Func001Func006C())then
                call ModifyHeroStat(bj_HEROSTAT_AGI, GetManipulatingUnit(), bj_MODIFYMETHOD_SUB, udg_IG_ItemValue[4])
            else
            endif
            if(Trig_IG_Drop_Func008Func001Func007C())then
                call UnitRemoveAbilityBJ(udg_IG_ItemModelW_L[udg_IG_ItemValue[5]], GetManipulatingUnit())
                set udg_CO_LeftWeapon = false
            else
            endif
            if(Trig_IG_Drop_Func008Func001Func008C())then
                call DestroyEffectBJ(udg_IG_ItemEnchantEffect[2])
                set udg_IG_ItemEnchantInt[udg_IG_ItemValue[6]] = (udg_IG_ItemEnchantInt[udg_IG_ItemValue[6]] - 1)
            else
            endif
        else
            if(Trig_IG_Drop_Func008Func001Func001C())then
                if(Trig_IG_Drop_Func008Func001Func001Func003C())then
                    call UnitRemoveAbilityBJ(udg_IG_ItemAT_ATK_R[udg_IG_ItemValue[1]], GetManipulatingUnit())
                else
                endif
                if(Trig_IG_Drop_Func008Func001Func001Func004C())then
                    set udg_ChanceCrit = (udg_ChanceCrit - I2R(udg_IG_ItemValue[2]))
                    set udg_ChanceCritBase = (udg_ChanceCritBase - I2R(udg_IG_ItemValue[2]))
                    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
                else
                endif
                if(Trig_IG_Drop_Func008Func001Func001Func005C())then
                    call UnitRemoveAbilityBJ(udg_IG_ItemAT_SPD[udg_IG_ItemValue[3]], GetManipulatingUnit())
                else
                endif
                if(Trig_IG_Drop_Func008Func001Func001Func006C())then
                    call ModifyHeroStat(bj_HEROSTAT_AGI, GetManipulatingUnit(), bj_MODIFYMETHOD_SUB, udg_IG_ItemValue[4])
                else
                endif
                if(Trig_IG_Drop_Func008Func001Func001Func007C())then
                    call UnitRemoveAbilityBJ(udg_IG_ItemModelW_R[udg_IG_ItemValue[5]], GetManipulatingUnit())
                else
                endif
                if(Trig_IG_Drop_Func008Func001Func001Func008C())then
                    call DestroyEffectBJ(udg_IG_ItemEnchantEffect[1])
                    set udg_IG_ItemEnchantInt[udg_IG_ItemValue[6]] = (udg_IG_ItemEnchantInt[udg_IG_ItemValue[6]] - 1)
                else
                endif
            else
                if(Trig_IG_Drop_Func008Func001Func001Func001C())then
                    if(Trig_IG_Drop_Func008Func001Func001Func001Func002C())then
                        call UnitRemoveAbilityBJ(udg_IG_ItemAT_DEF[udg_IG_ItemValue[1]], GetManipulatingUnit())
                    else
                    endif
                    if(Trig_IG_Drop_Func008Func001Func001Func001Func003C())then
                        set udg_ChanceBlock = (udg_ChanceBlock - I2R(udg_IG_ItemValue[2]))
                        set udg_ChanceBlockBase = (udg_ChanceBlockBase - I2R(udg_IG_ItemValue[2]))
                        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
                    else
                    endif
                    if(Trig_IG_Drop_Func008Func001Func001Func001Func004C())then
                        call UnitRemoveAbilityBJ(udg_IG_ItemAT_HP_A[udg_IG_ItemValue[3]], udg_Arct)
                    else
                    endif
                    if(Trig_IG_Drop_Func008Func001Func001Func001Func005C())then
                        call ModifyHeroStat(bj_HEROSTAT_STR, GetManipulatingUnit(), bj_MODIFYMETHOD_SUB, udg_IG_ItemValue[4])
                    else
                    endif
                    if(Trig_IG_Drop_Func008Func001Func001Func001Func006C())then
                        call UnitRemoveAbilityBJ(udg_IG_ItemModelA[udg_IG_ItemValue[5]], udg_Arct)
                        call UnitRemoveAbilityBJ(udg_IG_ItemEffect_Helmet, udg_Arct)
                        call UnitRemoveAbilityBJ(udg_IG_ItemEffect_Pauldrons, udg_Arct)
                    else
                    endif
                    if(Trig_IG_Drop_Func008Func001Func001Func001Func007C())then
                        set udg_IG_ItemEnchant[1] = 0
                        call UnitRemoveAbilityBJ(0x4130334D, udg_Arct)
                    else
                    endif
                else
                endif
            endif
        endif
    endif
endfunction
function InitTrig_IG_Drop takes nothing returns nothing
    set gg_trg_IG_Drop = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_IG_Drop, gg_unit_H000_0004, EVENT_UNIT_DROP_ITEM)
    call TriggerAddCondition(gg_trg_IG_Drop, Condition(function Trig_IG_Drop_Conditions))
    call TriggerAddAction(gg_trg_IG_Drop, function Trig_IG_Drop_Actions)
endfunction
function Trig_IG_Text_Conditions takes nothing returns boolean
    if(not(GetItemType(GetManipulatedItem()) == ITEM_TYPE_CHARGED))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func001C takes nothing returns boolean
    if(not(udg_IG_InfoBool == false))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func001Func002C takes nothing returns boolean
    if(not(udg_IG_ItemValue[1] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func001Func003C takes nothing returns boolean
    if(not(udg_IG_ItemValue[2] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func001Func004C takes nothing returns boolean
    if(not(udg_IG_ItemValue[3] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func001Func005C takes nothing returns boolean
    if(not(udg_IG_ItemValue[4] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func001Func006Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemValue[6] == 5))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func001Func006Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemValue[6] == 4))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func001Func006Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemValue[6] == 3))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func001Func006Func001C takes nothing returns boolean
    if(not(udg_IG_ItemValue[6] == 2))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func001Func006C takes nothing returns boolean
    if(not(udg_IG_ItemValue[6] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func001C takes nothing returns boolean
    if(not(GetItemLevel(udg_IG_InfoItem) == 3))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func002C takes nothing returns boolean
    if((GetItemLevel(udg_IG_InfoItem) == 1))then
        return true
    endif
    if((GetItemLevel(udg_IG_InfoItem) == 2))then
        return true
    endif
    return false
endfunction
function Trig_IG_Text_Func008Func001Func003C takes nothing returns boolean
    if(not(udg_IG_ItemValue[1] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func004C takes nothing returns boolean
    if(not(udg_IG_ItemValue[2] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func005C takes nothing returns boolean
    if(not(udg_IG_ItemValue[3] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func006C takes nothing returns boolean
    if(not(udg_IG_ItemValue[4] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func007Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemValue[6] == 6))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func007Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemValue[6] == 5))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func007Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemValue[6] == 4))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func007Func001C takes nothing returns boolean
    if(not(udg_IG_ItemValue[6] == 3))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001Func007C takes nothing returns boolean
    if(not(udg_IG_ItemValue[6] == 2))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func001C takes nothing returns boolean
    if(not Trig_IG_Text_Func008Func001Func002C())then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func006C takes nothing returns boolean
    if(not(udg_IG_ItemValue[1] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func007C takes nothing returns boolean
    if(not(udg_IG_ItemValue[2] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func008C takes nothing returns boolean
    if(not(udg_IG_ItemValue[3] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func009C takes nothing returns boolean
    if(not(udg_IG_ItemValue[4] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func010C takes nothing returns boolean
    if(not(udg_IG_ItemValue[5] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func011C takes nothing returns boolean
    if(not(udg_IG_ItemValue[6] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func012C takes nothing returns boolean
    if(not(udg_IG_ItemValue[7] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func013C takes nothing returns boolean
    if(not(udg_IG_ItemValue[8] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func014Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemValue[9] == 9))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func014Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemValue[9] == 8))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func014Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemValue[9] == 7))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func014Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemValue[9] == 6))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func014Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemValue[9] == 5))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func014Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemValue[9] == 4))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func014Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemValue[9] == 3))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func014Func001C takes nothing returns boolean
    if(not(udg_IG_ItemValue[9] == 2))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008Func014C takes nothing returns boolean
    if(not(udg_IG_ItemValue[9] > 1))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Func008C takes nothing returns boolean
    if(not(GetItemLevel(udg_IG_InfoItem) == 4))then
        return false
    endif
    return true
endfunction
function Trig_IG_Text_Actions takes nothing returns nothing
    if(Trig_IG_Text_Func001C())then
        set udg_IG_InfoItem = GetManipulatedItem()
    else
        set udg_IG_InfoBool = false
    endif
    call ClearTextMessagesBJ(GetPlayersAll())
    set udg_IG_ItemValue[1] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 1, 1))
    set udg_IG_ItemValue[2] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 2, 2))
    set udg_IG_ItemValue[3] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 3, 3))
    set udg_IG_ItemValue[4] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 4, 4))
    set udg_IG_ItemValue[6] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 6, 6))
    if(Trig_IG_Text_Func008C())then
        set udg_IG_ItemValue[5] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 5, 5))
        set udg_IG_ItemValue[7] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 7, 7))
        set udg_IG_ItemValue[8] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 8, 8))
        set udg_IG_ItemValue[9] = S2I(SubStringBJ(I2S(GetItemUserData(udg_IG_InfoItem)), 9, 9))
        if(Trig_IG_Text_Func008Func006C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Стойкость +" + I2S(udg_IG_ItemValue[1])))
        else
        endif
        if(Trig_IG_Text_Func008Func007C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Ловкость +" + I2S(udg_IG_ItemValue[2])))
        else
        endif
        if(Trig_IG_Text_Func008Func008C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Мудрость +" + I2S(udg_IG_ItemValue[3])))
        else
        endif
        if(Trig_IG_Text_Func008Func009C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Шанс блока +" + (I2S(udg_IG_ItemValue[4]) + "%")))
        else
        endif
        if(Trig_IG_Text_Func008Func010C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Шанс разгрома +" + (I2S(udg_IG_ItemValue[5]) + "%")))
        else
        endif
        if(Trig_IG_Text_Func008Func011C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Здоровье +" + I2S((udg_IG_ItemValue[6] * 30))))
        else
        endif
        if(Trig_IG_Text_Func008Func012C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Энергия +" + I2S((udg_IG_ItemValue[7] * 10))))
        else
        endif
        if(Trig_IG_Text_Func008Func013C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Регенерация здоровья +" + I2S(udg_IG_ItemValue[8])))
        else
        endif
        if(Trig_IG_Text_Func008Func014C())then
            if(Trig_IG_Text_Func008Func014Func001C())then
                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFFFFFC2Скорость Света|r: рывок в указанную точку; при достижении врага он отталкивается и получает урон (зависит от стойкости)")
            else
                if(Trig_IG_Text_Func008Func014Func001Func001C())then
                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFFF4F20Огненный шар|r: все монстры вокруг указанной точки получают урон (зависит от мудрости и стойкости)")
                else
                    if(Trig_IG_Text_Func008Func014Func001Func001Func001C())then
                        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFFF6C76Ослабление|r: понижает скорость и силу атаки цели на 50% на 10 сек.")
                    else
                        if(Trig_IG_Text_Func008Func014Func001Func001Func001Func001C())then
                            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFA05AFFСлово Пилигрима|r: подчиняет указанного противника (время зависит от мудрости)")
                        else
                            if(Trig_IG_Text_Func008Func014Func001Func001Func001Func001Func001C())then
                                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFFFFFC9Освобождение|r: мгновенно убивает слабого врага у которого меньше 50% здоровья и создаёт Свет (кол-во зависит от ловкости)")
                            else
                                if(Trig_IG_Text_Func008Func014Func001Func001Func001Func001Func001Func001C())then
                                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFFFDC00Осырение|r: превращает указанного монстра в сыр на 5 сек.")
                                else
                                    if(Trig_IG_Text_Func008Func014Func001Func001Func001Func001Func001Func001Func001C())then
                                        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBF00Пугало|r: создает на несколько секунд провоцирующее монстров пугало")
                                    else
                                        if(Trig_IG_Text_Func008Func014Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFA90000Жнец|r: крадёт здоровье монстра и передает Аркту (зависит от ловкости)")
                                        else
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        else
        endif
    else
        if(Trig_IG_Text_Func008Func001C())then
            if(Trig_IG_Text_Func008Func001Func003C())then
                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Атака +" + I2S((udg_IG_ItemValue[1] * 2))))
            else
            endif
            if(Trig_IG_Text_Func008Func001Func004C())then
                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Шанс разгрома +" + (I2S(udg_IG_ItemValue[2]) + "%")))
            else
            endif
            if(Trig_IG_Text_Func008Func001Func005C())then
                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Скорость атаки +" + (I2S((udg_IG_ItemValue[3] * 3)) + "%")))
            else
            endif
            if(Trig_IG_Text_Func008Func001Func006C())then
                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Ловкость +" + I2S(udg_IG_ItemValue[4])))
            else
            endif
            if(Trig_IG_Text_Func008Func001Func007C())then
                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF00AD50Ядовитое|r (при разгроме): волна яда, отравлящая стоящих перед Арктом монстров")
            else
                if(Trig_IG_Text_Func008Func001Func007Func001C())then
                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF81DBF5Морозное|r (при разгроме): замедляет скорость монстра и высасывает энергию")
                else
                    if(Trig_IG_Text_Func008Func001Func007Func001Func001C())then
                        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF8C7A00Проклятое|r (при разгроме): сильно снижает защиту монстра и исцеляет Аркта")
                    else
                        if(Trig_IG_Text_Func008Func001Func007Func001Func001Func001C())then
                            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF9E24A2Магическое|r (при разгроме): оглушает и временно повышает шанс разгрома")
                        else
                            if(Trig_IG_Text_Func008Func001Func007Func001Func001Func001Func001C())then
                                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF00DB93Астральное|r: разгром наносит урон монстрам всем вокруг")
                            else
                            endif
                        endif
                    endif
                endif
            endif
        else
            if(Trig_IG_Text_Func008Func001Func001C())then
                if(Trig_IG_Text_Func008Func001Func001Func002C())then
                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Броня +" + I2S((udg_IG_ItemValue[1] * 2))))
                else
                endif
                if(Trig_IG_Text_Func008Func001Func001Func003C())then
                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Шанс блока +" + (I2S(udg_IG_ItemValue[2]) + "%")))
                else
                endif
                if(Trig_IG_Text_Func008Func001Func001Func004C())then
                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Здоровье +" + I2S((udg_IG_ItemValue[3] * 30))))
                else
                endif
                if(Trig_IG_Text_Func008Func001Func001Func005C())then
                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, ("Стойкость +" + I2S(udg_IG_ItemValue[4])))
                else
                endif
                if(Trig_IG_Text_Func008Func001Func001Func006C())then
                    if(Trig_IG_Text_Func008Func001Func001Func006Func001C())then
                        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFE32B00Жизнеотвод|r: восстанавливает энергию (10%) за счёт здоровья (20%)")
                    else
                        if(Trig_IG_Text_Func008Func001Func001Func006Func001Func001C())then
                            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF449EFFДушеотвод|r: восстанавливает здоровье (20%) за счёт энергии (20%)")
                        else
                            if(Trig_IG_Text_Func008Func001Func001Func006Func001Func001Func001C())then
                                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF449EFFРунический доспех|r: создаёт случайный свиток (ценой 50% энергии)")
                            else
                                if(Trig_IG_Text_Func008Func001Func001Func006Func001Func001Func001Func001C())then
                                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF90DFFFЗащитные символы|r: отталкивает всех вокруг и наносит урон (зависит от стойкости и ловкости)")
                                else
                                endif
                            endif
                        endif
                    endif
                else
                endif
            else
            endif
        endif
    endif
endfunction
function InitTrig_IG_Text takes nothing returns nothing
    set gg_trg_IG_Text = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_IG_Text, gg_unit_H000_0004, EVENT_UNIT_USE_ITEM)
    call TriggerAddCondition(gg_trg_IG_Text, Condition(function Trig_IG_Text_Conditions))
    call TriggerAddAction(gg_trg_IG_Text, function Trig_IG_Text_Actions)
endfunction
function Trig_Core_Select_Conditions takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h00F_0003))then
        return false
    endif
    return true
endfunction
function Trig_Core_Select_Func009Func001C takes nothing returns boolean
    if(not(udg_CC_Ingredient[bj_forLoopAIndex] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Core_Select_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ(0x4130344A, GetTriggerUnit())
    call UnitRemoveAbilityBJ(0x41303449, GetTriggerUnit())
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call RemoveItemFromAllStock(udg_CC_IngredientItem[bj_forLoopAIndex])
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_CC_Ingredient[bj_forLoopAIndex] = (udg_CC_Ingredient[bj_forLoopAIndex] + udg_CC_IngredientAdded[bj_forLoopAIndex])
        set udg_CC_IngredientAdded[bj_forLoopAIndex] = 0
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call ClearTextMessagesBJ(GetPlayersAll())
    call UnitAddAbilityBJ(0x4130344A, GetTriggerUnit())
    call UnitAddAbilityBJ(0x41303449, GetTriggerUnit())
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 10
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if(Trig_Core_Select_Func009Func001C())then
            call AddItemToStockBJ(udg_CC_IngredientItem[bj_forLoopAIndex], gg_unit_h00F_0003, udg_CC_Ingredient[bj_forLoopAIndex], udg_CC_Ingredient[bj_forLoopAIndex])
        else
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
endfunction
function InitTrig_Core_Select takes nothing returns nothing
    set gg_trg_Core_Select = CreateTrigger()
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Core_Select, Player(0), true)
    call TriggerAddCondition(gg_trg_Core_Select, Condition(function Trig_Core_Select_Conditions))
    call TriggerAddAction(gg_trg_Core_Select, function Trig_Core_Select_Actions)
endfunction
function Trig_Core_Secret_Select_Conditions takes nothing returns boolean
    if(not(IsUnitInGroup(GetTriggerUnit(), udg_SecretGroup) == true))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h01G_0027))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h01F_0026))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h01E_0025))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h01D_0024))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h01C_0023))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h01B_0022))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h01A_0021))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h019_0020))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h018_0019))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h017_0018))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h016_0017))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h015_0016))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h00U_0015))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h003_0014))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h002_0010))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h010_0008))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h011_0009))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h00Z_0007))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h00H_0002))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Func003C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h00Y_0005))then
        return false
    endif
    return true
endfunction
function Trig_Core_Secret_Select_Actions takes nothing returns nothing
    call ClearTextMessagesBJ(GetPlayersAll())
    if(Trig_Core_Secret_Select_Func003C())then
        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Энергии Света|r: поднятие Света восстанавливает энергию (1 ед. за уровень).|n|cFFBFBFC2Элементы|r: 3 субстанции смерти, 3 души превратности.")
    else
        if(Trig_Core_Secret_Select_Func003Func001C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Сущности Света|r: в бою каждые десять секунд создается Свет (1 ед. за уровень).|n|cFFBFBFC2Элементы|r: 3 субстанции смерти, 2 души превратности.")
        else
            if(Trig_Core_Secret_Select_Func003Func001Func001C())then
                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Богатой Добычи|r: увеличивает шанс выпадения предметов с монстров (1% за уровень).|n|cFFBFBFC2Элементы|r: 5 субстанций смерти, 5 душ превратности.")
            else
                if(Trig_Core_Secret_Select_Func003Func001Func001Func001C())then
                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Жатвы Крови|r: каждое убийство монстра восстанавливает здоровье (2% за уровень).|n|cFFBFBFC2Элементы|r: 1 субстанция смерти, 3 экстракта гниения.")
                else
                    if(Trig_Core_Secret_Select_Func003Func001Func001Func001Func001C())then
                        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Искры Пилигрима|r: после убийства монстра есть шанс (3% за уровень) применить случайный навык.|n|cFFBFBFC2Элементы|r: 4 души превратности, 4 экстракта гниения.")
                    else
                        if(Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001C())then
                            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Распыления|r: увеличивает количество получаемого Света за распыление (3 ед. за уровень).|n|cFFBFBFC2Элементы|r: 3 экстракта гниения, 8 сущностей невежества.")
                        else
                            if(Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001C())then
                                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Меча|r: увеличивает шанс разгрома (1% за уровень).|n|cFFBFBFC2Элементы|r: 10 сущностей невежества, 3 сердца ненависти.")
                            else
                                if(Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001C())then
                                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Бури|r: ежесекундно шанс 5% ударить ближайшего монстра молнией (50 ед. урона за уровень).|n|cFFBFBFC2Элементы|r: 5 душ превратности, 5 экстрактов гниения.")
                                else
                                    if(Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Пилигримов|r: в бою каждые пять секунд серия ударов увеличивается (на 1 ед. за уровень).|n|cFFBFBFC2Элементы|r: 4 природы падения, 3 ядра тьмы.")
                                    else
                                        if(Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Анимирования|r: открытие сундуков призывает на 60 сек. ожившее оружие (сила зависит от уровня) помогающее Аркту.|n|cFFBFBFC2Элементы|r: 8 сущностей невежества, 5 эссенций жадности.")
                                        else
                                            if(Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Вливания Света|r: после каждого приёма есть шанс (5% за уровень) запустить наносящий урон (сила зависит от хар-ик и серии ударов) снаряд в монстра.|n|cFFBFBFC2Элементы|r: 2 экстракта гниения, 6 сердцевин лжи.")
                                            else
                                                if(Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Защиты|r: увеличивает шанс блока (1% за уровень).|n|cFFBFBFC2Элементы|r: 3 сердцевины лжи, 3 природы падения.")
                                                else
                                                    if(Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Вынесения Урока|r: прохождение трех подземелий повышает случайную хар-ку (1 ед. за уровень).|n|cFFBFBFC2Элементы|r: 10 сущностей невежества.")
                                                    else
                                                        if(Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Сильной Воли|r: при снижении здоровья до 20% - оно восстанавливается (100 ед. за уровень). Срабатывает один раз за уровень.|n|cFFBFBFC2Элементы|r: 5 сердец ненависти.")
                                                        else
                                                            if(Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Отражений Души|r: при блоке создаёт иллюзию Аркта на 10 сек. (сила зависит от уровня).|n|cFFBFBFC2Элементы|r: 6 эссенций жадности, 6 сердцевин лжи.")
                                                            else
                                                                if(Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Роста Души|r: увеличивает все хар-ки (1 ед. за уровень).|n|cFFBFBFC2Элементы|r: 5 субстанций смерти, 3 сердца ненависти.")
                                                                else
                                                                    if(Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                                        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Проницательности|r: увеличивает максимальное количество секретов на уровне (1 ед. за уровень).|n|cFFBFBFC2Элементы|r: 7 эссенций жадности.")
                                                                    else
                                                                        if(Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                                            call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Мастерства|r: применение навыков дополнительно увеличивают серию ударов (1 ед. за уровень).|n|cFFBFBFC2Элементы|r: 3 природы падения, 2 ядра тьмы.")
                                                                        else
                                                                            if(Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                                                call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Техники Стража|r: во время действия рывка увеличивается шанс блока (3% за уровень).|n|cFFBFBFC2Элементы|r: 6 сущностей невежества, 2 сердцевины лжи.")
                                                                            else
                                                                                if(Trig_Core_Secret_Select_Func003Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                                                    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFFBFBFC2Секрет Единства Света|r: в начале боя на 15 сек. появляется Собрат, помогающий в бою (сила растет с уровнем).|n|cFFBFBFC2Элементы|r: 2 субстанции смерти, 2 души превратности, 2 экстракта гниения, 2 сущности невежества.")
                                                                                else
                                                                                endif
                                                                            endif
                                                                        endif
                                                                    endif
                                                                endif
                                                            endif
                                                        endif
                                                    endif
                                                endif
                                            endif
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endfunction
function InitTrig_Core_Secret_Select takes nothing returns nothing
    set gg_trg_Core_Secret_Select = CreateTrigger()
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Core_Secret_Select, Player(0), true)
    call TriggerAddCondition(gg_trg_Core_Secret_Select, Condition(function Trig_Core_Secret_Select_Conditions))
    call TriggerAddAction(gg_trg_Core_Secret_Select, function Trig_Core_Secret_Select_Actions)
endfunction
function Trig_Core_Put_Ingredient_Conditions takes nothing returns boolean
    if(not(GetItemType(GetSoldItem()) == ITEM_TYPE_CAMPAIGN))then
        return false
    endif
    return true
endfunction
function Trig_Core_Put_Ingredient_Func005Func002C takes nothing returns boolean
    if(not(udg_CC_Ingredient[bj_forLoopAIndex] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Core_Put_Ingredient_Func007Func001C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[bj_forLoopAIndex] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Core_Put_Ingredient_Actions takes nothing returns nothing
    set udg_CC_ItemLevel = GetItemLevel(GetSoldItem())
    set udg_CC_Ingredient[udg_CC_ItemLevel] = (udg_CC_Ingredient[udg_CC_ItemLevel] - 1)
    set udg_CC_IngredientAdded[udg_CC_ItemLevel] = (udg_CC_IngredientAdded[udg_CC_ItemLevel] + 1)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call RemoveItemFromStockBJ(udg_CC_IngredientItem[bj_forLoopAIndex], gg_unit_h00F_0003)
        if(Trig_Core_Put_Ingredient_Func005Func002C())then
            call AddItemToStockBJ(udg_CC_IngredientItem[bj_forLoopAIndex], gg_unit_h00F_0003, udg_CC_Ingredient[bj_forLoopAIndex], udg_CC_Ingredient[bj_forLoopAIndex])
        else
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call ClearTextMessagesBJ(GetPlayersAll())
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if(Trig_Core_Put_Ingredient_Func007Func001C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 999.00, (udg_CC_IngredientName[bj_forLoopAIndex] + (": " + I2S(udg_CC_IngredientAdded[bj_forLoopAIndex]))))
        else
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call RemoveItem(GetSoldItem())
endfunction
function InitTrig_Core_Put_Ingredient takes nothing returns nothing
    set gg_trg_Core_Put_Ingredient = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Core_Put_Ingredient, gg_unit_h00F_0003, EVENT_UNIT_SELL_ITEM)
    call TriggerAddCondition(gg_trg_Core_Put_Ingredient, Condition(function Trig_Core_Put_Ingredient_Conditions))
    call TriggerAddAction(gg_trg_Core_Put_Ingredient, function Trig_Core_Put_Ingredient_Actions)
endfunction
function Trig_Core_Recycle_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x4130344A))then
        return false
    endif
    return true
endfunction
function Trig_Core_Recycle_Func003Func002C takes nothing returns boolean
    if(not(udg_CC_Ingredient[bj_forLoopAIndex] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Core_Recycle_Actions takes nothing returns nothing
    call ClearTextMessagesBJ(GetPlayersAll())
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_CC_Ingredient[bj_forLoopAIndex] = (udg_CC_Ingredient[bj_forLoopAIndex] + udg_CC_IngredientAdded[bj_forLoopAIndex])
        set udg_CC_IngredientAdded[bj_forLoopAIndex] = 0
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call RemoveItemFromStockBJ(udg_CC_IngredientItem[bj_forLoopAIndex], gg_unit_h00F_0003)
        if(Trig_Core_Recycle_Func003Func002C())then
            call AddItemToStockBJ(udg_CC_IngredientItem[bj_forLoopAIndex], gg_unit_h00F_0003, udg_CC_Ingredient[bj_forLoopAIndex], udg_CC_Ingredient[bj_forLoopAIndex])
        else
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
endfunction
function InitTrig_Core_Recycle takes nothing returns nothing
    set gg_trg_Core_Recycle = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Core_Recycle, gg_unit_h00F_0003, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Core_Recycle, Condition(function Trig_Core_Recycle_Conditions))
    call TriggerAddAction(gg_trg_Core_Recycle, function Trig_Core_Recycle_Actions)
endfunction
function Trig_Core_Create_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x41303449
endfunction
function Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[1] == 2))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[2] == 2))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[3] == 2))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[4] == 2))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[4] == 6))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[7] == 2))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[8] == 3))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[9] == 2))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[6] == 7))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[1] == 5))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[5] == 3))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[6] == 6))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[7] == 6))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[5] == 5))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[4] == 10))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[7] == 3))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[8] == 3))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[3] == 2))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[7] == 6))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[4] == 8))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[6] == 5))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[8] == 4))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[9] == 3))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[2] == 5))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[3] == 5))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[4] == 10))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[5] == 3))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003Func001Func003Func003C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[3] == 3))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[4] == 8))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003Func001Func003C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[2] == 4))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[3] == 4))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003Func001C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[1] == 1))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[3] == 3))then
        return false
    endif
    return true
endfunction
function Trig_Core_Create_Func002Func003Func003C takes nothing returns boolean
    if(not(udg_CC_IngredientAdded[1] == 5))then
        return false
    endif
    if(not(udg_CC_IngredientAdded[2] == 5))then
        return false
    endif
    return true
endfunction

function Trig_Core_Create_Actions takes nothing returns nothing
    call ClearTextMessagesBJ(GetPlayersAll())
    if udg_CC_IngredientAdded[1] == 3 or udg_CC_IngredientAdded[2] == 3 then
        call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
        set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h00Y_0005)
    else
        if udg_CC_IngredientAdded[1] == 3 or udg_CC_IngredientAdded[2] == 2 then
            call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
            set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h00H_0002)
        else
            if(Trig_Core_Create_Func002Func003Func003C())then
                call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h00Z_0007)
            else
                if(Trig_Core_Create_Func002Func003Func003Func001C())then
                    call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                    set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h011_0009)
                else
                    if(Trig_Core_Create_Func002Func003Func003Func001Func003C())then
                        call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                        set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h010_0008)
                    else
                        if(Trig_Core_Create_Func002Func003Func003Func001Func003Func003C())then
                            call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                            set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h002_0010)
                        else
                            if(Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005C())then
                                call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h003_0014)
                            else
                                if(Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001C())then
                                    call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                    set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h00U_0015)
                                else
                                    if(Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001C())then
                                        call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                        set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h015_0016)
                                    else
                                        if(Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001C())then
                                            call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                            set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h016_0017)
                                        else
                                            if(Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001C())then
                                                call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h017_0018)
                                            else
                                                if(Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001C())then
                                                    call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                    set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h018_0019)
                                                else
                                                    if(Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001Func001C())then
                                                        call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                        set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h019_0020)
                                                    else
                                                        if(Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001Func001Func001C())then
                                                            call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                            set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h01A_0021)
                                                        else
                                                            if(Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                                call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                                set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h01B_0022)
                                                            else
                                                                if(Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                                    call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                                    set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h01C_0023)
                                                                else
                                                                    if(Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                                        call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                                        set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h01D_0024)
                                                                    else
                                                                        if(Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                                            call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                                            set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h01E_0025)
                                                                        else
                                                                            if(Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                                                call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                                                set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h01F_0026)
                                                                            else
                                                                                if(Trig_Core_Create_Func002Func003Func003Func001Func003Func003Func005Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                                                    call ConditionalTriggerExecute(gg_trg_Core_Start_Timer)
                                                                                    set udg_CC_SecretNumber = GetUnitUserData(gg_unit_h01G_0027)
                                                                                else
                                                                                    call CreateTextTagUnitBJ("Ничего...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
                                                                                    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
                                                                                    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                                                                                    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 3.00)
                                                                                    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 2.50)
                                                                                endif
                                                                            endif
                                                                        endif
                                                                    endif
                                                                endif
                                                            endif
                                                        endif
                                                    endif
                                                endif
                                            endif
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_CC_IngredientAdded[bj_forLoopAIndex] = 0
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    if not udg_CC_SecretUnlocked[udg_CC_SecretNumber] then
        set udg_CC_SecretUnlocked[udg_CC_SecretNumber] = true
        call ShowUnitShow(udg_CC_SecretUnit[udg_CC_SecretNumber])
    else
    endif
endfunction
function InitTrig_Core_Create takes nothing returns nothing
    set gg_trg_Core_Create = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Core_Create, gg_unit_h00F_0003, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Core_Create, Condition(function Trig_Core_Create_Conditions))
    call TriggerAddAction(gg_trg_Core_Create, function Trig_Core_Create_Actions)
endfunction
function Trig_Core_Start_Timer_Actions takes nothing returns nothing
    call ShowUnitHide(gg_unit_h00F_0003)
    call StartTimerBJ(udg_CC_Timer, false, 3.00)
    set udg_Point = GetUnitLoc(gg_unit_h00F_0003)
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\CoreCraft.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\LaserStrike.mdx")
    set udg_CC_Effect = GetLastCreatedEffectBJ()
    call RemoveLocation(udg_Point)
endfunction
function InitTrig_Core_Start_Timer takes nothing returns nothing
    set gg_trg_Core_Start_Timer = CreateTrigger()
    call TriggerAddAction(gg_trg_Core_Start_Timer, function Trig_Core_Start_Timer_Actions)
endfunction
function Trig_Core_Timer_Func010C takes nothing returns boolean
    if(not(udg_CC_SecretNumber == 7))then
        return false
    endif
    return true
endfunction
function Trig_Core_Timer_Func011C takes nothing returns boolean
    if(not(udg_CC_SecretNumber == 12))then
        return false
    endif
    return true
endfunction
function Trig_Core_Timer_Func012C takes nothing returns boolean
    if(not(udg_CC_SecretNumber == 16))then
        return false
    endif
    return true
endfunction
function Trig_Core_Timer_Actions takes nothing returns nothing
    set udg_ART[udg_CC_SecretNumber] = (udg_ART[udg_CC_SecretNumber] + 1)
    set udg_QG_Count[8] = (udg_QG_Count[8] + 1)
    call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
    call DestroyTextTagBJ(udg_CC_SecretLevel[udg_CC_SecretNumber])
    set udg_Point = GetUnitLoc(udg_CC_SecretUnit[udg_CC_SecretNumber])
    call CreateTextTagLocBJ(I2S(udg_ART[udg_CC_SecretNumber]), udg_Point, (GetUnitFlyHeight(udg_CC_SecretUnit[udg_CC_SecretNumber]) + 40.00), 10, 100, 100, 100, 0)
    call RemoveLocation(udg_Point)
    set udg_CC_SecretLevel[udg_CC_SecretNumber] = GetLastCreatedTextTag()
    if(Trig_Core_Timer_Func010C())then
        set udg_ChanceCrit = (udg_ChanceCrit + 1)
        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
    else
    endif
    if(Trig_Core_Timer_Func011C())then
        set udg_ChanceBlock = (udg_ChanceBlock + 1)
        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
    else
    endif
    if(Trig_Core_Timer_Func012C())then
        call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
        call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
        call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
    else
    endif
    call ShowUnitShow(gg_unit_h00F_0003)
    call DestroyEffectBJ(udg_CC_Effect)
    set udg_Point = GetRectCenter(gg_rct_Core_Create)
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Heal_Small.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call RemoveLocation(udg_Point)
    set udg_AutosaveBool = true
endfunction
function InitTrig_Core_Timer takes nothing returns nothing
    set gg_trg_Core_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Core_Timer, udg_CC_Timer)
    call TriggerAddAction(gg_trg_Core_Timer, function Trig_Core_Timer_Actions)
endfunction
function Trig_Core_Item_Pickup_Func001C takes nothing returns boolean
    if(not(GetItemType(GetManipulatedItem()) == ITEM_TYPE_CAMPAIGN))then
        return false
    endif
    return true
endfunction
function Trig_Core_Item_Pickup_Func002C takes nothing returns boolean
    if(not(GetItemType(GetManipulatedItem()) == ITEM_TYPE_PURCHASABLE))then
        return false
    endif
    return true
endfunction
function Trig_Core_Item_Pickup_Actions takes nothing returns nothing
    if(Trig_Core_Item_Pickup_Func001C())then
        set udg_CC_Ingredient[GetItemLevel(GetManipulatedItem())] = (udg_CC_Ingredient[GetItemLevel(GetManipulatedItem())] + 1)
        call RemoveItem(GetManipulatedItem())
    else
    endif
    if(Trig_Core_Item_Pickup_Func002C())then
        call ShowUnitShow(udg_CC_SecretUnit[GetItemLevel(GetManipulatedItem())])
        set udg_CC_SecretUnlocked[GetItemLevel(GetManipulatedItem())] = true
        call RemoveItem(GetManipulatedItem())
        call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Human\\Slow\\SlowCaster.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call AddSpecialEffectTargetUnitBJ("overhead", gg_unit_H000_0004, "war3mapImported\\SoundEffect3.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call CreateTextTagUnitBJ("Секрет раскрыт!", udg_Arct, 0, 11.00, 100.00, 100.00, 100.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.50)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
    else
    endif
endfunction
function InitTrig_Core_Item_Pickup takes nothing returns nothing
    set gg_trg_Core_Item_Pickup = CreateTrigger()
    call DisableTrigger(gg_trg_Core_Item_Pickup)
    call TriggerRegisterUnitEvent(gg_trg_Core_Item_Pickup, gg_unit_H000_0004, EVENT_UNIT_PICKUP_ITEM)
    call TriggerAddAction(gg_trg_Core_Item_Pickup, function Trig_Core_Item_Pickup_Actions)
endfunction
function Trig_Talent_Kill_Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetTriggerUnit()) == Player(11)))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x68303039))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x68303133))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x68303134))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x7567686F))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x6F737031))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x6E303039))then
        return false
    endif
    return true
endfunction
function Trig_Talent_Kill_Conditions takes nothing returns boolean
    if(not Trig_Talent_Kill_Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Talent_Kill_Func002C takes nothing returns boolean
    if(not(udg_ART[4] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Talent_Kill_Func003Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) <= (3 * udg_ART[5])))then
        return false
    endif
    return true
endfunction
function Trig_Talent_Kill_Func003C takes nothing returns boolean
    if(not(udg_ART[5] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Talent_Kill_Actions takes nothing returns nothing
    if(Trig_Talent_Kill_Func002C())then
        set udg_AbilityPower = (GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_Arct) * (2.00 * I2R(udg_ART[4])))
        set udg_AbilityPower = (udg_AbilityPower / 100.00)
        call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
    else
    endif
    if(Trig_Talent_Kill_Func003C())then
        if(Trig_Talent_Kill_Func003Func001C())then
            set udg_AS_SeriesNumber = GetRandomInt(1, 4)
            call ConditionalTriggerExecute(gg_trg_Abilities_Effects)
        else
        endif
    else
    endif
endfunction
function InitTrig_Talent_Kill takes nothing returns nothing
    set gg_trg_Talent_Kill = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Talent_Kill, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Talent_Kill, Condition(function Trig_Talent_Kill_Conditions))
    call TriggerAddAction(gg_trg_Talent_Kill, function Trig_Talent_Kill_Actions)
endfunction
function Trig_Talent_Periodic_Func001Func001Func002C takes nothing returns boolean
    if(not(udg_ARTInteger[1] == 10))then
        return false
    endif
    return true
endfunction
function Trig_Talent_Periodic_Func001Func001C takes nothing returns boolean
    if(not(udg_Combat == true))then
        return false
    endif
    if(not(udg_Artefactorium == false))then
        return false
    endif
    return true
endfunction
function Trig_Talent_Periodic_Func001C takes nothing returns boolean
    if(not(udg_ART[2] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Talent_Periodic_Func002Func001Func011Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    if(not(IsUnitAliveBJ(GetEnumUnit()) == true))then
        return false
    endif
    return true
endfunction
function Trig_Talent_Periodic_Func002Func001Func011A takes nothing returns nothing
    if(Trig_Talent_Periodic_Func002Func001Func011Func001C())then
        set udg_Point = GetUnitLoc(GetEnumUnit())
        call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Blue Lightning.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call RemoveLocation(udg_Point)
    else
    endif
endfunction
function Trig_Talent_Periodic_Func002Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) <= 5))then
        return false
    endif
    return true
endfunction
function Trig_Talent_Periodic_Func002C takes nothing returns boolean
    if(not(udg_ART[8] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Talent_Periodic_Func003Func001Func002C takes nothing returns boolean
    if(not(udg_ARTInteger[2] == 5))then
        return false
    endif
    return true
endfunction
function Trig_Talent_Periodic_Func003Func001C takes nothing returns boolean
    if(not(udg_Combat == true))then
        return false
    endif
    return true
endfunction
function Trig_Talent_Periodic_Func003C takes nothing returns boolean
    if(not(udg_ART[9] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Talent_Periodic_Func004Func003Func001C takes nothing returns boolean
    if(not(udg_ARTInteger[4] == 0))then
        return false
    endif
    return true
endfunction
function Trig_Talent_Periodic_Func004Func003C takes nothing returns boolean
    if(not(udg_AbilityPower > GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct)))then
        return false
    endif
    return true
endfunction
function Trig_Talent_Periodic_Func004C takes nothing returns boolean
    if(not(udg_ART[14] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Talent_Periodic_Actions takes nothing returns nothing
    if(Trig_Talent_Periodic_Func001C())then
        if(Trig_Talent_Periodic_Func001Func001C())then
            set udg_ARTInteger[1] = (udg_ARTInteger[1] + 1)
            if(Trig_Talent_Periodic_Func001Func001Func002C())then
                set udg_ARTInteger[1] = 0
                set udg_RandomNumber = (udg_ART[GetUnitUserData(gg_unit_h00H_0002)] + 1)
                set udg_LightOrbs[1] = (udg_LightOrbs[1] + udg_RandomNumber)
                set udg_LightIterations = (udg_LightIterations + udg_RandomNumber)
                call EnableTrigger(gg_trg_Orbs_Spawn)
            else
            endif
        else
        endif
    else
    endif
    if(Trig_Talent_Periodic_Func002C())then
        if(Trig_Talent_Periodic_Func002Func001C())then
            set udg_AbilityPower = (I2R(udg_ART[8]) * 50.00)
            set udg_Point = GetUnitLoc(udg_Arct)
            set udg_UnitGroup = GetUnitsInRangeOfLocAll(500.00, udg_Point)
            call RemoveLocation(udg_Point)
            set udg_UnitGroupPlayer = GetUnitsOfPlayerAll(Player(0))
            call GroupRemoveGroup(udg_UnitGroupPlayer, udg_UnitGroup)
            call DestroyGroup(udg_UnitGroupPlayer)
            set udg_UnitGroupPlayer = GetUnitsOfPlayerAll(Player(1))
            call GroupRemoveGroup(udg_UnitGroupPlayer, udg_UnitGroup)
            call DestroyGroup(udg_UnitGroupPlayer)
            call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Talent_Periodic_Func002Func001Func011A)
            call DestroyGroup(udg_UnitGroup)
        else
        endif
    else
    endif
    if(Trig_Talent_Periodic_Func003C())then
        if(Trig_Talent_Periodic_Func003Func001C())then
            set udg_ARTInteger[2] = (udg_ARTInteger[2] + 1)
            if(Trig_Talent_Periodic_Func003Func001Func002C())then
                set udg_ARTInteger[2] = 0
                set udg_CO_Combo = (udg_CO_Combo + (1 * udg_ART[9]))
                call LeaderboardSetLabelBJ(udg_CO_ComboBoard, ("Серия ударов: " + I2S(udg_CO_Combo)))
            else
            endif
        else
        endif
    else
    endif
    if(Trig_Talent_Periodic_Func004C())then
        set udg_AbilityPower = (GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_Arct) * 20.00)
        set udg_AbilityPower = (udg_AbilityPower / 100.00)
        if(Trig_Talent_Periodic_Func004Func003C())then
            if(Trig_Talent_Periodic_Func004Func003Func001C())then
                set udg_ARTInteger[4] = 1
                call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + (100.00 * I2R(udg_ART[14]))))
                call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Human\\Resurrect\\ResurrectTarget.mdl")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
            else
            endif
        else
        endif
    else
    endif
endfunction
function InitTrig_Talent_Periodic takes nothing returns nothing
    set gg_trg_Talent_Periodic = CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_Talent_Periodic, 1.00)
    call TriggerAddAction(gg_trg_Talent_Periodic, function Trig_Talent_Periodic_Actions)
endfunction
function Trig_Combo_Ability_Use_Func001C takes nothing returns boolean
    if((GetSpellAbilityId() == 0x41303138))then
        return true
    endif
    if((GetSpellAbilityId() == 0x41303537))then
        return true
    endif
    if((GetSpellAbilityId() == 0x41303530))then
        return true
    endif
    return false
endfunction
function Trig_Combo_Ability_Use_Conditions takes nothing returns boolean
    if(not Trig_Combo_Ability_Use_Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func005C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303138))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func006C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303537))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func007C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303530))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010Func005C takes nothing returns boolean
    if(not(udg_CO_LeftWeapon == true))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010Func018Func004Func004C takes nothing returns boolean
    if(not(udg_CO_ComboSeries[1] == 3))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010Func018Func004Func005C takes nothing returns boolean
    if(not(udg_CO_ComboSeries[2] == 5))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010Func018Func004Func006C takes nothing returns boolean
    if(not(udg_CO_ComboSeries[3] == 7))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010Func018Func004Func007C takes nothing returns boolean
    if(not(udg_CO_ComboSeries[4] == 9))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010Func018Func004Func009C takes nothing returns boolean
    if((udg_CO_ComboSeries[1] == 3))then
        return true
    endif
    if((udg_CO_ComboSeries[2] == 5))then
        return true
    endif
    if((udg_CO_ComboSeries[3] == 7))then
        return true
    endif
    if((udg_CO_ComboSeries[4] == 9))then
        return true
    endif
    return false
endfunction
function Trig_Combo_Ability_Use_Func010Func018Func004C takes nothing returns boolean
    if(not Trig_Combo_Ability_Use_Func010Func018Func004Func009C())then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010Func018A takes nothing returns nothing
    set udg_AS_EnemyTarget = udg_CO_AttackingUnit[GetUnitUserData(GetEnumUnit())]
    call UnitAddAbilityBJ(0x41303445, GetTriggerUnit())
    call StartTimerBJ(udg_CO_CombatTimer2, false, 0.40)
    if(Trig_Combo_Ability_Use_Func010Func018Func004C())then
        if(Trig_Combo_Ability_Use_Func010Func018Func004Func004C())then
            set udg_CO_ComboSeries[1] = 0
            set udg_AS_SeriesNumber = 1
            call ConditionalTriggerExecute(gg_trg_Abilities_Effects)
        else
        endif
        if(Trig_Combo_Ability_Use_Func010Func018Func004Func005C())then
            set udg_CO_ComboSeries[2] = 0
            set udg_AS_SeriesNumber = 2
            call ConditionalTriggerExecute(gg_trg_Abilities_Effects)
        else
        endif
        if(Trig_Combo_Ability_Use_Func010Func018Func004Func006C())then
            set udg_CO_ComboSeries[3] = 0
            set udg_AS_SeriesNumber = 3
            call ConditionalTriggerExecute(gg_trg_Abilities_Effects)
        else
        endif
        if(Trig_Combo_Ability_Use_Func010Func018Func004Func007C())then
            set udg_CO_ComboSeries[4] = 0
            set udg_AS_SeriesNumber = 4
            call ConditionalTriggerExecute(gg_trg_Abilities_Effects)
        else
        endif
        call RemoveUnit(GetEnumUnit())
    else
        set udg_CO_Damage = true
        call ConditionalTriggerExecute(gg_trg_Combat_Damage)
        call RemoveUnit(GetEnumUnit())
    endif
endfunction
function Trig_Combo_Ability_Use_Func010Func019Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) <= (5 * udg_ART[11])))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010Func019C takes nothing returns boolean
    if(not(udg_ART[11] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Func010C takes nothing returns boolean
    if(not(CountUnitsInGroup(udg_CO_UnitGroup2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Ability_Use_Actions takes nothing returns nothing
    call GroupClear(udg_CO_UnitGroup)
    call DestroyGroup(udg_CO_UnitGroup)
    if(Trig_Combo_Ability_Use_Func005C())then
        set udg_CO_UnitGroup = GetUnitsOfTypeIdAll(0x6830304F)
        set udg_CO_Ability = 0x41303138
    else
    endif
    if(Trig_Combo_Ability_Use_Func006C())then
        set udg_CO_UnitGroup = GetUnitsOfTypeIdAll(0x68303050)
        set udg_CO_Ability = 0x41303537
    else
    endif
    if(Trig_Combo_Ability_Use_Func007C())then
        set udg_CO_UnitGroup = GetUnitsOfTypeIdAll(0x68303051)
        set udg_CO_Ability = 0x41303530
    else
    endif
    set udg_CO_UnitGroup2 = GetRandomSubGroup(1, udg_CO_UnitGroup)
    if(Trig_Combo_Ability_Use_Func010C())then
        call DestroyEffectBJ(udg_CO_SweapEffect[1])
        call DestroyEffectBJ(udg_CO_SweapEffect[2])
        call AddSpecialEffectTargetUnitBJ("weapon", udg_Arct, "war3mapImported\\Sweep_Holy_Large.mdx")
        set udg_CO_SweapEffect[1] = GetLastCreatedEffectBJ()
        if(Trig_Combo_Ability_Use_Func010Func005C())then
            call AddSpecialEffectTargetUnitBJ("foot, left", udg_Arct, "war3mapImported\\Sweep_Holy_Large.mdx")
            set udg_CO_SweapEffect[2] = GetLastCreatedEffectBJ()
        else
        endif
        set udg_CO_Combo = (udg_CO_Combo + 1)
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 4
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            set udg_CO_ComboSeries[bj_forLoopAIndex] = (udg_CO_ComboSeries[bj_forLoopAIndex] + 1)
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        set udg_CO_ComboSeries[5] = 0
        call ForGroupBJ(udg_CO_UnitGroup2, function Trig_Combo_Ability_Use_Func010Func018A)
        if(Trig_Combo_Ability_Use_Func010Func019C())then
            if(Trig_Combo_Ability_Use_Func010Func019Func001C())then
                set udg_Point = GetUnitLoc(udg_Arct)
                set udg_Point2 = GetUnitLoc(udg_AS_EnemyTarget)
                call CreateNUnitsAtLoc(1, 0x68303149, Player(0), udg_Point, bj_UNIT_FACING)
                call UnitAddAbilityBJ(0x4130354B, GetLastCreatedUnit())
                call UnitApplyTimedLifeBJ(1.20, 0x42544C46, GetLastCreatedUnit())
                call IssuePointOrderLocBJ(GetLastCreatedUnit(), "carrionswarm", udg_Point2)
                call RemoveLocation(udg_Point)
                call RemoveLocation(udg_Point2)
            else
            endif
        else
        endif
    else
        set udg_CO_Combo = 0
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = 4
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            set udg_CO_ComboSeries[bj_forLoopAIndex] = 0
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - 1))
        call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) - 2.00))
        call CreateTextTagUnitBJ("X", udg_Arct, 0, 20.00, 80.00, 0.00, 0.00, 10.00)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 200.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.60)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.45)
    endif
    call LeaderboardSetLabelBJ(udg_CO_ComboBoard, ("|cFFFFFFFFСерия ударов:|r |cFF449EFF" + I2S(udg_CO_Combo)))
    call GroupClear(udg_CO_UnitGroup2)
    call DestroyGroup(udg_CO_UnitGroup2)
endfunction
function InitTrig_Combo_Ability_Use takes nothing returns nothing
    set gg_trg_Combo_Ability_Use = CreateTrigger()
    call DisableTrigger(gg_trg_Combo_Ability_Use)
    call TriggerRegisterPlayerUnitEventSimple(gg_trg_Combo_Ability_Use, Player(0), EVENT_PLAYER_UNIT_SPELL_CHANNEL)
    call TriggerAddCondition(gg_trg_Combo_Ability_Use, Condition(function Trig_Combo_Ability_Use_Conditions))
    call TriggerAddAction(gg_trg_Combo_Ability_Use, function Trig_Combo_Ability_Use_Actions)
endfunction
function Trig_Combo_Spawn_Creeps_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(GetAttacker()) != 0x6F687764))then
        return false
    endif
    if(not(GetUnitTypeId(GetAttacker()) != 0x6E303038))then
        return false
    endif
    if(not(udg_ComboSpawnAllowed == true))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Creeps_Func006Func004C takes nothing returns boolean
    if(not(GetUnitAbilityLevelSwapped(0x41303559, GetAttacker()) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Creeps_Func006Func006C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Creeps_Func006Func007C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Creeps_Func006Func008C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Creeps_Func006C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_CO_Point, udg_CO_Point2) <= 300.00))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Creeps_Actions takes nothing returns nothing
    set udg_CO_Point = GetUnitLoc(GetAttacker())
    set udg_CO_Point2 = GetUnitLoc(GetAttackedUnitBJ())
    if(Trig_Combo_Spawn_Creeps_Func006C())then
        call RemoveLocation(udg_CO_Point)
        call RemoveLocation(udg_CO_Point2)
        set udg_CO_Point = GetUnitLoc(GetAttacker())
        if(Trig_Combo_Spawn_Creeps_Func006Func004C())then
            set udg_RandomNumber = GetRandomInt(2, 3)
        else
            set udg_RandomNumber = GetRandomInt(1, 2)
        endif
        call RemoveUnit(udg_CO_OpportunityUnit[GetUnitUserData(GetAttacker())])
        if(Trig_Combo_Spawn_Creeps_Func006Func006C())then
            call CreateNUnitsAtLoc(1, 0x6830304F, Player(9), udg_CO_Point, bj_UNIT_FACING)
        else
        endif
        if(Trig_Combo_Spawn_Creeps_Func006Func007C())then
            call CreateNUnitsAtLoc(1, 0x68303050, Player(9), udg_CO_Point, bj_UNIT_FACING)
        else
        endif
        if(Trig_Combo_Spawn_Creeps_Func006Func008C())then
            call CreateNUnitsAtLoc(1, 0x68303051, Player(9), udg_CO_Point, bj_UNIT_FACING)
        else
        endif
        call SetUnitUserData(GetLastCreatedUnit(), GetUnitUserData(GetAttacker()))
        call UnitApplyTimedLifeBJ(udg_CO_Time, 0x42544C46, GetLastCreatedUnit())
        set udg_CO_AttackingUnit[GetUnitUserData(GetLastCreatedUnit())] = GetAttacker()
        set udg_CO_OpportunityUnit[GetUnitUserData(GetLastCreatedUnit())] = GetLastCreatedUnit()
        call RemoveLocation(udg_CO_Point)
    else
    endif
endfunction
function InitTrig_Combo_Spawn_Creeps takes nothing returns nothing
    set gg_trg_Combo_Spawn_Creeps = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Combo_Spawn_Creeps, gg_unit_H000_0004, EVENT_UNIT_ATTACKED)
    call TriggerAddCondition(gg_trg_Combo_Spawn_Creeps, Condition(function Trig_Combo_Spawn_Creeps_Conditions))
    call TriggerAddAction(gg_trg_Combo_Spawn_Creeps, function Trig_Combo_Spawn_Creeps_Actions)
endfunction
function Trig_Combo_Spawn_Hero_Conditions takes nothing returns boolean
    if(not(udg_DamageEventSource == udg_Arct))then
        return false
    endif
    if(not(GetUnitAbilityLevelSwapped(0x41303559, udg_DamageEventTarget) == 1))then
        return false
    endif
    if(not(udg_ComboSpawnAllowed == true))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Hero_Func006Func005C takes nothing returns boolean
    if(not(GetUnitAbilityLevelSwapped(0x41303559, udg_DamageEventTarget) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Hero_Func006Func006C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Hero_Func006Func007C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Hero_Func006Func008C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Hero_Func006C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_CO_Point, udg_CO_Point2) <= 250.00))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Hero_Actions takes nothing returns nothing
    set udg_CO_Point = GetUnitLoc(udg_DamageEventSource)
    set udg_CO_Point2 = GetUnitLoc(udg_DamageEventTarget)
    if(Trig_Combo_Spawn_Hero_Func006C())then
        call RemoveLocation(udg_CO_Point)
        call RemoveLocation(udg_CO_Point2)
        set udg_CO_Point = GetUnitLoc(udg_DamageEventSource)
        call RemoveUnit(udg_CO_OpportunityUnit[71])
        if(Trig_Combo_Spawn_Hero_Func006Func005C())then
            set udg_RandomNumber = GetRandomInt(1, 3)
        else
            set udg_RandomNumber = GetRandomInt(1, 2)
        endif
        if(Trig_Combo_Spawn_Hero_Func006Func006C())then
            call CreateNUnitsAtLoc(1, 0x68303050, Player(9), udg_CO_Point, bj_UNIT_FACING)
        else
        endif
        if(Trig_Combo_Spawn_Hero_Func006Func007C())then
            call CreateNUnitsAtLoc(1, 0x68303050, Player(9), udg_CO_Point, bj_UNIT_FACING)
        else
        endif
        if(Trig_Combo_Spawn_Hero_Func006Func008C())then
            call CreateNUnitsAtLoc(1, 0x68303051, Player(9), udg_CO_Point, bj_UNIT_FACING)
        else
        endif
        call SetUnitUserData(GetLastCreatedUnit(), 71)
        call UnitApplyTimedLifeBJ(1.50, 0x42544C46, GetLastCreatedUnit())
        set udg_CO_AttackingUnit[71] = udg_DamageEventTarget
        set udg_CO_OpportunityUnit[71] = GetLastCreatedUnit()
        call RemoveLocation(udg_CO_Point)
    else
    endif
    call StartTimerBJ(udg_CO_Timer, false, 2.00)
    call DisableTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Combo_Spawn_Hero takes nothing returns nothing
    set gg_trg_Combo_Spawn_Hero = CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Combo_Spawn_Hero, "udg_DamageModifierEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Combo_Spawn_Hero, Condition(function Trig_Combo_Spawn_Hero_Conditions))
    call TriggerAddAction(gg_trg_Combo_Spawn_Hero, function Trig_Combo_Spawn_Hero_Actions)
endfunction
function Trig_Combo_Spawn_Timer_Conditions takes nothing returns boolean
    if(not(GetAttacker() == udg_Arct))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Spawn_Timer_Actions takes nothing returns nothing
    set udg_ComboSpawnAllowed = true
    call StartTimerBJ(udg_ComboSpawnTimer, false, 3.00)
endfunction
function InitTrig_Combo_Spawn_Timer takes nothing returns nothing
    set gg_trg_Combo_Spawn_Timer = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Combo_Spawn_Timer, EVENT_PLAYER_UNIT_ATTACKED)
    call TriggerAddCondition(gg_trg_Combo_Spawn_Timer, Condition(function Trig_Combo_Spawn_Timer_Conditions))
    call TriggerAddAction(gg_trg_Combo_Spawn_Timer, function Trig_Combo_Spawn_Timer_Actions)
endfunction
function Trig_Combo_Spawn_Timer_Expires_Actions takes nothing returns nothing
    set udg_ComboSpawnAllowed = false
endfunction
function InitTrig_Combo_Spawn_Timer_Expires takes nothing returns nothing
    set gg_trg_Combo_Spawn_Timer_Expires = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Combo_Spawn_Timer_Expires, udg_ComboSpawnTimer)
    call TriggerAddAction(gg_trg_Combo_Spawn_Timer_Expires, function Trig_Combo_Spawn_Timer_Expires_Actions)
endfunction
function Trig_Combo_Spawn_Hero_Timer_Actions takes nothing returns nothing
    call EnableTrigger(gg_trg_Combo_Spawn_Hero)
endfunction
function InitTrig_Combo_Spawn_Hero_Timer takes nothing returns nothing
    set gg_trg_Combo_Spawn_Hero_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Combo_Spawn_Hero_Timer, udg_CO_Timer)
    call TriggerAddAction(gg_trg_Combo_Spawn_Hero_Timer, function Trig_Combo_Spawn_Hero_Timer_Actions)
endfunction
function Trig_Combo_Disappear_Conditions takes nothing returns boolean
    if(not(GetOwningPlayer(GetTriggerUnit()) == Player(9)))then
        return false
    endif
    return true
endfunction
function Trig_Combo_Disappear_Actions takes nothing returns nothing
    call RemoveUnit(GetTriggerUnit())
endfunction
function InitTrig_Combo_Disappear takes nothing returns nothing
    set gg_trg_Combo_Disappear = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Combo_Disappear, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Combo_Disappear, Condition(function Trig_Combo_Disappear_Conditions))
    call TriggerAddAction(gg_trg_Combo_Disappear, function Trig_Combo_Disappear_Actions)
endfunction
function Trig_Combat_Start_Func001C takes nothing returns boolean
    if(not(udg_Combat == false))then
        return false
    endif
    if(not(udg_ART[20] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Combat_Start_Actions takes nothing returns nothing
    if(Trig_Combat_Start_Func001C())then
        set udg_Point = GetUnitLoc(udg_Arct)
        set udg_Point2 = PolarProjectionBJ(udg_Point, 200.00, GetRandomDirectionDeg())
        call CreateNUnitsAtLoc(1, 0x48303053, Player(1), udg_Point2, bj_UNIT_FACING)
        call UnitApplyTimedLifeBJ(15.00, 0x42544C46, GetLastCreatedUnit())
        call SetHeroLevelBJ(GetLastCreatedUnit(), udg_ART[20], false)
        call SuspendHeroXPBJ(false, GetLastCreatedUnit())
        call AddSpecialEffectTargetUnitBJ("origin", GetLastCreatedUnit(), "war3mapImported\\Flash.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call SetUnitVertexColorBJ(GetLastCreatedUnit(), 100, 100, 100, 40.00)
        call RemoveLocation(udg_Point)
        call RemoveLocation(udg_Point2)
    else
    endif
    set udg_Combat = true
    call StartTimerBJ(udg_CO_CombatTimer, false, 6.50)
    call EnableTrigger(gg_trg_Combo_Ability_Use)
endfunction
function InitTrig_Combat_Start takes nothing returns nothing
    set gg_trg_Combat_Start = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Combat_Start, gg_unit_H000_0004, EVENT_UNIT_ATTACKED)
    call TriggerAddAction(gg_trg_Combat_Start, function Trig_Combat_Start_Actions)
endfunction
function Trig_Combat_Damage_Func001C takes nothing returns boolean
    if(not(udg_CO_Damage == true))then
        return false
    endif
    return true
endfunction
function Trig_Combat_Damage_Actions takes nothing returns nothing
    if(Trig_Combat_Damage_Func001C())then
        set udg_CO_Damage = false
        set udg_CO_Power = (GetHeroStatBJ(bj_HEROSTAT_AGI, udg_Arct, true) + GetHeroStatBJ(bj_HEROSTAT_STR, udg_Arct, true) + GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true))
        set udg_CO_Power = (udg_CO_Power / 3)
        set udg_AbilityPower = (I2R(udg_CO_Power) + I2R(udg_CO_Combo))
        call UnitDamageTargetBJ(udg_Arct, udg_AS_EnemyTarget, udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        set udg_AbilityPower = (udg_AbilityPower / 2.00)
        call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
    else
    endif
endfunction
function InitTrig_Combat_Damage takes nothing returns nothing
    set gg_trg_Combat_Damage = CreateTrigger()
    call TriggerAddAction(gg_trg_Combat_Damage, function Trig_Combat_Damage_Actions)
endfunction
function Trig_Combat_Timer_Actions takes nothing returns nothing
    set udg_Combat = false
    set udg_CO_Combo = 0
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 4
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_CO_ComboSeries[bj_forLoopAIndex] = 0
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call LeaderboardSetLabelBJ(udg_CO_ComboBoard, ("|cFFFFFFFFСерия ударов:|r |cFF449EFF" + I2S(udg_CO_Combo)))
    call CreateTextTagUnitBJ("X", udg_Arct, 0, 20.00, 80.00, 0.00, 0.00, 10.00)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 200.00, 90.00)
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.50)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.25)
    call DisableTrigger(gg_trg_Combo_Ability_Use)
endfunction
function InitTrig_Combat_Timer takes nothing returns nothing
    set gg_trg_Combat_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Combat_Timer, udg_CO_CombatTimer)
    call TriggerAddAction(gg_trg_Combat_Timer, function Trig_Combat_Timer_Actions)
endfunction
function Trig_Combat_Timer_2_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ(0x41303445, udg_Arct)
    call DestroyEffectBJ(udg_CO_SweapEffect[1])
    call DestroyEffectBJ(udg_CO_SweapEffect[2])
endfunction
function InitTrig_Combat_Timer_2 takes nothing returns nothing
    set gg_trg_Combat_Timer_2 = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Combat_Timer_2, udg_CO_CombatTimer2)
    call TriggerAddAction(gg_trg_Combat_Timer_2, function Trig_Combat_Timer_2_Actions)
endfunction
function Trig_Secret_Search_Func001C takes nothing returns boolean
    if(not(UnitHasBuffBJ(udg_Arct, 0x42303039) == true))then
        return false
    endif
    return true
endfunction
function Trig_Secret_Search_Actions takes nothing returns nothing
    if(Trig_Secret_Search_Func001C())then
        call UnitAddAbilityBJ(0x4130335A, udg_Arct)
    else
        call UnitRemoveAbilityBJ(0x4130335A, udg_Arct)
    endif
endfunction
function InitTrig_Secret_Search takes nothing returns nothing
    set gg_trg_Secret_Search = CreateTrigger()
    call DisableTrigger(gg_trg_Secret_Search)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Secret_Search, 0.30)
    call TriggerAddAction(gg_trg_Secret_Search, function Trig_Secret_Search_Actions)
endfunction
function Trig_Secret_Found_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x4130335A))then
        return false
    endif
    return true
endfunction
function Trig_Secret_Found_Func003Func001Func002Func011Func005C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Secret_Found_Func003Func001Func002Func011C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Secret_Found_Func003Func001Func002C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_Point, udg_D_Point1) <= 200.00))then
        return false
    endif
    return true
endfunction
function Trig_Secret_Found_Func003Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x68303044))then
        return false
    endif
    return true
endfunction
function Trig_Secret_Found_Func003A takes nothing returns nothing
    if(Trig_Secret_Found_Func003Func001C())then
        set udg_Point = GetUnitLoc(GetEnumUnit())
        if(Trig_Secret_Found_Func003Func001Func002C())then
            call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Heal.mdx")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
            call RemoveUnit(GetEnumUnit())
            call UnitRemoveBuffBJ(0x42303039, udg_Arct)
            set udg_RandomNumber = GetRandomInt(1, 2)
            if(Trig_Secret_Found_Func003Func001Func002Func011C())then
                set udg_RandomNumber = GetRandomInt(6, 10)
                set udg_LightOrbs[2] = (udg_LightOrbs[2] + udg_RandomNumber)
                set udg_LightIterations = (udg_LightIterations + GetRandomInt(6, 10))
                call EnableTrigger(gg_trg_Orbs_Spawn)
            else
                if(Trig_Secret_Found_Func003Func001Func002Func011Func005C())then
                    set udg_RandomNumber = GetRandomInt(1, 2)
                    set bj_forLoopAIndex = 1
                    set bj_forLoopAIndexEnd = udg_RandomNumber
                    loop
                        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                        call CreateItemLoc(0x4930304D, udg_Point)
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                else
                endif
            endif
        else
            call CreateTextTagUnitBJ("Не здесь...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
            call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
            call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
            call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
            call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.50)
        endif
        call UnitRemoveAbilityBJ(0x4130335A, udg_Arct)
        call RemoveLocation(udg_Point)
    else
    endif
endfunction
function Trig_Secret_Found_Actions takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(udg_Arct)
    set udg_D_Pick = GetUnitsInRangeOfLocAll(450.00, udg_D_Point1)
    call ForGroupBJ(udg_D_Pick, function Trig_Secret_Found_Func003A)
    call RemoveLocation(udg_D_Point1)
    call DestroyGroup(udg_D_Pick)
endfunction
function InitTrig_Secret_Found takes nothing returns nothing
    set gg_trg_Secret_Found = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Secret_Found, gg_unit_H000_0004, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Secret_Found, Condition(function Trig_Secret_Found_Conditions))
    call TriggerAddAction(gg_trg_Secret_Found, function Trig_Secret_Found_Actions)
endfunction
function Trig_Enter_Dialog_Conditions takes nothing returns boolean
    if(not(GetEnteringUnit() == udg_Arct))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Dialog_Func001Func011Func001Func001Func001C takes nothing returns boolean
    if(not(udg_Difficulty == 4))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Dialog_Func001Func011Func001Func001C takes nothing returns boolean
    if(not(udg_Difficulty == 3))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Dialog_Func001Func011Func001C takes nothing returns boolean
    if(not(udg_Difficulty == 2))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Dialog_Func001Func011C takes nothing returns boolean
    if(not(udg_Difficulty == 1))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Dialog_Func001C takes nothing returns boolean
    if(not(udg_Tutorial[5] == false))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Dialog_Actions takes nothing returns nothing
    if(Trig_Enter_Dialog_Func001C())then
        call DialogClearBJ(udg_TeleportDialog)
        call DialogSetMessageBJ(udg_TeleportDialog, "Вперёд?")
        call DialogAddButtonBJ(udg_TeleportDialog, "Да!")
        set udg_DialogButton[1] = GetLastCreatedButtonBJ()
        if(Trig_Enter_Dialog_Func001Func011C())then
            call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFF00C850Послушник|r")
        else
            if(Trig_Enter_Dialog_Func001Func011Func001C())then
                call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFFBFBFC2Паломник|r")
            else
                if(Trig_Enter_Dialog_Func001Func011Func001Func001C())then
                    call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFFFFDC00Пастырь|r")
                else
                    if(Trig_Enter_Dialog_Func001Func011Func001Func001Func001C())then
                        call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFFFF8900Паладин|r")
                    else
                        call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFFE30000Пилигрим|r")
                    endif
                endif
            endif
        endif
        set udg_DialogButton[2] = GetLastCreatedButtonBJ()
        call DialogAddButtonBJ(udg_TeleportDialog, "Ещё минутку...")
        call DialogDisplayBJ(true, udg_TeleportDialog, Player(0))
    else
        set udg_Tutorial[5] = false
        call DisableTrigger(gg_trg_Camera_Fix)
        call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 1.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 100.00, 100.00, 100.00, 0)
        call TriggerSleepAction(1.00)
        call TriggerExecute(gg_trg_Tutorial_Cinematic)
        call DisableTrigger(GetTriggeringTrigger())
    endif
endfunction
function InitTrig_Enter_Dialog takes nothing returns nothing
    set gg_trg_Enter_Dialog = CreateTrigger()
    call DisableTrigger(gg_trg_Enter_Dialog)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Dialog, gg_rct_Edemium)
    call TriggerAddCondition(gg_trg_Enter_Dialog, Condition(function Trig_Enter_Dialog_Conditions))
    call TriggerAddAction(gg_trg_Enter_Dialog, function Trig_Enter_Dialog_Actions)
endfunction
function Trig_Escape_Initiate_Conditions takes nothing returns boolean
    if(not(GetTriggerUnit() == udg_Arct))then
        return false
    endif
    return true
endfunction
function Trig_Escape_Initiate_Actions takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(udg_D_Exit)
    call CreateNUnitsAtLocFacingLocBJ(1, 0x6E303042, Player(11), udg_D_Point1, GetUnitLoc(GetTriggerUnit()))
    set udg_D_Guardian = GetLastCreatedUnit()
    call PlaySoundAtPointBJ(gg_snd_HPitLordYes3, 100, udg_D_Point1, 0)
    call RemoveLocation(udg_D_Point1)
    set udg_D_Point1 = GetRectCenter(gg_rct_Dungeon_Exit)
    call SetUnitPositionLoc(udg_D_Exit, udg_D_Point1)
    call RemoveLocation(udg_D_Point1)
    call AddSpecialEffectTargetUnitBJ("origin", udg_D_Guardian, "Abilities\\Spells\\Other\\HowlOfTerror\\HowlCaster.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call DisableTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Escape_Initiate takes nothing returns nothing
    set gg_trg_Escape_Initiate = CreateTrigger()
    call DisableTrigger(gg_trg_Escape_Initiate)
    call TriggerRegisterUnitInRangeSimple(gg_trg_Escape_Initiate, 256.00, gg_unit_h00N_0045)
    call TriggerAddCondition(gg_trg_Escape_Initiate, Condition(function Trig_Escape_Initiate_Conditions))
    call TriggerAddAction(gg_trg_Escape_Initiate, function Trig_Escape_Initiate_Actions)
endfunction
function Trig_Escape_Guardian_Kill_Conditions takes nothing returns boolean
    if(not(GetTriggerUnit() == udg_D_Guardian))then
        return false
    endif
    return true
endfunction
function Trig_Escape_Guardian_Kill_Actions takes nothing returns nothing
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 2.00, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 100.00, 100.00, 100.00, 20.00)
    call EnableWeatherEffect(GetLastCreatedWeatherEffect(), true)
    call DisableTrigger(gg_trg_Dungeon_Dark)
    call DisableTrigger(gg_trg_Dungeon_Dark_Periodic)
    call DestroyTimerDialogBJ(udg_DungeonDarkTimerWindow)
    call DestroyFogModifier(GetLastCreatedFogModifier())
    call FogEnableOff()
    call FogMaskEnableOff()
    call CreateFogModifierRectBJ(true, Player(0), FOG_OF_WAR_VISIBLE, GetPlayableMapRect())
    call DisplayTimedTextToForce(GetPlayersAll(), 30.00, "Для выхода нажмите ESC.")
    call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
    call EnableTrigger(gg_trg_Escape_Dialog_Dummy)
    call EnableTrigger(gg_trg_Escape_Dialog)
endfunction
function InitTrig_Escape_Guardian_Kill takes nothing returns nothing
    set gg_trg_Escape_Guardian_Kill = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Escape_Guardian_Kill, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Escape_Guardian_Kill, Condition(function Trig_Escape_Guardian_Kill_Conditions))
    call TriggerAddAction(gg_trg_Escape_Guardian_Kill, function Trig_Escape_Guardian_Kill_Actions)
endfunction
function Trig_Escape_Dialog_Dummy_Actions takes nothing returns nothing
    call IssueImmediateOrderBJ(gg_unit_h009_0006, "berserk")
endfunction
function InitTrig_Escape_Dialog_Dummy takes nothing returns nothing
    set gg_trg_Escape_Dialog_Dummy = CreateTrigger()
    call DisableTrigger(gg_trg_Escape_Dialog_Dummy)
    call TriggerRegisterPlayerEventEndCinematic(gg_trg_Escape_Dialog_Dummy, Player(0))
    call TriggerAddAction(gg_trg_Escape_Dialog_Dummy, function Trig_Escape_Dialog_Dummy_Actions)
endfunction
function Trig_Escape_Dialog_Func005Func001C takes nothing returns boolean
    if(not(udg_EnchantingRoom == false))then
        return false
    endif
    if(not(udg_ER_Logic == false))then
        return false
    endif
    if(not(udg_OnkieRoom == false))then
        return false
    endif
    if(not(udg_CS_Bool == false))then
        return false
    endif
    return true
endfunction
function Trig_Escape_Dialog_Func005C takes nothing returns boolean
    if(not Trig_Escape_Dialog_Func005Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Escape_Dialog_Actions takes nothing returns nothing
    call DestroyGroup(udg_UnitGroup)
    call DialogClearBJ(udg_LeaveDialog)
    call DialogSetMessageBJ(udg_LeaveDialog, "Покинуть Эдемиум?")
    call DialogAddButtonBJ(udg_LeaveDialog, "Да!")
    if(Trig_Escape_Dialog_Func005C())then
        set udg_LeaveButton = GetLastCreatedButtonBJ()
    else
        set udg_LeaveButton2 = GetLastCreatedButtonBJ()
    endif
    call DialogAddButtonBJ(udg_LeaveDialog, "Стоп, забыл кое-что.")
    call DialogDisplayBJ(true, udg_LeaveDialog, Player(0))
endfunction
function InitTrig_Escape_Dialog takes nothing returns nothing
    set gg_trg_Escape_Dialog = CreateTrigger()
    call DisableTrigger(gg_trg_Escape_Dialog)
    call TriggerRegisterUnitEvent(gg_trg_Escape_Dialog, gg_unit_h009_0006, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_Escape_Dialog, function Trig_Escape_Dialog_Actions)
endfunction
function Trig_Dungeon_Room_Leave_Conditions takes nothing returns boolean
    if(not(GetClickedButton() == udg_LeaveButton2))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Room_Leave_Func004Func001C takes nothing returns boolean
    if((udg_ER_Logic == true))then
        return true
    endif
    if((udg_CS_Bool == true))then
        return true
    endif
    return false
endfunction
function Trig_Dungeon_Room_Leave_Func004Func006002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Dungeon_Room_Leave_Func004C takes nothing returns boolean
    if(not Trig_Dungeon_Room_Leave_Func004Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Room_Leave_Func007Func001Func002Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Room_Leave_Func007Func001Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Room_Leave_Func007C takes nothing returns boolean
    if(not(udg_EX_LevelUp > 0))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Room_Leave_Actions takes nothing returns nothing
    set udg_EM_EncounterChance = 0
    set udg_EnchantingRoom = false
    set udg_OnkieRoom = false
    if(Trig_Dungeon_Room_Leave_Func004C())then
        set udg_ER_Logic = false
        set udg_CS_Bool = false
        set udg_D_Pick = GetUnitsInRectAll(gg_rct_Coliseum)
        call GroupRemoveUnitSimple(gg_unit_n006_0028, udg_D_Pick)
        call ForGroupBJ(udg_D_Pick, function Trig_Dungeon_Room_Leave_Func004Func006002)
        call GroupClear(udg_D_Pick)
        call DestroyGroup(udg_D_Pick)
        call DisableTrigger(gg_trg_Keeper_Look)
        call ConditionalTriggerExecute(gg_trg_Edemor_Exit)
    else
    endif
    call ConditionalTriggerExecute(gg_trg_Trees_Camera_Off)
    call DisableTrigger(gg_trg_Escape_Dialog_Dummy)
    if(Trig_Dungeon_Room_Leave_Func007C())then
        set bj_forLoopAIndex = 1
        set bj_forLoopAIndexEnd = udg_EX_LevelUp
        loop
            exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
            set udg_RandomNumber = GetRandomInt(1, 3)
            if(Trig_Dungeon_Room_Leave_Func007Func001Func002C())then
                set udg_Target = gg_unit_h012_0011
                call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
            else
                if(Trig_Dungeon_Room_Leave_Func007Func001Func002Func002C())then
                    set udg_Target = gg_unit_h012_0012
                    call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                else
                    set udg_Target = gg_unit_h012_0013
                    call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                endif
            endif
            set udg_AugmentValue = GetUnitUserData(udg_Target)
            set udg_AugmentLevel[udg_AugmentValue] = (udg_AugmentLevel[udg_AugmentValue] + 1)
            set udg_Point = GetUnitLoc(udg_Target)
            call DestroyTextTagBJ(udg_GiftText[udg_AugmentValue])
            call CreateTextTagLocBJ(I2S(udg_AugmentLevel[udg_AugmentValue]), udg_Point, 150.00, 10, 100, 100, 100, 0)
            set udg_GiftText[udg_AugmentValue] = GetLastCreatedTextTag()
            call RemoveLocation(udg_Point)
            set udg_AugmentPrice = udg_AugmentCost[udg_AugmentValue]
            set udg_AugmentCost[udg_AugmentValue] = (udg_AugmentCost[udg_AugmentValue] + 10)
            set bj_forLoopAIndex = bj_forLoopAIndex + 1
        endloop
        set udg_EX_LevelUp = 0
    else
    endif
    call ExecuteFunc("Autosave")
endfunction
function InitTrig_Dungeon_Room_Leave takes nothing returns nothing
    set gg_trg_Dungeon_Room_Leave = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Dungeon_Room_Leave, udg_LeaveDialog)
    call TriggerAddCondition(gg_trg_Dungeon_Room_Leave, Condition(function Trig_Dungeon_Room_Leave_Conditions))
    call TriggerAddAction(gg_trg_Dungeon_Room_Leave, function Trig_Dungeon_Room_Leave_Actions)
endfunction
function Trig_Edemium_Portals_Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303049))then
        return false
    endif
    if(not(GetTriggerUnit() == udg_Arct))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Portals_Conditions takes nothing returns boolean
    if(not Trig_Edemium_Portals_Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Portals_Func006Func008Func004A takes nothing returns nothing
    call SetUnitPositionLoc(GetEnumUnit(), udg_D_Point1)
endfunction
function Trig_Edemium_Portals_Func006Func008A takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetEnumUnit())
    call PanCameraToTimedLocForPlayer(Player(0), udg_D_Point1, 0)
    call SetUnitPositionLoc(udg_Arct, udg_D_Point1)
    call ForGroupBJ(udg_FollowersGroup, function Trig_Edemium_Portals_Func006Func008Func004A)
    call RemoveLocation(udg_D_Point1)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 1.00, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 0.00, 50.00, 100.00, 0)
    call PlaySoundBJ(gg_snd_CatapultDeath1)
    call StartTimerBJ(udg_D_TimerPortals, false, 3.00)
    call DisableTrigger(GetTriggeringTrigger())
endfunction
function Trig_Edemium_Portals_Func006C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_D_Point1, udg_D_Point2) < 300.00))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Portals_Actions takes nothing returns nothing
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6E303049)
    call GroupRemoveUnitSimple(GetOrderTargetUnit(), udg_D_Pick)
    set udg_D_Point1 = GetUnitLoc(udg_Arct)
    set udg_D_Point2 = GetUnitLoc(GetOrderTargetUnit())
    if(Trig_Edemium_Portals_Func006C())then
        call RemoveLocation(udg_D_Point1)
        call ForGroupBJ(GetRandomSubGroup(1, udg_D_Pick), function Trig_Edemium_Portals_Func006Func008A)
    else
        call CreateTextTagUnitBJ("Поближе бы...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.50)
    endif
    call RemoveLocation(udg_D_Point1)
    call RemoveLocation(udg_D_Point2)
    call DestroyGroup(udg_D_Pick)
endfunction
function InitTrig_Edemium_Portals takes nothing returns nothing
    set gg_trg_Edemium_Portals = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Edemium_Portals, gg_unit_H000_0004, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Edemium_Portals, Condition(function Trig_Edemium_Portals_Conditions))
    call TriggerAddAction(gg_trg_Edemium_Portals, function Trig_Edemium_Portals_Actions)
endfunction
function Trig_Edemium_Portals_Cooldown_Actions takes nothing returns nothing
    call EnableTrigger(gg_trg_Edemium_Portals)
endfunction
function InitTrig_Edemium_Portals_Cooldown takes nothing returns nothing
    set gg_trg_Edemium_Portals_Cooldown = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Edemium_Portals_Cooldown, udg_D_TimerPortals)
    call TriggerAddAction(gg_trg_Edemium_Portals_Cooldown, function Trig_Edemium_Portals_Cooldown_Actions)
endfunction
function Trig_Edemium_Difficulty_Dialog_Conditions takes nothing returns boolean
    if(not(GetClickedButton() == udg_DialogButton[2]))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Dialog_Func009C takes nothing returns boolean
    if(not(udg_Difficulty_Unlocked[1] == true))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Dialog_Func010C takes nothing returns boolean
    if(not(udg_Difficulty_Unlocked[2] == true))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Dialog_Actions takes nothing returns nothing
    call DialogClearBJ(udg_DifficultyDialog)
    call DialogSetMessageBJ(udg_DifficultyDialog, "Уровень сложности:")
    call DialogAddButtonBJ(udg_DifficultyDialog, "|cFF00C850Послушник|r")
    set udg_DialogButton[3] = GetLastCreatedButtonBJ()
    call DialogAddButtonBJ(udg_DifficultyDialog, "|cFFBFBFC2Паломник|r")
    set udg_DialogButton[4] = GetLastCreatedButtonBJ()
    call DialogAddButtonBJ(udg_DifficultyDialog, "|cFFFFDC00Пастырь|r")
    set udg_DialogButton[5] = GetLastCreatedButtonBJ()
    if(Trig_Edemium_Difficulty_Dialog_Func009C())then
        call DialogAddButtonBJ(udg_DifficultyDialog, "|cFFFF9000Паладин|r")
        set udg_DialogButton[6] = GetLastCreatedButtonBJ()
    else
    endif
    if(Trig_Edemium_Difficulty_Dialog_Func010C())then
        call DialogAddButtonBJ(udg_DifficultyDialog, "|cFFE30000Пилигрим|r")
        set udg_DialogButton[7] = GetLastCreatedButtonBJ()
    else
    endif
    call DialogAddButtonBJ(udg_DifficultyDialog, "Мне и так хорошо.")
    set udg_DialogButton[8] = GetLastCreatedButtonBJ()
    call DialogDisplayBJ(true, udg_DifficultyDialog, Player(0))
endfunction
function InitTrig_Edemium_Difficulty_Dialog takes nothing returns nothing
    set gg_trg_Edemium_Difficulty_Dialog = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Edemium_Difficulty_Dialog, udg_TeleportDialog)
    call TriggerAddCondition(gg_trg_Edemium_Difficulty_Dialog, Condition(function Trig_Edemium_Difficulty_Dialog_Conditions))
    call TriggerAddAction(gg_trg_Edemium_Difficulty_Dialog, function Trig_Edemium_Difficulty_Dialog_Actions)
endfunction
function Trig_Edemium_Difficulty_Buttons_Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetClickedButton() == udg_DialogButton[7]))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetClickedButton() == udg_DialogButton[6]))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Func001Func001Func001C takes nothing returns boolean
    if(not(GetClickedButton() == udg_DialogButton[5]))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Func001Func001C takes nothing returns boolean
    if(not(GetClickedButton() == udg_DialogButton[4]))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Func001C takes nothing returns boolean
    if(not(GetClickedButton() == udg_DialogButton[3]))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Func006Func001Func001Func001C takes nothing returns boolean
    if(not(udg_Difficulty == 4))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Func006Func001Func001C takes nothing returns boolean
    if(not(udg_Difficulty == 3))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Func006Func001C takes nothing returns boolean
    if(not(udg_Difficulty == 2))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Func006C takes nothing returns boolean
    if(not(udg_Difficulty == 1))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Difficulty_Buttons_Actions takes nothing returns nothing
    if(Trig_Edemium_Difficulty_Buttons_Func001C())then
        set udg_Difficulty = 1
        set udg_DifficultyRate = 1.00
        set udg_CO_Time = 2.00
    else
        if(Trig_Edemium_Difficulty_Buttons_Func001Func001C())then
            set udg_Difficulty = 2
            set udg_DifficultyRate = 1.50
            set udg_CO_Time = 1.75
        else
            if(Trig_Edemium_Difficulty_Buttons_Func001Func001Func001C())then
                set udg_Difficulty = 3
                set udg_DifficultyRate = 2.00
                set udg_CO_Time = 1.50
            else
                if(Trig_Edemium_Difficulty_Buttons_Func001Func001Func001Func001C())then
                    set udg_Difficulty = 4
                    set udg_DifficultyRate = 2.50
                    set udg_CO_Time = 1.25
                else
                    if(Trig_Edemium_Difficulty_Buttons_Func001Func001Func001Func001Func001C())then
                        set udg_Difficulty = 5
                        set udg_DifficultyRate = 3.00
                        set udg_CO_Time = 1.00
                    else
                    endif
                endif
            endif
        endif
    endif
    call DialogClearBJ(udg_TeleportDialog)
    call DialogSetMessageBJ(udg_TeleportDialog, "Вперёд?")
    call DialogAddButtonBJ(udg_TeleportDialog, "Да!")
    set udg_DialogButton[1] = GetLastCreatedButtonBJ()
    if(Trig_Edemium_Difficulty_Buttons_Func006C())then
        call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFF00C850Послушник|r")
    else
        if(Trig_Edemium_Difficulty_Buttons_Func006Func001C())then
            call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFFBFBFC2Паломник|r")
        else
            if(Trig_Edemium_Difficulty_Buttons_Func006Func001Func001C())then
                call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFFFFDC00Пастырь|r")
            else
                if(Trig_Edemium_Difficulty_Buttons_Func006Func001Func001Func001C())then
                    call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFFFF8900Паладин|r")
                else
                    call DialogAddButtonBJ(udg_TeleportDialog, "Уровень сложности: |cFFE30000Пилигрим|r")
                endif
            endif
        endif
    endif
    set udg_DialogButton[2] = GetLastCreatedButtonBJ()
    call DialogAddButtonBJ(udg_TeleportDialog, "Ещё минутку...")
    call DialogDisplayBJ(true, udg_TeleportDialog, Player(0))
endfunction
function InitTrig_Edemium_Difficulty_Buttons takes nothing returns nothing
    set gg_trg_Edemium_Difficulty_Buttons = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Edemium_Difficulty_Buttons, udg_DifficultyDialog)
    call TriggerAddAction(gg_trg_Edemium_Difficulty_Buttons, function Trig_Edemium_Difficulty_Buttons_Actions)
endfunction
function Trig_Edemium_Hero_Dies_Func013C takes nothing returns boolean
    if(not(udg_AS_Effect2 == true))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Hero_Dies_Func014C takes nothing returns boolean
    if(not(udg_AS_Effect11 == true))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Hero_Dies_Func029C takes nothing returns boolean
    if(not(udg_MeditationLogic == true))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Hero_Dies_Func030C takes nothing returns boolean
    if(not(udg_SprintLogic == true))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Hero_Dies_Func035C takes nothing returns boolean
    if(not(udg_ER_Logic == true))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Hero_Dies_Actions takes nothing returns nothing
    set udg_Dead = true
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 2.50, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 100.00, 100.00, 100.00, 0)
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call DisableTrigger(gg_trg_Escape_Dialog)
    call DisableTrigger(gg_trg_Escape_Dialog_Dummy)
    call DisableTrigger(gg_trg_Edemor_Check)
    call DisableTrigger(gg_trg_Boss_II_Phase_2_Init)
    call StopMusicBJ(true)
    call RemoveUnit(udg_AS_Effect10Unit)
    set udg_AS_Effect10 = false
    call AdjustPlayerStateBJ(1, Player(0), PLAYER_STATE_RESOURCE_FOOD_USED)
    call SetUnitLifePercentBJ(udg_EM_BossUnit, 100)
    if(Trig_Edemium_Hero_Dies_Func013C())then
        set udg_AS_Effect2 = false
        set udg_ChanceCrit = (udg_ChanceCrit - 10.00)
    else
    endif
    if(Trig_Edemium_Hero_Dies_Func014C())then
        set udg_AS_Effect11 = false
        set udg_ChanceBlock = (udg_ChanceBlock - 20.00)
        call DestroyEffectBJ(udg_AS_Effect11SE)
        call SetUnitVertexColorBJ(udg_Arct, 100.00, 100.00, 100, 0)
    else
    endif
    call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_SUB, udg_AS_Effect9Count2)
    call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_SUB, udg_AS_Effect9Count2)
    call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_SUB, udg_AS_Effect9Count2)
    set udg_AS_Effect9Count2 = 0
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 24
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_AS_AbilityLVL[bj_forLoopAIndex] = udg_AS_AbilityLVL_Base[bj_forLoopAIndex]
        set udg_AS_AbilityEXP[bj_forLoopAIndex] = udg_AS_AbilityEXP_Base[bj_forLoopAIndex]
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_AS_AbilityCountLVL = udg_AS_AbilityCountLVL_Base
    set udg_AS_Points = udg_AS_Points_Base
    call SetHeroLevelBJ(udg_Arct, udg_EX_Level_Base, false)
    call SetHeroXP(udg_Arct, udg_EX_Exp_Base, false)
    set udg_EX_LevelUp = 0
    if(Trig_Edemium_Hero_Dies_Func029C())then
        set udg_MeditationLogic = false
        call AddUnitAnimationPropertiesBJ(false, "gold", gg_unit_H000_0004)
        call SetUnitMoveSpeed(gg_unit_H000_0004, GetUnitDefaultMoveSpeed(gg_unit_H000_0004))
        call SetUnitTurnSpeedBJ(gg_unit_H000_0004, 1.00)
        call DestroyEffectBJ(udg_MeditationEffect)
        call DisableTrigger(gg_trg_Meditation_Heal)
        call DisableTrigger(gg_trg_Meditation_Cast)
        call DisableTrigger(gg_trg_Meditation_Turn_Off)
    else
    endif
    if(Trig_Edemium_Hero_Dies_Func030C())then
        set udg_SprintLogic = false
        call SetUnitMoveSpeed(udg_Arct, GetUnitDefaultMoveSpeed(udg_Arct))
        call DisableTrigger(gg_trg_Sprint_Energy)
    else
    endif
    call TriggerSleepAction(5.00)
    set udg_RewardDustReal = 0.00
    set udg_EM_EncounterChance =- 4
    set udg_EM_Encounter = false
    if(Trig_Edemium_Hero_Dies_Func035C())then
        set udg_ER_Logic = false
        call TriggerExecute(gg_trg_Edemor_Exit)
    else
        call TriggerExecute(gg_trg_Gen_Exit)
    endif
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 2.50, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 100.00, 100.00, 100.00, 0)
    call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
    call DisableTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Edemium_Hero_Dies takes nothing returns nothing
    set gg_trg_Edemium_Hero_Dies = CreateTrigger()
    call DisableTrigger(gg_trg_Edemium_Hero_Dies)
    call TriggerRegisterUnitEvent(gg_trg_Edemium_Hero_Dies, gg_unit_H000_0004, EVENT_UNIT_DEATH)
    call TriggerAddAction(gg_trg_Edemium_Hero_Dies, function Trig_Edemium_Hero_Dies_Actions)
endfunction
function Trig_Creep_Lead_Timer_Actions takes nothing returns nothing
    call DestroyLightningBJ(udg_Lead)
endfunction
function InitTrig_Creep_Lead_Timer takes nothing returns nothing
    set gg_trg_Creep_Lead_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Creep_Lead_Timer, udg_TimerLead)
    call TriggerAddAction(gg_trg_Creep_Lead_Timer, function Trig_Creep_Lead_Timer_Actions)
endfunction
function Trig_Trap_Periodic_Explosion_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303057))then
        return false
    endif
    return true
endfunction
function Trig_Trap_Periodic_Explosion_Func002Func001Func005Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return false
    endif
    return true
endfunction
function Trig_Trap_Periodic_Explosion_Func002Func001Func005A takes nothing returns nothing
    if(Trig_Trap_Periodic_Explosion_Func002Func001Func005Func001C())then
        set udg_AbilityPower = GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_Arct)
        set udg_AbilityPower = (udg_AbilityPower / 3.00)
        call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
    else
    endif
endfunction
function Trig_Trap_Periodic_Explosion_Func002Func001C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303051))then
        return false
    endif
    return true
endfunction
function Trig_Trap_Periodic_Explosion_Func002Func006Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return false
    endif
    return true
endfunction
function Trig_Trap_Periodic_Explosion_Func002Func006A takes nothing returns nothing
    if(Trig_Trap_Periodic_Explosion_Func002Func006Func001C())then
        set udg_AbilityPower = GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct)
        set udg_AbilityPower = (udg_AbilityPower / 3.00)
        call SetUnitManaBJ(GetEnumUnit(), (GetUnitStateSwap(UNIT_STATE_MANA, GetEnumUnit()) - udg_AbilityPower))
    else
    endif
endfunction
function Trig_Trap_Periodic_Explosion_Func002C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303052))then
        return false
    endif
    return true
endfunction
function Trig_Trap_Periodic_Explosion_Actions takes nothing returns nothing
    if(Trig_Trap_Periodic_Explosion_Func002C())then
        set udg_Point = GetUnitLoc(GetTriggerUnit())
        set udg_UnitGroup = GetUnitsInRangeOfLocAll(380.00, udg_Point)
        call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Ground Slam Blue.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call ForGroupBJ(udg_UnitGroup, function Trig_Trap_Periodic_Explosion_Func002Func006A)
        call DestroyGroup(udg_UnitGroup)
        call RemoveLocation(udg_Point)
    else
        if(Trig_Trap_Periodic_Explosion_Func002Func001C())then
            set udg_Point = GetUnitLoc(GetTriggerUnit())
            set udg_UnitGroup = GetUnitsInRangeOfLocAll(380.00, udg_Point)
            call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Ground Slam Fire.mdx")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
            call ForGroupBJ(udg_UnitGroup, function Trig_Trap_Periodic_Explosion_Func002Func001Func005A)
            call DestroyGroup(udg_UnitGroup)
            call RemoveLocation(udg_Point)
        else
        endif
    endif
endfunction
function InitTrig_Trap_Periodic_Explosion takes nothing returns nothing
    set gg_trg_Trap_Periodic_Explosion = CreateTrigger()
    call TriggerRegisterPlayerUnitEventSimple(gg_trg_Trap_Periodic_Explosion, Player(1), EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Trap_Periodic_Explosion, Condition(function Trig_Trap_Periodic_Explosion_Conditions))
    call TriggerAddAction(gg_trg_Trap_Periodic_Explosion, function Trig_Trap_Periodic_Explosion_Actions)
endfunction
function Trig_Trap_Periodic_Func002Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetEnumUnit()) == 0x68303057))then
        return false
    endif
    return true
endfunction
function Trig_Trap_Periodic_Func002A takes nothing returns nothing
    if(Trig_Trap_Periodic_Func002Func001C())then
        call IssueImmediateOrderBJ(GetEnumUnit(), "roar")
    else
    endif
endfunction
function Trig_Trap_Periodic_Actions takes nothing returns nothing
    set udg_UnitGroup = GetUnitsOfPlayerAll(Player(1))
    call ForGroupBJ(udg_UnitGroup, function Trig_Trap_Periodic_Func002A)
    call DestroyGroup(udg_UnitGroup)
endfunction
function InitTrig_Trap_Periodic takes nothing returns nothing
    set gg_trg_Trap_Periodic = CreateTrigger()
    call DisableTrigger(gg_trg_Trap_Periodic)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Trap_Periodic, 3.20)
    call TriggerAddAction(gg_trg_Trap_Periodic, function Trig_Trap_Periodic_Actions)
endfunction
function Trig_Decorations_Click_Func001C takes nothing returns boolean
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303053))then
        return true
    endif
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303156))then
        return true
    endif
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x4230314B))then
        return true
    endif
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x4230314C))then
        return true
    endif
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x4230315A))then
        return true
    endif
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303159))then
        return true
    endif
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303231))then
        return true
    endif
    return false
endfunction
function Trig_Decorations_Click_Conditions takes nothing returns boolean
    if(not Trig_Decorations_Click_Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Decorations_Click_Func004Func001Func002C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Decorations_Click_Func004Func001Func008Func001Func003Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Decorations_Click_Func004Func001Func008Func001Func003C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Decorations_Click_Func004Func001Func008Func001C takes nothing returns boolean
    if(not(GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303231))then
        return false
    endif
    return true
endfunction
function Trig_Decorations_Click_Func004Func001Func008Func013C takes nothing returns boolean
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x4230315A))then
        return true
    endif
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303159))then
        return true
    endif
    return false
endfunction
function Trig_Decorations_Click_Func004Func001Func008C takes nothing returns boolean
    if(not Trig_Decorations_Click_Func004Func001Func008Func013C())then
        return false
    endif
    return true
endfunction
function Trig_Decorations_Click_Func004Func001C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_D_Point1, udg_D_Point2) < 300.00))then
        return false
    endif
    return true
endfunction
function Trig_Decorations_Click_Func004Func002Func003Func005C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 8))then
        return false
    endif
    return true
endfunction
function Trig_Decorations_Click_Func004Func002Func003C takes nothing returns boolean
    if(not(GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303053))then
        return false
    endif
    return true
endfunction
function Trig_Decorations_Click_Func004Func002Func004C takes nothing returns boolean
    if(not(GetRandomInt(1, 20) == 20))then
        return false
    endif
    return true
endfunction
function Trig_Decorations_Click_Func004Func002C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_D_Point1, udg_D_Point2) < 300.00))then
        return false
    endif
    return true
endfunction
function Trig_Decorations_Click_Func004Func003C takes nothing returns boolean
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303053))then
        return true
    endif
    if((GetDestructableTypeId(GetOrderTargetDestructable()) == 0x42303156))then
        return true
    endif
    return false
endfunction
function Trig_Decorations_Click_Func004C takes nothing returns boolean
    if(not Trig_Decorations_Click_Func004Func003C())then
        return false
    endif
    return true
endfunction
function Trig_Decorations_Click_Actions takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetTriggerUnit())
    set udg_D_Point2 = GetDestructableLoc(GetOrderTargetDestructable())
    if(Trig_Decorations_Click_Func004C())then
        if(Trig_Decorations_Click_Func004Func002C())then
            call KillDestructable(GetOrderTargetDestructable())
            if(Trig_Decorations_Click_Func004Func002Func003C())then
                set udg_RandomNumber = GetRandomInt(2, 4)
                set udg_LightOrbs[1] = (udg_LightOrbs[1] + udg_RandomNumber)
                set udg_LightIterations = (udg_LightIterations + udg_RandomNumber)
                call EnableTrigger(gg_trg_Orbs_Spawn)
            else
                if(Trig_Decorations_Click_Func004Func002Func003Func005C())then
                    call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(1, udg_CC_IngredientDrop)], udg_D_Point2)
                else
                endif
            endif
            if(Trig_Decorations_Click_Func004Func002Func004C())then
                call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 3)], Player(11), udg_D_Point2, GetRandomReal(0, 360.00))
            else
            endif
        else
            call IssuePointOrderLocBJ(udg_Arct, "move", udg_D_Point2)
            call CreateTextTagUnitBJ("Поближе бы...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
            call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
            call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
            call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
            call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.50)
        endif
    else
        if(Trig_Decorations_Click_Func004Func001C())then
            call ModifyGateBJ(bj_GATEOPERATION_OPEN, GetOrderTargetDestructable())
            if(Trig_Decorations_Click_Func004Func001Func008C())then
                call CreateTextTagUnitBJ("ЛОВУШКА!", udg_Arct, 0, 11.00, 100.00, 100.00, 100.00, 0)
                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.50)
                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
                set udg_Point = GetDestructableLoc(GetOrderTargetDestructable())
                call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
                call RemoveLocation(udg_Point)
                call UnitAddAbilityBJ(0x4130344C, GetLastCreatedUnit())
                call UnitApplyTimedLifeBJ(2.50, 0x42544C46, GetLastCreatedUnit())
                call IssueImmediateOrderBJ(GetLastCreatedUnit(), "stomp")
            else
                if(Trig_Decorations_Click_Func004Func001Func008Func001C())then
                    set udg_Point = GetUnitLoc(udg_Arct)
                    set udg_RandomNumber = GetRandomInt(1, 3)
                    if(Trig_Decorations_Click_Func004Func001Func008Func001Func003C())then
                        call CreateItemLoc(0x49303131, udg_Point)
                    else
                        if(Trig_Decorations_Click_Func004Func001Func008Func001Func003Func001C())then
                            call CreateItemLoc(0x49303055, udg_Point)
                        else
                            call CreateItemLoc(0x49303143, udg_Point)
                        endif
                    endif
                    call PlaySoundAtPointBJ(gg_snd_FrogWhat1, 100.00, udg_Point, 150.00)
                    call RemoveLocation(udg_Point)
                else
                endif
            endif
        else
            call IssuePointOrderLocBJ(udg_Arct, "move", udg_D_Point2)
            if(Trig_Decorations_Click_Func004Func001Func002C())then
                call CreateTextTagUnitBJ("Поближе бы...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
            else
                call CreateTextTagUnitBJ("Слишком далеко.", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
            endif
            call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
            call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
            call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
            call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.50)
        endif
    endif
    call RemoveLocation(udg_D_Point1)
    call RemoveLocation(udg_D_Point2)
endfunction
function InitTrig_Decorations_Click takes nothing returns nothing
    set gg_trg_Decorations_Click = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Decorations_Click, gg_unit_H000_0004, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Decorations_Click, Condition(function Trig_Decorations_Click_Conditions))
    call TriggerAddAction(gg_trg_Decorations_Click, function Trig_Decorations_Click_Actions)
endfunction
function Trig_Chest_Unlock_Func007C takes nothing returns boolean
    if((GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303044))then
        return true
    endif
    if((GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303045))then
        return true
    endif
    if((GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303046))then
        return true
    endif
    return false
endfunction
function Trig_Chest_Unlock_Conditions takes nothing returns boolean
    if(not Trig_Chest_Unlock_Func007C())then
        return false
    endif
    return true
endfunction
function Trig_Chest_Unlock_Func004Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303045))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Unlock_Func004Func001Func002C takes nothing returns boolean
    if(not(GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303046))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Unlock_Func004Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303044))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Unlock_Func004C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_D_Point1, udg_D_Point2) < 300.00))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Unlock_Actions takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetTriggerUnit())
    set udg_D_Point2 = GetUnitLoc(GetOrderTargetUnit())
    set udg_Chest = GetOrderTargetUnit()
    if(Trig_Chest_Unlock_Func004C())then
        if(Trig_Chest_Unlock_Func004Func001C())then
            set udg_ChestEnergy = 10
        else
            if(Trig_Chest_Unlock_Func004Func001Func001C())then
                set udg_ChestEnergy = 20
            else
            endif
            if(Trig_Chest_Unlock_Func004Func001Func002C())then
                set udg_ChestEnergy = 30
            else
            endif
        endif
        set udg_Chest = GetOrderTargetUnit()
        call DialogClearBJ(udg_ChestDialog)
        call DialogSetMessageBJ(udg_ChestDialog, GetUnitName(udg_Chest))
        call DialogAddButtonBJ(udg_ChestDialog, ("Открыть потратив |cFF449EFF" + (I2S(udg_ChestEnergy) + " |rэнергии.")))
        set udg_ChestButtonEnergy = GetLastCreatedButtonBJ()
        call DialogAddButtonBJ(udg_ChestDialog, "|cFFFFFFFFОткрыть Ключом Эдемора.|r")
        set udg_ChestButtonKey = GetLastCreatedButtonBJ()
        call DialogAddButtonBJ(udg_ChestDialog, "Обойдусь.")
        call DialogDisplayBJ(true, udg_ChestDialog, Player(0))
    else
        call CreateTextTagUnitBJ("Поближе бы...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.50)
    endif
    call RemoveLocation(udg_D_Point1)
    call RemoveLocation(udg_D_Point2)
endfunction
function InitTrig_Chest_Unlock takes nothing returns nothing
    set gg_trg_Chest_Unlock = CreateTrigger()
    call DisableTrigger(gg_trg_Chest_Unlock)
    call TriggerRegisterUnitEvent(gg_trg_Chest_Unlock, gg_unit_H000_0004, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Chest_Unlock, Condition(function Trig_Chest_Unlock_Conditions))
    call TriggerAddAction(gg_trg_Chest_Unlock, function Trig_Chest_Unlock_Actions)
endfunction
function Trig_Chest_Unlock_Button_Func001Func001Func001C takes nothing returns boolean
    if(not(GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_LUMBER) > 0))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Unlock_Button_Func001Func001C takes nothing returns boolean
    if(not(GetClickedButton() == udg_ChestButtonKey))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Unlock_Button_Func001Func002Func002C takes nothing returns boolean
    if(not(GetRandomInt(1, 10) <= 8))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Unlock_Button_Func001Func002C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) >= I2R(udg_ChestEnergy)))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Unlock_Button_Func001C takes nothing returns boolean
    if(not(GetClickedButton() == udg_ChestButtonEnergy))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Unlock_Button_Actions takes nothing returns nothing
    if(Trig_Chest_Unlock_Button_Func001C())then
        if(Trig_Chest_Unlock_Button_Func001Func002C())then
            call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - I2R(udg_ChestEnergy)))
            if(Trig_Chest_Unlock_Button_Func001Func002Func002C())then
                call ConditionalTriggerExecute(gg_trg_Chest_Reward)
            else
                call CreateTextTagUnitBJ("Не получилось...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 3.00)
                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 2.50)
            endif
        else
            call CreateTextTagUnitBJ("Нет сил...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
            call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
            call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
            call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 3.00)
            call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 2.50)
        endif
    else
        if(Trig_Chest_Unlock_Button_Func001Func001C())then
            if(Trig_Chest_Unlock_Button_Func001Func001Func001C())then
                call SetPlayerStateBJ(Player(0), PLAYER_STATE_RESOURCE_LUMBER, (GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_LUMBER) - 1))
                call ConditionalTriggerExecute(gg_trg_Chest_Reward)
            else
                call CreateTextTagUnitBJ("Нет ключей...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 3.00)
                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 2.50)
            endif
        else
        endif
    endif
    call DialogDisplayBJ(false, udg_ChestDialog, Player(0))
endfunction
function InitTrig_Chest_Unlock_Button takes nothing returns nothing
    set gg_trg_Chest_Unlock_Button = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Chest_Unlock_Button, udg_ChestDialog)
    call TriggerAddAction(gg_trg_Chest_Unlock_Button, function Trig_Chest_Unlock_Button_Actions)
endfunction
function Trig_Chest_Reward_Func007C takes nothing returns boolean
    if(not(GetUnitUserData(udg_Chest) == 10))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Reward_Func008C takes nothing returns boolean
    if(not(udg_ART[10] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Reward_Func009Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Reward_Func009Func004Func007C takes nothing returns boolean
    if(not(GetUnitTypeId(udg_Chest) == 0x6E303046))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Reward_Func009Func004C takes nothing returns boolean
    if(not(GetUnitTypeId(udg_Chest) == 0x6E303045))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Reward_Func009C takes nothing returns boolean
    if(not(GetUnitTypeId(udg_Chest) == 0x6E303044))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Reward_Func010Func001C takes nothing returns boolean
    if(not(udg_CC_SecretUnlocked[13] == false))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Reward_Func010C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) <= 5))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Reward_Func011Func001C takes nothing returns boolean
    if(not(udg_CC_SecretUnlocked[17] == false))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Reward_Func011C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) <= 5))then
        return false
    endif
    return true
endfunction
function Trig_Chest_Reward_Actions takes nothing returns nothing
    set udg_QG_Count[4] = (udg_QG_Count[4] + 1)
    call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
    set udg_IG_Point = GetUnitLoc(udg_Chest)
    call KillUnit(udg_Chest)
    call AddSpecialEffectLocBJ(udg_IG_Point, "war3mapImported\\GoldCoinBuffLargeV.015.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    if(Trig_Chest_Reward_Func007C())then
        call CreateTextTagUnitBJ("ЛОВУШКА!", udg_Arct, 0, 11.00, 100.00, 100.00, 100.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.50)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
        call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_IG_Point, bj_UNIT_FACING)
        call UnitAddAbilityBJ(0x4130344C, GetLastCreatedUnit())
        call UnitApplyTimedLifeBJ(1.70, 0x42544C46, GetLastCreatedUnit())
        call IssueImmediateOrderBJ(GetLastCreatedUnit(), "stomp")
    else
    endif
    if(Trig_Chest_Reward_Func008C())then
        call CreateNUnitsAtLoc(1, 0x48303148, Player(1), udg_IG_Point, bj_UNIT_FACING)
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_FollowersGroup)
        call SetHeroLevelBJ(GetLastCreatedUnit(), udg_ART[10], false)
        call SuspendHeroXPBJ(false, GetLastCreatedUnit())
        call UnitApplyTimedLifeBJ(60.00, 0x42544C46, GetLastCreatedUnit())
        call EnableTrigger(gg_trg_Follower_Movement)
    else
    endif
    if(Trig_Chest_Reward_Func009C())then
        if(Trig_Chest_Reward_Func009Func001C())then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 2
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(1, udg_CC_IngredientDrop)], udg_IG_Point)
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        else
        endif
        set udg_RandomNumber = GetRandomInt(2, 4)
        set udg_LightOrbs[2] = (udg_LightOrbs[2] + udg_RandomNumber)
        set udg_ChestDust = udg_RandomNumber
        set udg_IG_ItemQuality = 1
        call ConditionalTriggerExecute(gg_trg_IG_Generate)
    else
        if(Trig_Chest_Reward_Func009Func004C())then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 2
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(1, udg_CC_IngredientDrop)], udg_IG_Point)
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            set udg_RandomNumber = GetRandomInt(4, 8)
            set udg_LightOrbs[2] = (udg_LightOrbs[2] + udg_RandomNumber)
            set udg_ChestDust = udg_RandomNumber
            set udg_IG_ItemQuality = 2
            call ConditionalTriggerExecute(gg_trg_IG_Generate)
        else
            if(Trig_Chest_Reward_Func009Func004Func007C())then
                set bj_forLoopAIndex = 2
                set bj_forLoopAIndexEnd = 4
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(1, udg_CC_IngredientDrop)], udg_IG_Point)
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
                set udg_RandomNumber = GetRandomInt(4, 6)
                set udg_LightOrbs[3] = (udg_LightOrbs[3] + udg_RandomNumber)
                set udg_ChestDust = udg_RandomNumber
                set udg_IG_ItemQuality = 3
                call ConditionalTriggerExecute(gg_trg_IG_Generate)
            else
            endif
        endif
    endif
    if(Trig_Chest_Reward_Func010C())then
        if(Trig_Chest_Reward_Func010Func001C())then
            call CreateItemLoc(0x49303046, udg_IG_Point)
        else
        endif
    else
    endif
    if(Trig_Chest_Reward_Func011C())then
        if(Trig_Chest_Reward_Func011Func001C())then
            call CreateItemLoc(0x4930304B, udg_IG_Point)
        else
        endif
    else
    endif
    set udg_LightIterations = (udg_LightIterations + udg_ChestDust)
    call EnableTrigger(gg_trg_Orbs_Spawn)
    call RemoveLocation(udg_IG_Point)
endfunction
function InitTrig_Chest_Reward takes nothing returns nothing
    set gg_trg_Chest_Reward = CreateTrigger()
    call TriggerAddAction(gg_trg_Chest_Reward, function Trig_Chest_Reward_Actions)
endfunction
function Trig_Trap_Effect_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303039))then
        return false
    endif
    if(not(GetSpellAbilityId() == 0x4130344C))then
        return false
    endif
    return true
endfunction
function Trig_Trap_Effect_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetTriggerUnit())
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Thunder Slam.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call RemoveLocation(udg_Point)
endfunction
function InitTrig_Trap_Effect takes nothing returns nothing
    set gg_trg_Trap_Effect = CreateTrigger()
    call TriggerRegisterPlayerUnitEventSimple(gg_trg_Trap_Effect, Player(11), EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Trap_Effect, Condition(function Trig_Trap_Effect_Conditions))
    call TriggerAddAction(gg_trg_Trap_Effect, function Trig_Trap_Effect_Actions)
endfunction
function Trig_QG_Generate_Func003Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_QG_Generate_Func003Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_QG_Generate_Func003Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_QG_Generate_Func003C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_QG_Generate_Func005Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_QG_Generate_Func005Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_QG_Generate_Func005Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_QG_Generate_Func005C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_QG_Generate_Actions takes nothing returns nothing
    set udg_RandomNumber = GetRandomInt(1, 4)
    if(Trig_QG_Generate_Func003C())then
        set udg_QG_Count[1] = 0
        set udg_RandomNumber = GetRandomInt(40, 80)
        set udg_QG_ObjectiveStateMax[1] = udg_RandomNumber
        set udg_QG_ObjectiveState[1] = 1
        set udg_QG_CountMax[1] = udg_RandomNumber
        set udg_QG_ObjectiveName[1] = "Убито монстров "
        set udg_QG_Objective[1] = (udg_QG_ObjectiveName[1] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[1]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[1]]))))
    else
        if(Trig_QG_Generate_Func003Func001C())then
            set udg_QG_Count[2] = 0
            set udg_RandomNumber = GetRandomInt(1, 2)
            set udg_QG_ObjectiveStateMax[1] = udg_RandomNumber
            set udg_QG_ObjectiveState[1] = 2
            set udg_QG_CountMax[2] = udg_RandomNumber
            set udg_QG_ObjectiveName[1] = "Пройдено подземелий "
            set udg_QG_Objective[1] = (udg_QG_ObjectiveName[1] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[1]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[1]]))))
        else
            if(Trig_QG_Generate_Func003Func001Func001C())then
                set udg_QG_Count[3] = 0
                set udg_RandomNumber = GetRandomInt(2, 4)
                set udg_QG_ObjectiveStateMax[1] = udg_RandomNumber
                set udg_QG_ObjectiveState[1] = 3
                set udg_QG_CountMax[3] = udg_RandomNumber
                set udg_QG_ObjectiveName[1] = "Пройдено арен Эдемора "
                set udg_QG_Objective[1] = (udg_QG_ObjectiveName[1] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[1]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[1]]))))
            else
                if(Trig_QG_Generate_Func003Func001Func001Func001C())then
                    set udg_QG_Count[4] = 0
                    set udg_RandomNumber = GetRandomInt(2, 6)
                    set udg_QG_ObjectiveStateMax[1] = udg_RandomNumber
                    set udg_QG_ObjectiveState[1] = 4
                    set udg_QG_CountMax[4] = udg_RandomNumber
                    set udg_QG_ObjectiveName[1] = "Открыто сундуков "
                    set udg_QG_Objective[1] = (udg_QG_ObjectiveName[1] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[1]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[1]]))))
                else
                endif
            endif
        endif
    endif
    set udg_RandomNumber = GetRandomInt(1, 4)
    if(Trig_QG_Generate_Func005C())then
        set udg_QG_Count[5] = 0
        set udg_RandomNumber = GetRandomInt(1, 2)
        set udg_QG_ObjectiveStateMax[2] = udg_RandomNumber
        set udg_QG_ObjectiveState[2] = 5
        set udg_QG_CountMax[5] = udg_RandomNumber
        set udg_QG_ObjectiveName[2] = "Убито боссов "
        set udg_QG_Objective[2] = (udg_QG_ObjectiveName[2] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[2]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[2]]))))
    else
        if(Trig_QG_Generate_Func005Func001C())then
            set udg_QG_Count[6] = 0
            set udg_RandomNumber = GetRandomInt(5, 10)
            set udg_QG_ObjectiveStateMax[2] = udg_RandomNumber
            set udg_QG_ObjectiveState[2] = 6
            set udg_QG_CountMax[6] = udg_RandomNumber
            set udg_QG_ObjectiveName[2] = "Распылено предметов "
            set udg_QG_Objective[2] = (udg_QG_ObjectiveName[2] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[2]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[2]]))))
        else
            if(Trig_QG_Generate_Func005Func001Func001C())then
                set udg_QG_Count[7] = 0
                set udg_RandomNumber = GetRandomInt(40, 80)
                set udg_QG_ObjectiveStateMax[2] = udg_RandomNumber
                set udg_QG_ObjectiveState[2] = 7
                set udg_QG_CountMax[7] = udg_RandomNumber
                set udg_QG_ObjectiveName[2] = "Применено навыков "
                set udg_QG_Objective[2] = (udg_QG_ObjectiveName[2] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[2]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[2]]))))
            else
                if(Trig_QG_Generate_Func005Func001Func001Func001C())then
                    set udg_QG_Count[8] = 0
                    set udg_RandomNumber = GetRandomInt(2, 4)
                    set udg_QG_ObjectiveStateMax[2] = udg_RandomNumber
                    set udg_QG_ObjectiveState[2] = 8
                    set udg_QG_CountMax[8] = udg_RandomNumber
                    set udg_QG_ObjectiveName[2] = "Изучено секретов "
                    set udg_QG_Objective[2] = (udg_QG_ObjectiveName[2] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[2]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[2]]))))
                else
                endif
            endif
        endif
    endif
    call PlaySoundBJ(gg_snd_NewQuest)
    call CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "Миссия Пилигрима", ("Текущий коэффициент получения опыта и Света: |cFF00FF00" + R2SW(udg_EX_Rate, 1, 1)), "ReplaceableTextures\\CommandButtons\\BTNArcturus.blp")
    call CreateQuestItemBJ(GetLastCreatedQuestBJ(), udg_QG_Objective[1])
    set udg_QG_Requirement[1] = GetLastCreatedQuestItemBJ()
    call CreateQuestItemBJ(GetLastCreatedQuestBJ(), udg_QG_Objective[2])
    set udg_QG_Requirement[2] = GetLastCreatedQuestItemBJ()
    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, udg_QG_Objective[1])
    call DisplayTimedTextToForce(GetPlayersAll(), 10.00, udg_QG_Objective[2])
    call EnableTrigger(gg_trg_QG_Completion_Check)
endfunction
function InitTrig_QG_Generate takes nothing returns nothing
    set gg_trg_QG_Generate = CreateTrigger()
    call TriggerAddAction(gg_trg_QG_Generate, function Trig_QG_Generate_Actions)
endfunction
function Trig_QG_Completion_Check_Func001C takes nothing returns boolean
    if(not(udg_QG_Count[udg_QG_ObjectiveState[1]] >= udg_QG_ObjectiveStateMax[1]))then
        return false
    endif
    if(not(udg_QG_Count[udg_QG_ObjectiveState[2]] >= udg_QG_ObjectiveStateMax[2]))then
        return false
    endif
    return true
endfunction
function Trig_QG_Completion_Check_Actions takes nothing returns nothing
    if(Trig_QG_Completion_Check_Func001C())then
        call DestroyQuestBJ(GetLastCreatedQuestBJ())
        call DisplayTimedTextToForce(GetPlayersAll(), 10.00, "|cFF00FF00Миссия осуществлена, коэффициент повышен.|r")
        set udg_EX_Rate = (udg_EX_Rate + 0.10)
        set udg_QG_QuestCompleted = (udg_QG_QuestCompleted + 1)
        call ConditionalTriggerExecute(gg_trg_QG_Generate)
    else
    endif
endfunction
function InitTrig_QG_Completion_Check takes nothing returns nothing
    set gg_trg_QG_Completion_Check = CreateTrigger()
    call DisableTrigger(gg_trg_QG_Completion_Check)
    call TriggerRegisterTimerEventPeriodic(gg_trg_QG_Completion_Check, 1.00)
    call TriggerAddAction(gg_trg_QG_Completion_Check, function Trig_QG_Completion_Check_Actions)
endfunction
function Trig_QG_Change_Text_Actions takes nothing returns nothing
    set udg_QG_Objective[1] = (udg_QG_ObjectiveName[1] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[1]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[1]]))))
    set udg_QG_Objective[2] = (udg_QG_ObjectiveName[2] + (I2S(udg_QG_Count[udg_QG_ObjectiveState[2]]) + ("/" + I2S(udg_QG_CountMax[udg_QG_ObjectiveState[2]]))))
    call QuestItemSetDescriptionBJ(udg_QG_Requirement[1], udg_QG_Objective[1])
    call QuestItemSetDescriptionBJ(udg_QG_Requirement[2], udg_QG_Objective[2])
endfunction
function InitTrig_QG_Change_Text takes nothing returns nothing
    set gg_trg_QG_Change_Text = CreateTrigger()
    call TriggerAddAction(gg_trg_QG_Change_Text, function Trig_QG_Change_Text_Actions)
endfunction
function Trig_Creep_Kill_Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x48303148))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func002C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x48303030))then
        return false
    endif
    if(not(GetOwningPlayer(GetTriggerUnit()) == Player(1)))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func002Func001C takes nothing returns boolean
    if((GetOwningPlayer(GetTriggerUnit()) == Player(11)))then
        return true
    endif
    if((GetOwningPlayer(GetTriggerUnit()) == Player(1)))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Kill_Func003Func002Func002C takes nothing returns boolean
    if((GetUnitAbilityLevelSwapped(0x41303345, GetTriggerUnit()) == 1))then
        return true
    endif
    if((GetUnitAbilityLevelSwapped(0x41303559, GetTriggerUnit()) == 1))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Kill_Func003Func002C takes nothing returns boolean
    if(not Trig_Creep_Kill_Func003Func002Func001C())then
        return false
    endif
    if(not Trig_Creep_Kill_Func003Func002Func002C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 5) == 1))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x6E303038))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func002Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x6E303034))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func002C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x6E303035))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func003Func002C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303038))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func003Func005Func002C takes nothing returns boolean
    if(not(udg_Difficulty_Unlocked[1] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func003Func005Func003Func001C takes nothing returns boolean
    if(not(udg_Difficulty_Unlocked[2] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func003Func005Func003Func002C takes nothing returns boolean
    if(not(udg_CC_SecretUnlocked[20] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func003Func005Func003C takes nothing returns boolean
    if(not(GetUnitTypeId(udg_EM_BossUnit) == 0x6E303047))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func003Func005Func004C takes nothing returns boolean
    if(not(udg_CC_SecretUnlocked[5] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func003Func005C takes nothing returns boolean
    if(not(GetUnitTypeId(udg_EM_BossUnit) == 0x6E30304C))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func003Func018Func003Func003001 takes nothing returns boolean
    return(udg_RandomNumber >= 2)
endfunction
function Trig_Creep_Kill_Func003Func012Func003Func018Func003Func003002 takes nothing returns boolean
    return(udg_RandomNumber <= 4)
endfunction
function Trig_Creep_Kill_Func003Func012Func003Func018Func003C takes nothing returns boolean
    if(not GetBooleanAnd(Trig_Creep_Kill_Func003Func012Func003Func018Func003Func003001(), Trig_Creep_Kill_Func003Func012Func003Func018Func003Func003002()))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func003Func018C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func003C takes nothing returns boolean
    if(not(GetTriggerUnit() == udg_EM_BossUnit))then
        return false
    endif
    if(not(GetUnitTypeId(udg_EM_BossUnit) != 0x6E303038))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func004Func001C takes nothing returns boolean
    if(not(udg_EM_BossRoom == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func004Func002Func002C takes nothing returns boolean
    if(not(udg_EM_BossRoom == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func004Func002C takes nothing returns boolean
    if(not(GetUnitAbilityLevelSwapped(0x41303345, GetTriggerUnit()) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func004Func003C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) >= (80 - (1 * udg_ART[3]))))then
        return false
    endif
    if(not(GetUnitAbilityLevelSwapped(0x41303345, GetTriggerUnit()) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func004C takes nothing returns boolean
    if(not Trig_Creep_Kill_Func003Func012Func004Func003C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012Func006Func004C takes nothing returns boolean
    if((GetTriggerUnit() == udg_ChestKeyOwner[1]))then
        return true
    endif
    if((GetTriggerUnit() == udg_ChestKeyOwner[2]))then
        return true
    endif
    if((GetTriggerUnit() == udg_ChestKeyOwner[3]))then
        return true
    endif
    if((GetTriggerUnit() == udg_ChestKeyOwner[4]))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Kill_Func003Func012Func006C takes nothing returns boolean
    if(not Trig_Creep_Kill_Func003Func012Func006Func004C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003Func012C takes nothing returns boolean
    if(not(udg_Artefactorium == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Func003C takes nothing returns boolean
    if(not Trig_Creep_Kill_Func003Func002C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Actions takes nothing returns nothing
    if(Trig_Creep_Kill_Func001C())then
        call GroupRemoveUnitSimple(GetTriggerUnit(), udg_FollowersGroup)
        call RemoveUnit(GetTriggerUnit())
        set udg_Point = GetUnitLoc(GetTriggerUnit())
        call AddSpecialEffectLocBJ(udg_Point, "Objects\\Spawnmodels\\Undead\\UndeadDissipate\\UndeadDissipate.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call RemoveLocation(udg_Point)
    else
    endif
    if(Trig_Creep_Kill_Func002C())then
        set udg_Point = GetUnitLoc(GetTriggerUnit())
        call AddSpecialEffectLocBJ(udg_Point, "Abilities\\Spells\\Human\\Polymorph\\PolyMorphTarget.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call RemoveLocation(udg_Point)
        call RemoveUnit(GetTriggerUnit())
    else
    endif
    if(Trig_Creep_Kill_Func003C())then
        set udg_FadeUnitKey = GetHandleId(GetTriggerUnit())
        call GroupAddUnitSimple(GetTriggerUnit(), udg_FadeSystemGroup)
        call SaveRealBJ(0.00, udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash)
        call SaveRealBJ(100.00, udg_FadeUnitKey, StringHashBJ("FadeEnd"), udg_FadeSystemHash)
        call SaveRealBJ(2.50, udg_FadeUnitKey, StringHashBJ("FadeSpeed"), udg_FadeSystemHash)
        call SaveBooleanBJ(false, udg_FadeUnitKey, StringHashBJ("FadeIn"), udg_FadeSystemHash)
        call EnableTrigger(gg_trg_Fade_Loop)
        call RemoveUnit(udg_CO_OpportunityUnit[GetUnitUserData(GetDyingUnit())])
        call DestroyEffectBJ(udg_CreepCastEffect[GetUnitUserData(GetTriggerUnit())])
        if(Trig_Creep_Kill_Func003Func012C())then
            if(Trig_Creep_Kill_Func003Func012Func001C())then
                set udg_Point = GetUnitLoc(GetTriggerUnit())
                call CreateItemLoc(udg_CC_IngredientItem[GetUnitLevel(GetTriggerUnit())], udg_Point)
                call RemoveLocation(udg_Point)
            else
            endif
            if(Trig_Creep_Kill_Func003Func012Func002C())then
                set udg_Point = GetUnitLoc(GetTriggerUnit())
                call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
                call RemoveLocation(udg_Point)
                call UnitAddAbilityBJ(0x41303356, GetLastCreatedUnit())
                call UnitApplyTimedLifeBJ(2.00, 0x42544C46, GetLastCreatedUnit())
                call IssueImmediateOrderBJ(GetLastCreatedUnit(), "roar")
            else
                if(Trig_Creep_Kill_Func003Func012Func002Func001C())then
                    set udg_Point = GetUnitLoc(GetTriggerUnit())
                    call CreateNUnitsAtLoc(3, 0x6E30304D, Player(11), udg_Point, bj_UNIT_FACING)
                    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\BloodEX-Small.mdx")
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                    call RemoveLocation(udg_Point)
                else
                endif
            endif
            if(Trig_Creep_Kill_Func003Func012Func003C())then
                call DisableTrigger(gg_trg_Boss_Creep_Spawn)
                if(Trig_Creep_Kill_Func003Func012Func003Func005C())then
                    if(Trig_Creep_Kill_Func003Func012Func003Func005Func002C())then
                        set udg_Difficulty_Unlocked[1] = true
                        set udg_TierUnlocked = 1
                        call DisplayTimedTextToForce(GetPlayersAll(), 30, "|cFF00C850Открыта новая сложность!|r")
                        set udg_IG_Point = GetUnitLoc(udg_IG_Monster)
                        set udg_IG_ItemQuality = 3
                        call ConditionalTriggerExecute(gg_trg_IG_Generate)
                    else
                    endif
                    if(Trig_Creep_Kill_Func003Func012Func003Func005Func004C())then
                        set udg_Point = GetUnitLoc(udg_Arct)
                        call CreateItemLoc(0x49303135, udg_Point)
                        call RemoveLocation(udg_Point)
                    else
                    endif
                else
                    if(Trig_Creep_Kill_Func003Func012Func003Func005Func003C())then
                        if(Trig_Creep_Kill_Func003Func012Func003Func005Func003Func001C())then
                            set udg_Difficulty_Unlocked[2] = true
                            set udg_Difficulty_Unlocked[3] = true
                            set udg_TierUnlocked = 2
                            call DisplayTimedTextToForce(GetPlayersAll(), 30, "|cFF00C850Открыты новые сложности!|r")
                            set udg_IG_Point = GetUnitLoc(udg_IG_Monster)
                            set udg_IG_ItemQuality = 3
                            call ConditionalTriggerExecute(gg_trg_IG_Generate)
                        else
                        endif
                        if(Trig_Creep_Kill_Func003Func012Func003Func005Func003Func002C())then
                            set udg_Point = GetUnitLoc(udg_Arct)
                            call CreateItemLoc(0x49303050, udg_Point)
                            call RemoveLocation(udg_Point)
                        else
                        endif
                    else
                    endif
                endif
                call DisplayTimedTextToForce(GetPlayersAll(), 30.00, "Для выхода нажмите ESC.")
                set bj_forLoopAIndex = 1
                set bj_forLoopAIndexEnd = 4
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    set udg_EM_BossDead[bj_forLoopAIndex] = true
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
                call ConditionalTriggerExecute(gg_trg_Boss_Kill_Check)
                call EnableTrigger(gg_trg_Escape_Dialog_Dummy)
                call EnableTrigger(gg_trg_Escape_Dialog)
                call AddSpecialEffectTargetUnitBJ("origin", GetTriggerUnit(), "war3mapImported\\Holy_Heal.mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                set udg_IG_Point = GetUnitLoc(udg_Arct)
                set udg_RandomNumber = GetRandomInt(1, 10)
                call AddSpecialEffectLocBJ(udg_IG_Point, "war3mapImported\\Holy_Heal.mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                if(Trig_Creep_Kill_Func003Func012Func003Func018C())then
                    set udg_IG_ItemQuality = 3
                    call ConditionalTriggerExecute(gg_trg_IG_Generate)
                else
                    if(Trig_Creep_Kill_Func003Func012Func003Func018Func003C())then
                        set udg_IG_ItemQuality = 2
                        call ConditionalTriggerExecute(gg_trg_IG_Generate)
                    else
                        set udg_IG_ItemQuality = 1
                        call ConditionalTriggerExecute(gg_trg_IG_Generate)
                    endif
                endif
                call RemoveLocation(udg_Point)
            else
                if(Trig_Creep_Kill_Func003Func012Func003Func002C())then
                    call ConditionalTriggerExecute(gg_trg_Ending_Init)
                else
                endif
            endif
            if(Trig_Creep_Kill_Func003Func012Func004C())then
                if(Trig_Creep_Kill_Func003Func012Func004Func001C())then
                    set udg_IG_Monster = GetTriggerUnit()
                    call ConditionalTriggerExecute(gg_trg_Creep_Kill_Reward)
                else
                endif
            else
                if(Trig_Creep_Kill_Func003Func012Func004Func002C())then
                    if(Trig_Creep_Kill_Func003Func012Func004Func002Func002C())then
                        set udg_RewardDustReal = (udg_RewardDustReal + 1.00)
                        call ConditionalTriggerExecute(gg_trg_Creep_Kill_Recipes)
                        set udg_QG_Count[1] = (udg_QG_Count[1] + 1)
                        call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
                    else
                    endif
                else
                endif
            endif
            if(Trig_Creep_Kill_Func003Func012Func006C())then
                set udg_Point = GetUnitLoc(GetTriggerUnit())
                call CreateItemLoc(0x4930304D, udg_Point)
                call RemoveLocation(udg_Point)
            else
            endif
        else
        endif
    else
    endif
endfunction
function InitTrig_Creep_Kill takes nothing returns nothing
    set gg_trg_Creep_Kill = CreateTrigger()
    call DisableTrigger(gg_trg_Creep_Kill)
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Creep_Kill, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddAction(gg_trg_Creep_Kill, function Trig_Creep_Kill_Actions)
endfunction
function Trig_Creep_Exp_Func001Func001C takes nothing returns boolean
    if(not(GetUnitAbilityLevelSwapped(0x41303559, GetTriggerUnit()) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Exp_Func001C takes nothing returns boolean
    if(not(GetUnitAbilityLevelSwapped(0x41303345, GetTriggerUnit()) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Exp_Actions takes nothing returns nothing
    if(Trig_Creep_Exp_Func001C())then
        call AddHeroXPSwapped(R2I((10.00 * udg_EX_Rate)), udg_Arct, false)
    else
        if(Trig_Creep_Exp_Func001Func001C())then
            call AddHeroXPSwapped(R2I((20.00 * udg_EX_Rate)), udg_Arct, false)
        else
        endif
    endif
endfunction
function InitTrig_Creep_Exp takes nothing returns nothing
    set gg_trg_Creep_Exp = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Creep_Exp, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddAction(gg_trg_Creep_Exp, function Trig_Creep_Exp_Actions)
endfunction
function Trig_Creep_Kill_Reward_Func001Func003Func001Func005001 takes nothing returns boolean
    return(udg_IG_RandomNumber > 85)
endfunction
function Trig_Creep_Kill_Reward_Func001Func003Func001Func005002 takes nothing returns boolean
    return(udg_IG_RandomNumber < 94)
endfunction
function Trig_Creep_Kill_Reward_Func001Func003Func001C takes nothing returns boolean
    if(not GetBooleanAnd(Trig_Creep_Kill_Reward_Func001Func003Func001Func005001(), Trig_Creep_Kill_Reward_Func001Func003Func001Func005002()))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Reward_Func001Func003C takes nothing returns boolean
    return udg_IG_RandomNumber <= 85
endfunction
function Trig_Creep_Kill_Reward_Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Reward_Actions takes nothing returns nothing
    if(Trig_Creep_Kill_Reward_Func001C())then
        set udg_RandomNumber = GetRandomInt(2, 4)
        set udg_RewardDustReal = (udg_RewardDustReal + I2R(udg_RandomNumber))
        set udg_LightOrbs[1] = (udg_LightOrbs[1] + udg_RandomNumber)
        set udg_LightIterations = (udg_LightIterations + udg_RandomNumber)
        call EnableTrigger(gg_trg_Orbs_Spawn)
    else
        set udg_IG_RandomNumber = GetRandomInt(1, 100)
        set udg_IG_Point = GetUnitLoc(udg_IG_Monster)
        if(Trig_Creep_Kill_Reward_Func001Func003C())then
            set udg_IG_ItemQuality = 1
            call ConditionalTriggerExecute(gg_trg_IG_Generate)
        else
            if(Trig_Creep_Kill_Reward_Func001Func003Func001C())then
                set udg_IG_ItemQuality = 2
                call ConditionalTriggerExecute(gg_trg_IG_Generate)
            else
                set udg_IG_ItemQuality = 3
                call ConditionalTriggerExecute(gg_trg_IG_Generate)
            endif
        endif
        call AddSpecialEffectLocBJ(udg_IG_Point, "war3mapImported\\Holy_Heal_Small.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
    endif
endfunction
function InitTrig_Creep_Kill_Reward takes nothing returns nothing
    set gg_trg_Creep_Kill_Reward = CreateTrigger()
    call TriggerAddAction(gg_trg_Creep_Kill_Reward, function Trig_Creep_Kill_Reward_Actions)
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func001C takes nothing returns boolean
    if((GetUnitTypeId(GetDyingUnit()) == 0x6E303032))then
        return true
    endif
    if((GetUnitTypeId(GetDyingUnit()) == 0x6E303033))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func001C takes nothing returns boolean
    if((GetUnitTypeId(GetDyingUnit()) == 0x6E303031))then
        return true
    endif
    if((GetUnitTypeId(GetDyingUnit()) == 0x6E303030))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303054))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[19] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303056))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[18] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303050))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[16] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E30305A))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[15] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E30304F))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[14] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303052))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[12] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303041))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[11] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303051))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[10] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303055))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[9] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E30304B))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[8] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303043))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[7] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E30304E))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[6] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func002C takes nothing returns boolean
    if((GetUnitTypeId(GetDyingUnit()) == 0x6E303035))then
        return true
    endif
    if((GetUnitTypeId(GetDyingUnit()) == 0x6E303034))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003C takes nothing returns boolean
    if(not Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func002C())then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[4] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003Func003C takes nothing returns boolean
    if(not Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func001C())then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[3] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002Func003C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E30304A))then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[2] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001Func002C takes nothing returns boolean
    if(not Trig_Creep_Kill_Recipes_Func001Func002Func001C())then
        return false
    endif
    if(not(udg_CC_SecretUnlocked[1] == false))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) <= 2))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Kill_Recipes_Actions takes nothing returns nothing
    if(Trig_Creep_Kill_Recipes_Func001C())then
        set udg_Point = GetUnitLoc(GetDyingUnit())
        if(Trig_Creep_Kill_Recipes_Func001Func002C())then
            call CreateItemLoc(0x49303137, udg_Point)
        else
            if(Trig_Creep_Kill_Recipes_Func001Func002Func003C())then
                call CreateItemLoc(0x49303132, udg_Point)
            else
                if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003C())then
                    call CreateItemLoc(0x49303134, udg_Point)
                else
                    if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003C())then
                        call CreateItemLoc(0x49303136, udg_Point)
                    else
                        if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001C())then
                            call CreateItemLoc(0x49303037, udg_Point)
                        else
                            if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001C())then
                                call CreateItemLoc(0x49303038, udg_Point)
                            else
                                if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001C())then
                                    call CreateItemLoc(0x49303039, udg_Point)
                                else
                                    if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001C())then
                                        call CreateItemLoc(0x49303041, udg_Point)
                                    else
                                        if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001C())then
                                            call CreateItemLoc(0x49303042, udg_Point)
                                        else
                                            if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001C())then
                                                call CreateItemLoc(0x49303043, udg_Point)
                                            else
                                                if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001C())then
                                                    call CreateItemLoc(0x49303044, udg_Point)
                                                else
                                                    if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004C())then
                                                        call CreateItemLoc(0x49303048, udg_Point)
                                                    else
                                                        if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004Func001C())then
                                                            call CreateItemLoc(0x49303049, udg_Point)
                                                        else
                                                            if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004Func001Func001C())then
                                                                call CreateItemLoc(0x4930304A, udg_Point)
                                                            else
                                                                if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004Func001Func001Func001C())then
                                                                    call CreateItemLoc(0x4930304E, udg_Point)
                                                                else
                                                                    if(Trig_Creep_Kill_Recipes_Func001Func002Func003Func003Func003Func001Func001Func001Func001Func001Func001Func001Func004Func001Func001Func001Func001C())then
                                                                        call CreateItemLoc(0x4930304F, udg_Point)
                                                                    else
                                                                    endif
                                                                endif
                                                            endif
                                                        endif
                                                    endif
                                                endif
                                            endif
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
        call RemoveLocation(udg_Point)
    else
    endif
endfunction
function InitTrig_Creep_Kill_Recipes takes nothing returns nothing
    set gg_trg_Creep_Kill_Recipes = CreateTrigger()
    call TriggerAddAction(gg_trg_Creep_Kill_Recipes, function Trig_Creep_Kill_Recipes_Actions)
endfunction
function Trig_Creep_Skills_Cast_Func004C takes nothing returns boolean
    if(not(GetOwningPlayer(GetTriggerUnit()) == Player(11)))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x68303039))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x6E303053))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x68303134))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Conditions takes nothing returns boolean
    if(not Trig_Creep_Skills_Cast_Func004C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func003Func006C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x6E30305A))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func003C takes nothing returns boolean
    if(not(GetTerrainTypeBJ(udg_Point2) != 0x4972626B))then
        return false
    endif
    if(not(GetTerrainTypeBJ(udg_Point2) != 0x58626C6D))then
        return false
    endif
    if(not(GetTerrainTypeBJ(udg_Point2) != 0x56737470))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func007Func001Func007C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x6E303054))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func007Func001C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303551))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func007C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303231))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func001Func007Func001C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303639))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func001Func007C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x4130354A))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func001C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303232))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Func005Func002C takes nothing returns boolean
    if((GetSpellAbilityId() == 0x41303139))then
        return true
    endif
    if((GetSpellAbilityId() == 0x41303456))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Cast_Func005C takes nothing returns boolean
    if(not Trig_Creep_Skills_Cast_Func005Func002C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Cast_Actions takes nothing returns nothing
    set udg_Combat = true
    call StartTimerBJ(udg_CO_CombatTimer, false, 6.50)
    call EnableTrigger(gg_trg_Combo_Ability_Use)
    if(Trig_Creep_Skills_Cast_Func005C())then
        call RemoveLocation(udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())])
        set udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())] = GetUnitLoc(GetSpellTargetUnit())
        call DestroyEffectBJ(udg_CreepCastEffect[GetUnitUserData(GetTriggerUnit())])
        call AddSpecialEffectTargetUnitBJ("hand right", GetTriggerUnit(), "Abilities\\Weapons\\VengeanceMissile\\VengeanceMissile.mdl")
        set udg_CreepCastEffect[GetUnitUserData(GetTriggerUnit())] = GetLastCreatedEffectBJ()
    else
        if(Trig_Creep_Skills_Cast_Func005Func001C())then
            call RemoveLocation(udg_Creep_Strike_Point[GetUnitUserData(GetTriggerUnit())])
            set udg_Creep_Strike_Point[GetUnitUserData(GetTriggerUnit())] = GetUnitLoc(GetSpellTargetUnit())
            call DestroyEffectBJ(udg_CreepCastEffect[GetUnitUserData(GetTriggerUnit())])
            call AddSpecialEffectTargetUnitBJ("hand right", GetTriggerUnit(), "Abilities\\Weapons\\VengeanceMissile\\VengeanceMissile.mdl")
            set udg_CreepCastEffect[GetUnitUserData(GetTriggerUnit())] = GetLastCreatedEffectBJ()
        else
            if(Trig_Creep_Skills_Cast_Func005Func001Func007C())then
                call IssueImmediateOrderBJ(GetTriggerUnit(), "whirlwind")
                call IssueTargetOrderBJ(GetTriggerUnit(), "smart", udg_Arct)
            else
                if(Trig_Creep_Skills_Cast_Func005Func001Func007Func001C())then
                    set udg_Point = GetUnitLoc(GetTriggerUnit())
                    set udg_Point2 = PolarProjectionBJ(udg_Point, 350.00, GetRandomDirectionDeg())
                    if(Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func003C())then
                        call SetUnitPositionLoc(GetTriggerUnit(), udg_Point2)
                        call AddSpecialEffectLocBJ(udg_Point2, "Abilities\\Spells\\NightElf\\Blink\\BlinkCaster.mdl")
                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                        if(Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func003Func006C())then
                            call CreateNUnitsAtLoc(1, 0x6830314B, Player(11), udg_Point, bj_UNIT_FACING)
                        else
                            call CreateNUnitsAtLoc(1, 0x6830314C, Player(11), udg_Point, bj_UNIT_FACING)
                        endif
                        call UnitApplyTimedLifeBJ(1.50, 0x42544C46, GetLastCreatedUnit())
                        call IssueImmediateOrderBJ(GetLastCreatedUnit(), "stomp")
                    else
                        call UnitResetCooldown(GetTriggerUnit())
                        call IssuePointOrderLocBJ(GetTriggerUnit(), "move", udg_Point)
                    endif
                    call RemoveLocation(udg_Point)
                    call RemoveLocation(udg_Point2)
                else
                    if(Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func007C())then
                        call GroupAddUnitSimple(GetTriggerUnit(), udg_FallenGroup)
                        call EnableTrigger(gg_trg_Creep_Fallen_Spawn)
                    else
                        if(Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func007Func001C())then
                            set udg_CO_Point = GetUnitLoc(GetSpellAbilityUnit())
                            set udg_CO_Point2 = PolarProjectionBJ(udg_CO_Point, 70.00, GetRandomDirectionDeg())
                            call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 3)], Player(11), udg_CO_Point2, bj_UNIT_FACING)
                            call UnitAddAbilityBJ(0x41303345, GetLastCreatedUnit())
                            call RemoveLocation(udg_CO_Point)
                            call RemoveLocation(udg_CO_Point2)
                            if(Trig_Creep_Skills_Cast_Func005Func001Func007Func001Func007Func001Func007C())then
                                call SetUnitManaBJ(GetTriggerUnit(), (GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) + 15.00))
                            else
                            endif
                        else
                        endif
                    endif
                endif
            endif
        endif
    endif
    call CreateTextTagUnitBJ("!!!", GetTriggerUnit(), 0, 16.00, 100.00, 0.00, 0.00, 0)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 30.00, 90.00)
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.80)
endfunction
function InitTrig_Creep_Skills_Cast takes nothing returns nothing
    set gg_trg_Creep_Skills_Cast = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Creep_Skills_Cast, EVENT_PLAYER_UNIT_SPELL_CHANNEL)
    call TriggerAddCondition(gg_trg_Creep_Skills_Cast, Condition(function Trig_Creep_Skills_Cast_Conditions))
    call TriggerAddAction(gg_trg_Creep_Skills_Cast, function Trig_Creep_Skills_Cast_Actions)
endfunction
function Trig_Creep_Skills_Conditions takes nothing returns boolean
    if(not(GetOwningPlayer(GetTriggerUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func005Func001C takes nothing returns boolean
    if((GetUnitTypeId(GetTriggerUnit()) == 0x6E303035))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x6E30304A))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func005Func002Func001Func001C takes nothing returns boolean
    if((GetUnitTypeId(GetTriggerUnit()) == 0x6E30304E))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x4E303133))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func005Func002Func001Func002C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x6E303041))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func005Func002Func001C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func005Func002Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func005Func002C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x6E303033))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func005C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func005Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func008Func004Func004Func001C takes nothing returns boolean
    if(not(udg_CreepSpellType == 1))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func008Func004Func004C takes nothing returns boolean
    if(not(udg_CreepSpellType == 2))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func008Func004C takes nothing returns boolean
    if(not(udg_CreepSpellType == 4))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func008C takes nothing returns boolean
    if(not(udg_CreepSpellType == 3))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func010Func001Func001C takes nothing returns boolean
    if((GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return true
    endif
    if((GetOwningPlayer(GetEnumUnit()) == Player(1)))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func010Func001Func002C takes nothing returns boolean
    if(not(udg_CreepSpellType == 4))then
        return false
    endif
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func010Func001Func005C takes nothing returns boolean
    if(not(udg_CreepSpellType == 3))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func010Func001C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func010Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func010A takes nothing returns nothing
    if(Trig_Creep_Skills_Func003Func010Func001C())then
        set udg_AbilityPower = (40.00 * I2R(udg_Difficulty))
        call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
        if(Trig_Creep_Skills_Func003Func010Func001Func005C())then
            set udg_Point = GetUnitLoc(GetEnumUnit())
            call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
            call UnitAddAbilityBJ(0x41303143, GetLastCreatedUnit())
            call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "entanglingroots", udg_Arct)
            call RemoveLocation(udg_Point)
        else
        endif
    else
        if(Trig_Creep_Skills_Func003Func010Func001Func002C())then
            set udg_AbilityPower = (50.00 * I2R(udg_Difficulty))
            call SetUnitLifeBJ(GetEnumUnit(), (GetUnitStateSwap(UNIT_STATE_LIFE, GetEnumUnit()) + udg_AbilityPower))
        else
        endif
    endif
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func001Func002Func003C takes nothing returns boolean
    if(not(GetUnitUserData(GetTriggerUnit()) == 73))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func001Func002C takes nothing returns boolean
    if(not(GetUnitUserData(GetTriggerUnit()) == 72))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitUserData(GetTriggerUnit()) == 71))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func001Func003Func001Func001C takes nothing returns boolean
    if((GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return true
    endif
    if((GetOwningPlayer(GetEnumUnit()) == Player(1)))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func001Func003Func001C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func001Func003Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func001Func003A takes nothing returns nothing
    if(Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func001Func003Func001C())then
        set udg_AbilityPower = (50.00 * I2R(udg_Difficulty))
        call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
    else
    endif
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func001C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303641))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func007Func001Func001C takes nothing returns boolean
    if((GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return true
    endif
    if((GetOwningPlayer(GetEnumUnit()) == Player(1)))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func007Func001C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func007Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func007A takes nothing returns nothing
    if(Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func007Func001C())then
        set udg_AbilityPower = (50.00 * I2R(udg_Difficulty))
        call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
    else
    endif
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303356))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func001C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303541))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func002C takes nothing returns boolean
    if((GetSpellAbilityId() == 0x4130354C))then
        return true
    endif
    if((GetSpellAbilityId() == 0x41303546))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001Func011C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303546))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func001C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func012Func001Func001Func002C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func006Func001Func001C takes nothing returns boolean
    if((GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return true
    endif
    if((GetOwningPlayer(GetEnumUnit()) == Player(1)))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func006Func001C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func012Func001Func006Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func001Func006A takes nothing returns nothing
    if(Trig_Creep_Skills_Func003Func012Func001Func006Func001C())then
        set udg_AbilityPower = (60.00 * I2R(udg_Difficulty))
        call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())], bj_UNIT_FACING)
        call UnitAddAbilityBJ(0x41303457, GetLastCreatedUnit())
        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
        call IssueImmediateOrderBJ(GetLastCreatedUnit(), "roar")
    else
    endif
endfunction
function Trig_Creep_Skills_Func003Func012Func001C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303456))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func006Func001Func001C takes nothing returns boolean
    if((GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return true
    endif
    if((GetOwningPlayer(GetEnumUnit()) == Player(1)))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func012Func006Func001Func004Func001C takes nothing returns boolean
    if((GetUnitTypeId(GetTriggerUnit()) == 0x6E303030))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x6E303052))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func012Func006Func001Func004Func007C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func006Func001Func004C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func012Func006Func001Func004Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func006Func001Func005Func007C takes nothing returns boolean
    if((GetUnitTypeId(GetTriggerUnit()) == 0x6E303050))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x4E303132))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Skills_Func003Func012Func006Func001Func005C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func012Func006Func001Func005Func007C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func006Func001C takes nothing returns boolean
    if(not Trig_Creep_Skills_Func003Func012Func006Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003Func012Func006A takes nothing returns nothing
    if(Trig_Creep_Skills_Func003Func012Func006Func001C())then
        set udg_AbilityPower = (60.00 * I2R(udg_Difficulty))
        call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        if(Trig_Creep_Skills_Func003Func012Func006Func001Func004C())then
            set udg_Point = GetUnitLoc(GetEnumUnit())
            call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
            call UnitAddAbilityBJ(0x41303230, GetLastCreatedUnit())
            call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "firebolt", GetEnumUnit())
            if(Trig_Creep_Skills_Func003Func012Func006Func001Func004Func007C())then
                call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 1.50, "ReplaceableTextures\\CameraMasks\\HazeAndFogFilter_Mask.blp", 0.00, 70.00, 100.00, 0.00)
            else
            endif
            call RemoveLocation(udg_Point)
        else
        endif
        if(Trig_Creep_Skills_Func003Func012Func006Func001Func005C())then
            set udg_Point = GetUnitLoc(udg_Arct)
            call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
            call RemoveLocation(udg_Point)
            call UnitAddAbilityBJ(0x41303637, GetLastCreatedUnit())
            call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "acidbomb", udg_Arct)
        else
        endif
    else
    endif
endfunction
function Trig_Creep_Skills_Func003Func012C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303232))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Func003C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303139))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Skills_Actions takes nothing returns nothing
    call DestroyEffectBJ(udg_CreepCastEffect[GetUnitUserData(GetTriggerUnit())])
    if(Trig_Creep_Skills_Func003C())then
        set udg_Point = GetUnitLoc(GetTriggerUnit())
        call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
        call RemoveLocation(udg_Point)
        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
        if(Trig_Creep_Skills_Func003Func005C())then
            call UnitAddAbilityBJ(0x41303355, GetLastCreatedUnit())
            set udg_CreepSpellType = 1
        else
            if(Trig_Creep_Skills_Func003Func005Func002C())then
                call UnitAddAbilityBJ(0x4130334E, GetLastCreatedUnit())
                set udg_CreepSpellType = 2
            else
                if(Trig_Creep_Skills_Func003Func005Func002Func001C())then
                    call UnitAddAbilityBJ(0x41303142, GetLastCreatedUnit())
                    set udg_CreepSpellType = 3
                else
                    if(Trig_Creep_Skills_Func003Func005Func002Func001Func002C())then
                        call UnitAddAbilityBJ(0x41303545, GetLastCreatedUnit())
                        set udg_CreepSpellType = 4
                    else
                    endif
                endif
            endif
        endif
        call IssuePointOrderLocBJ(GetLastCreatedUnit(), "clusterrockets", udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())])
        call TriggerSleepAction(0.70)
        if(Trig_Creep_Skills_Func003Func008C())then
            set udg_UnitGroup = GetUnitsInRangeOfLocAll(140.00, udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())])
        else
            set udg_UnitGroup = GetUnitsInRangeOfLocAll(250.00, udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())])
            if(Trig_Creep_Skills_Func003Func008Func004C())then
                call AddSpecialEffectLocBJ(udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())], "Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
            else
                if(Trig_Creep_Skills_Func003Func008Func004Func004C())then
                    call AddSpecialEffectLocBJ(udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())], "war3mapImported\\ShadowAssault.mdx")
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                else
                    if(Trig_Creep_Skills_Func003Func008Func004Func004Func001C())then
                        call SetTerrainTypeBJ(udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())], 0x43706F73, - 1, 1, 0)
                    else
                    endif
                endif
            endif
        endif
        call RemoveLocation(udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())])
        call ForGroupBJ(udg_UnitGroup, function Trig_Creep_Skills_Func003Func010A)
        call DestroyGroup(udg_UnitGroup)
    else
        if(Trig_Creep_Skills_Func003Func012C())then
            set udg_UnitGroup = GetUnitsInRangeOfLocAll(150.00, udg_Creep_Strike_Point[GetUnitUserData(GetTriggerUnit())])
            call AddSpecialEffectLocBJ(udg_Creep_Strike_Point[GetUnitUserData(GetTriggerUnit())], "Abilities\\Spells\\Orc\\FeralSpirit\\feralspirittarget.mdl")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
            call RemoveLocation(udg_Creep_Strike_Point[GetUnitUserData(GetTriggerUnit())])
            call ForGroupBJ(udg_UnitGroup, function Trig_Creep_Skills_Func003Func012Func006A)
            call DestroyGroup(udg_UnitGroup)
        else
            if(Trig_Creep_Skills_Func003Func012Func001C())then
                set udg_UnitGroup = GetUnitsInRangeOfLocAll(120.00, udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())])
                call AddSpecialEffectLocBJ(udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())], "Abilities\\Spells\\Orc\\FeralSpirit\\feralspirittarget.mdl")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                call SetUnitPositionLoc(GetTriggerUnit(), udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())])
                call ForGroupBJ(udg_UnitGroup, function Trig_Creep_Skills_Func003Func012Func001Func006A)
                call RemoveLocation(udg_Creep_Cast_Point[GetUnitUserData(GetTriggerUnit())])
            else
                if(Trig_Creep_Skills_Func003Func012Func001Func001C())then
                    set udg_Point = GetUnitLoc(GetTriggerUnit())
                    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
                    call UnitAddAbilityBJ(0x4130354B, GetLastCreatedUnit())
                    call UnitApplyTimedLifeBJ(3.00, 0x42544C46, GetLastCreatedUnit())
                    set udg_Point2 = GetUnitLoc(GetSpellTargetUnit())
                    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "carrionswarm", udg_Point2)
                    call RemoveLocation(udg_Point)
                    call RemoveLocation(udg_Point2)
                    if(Trig_Creep_Skills_Func003Func012Func001Func001Func011C())then
                        set udg_BL_Idol = true
                    else
                        set udg_BL_Idol = false
                    endif
                else
                    if(Trig_Creep_Skills_Func003Func012Func001Func001Func001C())then
                        if(Trig_Creep_Skills_Func003Func012Func001Func001Func001Func001C())then
                            call SetUnitUserData(GetTriggerUnit(), 72)
                            call UnitAddAbilityBJ(0x41303535, GetTriggerUnit())
                        else
                            if(Trig_Creep_Skills_Func003Func012Func001Func001Func001Func001Func002C())then
                                call SetUnitUserData(GetTriggerUnit(), 73)
                                call UnitRemoveAbilityBJ(0x41303535, GetTriggerUnit())
                                call UnitAddAbilityBJ(0x41303536, GetTriggerUnit())
                            else
                                if(Trig_Creep_Skills_Func003Func012Func001Func001Func001Func001Func002Func003C())then
                                    call UnitRemoveAbilityBJ(0x41303536, GetTriggerUnit())
                                    call UnitAddAbilityBJ(0x41303539, GetTriggerUnit())
                                else
                                endif
                            endif
                        endif
                    else
                        if(Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002C())then
                            set udg_Point = GetUnitLoc(GetTriggerUnit())
                            call SetTerrainTypeBJ(udg_Point, 0x43706F73, - 1, 2, 0)
                            call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Blight Missile.mdx")
                            call DestroyEffectBJ(GetLastCreatedEffectBJ())
                            set udg_UnitGroup = GetUnitsInRangeOfLocAll(150.00, udg_Point)
                            call ForGroupBJ(udg_UnitGroup, function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func007A)
                            call RemoveLocation(udg_Point)
                        else
                            if(Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func001C())then
                                set udg_Point = GetUnitLoc(GetTriggerUnit())
                                set udg_UnitGroup = GetUnitsInRangeOfLocAll(150.00, udg_Point)
                                call ForGroupBJ(udg_UnitGroup, function Trig_Creep_Skills_Func003Func012Func001Func001Func001Func002Func001Func003A)
                                call RemoveLocation(udg_Point)
                            else
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endfunction
function InitTrig_Creep_Skills takes nothing returns nothing
    set gg_trg_Creep_Skills = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Creep_Skills, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Creep_Skills, Condition(function Trig_Creep_Skills_Conditions))
    call TriggerAddAction(gg_trg_Creep_Skills, function Trig_Creep_Skills_Actions)
endfunction
function Trig_Creep_Attacked_Func001Func001Func001C takes nothing returns boolean
    if((GetUnitTypeId(GetTriggerUnit()) == 0x6E30305A))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x4E303133))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Attacked_Func001Func001C takes nothing returns boolean
    if(not Trig_Creep_Attacked_Func001Func001Func001C())then
        return false
    endif
    if(not(GetRandomInt(1, 3) == 1))then
        return false
    endif
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) > 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Attacked_Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x6E303055))then
        return false
    endif
    if(not(GetRandomInt(1, 5) == 1))then
        return false
    endif
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) > 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Attacked_Actions takes nothing returns nothing
    if(Trig_Creep_Attacked_Func001C())then
        call IssueImmediateOrderBJ(GetTriggerUnit(), "tranquility")
    else
        if(Trig_Creep_Attacked_Func001Func001C())then
            call IssueTargetOrderBJ(GetTriggerUnit(), "heal", GetTriggerUnit())
        else
        endif
    endif
endfunction
function InitTrig_Creep_Attacked takes nothing returns nothing
    set gg_trg_Creep_Attacked = CreateTrigger()
    call TriggerRegisterPlayerUnitEventSimple(gg_trg_Creep_Attacked, Player(11), EVENT_PLAYER_UNIT_ATTACKED)
    call TriggerAddAction(gg_trg_Creep_Attacked, function Trig_Creep_Attacked_Actions)
endfunction
function Trig_Creep_Attacking_Func001Func004C takes nothing returns boolean
    if(not(GetUnitTypeId(GetAttacker()) == 0x6E303047))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Attacking_Func001Func010C takes nothing returns boolean
    if((GetUnitTypeId(GetAttacker()) == 0x6E303056))then
        return true
    endif
    if((GetUnitTypeId(GetAttacker()) == 0x6E303047))then
        return true
    endif
    return false
endfunction
function Trig_Creep_Attacking_Func001C takes nothing returns boolean
    if(not Trig_Creep_Attacking_Func001Func010C())then
        return false
    endif
    return true
endfunction
function Trig_Creep_Attacking_Actions takes nothing returns nothing
    if(Trig_Creep_Attacking_Func001C())then
        set udg_Point = GetUnitLoc(udg_Arct)
        set udg_Point2 = GetUnitLoc(GetAttacker())
        call CreateNUnitsAtLoc(1, 0x68303134, Player(11), udg_Point2, bj_UNIT_FACING)
        if(Trig_Creep_Attacking_Func001Func004C())then
            call SetUnitUserData(GetLastCreatedUnit(), 22)
        else
        endif
        call UnitAddAbilityBJ(0x4130354B, GetLastCreatedUnit())
        call UnitApplyTimedLifeBJ(1.20, 0x42544C46, GetLastCreatedUnit())
        call IssuePointOrderLocBJ(GetLastCreatedUnit(), "carrionswarm", udg_Point)
        call RemoveLocation(udg_Point)
        call RemoveLocation(udg_Point2)
    else
    endif
endfunction
function InitTrig_Creep_Attacking takes nothing returns nothing
    set gg_trg_Creep_Attacking = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Creep_Attacking, gg_unit_H000_0004, EVENT_UNIT_ATTACKED)
    call TriggerAddAction(gg_trg_Creep_Attacking, function Trig_Creep_Attacking_Actions)
endfunction
function Trig_Creep_Fallen_End_Cast_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303231))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Fallen_End_Cast_Actions takes nothing returns nothing
    call GroupRemoveUnitSimple(GetTriggerUnit(), udg_FallenGroup)
endfunction
function InitTrig_Creep_Fallen_End_Cast takes nothing returns nothing
    set gg_trg_Creep_Fallen_End_Cast = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Creep_Fallen_End_Cast, EVENT_PLAYER_UNIT_SPELL_FINISH)
    call TriggerAddCondition(gg_trg_Creep_Fallen_End_Cast, Condition(function Trig_Creep_Fallen_End_Cast_Conditions))
    call TriggerAddAction(gg_trg_Creep_Fallen_End_Cast, function Trig_Creep_Fallen_End_Cast_Actions)
endfunction
function Trig_Creep_Fallen_Spawn_Func001A takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetEnumUnit())
    set udg_Point2 = PolarProjectionBJ(udg_Point, GetRandomReal(100.00, 200.00), GetRandomDirectionDeg())
    call CreateNUnitsAtLoc(1, 0x68303133, Player(11), udg_Point2, bj_UNIT_FACING)
    call UnitAddAbilityBJ(0x4130354B, GetLastCreatedUnit())
    call UnitApplyTimedLifeBJ(1.20, 0x42544C46, GetLastCreatedUnit())
    call RemoveLocation(udg_Point)
    call RemoveLocation(udg_Point2)
    set udg_Point = GetUnitLoc(udg_Arct)
    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "carrionswarm", udg_Point)
    call RemoveLocation(udg_Point)
endfunction
function Trig_Creep_Fallen_Spawn_Func002C takes nothing returns boolean
    if(not(CountUnitsInGroup(udg_FallenGroup) == 0))then
        return false
    endif
    return true
endfunction
function Trig_Creep_Fallen_Spawn_Actions takes nothing returns nothing
    call ForGroupBJ(udg_FallenGroup, function Trig_Creep_Fallen_Spawn_Func001A)
    if(Trig_Creep_Fallen_Spawn_Func002C())then
        call DisableTrigger(GetTriggeringTrigger())
    else
    endif
endfunction
function InitTrig_Creep_Fallen_Spawn takes nothing returns nothing
    set gg_trg_Creep_Fallen_Spawn = CreateTrigger()
    call DisableTrigger(gg_trg_Creep_Fallen_Spawn)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Creep_Fallen_Spawn, 0.50)
    call TriggerAddAction(gg_trg_Creep_Fallen_Spawn, function Trig_Creep_Fallen_Spawn_Actions)
endfunction
function Trig_Izurods_Damage_Func001Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_LIFE, GetTriggerUnit()) <= I2R(udg_RandomNumber)))then
        return false
    endif
    if(not(GetUnitUserData(GetTriggerUnit()) == 70))then
        return false
    endif
    return true
endfunction
function Trig_Izurods_Damage_Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(udg_DamageEventTarget) == 0x6E30304F))then
        return false
    endif
    return true
endfunction
function Trig_Izurods_Damage_Func002C takes nothing returns boolean
    if(not(UnitHasBuffBJ(GetTriggerUnit(), 0x42486162) == true))then
        return false
    endif
    return true
endfunction
function Trig_Izurods_Damage_Actions takes nothing returns nothing
    if(Trig_Izurods_Damage_Func001C())then
        set udg_RandomNumber = (R2I(GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetTriggerUnit())) * 85)
        set udg_RandomNumber = (udg_RandomNumber / 100)
        if(Trig_Izurods_Damage_Func001Func003C())then
            call SetUnitUserData(GetTriggerUnit(), 71)
            call UnitRemoveBuffBJ(0x42303045, GetTriggerUnit())
            call ResetUnitAnimation(GetTriggerUnit())
            call AddSpecialEffectTargetUnitBJ("chest", GetTriggerUnit(), "war3mapImported\\StompRed.mdx")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
        else
        endif
    else
    endif
    if(Trig_Izurods_Damage_Func002C())then
        call SetUnitManaBJ(GetTriggerUnit(), (GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) + 10.00))
    else
    endif
endfunction
function InitTrig_Izurods_Damage takes nothing returns nothing
    set gg_trg_Izurods_Damage = CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Izurods_Damage, "udg_DamageModifierEvent", EQUAL, 1.00)
    call TriggerAddAction(gg_trg_Izurods_Damage, function Trig_Izurods_Damage_Actions)
endfunction
function Trig_Flying_Missile_Setings_Conditions takes nothing returns boolean
    if(not(0x4130354B == GetSpellAbilityId()))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Setings_Func003C takes nothing returns boolean
    if(not(udg_BL_Skip == 0))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Setings_Func019Func001Func001Func001Func009Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303149))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Setings_Func019Func001Func001Func001Func009C takes nothing returns boolean
    if(not(udg_BL_Idol == true))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Setings_Func019Func001Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303039))then
        return false
    endif
    if(not(GetUnitUserData(GetTriggerUnit()) == 33))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Setings_Func019Func001Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303134))then
        return false
    endif
    if(not(GetUnitUserData(GetTriggerUnit()) == 22))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Setings_Func019Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303134))then
        return false
    endif
    if(not(GetUnitUserData(GetTriggerUnit()) != 22))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Setings_Func019C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303133))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Setings_Actions takes nothing returns nothing
    if(Trig_Flying_Missile_Setings_Func003C())then
        call EnableTrigger(gg_trg_Flying_Missile_Loop)
    else
    endif
    set udg_BL_Skip = (udg_BL_Skip + 1)
    set udg_BL_Times = (udg_BL_Times + 1)
    set udg_BL_Off[udg_BL_Times] = true
    set udg_BL_Hero[udg_BL_Times] = GetSpellAbilityUnit()
    set udg_BL_Point[0] = GetUnitLoc(GetSpellAbilityUnit())
    set udg_BL_Point[1] = GetSpellTargetLoc()
    set udg_BL_Angle[udg_BL_Times] = AngleBetweenPoints(udg_BL_Point[0], udg_BL_Point[1])
    set udg_BL_Distance[udg_BL_Times] = 1000.00
    set udg_BL_Speed[udg_BL_Times] = 11.25
    set udg_BL_AoE[udg_BL_Times] = 100.00
    set udg_BL_Collision[udg_BL_Times] = 50.00
    call CreateNUnitsAtLoc(1, 0x6E303053, GetOwningPlayer(udg_BL_Hero[udg_BL_Times]), udg_BL_Point[0], udg_BL_Angle[udg_BL_Times])
    set udg_BL_Missile[udg_BL_Times] = GetLastCreatedUnit()
    call SetUnitFlyHeightBJ(udg_BL_Missile[udg_BL_Times], 30.00, 0.00)
    if(Trig_Flying_Missile_Setings_Func019C())then
        set udg_BL_Dmg[udg_BL_Times] = (50.00 * I2R(udg_Difficulty))
        call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\LordofFlameMissile\\LordofFlameMissile.mdl")
        set udg_BL_Effect1[udg_BL_Times] = GetLastCreatedEffectBJ()
        call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\VengeanceMissile\\VengeanceMissile.mdl")
        set udg_BL_Effect2[udg_BL_Times] = GetLastCreatedEffectBJ()
    else
        if(Trig_Flying_Missile_Setings_Func019Func001C())then
            set udg_BL_Dmg[udg_BL_Times] = (50.00 * I2R(udg_Difficulty))
            call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl")
            set udg_BL_Effect1[udg_BL_Times] = GetLastCreatedEffectBJ()
            call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\AvengerMissile\\AvengerMissile.mdl")
            set udg_BL_Effect2[udg_BL_Times] = GetLastCreatedEffectBJ()
        else
            if(Trig_Flying_Missile_Setings_Func019Func001Func001C())then
                set udg_BL_Dmg[udg_BL_Times] = (120.00 * I2R(udg_Difficulty))
                call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\GreenDragonMissile\\GreenDragonMissile.mdl")
                set udg_BL_Effect1[udg_BL_Times] = GetLastCreatedEffectBJ()
                call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\ChimaeraAcidMissile\\ChimaeraAcidMissile.mdl")
                set udg_BL_Effect2[udg_BL_Times] = GetLastCreatedEffectBJ()
            else
                if(Trig_Flying_Missile_Setings_Func019Func001Func001Func001C())then
                    set udg_BL_Dmg[udg_BL_Times] = (200.00 * I2R(udg_Difficulty))
                    call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "war3mapImported\\Black Missile.mdx")
                    set udg_BL_Effect1[udg_BL_Times] = GetLastCreatedEffectBJ()
                    call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\VengeanceMissile\\VengeanceMissile.mdl")
                    set udg_BL_Effect2[udg_BL_Times] = GetLastCreatedEffectBJ()
                    set udg_BL_Speed[udg_BL_Times] = (14.00 + I2R(udg_Difficulty))
                else
                    if(Trig_Flying_Missile_Setings_Func019Func001Func001Func001Func009C())then
                        set udg_BL_Dmg[udg_BL_Times] = (50.00 * I2R(udg_Difficulty))
                        call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\AncestralGuardianMissile\\AncestralGuardianMissile.mdl")
                        set udg_BL_Effect1[udg_BL_Times] = GetLastCreatedEffectBJ()
                        call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\VengeanceMissile\\VengeanceMissile.mdl")
                        set udg_BL_Effect2[udg_BL_Times] = GetLastCreatedEffectBJ()
                    else
                        if(Trig_Flying_Missile_Setings_Func019Func001Func001Func001Func009Func001C())then
                            set udg_BL_Dmg[udg_BL_Times] = (I2R(udg_CO_Power) * 3.00)
                            set udg_BL_Dmg[udg_BL_Times] = (udg_BL_Dmg[udg_BL_Times] + I2R(udg_CO_Combo))
                            call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\PriestMissile\\PriestMissile.mdl")
                            set udg_BL_Effect1[udg_BL_Times] = GetLastCreatedEffectBJ()
                            call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\FaerieDragonMissile\\FaerieDragonMissile.mdl")
                            set udg_BL_Effect2[udg_BL_Times] = GetLastCreatedEffectBJ()
                        else
                            set udg_BL_Dmg[udg_BL_Times] = (100.00 * I2R(udg_Difficulty))
                            call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Weapons\\CryptFiendMissile\\CryptFiendMissile.mdl")
                            set udg_BL_Effect1[udg_BL_Times] = GetLastCreatedEffectBJ()
                            call AddSpecialEffectTargetUnitBJ("chest", udg_BL_Missile[udg_BL_Times], "Abilities\\Spells\\Undead\\DeathCoil\\DeathCoilMissile.mdl")
                            set udg_BL_Effect2[udg_BL_Times] = GetLastCreatedEffectBJ()
                        endif
                    endif
                endif
            endif
        endif
    endif
    call RemoveLocation(udg_BL_Point[0])
    call RemoveLocation(udg_BL_Point[1])
endfunction
function InitTrig_Flying_Missile_Setings takes nothing returns nothing
    set gg_trg_Flying_Missile_Setings = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Flying_Missile_Setings, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Flying_Missile_Setings, Condition(function Trig_Flying_Missile_Setings_Conditions))
    call TriggerAddAction(gg_trg_Flying_Missile_Setings, function Trig_Flying_Missile_Setings_Actions)
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func005002003001001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false)
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func005002003001002 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_MECHANICAL) == false)
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func005002003001 takes nothing returns boolean
    return GetBooleanAnd(Trig_Flying_Missile_Loop_Func002Func001Func005002003001001(), Trig_Flying_Missile_Loop_Func002Func001Func005002003001002())
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func005002003002001001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false)
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func005002003002001002 takes nothing returns boolean
    return(IsUnitDeadBJ(GetFilterUnit()) == false)
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func005002003002001 takes nothing returns boolean
    return GetBooleanAnd(Trig_Flying_Missile_Loop_Func002Func001Func005002003002001001(), Trig_Flying_Missile_Loop_Func002Func001Func005002003002001002())
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func005002003002002001 takes nothing returns boolean
    return(IsUnitAlly(GetFilterUnit(), GetOwningPlayer(udg_BL_Hero[udg_BL])) == false)
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func005002003002002002 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING) == false)
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func005002003002002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Flying_Missile_Loop_Func002Func001Func005002003002002001(), Trig_Flying_Missile_Loop_Func002Func001Func005002003002002002())
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func005002003002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Flying_Missile_Loop_Func002Func001Func005002003002001(), Trig_Flying_Missile_Loop_Func002Func001Func005002003002002())
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func005002003 takes nothing returns boolean
    return GetBooleanAnd(Trig_Flying_Missile_Loop_Func002Func001Func005002003001(), Trig_Flying_Missile_Loop_Func002Func001Func005002003002())
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003001001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false)
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003001002 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_MECHANICAL) == false)
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003001 takes nothing returns boolean
    return GetBooleanAnd(Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003001001(), Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003001002())
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003002001001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false)
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003002001002 takes nothing returns boolean
    return(IsUnitDeadBJ(GetFilterUnit()) == false)
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003002001 takes nothing returns boolean
    return GetBooleanAnd(Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003002001001(), Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003002001002())
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003002002001 takes nothing returns boolean
    return(IsUnitAlly(GetFilterUnit(), GetOwningPlayer(udg_BL_Hero[udg_BL])) == false)
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003002002002 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING) == false)
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003002002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003002002001(), Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003002002002())
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003002001(), Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003002002())
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003 takes nothing returns boolean
    return GetBooleanAnd(Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003001(), Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003002())
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func006Func003A takes nothing returns nothing
    call UnitDamageTargetBJ(udg_BL_Hero[udg_BL], GetEnumUnit(), udg_BL_Dmg[udg_BL], ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
    set udg_BL_Distance[udg_BL] = 0.00
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func006C takes nothing returns boolean
    if(not(CountUnitsInGroup(udg_BL_Group) > 0))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func010Func006C takes nothing returns boolean
    if(not(udg_BL_Skip == 0))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Loop_Func002Func001Func010C takes nothing returns boolean
    if(not(udg_BL_Distance[udg_BL] <= 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Loop_Func002Func001C takes nothing returns boolean
    if(not(udg_BL_Off[udg_BL] == true))then
        return false
    endif
    return true
endfunction
function Trig_Flying_Missile_Loop_Actions takes nothing returns nothing
    set udg_BL = 1
    loop
        exitwhen udg_BL > udg_BL_Times
        if(Trig_Flying_Missile_Loop_Func002Func001C())then
            set udg_BL_Point[2] = GetUnitLoc(udg_BL_Missile[udg_BL])
            set udg_BL_Point[3] = PolarProjectionBJ(udg_BL_Point[2], udg_BL_Speed[udg_BL], udg_BL_Angle[udg_BL])
            call SetUnitPositionLoc(udg_BL_Missile[udg_BL], udg_BL_Point[3])
            set udg_BL_Distance[udg_BL] = (udg_BL_Distance[udg_BL] - udg_BL_Speed[udg_BL])
            set udg_BL_Group = GetUnitsInRangeOfLocMatching(udg_BL_Collision[udg_BL], udg_BL_Point[3], Condition(function Trig_Flying_Missile_Loop_Func002Func001Func005002003))
            if(Trig_Flying_Missile_Loop_Func002Func001Func006C())then
                call DestroyGroup(udg_BL_Group)
                set udg_BL_Group = GetUnitsInRangeOfLocMatching(udg_BL_AoE[udg_BL], udg_BL_Point[3], Condition(function Trig_Flying_Missile_Loop_Func002Func001Func006Func002002003))
                call ForGroupBJ(udg_BL_Group, function Trig_Flying_Missile_Loop_Func002Func001Func006Func003A)
            else
            endif
            call RemoveLocation(udg_BL_Point[2])
            call RemoveLocation(udg_BL_Point[3])
            call DestroyGroup(udg_BL_Group)
            if(Trig_Flying_Missile_Loop_Func002Func001Func010C())then
                call DestroyEffectBJ(udg_BL_Effect1[udg_BL])
                call DestroyEffectBJ(udg_BL_Effect2[udg_BL])
                call KillUnit(udg_BL_Missile[udg_BL])
                set udg_BL_Skip = (udg_BL_Skip - 1)
                set udg_BL_Off[udg_BL] = false
                if(Trig_Flying_Missile_Loop_Func002Func001Func010Func006C())then
                    set udg_BL_Times = 0
                    call DisableTrigger(GetTriggeringTrigger())
                else
                endif
            else
            endif
        else
        endif
        set udg_BL = udg_BL + 1
    endloop
endfunction
function InitTrig_Flying_Missile_Loop takes nothing returns nothing
    set gg_trg_Flying_Missile_Loop = CreateTrigger()
    call DisableTrigger(gg_trg_Flying_Missile_Loop)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Flying_Missile_Loop, 0.03)
    call TriggerAddAction(gg_trg_Flying_Missile_Loop, function Trig_Flying_Missile_Loop_Actions)
endfunction
function Trig_Boss_Creep_Spawn_Func003Func001Func001Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Boss_Creep_Spawn_Func003Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Boss_Creep_Spawn_Func003Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(udg_EM_BossUnit) == 0x6E303047))then
        return false
    endif
    return true
endfunction
function Trig_Boss_Creep_Spawn_Func003Func002Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Boss_Creep_Spawn_Func003Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Boss_Creep_Spawn_Func003C takes nothing returns boolean
    if(not(GetUnitTypeId(udg_EM_BossUnit) == 0x6E30304C))then
        return false
    endif
    return true
endfunction
function Trig_Boss_Creep_Spawn_Actions takes nothing returns nothing
    set udg_RandomNumber = GetRandomInt(1, 3)
    set udg_CustomValues = (udg_CustomValues + 1)
    if(Trig_Boss_Creep_Spawn_Func003C())then
        if(Trig_Boss_Creep_Spawn_Func003Func002C())then
            set udg_CO_Point = GetRectCenter(gg_rct_Boss_Creep_Spawn_1)
        else
            if(Trig_Boss_Creep_Spawn_Func003Func002Func002C())then
                set udg_CO_Point = GetRectCenter(gg_rct_Boss_Creep_Spawn_2)
            else
                set udg_CO_Point = GetRectCenter(gg_rct_Boss_Creep_Spawn_3)
            endif
        endif
    else
        if(Trig_Boss_Creep_Spawn_Func003Func001C())then
            if(Trig_Boss_Creep_Spawn_Func003Func001Func001C())then
                set udg_CO_Point = GetRectCenter(gg_rct_Boss_2_Spawn)
            else
                if(Trig_Boss_Creep_Spawn_Func003Func001Func001Func002C())then
                    set udg_CO_Point = GetRectCenter(gg_rct_Boss_2_Spawn_2)
                else
                    set udg_CO_Point = GetRectCenter(gg_rct_Boss_2_Spawn_3)
                endif
            endif
        else
        endif
    endif
    call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 5)], Player(11), udg_CO_Point, bj_UNIT_FACING)
    call SetUnitUserData(GetLastCreatedUnit(), udg_CustomValues)
    call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", udg_Arct)
    call RemoveLocation(udg_CO_Point)
    call ConditionalTriggerExecute(gg_trg_Gen_Creeps_Skills)
endfunction
function InitTrig_Boss_Creep_Spawn takes nothing returns nothing
    set gg_trg_Boss_Creep_Spawn = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_Creep_Spawn)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_Creep_Spawn, 6.00)
    call TriggerAddAction(gg_trg_Boss_Creep_Spawn, function Trig_Boss_Creep_Spawn_Actions)
endfunction
function Trig_Boss_Kill_Check_Func008Func001Func001C takes nothing returns boolean
    if(not(udg_EM_Boss[3] == false))then
        return false
    endif
    return true
endfunction
function Trig_Boss_Kill_Check_Func008Func001Func002C takes nothing returns boolean
    if(not(udg_EM_Boss[2] == false))then
        return false
    endif
    return true
endfunction
function Trig_Boss_Kill_Check_Func008Func001C takes nothing returns boolean
    if(not(udg_EM_BossLevel == gg_unit_h00K_0123))then
        return false
    endif
    return true
endfunction
function Trig_Boss_Kill_Check_Func008Func002C takes nothing returns boolean
    if(not(udg_EM_Boss[1] == false))then
        return false
    endif
    return true
endfunction
function Trig_Boss_Kill_Check_Func008C takes nothing returns boolean
    if(not(udg_EM_BossLevel == gg_unit_h00K_0105))then
        return false
    endif
    return true
endfunction
function Trig_Boss_Kill_Check_Actions takes nothing returns nothing
    set udg_QG_Count[5] = (udg_QG_Count[5] + 1)
    call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 2.00, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 100.00, 100.00, 100.00, 20.00)
    set udg_Point = GetRectCenter(gg_rct_Boss_Zone_1)
    call SetTerrainTypeBJ(udg_Point, 0x51647272, - 1, 6, 1)
    call RemoveLocation(udg_Point)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 5
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_Point = GetRandomLocInRect(gg_rct_Boss_Zone_1)
        call SetTerrainTypeBJ(udg_Point, 0x58626C6D, - 1, 2, 0)
        call RemoveLocation(udg_Point)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    if(Trig_Boss_Kill_Check_Func008C())then
        if(Trig_Boss_Kill_Check_Func008Func002C())then
            set udg_EM_Generate = 2
            set udg_EM_Boss[1] = true
            call ConditionalTriggerExecute(gg_trg_Map_Generate)
        else
        endif
    else
        if(Trig_Boss_Kill_Check_Func008Func001C())then
            if(Trig_Boss_Kill_Check_Func008Func001Func002C())then
                set udg_EM_Generate = 3
                set udg_EM_Boss[2] = true
                call ConditionalTriggerExecute(gg_trg_Map_Generate)
            else
            endif
        else
            if(Trig_Boss_Kill_Check_Func008Func001Func001C())then
                set udg_EM_Boss[3] = true
            else
            endif
        endif
    endif
    call SetUnitLifePercentBJ(udg_Arct, 100)
    call SetUnitManaPercentBJ(udg_Arct, 100)
    set udg_RandomNumber = (10 * udg_Difficulty)
    set udg_LightOrbs[2] = (udg_LightOrbs[2] + udg_RandomNumber)
    set udg_LightIterations = (udg_LightIterations + udg_RandomNumber)
    call EnableTrigger(gg_trg_Orbs_Spawn)
    call StopMusicBJ(true)
    call DisableTrigger(gg_trg_Boss_II_Channel_Periodic)
    call DisableTrigger(gg_trg_Boss_II_Channel_Init)
    call UnitAddAbilityBJ(0x4176756C, udg_Arct)
    call ConditionalTriggerExecute(gg_trg_Boss_Units_Remove)
endfunction
function InitTrig_Boss_Kill_Check takes nothing returns nothing
    set gg_trg_Boss_Kill_Check = CreateTrigger()
    call TriggerAddAction(gg_trg_Boss_Kill_Check, function Trig_Boss_Kill_Check_Actions)
endfunction
function Trig_Boss_Units_Remove_Func002002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Boss_Units_Remove_Func005002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Boss_Units_Remove_Func008002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Boss_Units_Remove_Func011002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Boss_Units_Remove_Func014002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Boss_Units_Remove_Actions takes nothing returns nothing
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Boss_Zone, Player(11))
    call ForGroupBJ(udg_D_Pick, function Trig_Boss_Units_Remove_Func002002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Boss_2_Zone, Player(11))
    call ForGroupBJ(udg_D_Pick, function Trig_Boss_Units_Remove_Func005002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Boss_3_Zone, Player(11))
    call ForGroupBJ(udg_D_Pick, function Trig_Boss_Units_Remove_Func008002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Boss_3_Zone, Player(PLAYER_NEUTRAL_PASSIVE))
    call ForGroupBJ(udg_D_Pick, function Trig_Boss_Units_Remove_Func011002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Boss_3_Zone, Player(1))
    call ForGroupBJ(udg_D_Pick, function Trig_Boss_Units_Remove_Func014002)
    call DestroyGroup(udg_D_Pick)
endfunction
function InitTrig_Boss_Units_Remove takes nothing returns nothing
    set gg_trg_Boss_Units_Remove = CreateTrigger()
    call TriggerAddAction(gg_trg_Boss_Units_Remove, function Trig_Boss_Units_Remove_Actions)
endfunction
function Trig_Boss_Casts_Conditions takes nothing returns boolean
    if(not(GetOwningPlayer(GetTriggerUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Boss_Casts_Func001Func001C takes nothing returns boolean
    if((GetSpellAbilityId() == 0x41303053))then
        return true
    endif
    if((GetSpellAbilityId() == 0x41303130))then
        return true
    endif
    return false
endfunction
function Trig_Boss_Casts_Func001Func002C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x4130354F))then
        return false
    endif
    return true
endfunction
function Trig_Boss_Casts_Func001C takes nothing returns boolean
    if(not Trig_Boss_Casts_Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Boss_Casts_Actions takes nothing returns nothing
    if(Trig_Boss_Casts_Func001C())then
        set udg_Boss_Ability_Point = GetUnitLoc(GetSpellTargetUnit())
        call CreateTextTagUnitBJ("!!!", GetTriggerUnit(), 0, 12.00, 100.00, 0.00, 0.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 30.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.00)
    else
        if(Trig_Boss_Casts_Func001Func002C())then
            call SetUnitLifeBJ(GetTriggerUnit(), (GetUnitStateSwap(UNIT_STATE_LIFE, GetTriggerUnit()) + GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetSpellTargetUnit())))
        else
        endif
    endif
endfunction
function InitTrig_Boss_Casts takes nothing returns nothing
    set gg_trg_Boss_Casts = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Boss_Casts, EVENT_PLAYER_UNIT_SPELL_CHANNEL)
    call TriggerAddCondition(gg_trg_Boss_Casts, Condition(function Trig_Boss_Casts_Conditions))
    call TriggerAddAction(gg_trg_Boss_Casts, function Trig_Boss_Casts_Actions)
endfunction
function Trig_Boss_I_Throw_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303053))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func007Func002Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func007Func002Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func007Func002Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func007Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func007C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010Func001Func001Func001Func001Func008Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010Func001Func001Func001Func001Func008A takes nothing returns nothing
    if(Trig_Boss_I_Throw_Func010Func001Func001Func001Func001Func008Func001C())then
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "bloodlust", GetEnumUnit())
    else
    endif
endfunction
function Trig_Boss_I_Throw_Func010Func001Func001Func001Func001Func013Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010Func001Func001Func001Func001Func013A takes nothing returns nothing
    if(Trig_Boss_I_Throw_Func010Func001Func001Func001Func001Func013Func001C())then
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "bloodlust", GetEnumUnit())
    else
    endif
endfunction
function Trig_Boss_I_Throw_Func010Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 5))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010Func001Func001Func005A takes nothing returns nothing
    call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), (80.00 * I2R(udg_Difficulty)), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL)
endfunction
function Trig_Boss_I_Throw_Func010Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010Func001Func009Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010Func001Func009A takes nothing returns nothing
    if(Trig_Boss_I_Throw_Func010Func001Func009Func001C())then
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "rejuvination", GetEnumUnit())
    else
    endif
endfunction
function Trig_Boss_I_Throw_Func010Func001Func014Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010Func001Func014A takes nothing returns nothing
    if(Trig_Boss_I_Throw_Func010Func001Func014Func001C())then
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "rejuvination", GetEnumUnit())
    else
    endif
endfunction
function Trig_Boss_I_Throw_Func010Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetTriggerUnit())
    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
    call UnitAddAbilityBJ(0x4130305A, GetLastCreatedUnit())
    call SetUnitAbilityLevelSwapped(0x4130305A, GetLastCreatedUnit(), 1)
    call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "clusterrockets", udg_Boss_Ability_Point)
    if(Trig_Boss_I_Throw_Func007C())then
        set udg_RandomNumber = GetRandomInt(1, 5)
        if(Trig_Boss_I_Throw_Func007Func002C())then
            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Сумасшедший", gg_snd_HeroAlchemistYesAttack1, "Всего один эликсир! *злобно хихикает*", bj_TIMETYPE_ADD, 0, false)
        else
            if(Trig_Boss_I_Throw_Func007Func002Func001C())then
                call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Сумасшедший", gg_snd_HeroAlchemistYesAttack2, "Взрываю!", bj_TIMETYPE_ADD, 0, false)
            else
                if(Trig_Boss_I_Throw_Func007Func002Func001Func001C())then
                    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Сумасшедший", gg_snd_HeroAlchemistWhat4, "Попробуем новый состав...", bj_TIMETYPE_ADD, 0, false)
                else
                    if(Trig_Boss_I_Throw_Func007Func002Func001Func001Func001C())then
                        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Сумасшедший", gg_snd_GoblinZeppelinYes4, "*радостное исступление*", bj_TIMETYPE_ADD, 0, false)
                    else
                        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Сумасшедший", gg_snd_GoblinZeppelinYes3, "*нездоровый смех*", bj_TIMETYPE_ADD, 0, false)
                    endif
                endif
            endif
        endif
    else
    endif
    call TriggerSleepAction(0.60)
    set udg_RandomNumber = GetRandomInt(1, 5)
    if(Trig_Boss_I_Throw_Func010C())then
        call SetTerrainTypeBJ(udg_Boss_Ability_Point, 0x43706F73, - 1, 3, 0)
        call AddSpecialEffectLocBJ(udg_Boss_Ability_Point, "war3mapImported\\GreatElderHydraAcidSpewV.153.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
    else
        if(Trig_Boss_I_Throw_Func010Func001C())then
            call AddSpecialEffectLocBJ(udg_Boss_Ability_Point, "war3mapImported\\HolyAwakening.mdx")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
            set udg_UnitGroup = GetUnitsInRangeOfLocAll(400.00, udg_Boss_Ability_Point)
            call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Boss_Ability_Point, bj_UNIT_FACING)
            call UnitAddAbilityBJ(0x41303131, GetLastCreatedUnit())
            call SetUnitAbilityLevelSwapped(0x4130305A, GetLastCreatedUnit(), 1)
            call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
            call ForGroupBJ(udg_UnitGroup, function Trig_Boss_I_Throw_Func010Func001Func009A)
            call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Boss_Ability_Point, bj_UNIT_FACING)
            call UnitAddAbilityBJ(0x41303131, GetLastCreatedUnit())
            call SetUnitAbilityLevelSwapped(0x4130305A, GetLastCreatedUnit(), 1)
            call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
            call ForGroupBJ(udg_UnitGroup, function Trig_Boss_I_Throw_Func010Func001Func014A)
            call DestroyGroup(udg_UnitGroup)
        else
            if(Trig_Boss_I_Throw_Func010Func001Func001C())then
                call AddSpecialEffectLocBJ(udg_Boss_Ability_Point, "war3mapImported\\Holy_Fire_Slam.mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                set udg_UnitGroup = GetUnitsInRangeOfLocAll(350.00, udg_Boss_Ability_Point)
                call ForGroupBJ(udg_UnitGroup, function Trig_Boss_I_Throw_Func010Func001Func001Func005A)
            else
                if(Trig_Boss_I_Throw_Func010Func001Func001Func001C())then
                    call AddSpecialEffectLocBJ(udg_Boss_Ability_Point, "war3mapImported\\Arcane Nova.mdx")
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                    call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 3)], Player(11), udg_Boss_Ability_Point, GetRandomReal(0, 360.00))
                    call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(4, 6)], Player(11), udg_Boss_Ability_Point, GetRandomReal(0, 360.00))
                    call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(10, 10)], Player(11), udg_Boss_Ability_Point, GetRandomReal(0, 360.00))
                else
                    if(Trig_Boss_I_Throw_Func010Func001Func001Func001Func001C())then
                        call AddSpecialEffectLocBJ(udg_Boss_Ability_Point, "war3mapImported\\BloodEX-Special-2.mdx")
                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                        set udg_UnitGroup = GetUnitsInRangeOfLocAll(400.00, udg_Boss_Ability_Point)
                        call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Boss_Ability_Point, bj_UNIT_FACING)
                        call UnitAddAbilityBJ(0x41303132, GetLastCreatedUnit())
                        call SetUnitAbilityLevelSwapped(0x41303132, GetLastCreatedUnit(), 1)
                        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
                        call ForGroupBJ(udg_UnitGroup, function Trig_Boss_I_Throw_Func010Func001Func001Func001Func001Func008A)
                        call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Boss_Ability_Point, bj_UNIT_FACING)
                        call UnitAddAbilityBJ(0x41303132, GetLastCreatedUnit())
                        call SetUnitAbilityLevelSwapped(0x41303132, GetLastCreatedUnit(), 1)
                        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
                        call ForGroupBJ(udg_UnitGroup, function Trig_Boss_I_Throw_Func010Func001Func001Func001Func001Func013A)
                        call DestroyGroup(udg_UnitGroup)
                    else
                    endif
                endif
            endif
        endif
    endif
    call RemoveLocation(udg_Boss_Ability_Point)
    call RemoveLocation(udg_Point)
endfunction
function InitTrig_Boss_I_Throw takes nothing returns nothing
    set gg_trg_Boss_I_Throw = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Boss_I_Throw, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Boss_I_Throw, Condition(function Trig_Boss_I_Throw_Conditions))
    call TriggerAddAction(gg_trg_Boss_I_Throw, function Trig_Boss_I_Throw_Actions)
endfunction
function Trig_Boss_II_Throw_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303130))then
        return false
    endif
    return true
endfunction
function Trig_Boss_II_Throw_Func011Func001C takes nothing returns boolean
    if(not(GetEnumUnit() == udg_Arct))then
        return false
    endif
    return true
endfunction
function Trig_Boss_II_Throw_Func011A takes nothing returns nothing
    if(Trig_Boss_II_Throw_Func011Func001C())then
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "firebolt", udg_Arct)
        call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 1.50, "ReplaceableTextures\\CameraMasks\\HazeAndFogFilter_Mask.blp", 0.00, 70.00, 100.00, 0.00)
    else
    endif
endfunction
function Trig_Boss_II_Throw_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetTriggerUnit())
    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
    call UnitAddAbilityBJ(0x41303550, GetLastCreatedUnit())
    call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "clusterrockets", udg_Boss_Ability_Point)
    call TriggerSleepAction(0.60)
    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Boss_Ability_Point, bj_UNIT_FACING)
    call UnitAddAbilityBJ(0x41303552, GetLastCreatedUnit())
    call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
    set udg_UnitGroup = GetUnitsInRangeOfLocAll(220.00, udg_Boss_Ability_Point)
    call ForGroupBJ(udg_UnitGroup, function Trig_Boss_II_Throw_Func011A)
    call GroupClear(udg_UnitGroup)
    call DestroyGroup(udg_UnitGroup)
    call RemoveLocation(udg_Boss_Ability_Point)
endfunction
function InitTrig_Boss_II_Throw takes nothing returns nothing
    set gg_trg_Boss_II_Throw = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Boss_II_Throw, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Boss_II_Throw, Condition(function Trig_Boss_II_Throw_Conditions))
    call TriggerAddAction(gg_trg_Boss_II_Throw, function Trig_Boss_II_Throw_Actions)
endfunction
function Trig_Boss_II_Phase_2_Init_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(udg_EM_BossUnit) == 0x6E303047))then
        return false
    endif
    if(not(GetUnitLifePercent(udg_EM_BossUnit) < 50.00))then
        return false
    endif
    return true
endfunction
function Trig_Boss_II_Phase_2_Init_Actions takes nothing returns nothing
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Изуродов Отец", gg_snd_HPitLordYesAttack2, "Час Хаоса!", bj_TIMETYPE_ADD, 0, false)
    call UnitAddAbilityBJ(0x41303553, GetTriggerUnit())
    call UnitRemoveAbilityBJ(0x4130354F, GetTriggerUnit())
    call EnableTrigger(gg_trg_Boss_II_Channel_Init)
    call DisableTrigger(gg_trg_Boss_Creep_Spawn)
    call DisableTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Boss_II_Phase_2_Init takes nothing returns nothing
    set gg_trg_Boss_II_Phase_2_Init = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_II_Phase_2_Init)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_II_Phase_2_Init, 1.00)
    call TriggerAddCondition(gg_trg_Boss_II_Phase_2_Init, Condition(function Trig_Boss_II_Phase_2_Init_Conditions))
    call TriggerAddAction(gg_trg_Boss_II_Phase_2_Init, function Trig_Boss_II_Phase_2_Init_Actions)
endfunction
function Trig_Boss_II_Channel_Init_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(udg_EM_BossUnit) == 0x6E303047))then
        return false
    endif
    return true
endfunction
function Trig_Boss_II_Channel_Init_Func004C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Boss_II_Channel_Init_Actions takes nothing returns nothing
    call EnableTrigger(gg_trg_Boss_II_Channel_Periodic)
    call StartTimerBJ(udg_Boss2Timer, false, 5.00)
    if(Trig_Boss_II_Channel_Init_Func004C())then
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Изуродов Отец", gg_snd_PitLordYesAttack1, "*читает заклинание*", bj_TIMETYPE_ADD, 0, false)
    else
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Изуродов Отец", gg_snd_PitLordWhat1, "*читает заклинание*", bj_TIMETYPE_ADD, 0, false)
    endif
endfunction
function InitTrig_Boss_II_Channel_Init takes nothing returns nothing
    set gg_trg_Boss_II_Channel_Init = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_II_Channel_Init)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_II_Channel_Init, 10.00)
    call TriggerAddCondition(gg_trg_Boss_II_Channel_Init, Condition(function Trig_Boss_II_Channel_Init_Conditions))
    call TriggerAddAction(gg_trg_Boss_II_Channel_Init, function Trig_Boss_II_Channel_Init_Actions)
endfunction
function Trig_Boss_II_Channel_Periodic_Actions takes nothing returns nothing
    set udg_Point = GetRectCenter(gg_rct_Boss_2_Zone)
    set udg_Point2 = PolarProjectionBJ(udg_Point, 700.00, GetRandomDirectionDeg())
    call CreateNUnitsAtLoc(1, 0x68303134, Player(11), udg_Point2, bj_UNIT_FACING)
    call SetUnitUserData(GetLastCreatedUnit(), 22)
    call UnitAddAbilityBJ(0x4130354B, GetLastCreatedUnit())
    call UnitApplyTimedLifeBJ(5.00, 0x42544C46, GetLastCreatedUnit())
    call RemoveLocation(udg_Point)
    call RemoveLocation(udg_Point2)
    set udg_Point = GetUnitLoc(udg_Arct)
    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "carrionswarm", udg_Point)
    call RemoveLocation(udg_Point)
endfunction
function InitTrig_Boss_II_Channel_Periodic takes nothing returns nothing
    set gg_trg_Boss_II_Channel_Periodic = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_II_Channel_Periodic)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_II_Channel_Periodic, 0.50)
    call TriggerAddAction(gg_trg_Boss_II_Channel_Periodic, function Trig_Boss_II_Channel_Periodic_Actions)
endfunction
function Trig_Boss_II_Channel_Timer_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Boss_II_Channel_Periodic)
endfunction
function InitTrig_Boss_II_Channel_Timer takes nothing returns nothing
    set gg_trg_Boss_II_Channel_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Boss_II_Channel_Timer, udg_Boss2Timer)
    call TriggerAddAction(gg_trg_Boss_II_Channel_Timer, function Trig_Boss_II_Channel_Timer_Actions)
endfunction
function Trig_Boss_III_Creep_Spawn_Func003Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Creep_Spawn_Func003C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Creep_Spawn_Actions takes nothing returns nothing
    set udg_RandomNumber = GetRandomInt(1, 3)
    set udg_CustomValues = (udg_CustomValues + 1)
    if(Trig_Boss_III_Creep_Spawn_Func003C())then
        set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Left)
    else
        if(Trig_Boss_III_Creep_Spawn_Func003Func002C())then
            set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Center)
        else
            set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Right)
        endif
    endif
    call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 4)], Player(11), udg_CO_Point, bj_UNIT_FACING)
    call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", udg_Arct)
    call SetUnitUserData(GetLastCreatedUnit(), udg_CustomValues)
    call AddSpecialEffectLocBJ(udg_CO_Point, "war3mapImported\\Holy_Heal_Small.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call RemoveLocation(udg_CO_Point)
endfunction
function InitTrig_Boss_III_Creep_Spawn takes nothing returns nothing
    set gg_trg_Boss_III_Creep_Spawn = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Creep_Spawn)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_III_Creep_Spawn, 6.00)
    call TriggerAddAction(gg_trg_Boss_III_Creep_Spawn, function Trig_Boss_III_Creep_Spawn_Actions)
endfunction
function Trig_Boss_III_Portal_Spawn_Func001Func002Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Portal_Spawn_Func001Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Portal_Spawn_Func001C takes nothing returns boolean
    if(not(udg_Boss3PortalCounter == 0))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Portal_Spawn_Actions takes nothing returns nothing
    if(Trig_Boss_III_Portal_Spawn_Func001C())then
        set udg_RandomNumber = GetRandomInt(1, 3)
        if(Trig_Boss_III_Portal_Spawn_Func001Func002C())then
            set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Left)
        else
            if(Trig_Boss_III_Portal_Spawn_Func001Func002Func002C())then
                set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Center)
            else
                set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Right)
            endif
        endif
        call CreateNUnitsAtLoc(1, 0x6E303048, Player(PLAYER_NEUTRAL_PASSIVE), udg_CO_Point, bj_UNIT_FACING)
        set udg_Boss3PortalCounter = (udg_Boss3PortalCounter + 1)
        call AddSpecialEffectLocBJ(udg_CO_Point, "war3mapImported\\Holy_Heal_Small.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 4)], Player(11), udg_CO_Point, bj_UNIT_FACING)
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", udg_Arct)
        call SetUnitUserData(GetLastCreatedUnit(), udg_CustomValues)
        call RemoveLocation(udg_CO_Point)
    else
    endif
endfunction
function InitTrig_Boss_III_Portal_Spawn takes nothing returns nothing
    set gg_trg_Boss_III_Portal_Spawn = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Portal_Spawn)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_III_Portal_Spawn, 15.00)
    call TriggerAddAction(gg_trg_Boss_III_Portal_Spawn, function Trig_Boss_III_Portal_Spawn_Actions)
endfunction
function Trig_Boss_III_Portal_Use_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303048))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Portal_Use_Func003C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_Point, udg_Point2) < 400.00))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Portal_Use_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetTriggerUnit())
    set udg_Point2 = GetUnitLoc(GetOrderTargetUnit())
    if(Trig_Boss_III_Portal_Use_Func003C())then
        set udg_Boss3Portal = GetOrderTargetUnit()
        call StartTimerBJ(udg_Boss3Timer, false, 2.00)
        call UnitAddAbilityBJ(0x41303631, gg_unit_H000_0004)
        call IssueImmediateOrderBJ(gg_unit_H000_0004, "tranquility")
        call SetUnitFacingToFaceUnitTimed(udg_Arct, GetOrderTargetUnit(), 0)
        call StartTimerBJ(udg_Boss3TimerOrder, false, 0.01)
        call EnableTrigger(gg_trg_Boss_III_Portal_Timer)
        call DestroyLightningBJ(udg_Boss3PortalEffect)
        call AddLightningLoc("HWSB", udg_Point, udg_Point2)
        set udg_Boss3PortalEffect = GetLastCreatedLightningBJ()
    else
        call IssuePointOrderLocBJ(udg_Arct, "move", udg_Point2)
        call CreateTextTagUnitBJ("Поближе бы...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.50)
    endif
    call RemoveLocation(udg_Point)
    call RemoveLocation(udg_Point2)
endfunction
function InitTrig_Boss_III_Portal_Use takes nothing returns nothing
    set gg_trg_Boss_III_Portal_Use = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Portal_Use)
    call TriggerRegisterUnitEvent(gg_trg_Boss_III_Portal_Use, gg_unit_H000_0004, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Boss_III_Portal_Use, Condition(function Trig_Boss_III_Portal_Use_Conditions))
    call TriggerAddAction(gg_trg_Boss_III_Portal_Use, function Trig_Boss_III_Portal_Use_Actions)
endfunction
function Trig_Boss_III_Portal_Abort_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ(0x41303631, gg_unit_H000_0004)
    call DestroyLightningBJ(udg_Boss3PortalEffect)
    call DisableTrigger(gg_trg_Boss_III_Portal_Timer)
    call DisableTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Boss_III_Portal_Abort takes nothing returns nothing
    set gg_trg_Boss_III_Portal_Abort = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Portal_Abort)
    call TriggerRegisterUnitEvent(gg_trg_Boss_III_Portal_Abort, gg_unit_H000_0004, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerRegisterUnitEvent(gg_trg_Boss_III_Portal_Abort, gg_unit_H000_0004, EVENT_UNIT_ISSUED_POINT_ORDER)
    call TriggerRegisterUnitEvent(gg_trg_Boss_III_Portal_Abort, gg_unit_H000_0004, EVENT_UNIT_ISSUED_ORDER)
    call TriggerAddAction(gg_trg_Boss_III_Portal_Abort, function Trig_Boss_III_Portal_Abort_Actions)
endfunction
function Trig_Boss_III_Portal_Timer_Func012Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 7))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Portal_Timer_Func012Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 6))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Portal_Timer_Func012Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 5))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Portal_Timer_Func012Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Portal_Timer_Func012Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Portal_Timer_Func012Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Portal_Timer_Func012C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Portal_Timer_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(udg_Boss3Portal)
    call CreateNUnitsAtLoc(1, 0x4830314A, Player(1), udg_Point, bj_UNIT_FACING)
    call UnitAddAbilityBJ(0x41303345, GetLastCreatedUnit())
    call SetUnitVertexColorBJ(GetLastCreatedUnit(), 100, 100, 100, 40.00)
    call SetHeroLevelBJ(GetLastCreatedUnit(), GetHeroLevel(udg_Arct), false)
    call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", udg_EM_BossUnit)
    call UnitRemoveAbilityBJ(0x41303631, gg_unit_H000_0004)
    call RemoveUnit(udg_Boss3Portal)
    set udg_Boss3PortalCounter = (udg_Boss3PortalCounter - 1)
    call DestroyLightningBJ(udg_Boss3PortalEffect)
    set udg_RandomNumber = GetRandomInt(1, 10)
    if(Trig_Boss_III_Portal_Timer_Func012C())then
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_TyrandeWarcry1, "Стражи, к бою!", bj_TIMETYPE_ADD, 0, false)
    else
        if(Trig_Boss_III_Portal_Timer_Func012Func001C())then
            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_TyrandePissed1, "Вечная жизнь - вечная служба.", bj_TIMETYPE_ADD, 0, false)
        else
            if(Trig_Boss_III_Portal_Timer_Func012Func001Func001C())then
                call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_TyrandePissed4, "Анутерадор-мали!", bj_TIMETYPE_ADD, 0, false)
            else
                if(Trig_Boss_III_Portal_Timer_Func012Func001Func001Func001C())then
                    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_TyrandeYes4, "Без промедления!", bj_TIMETYPE_ADD, 0, false)
                else
                    if(Trig_Boss_III_Portal_Timer_Func012Func001Func001Func001Func001C())then
                        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_ArcherYesAttack4, "Пощады не будет!", bj_TIMETYPE_ADD, 0, false)
                    else
                        if(Trig_Boss_III_Portal_Timer_Func012Func001Func001Func001Func001Func001C())then
                            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_HeroWardenYesAttack2, "Да свершится правосудие!", bj_TIMETYPE_ADD, 0, false)
                        else
                            if(Trig_Boss_III_Portal_Timer_Func012Func001Func001Func001Func001Func001Func001C())then
                                call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetLastCreatedUnit(), GetUnitName(GetLastCreatedUnit()), gg_snd_HeroWardenYesAttack1, "Исполняю приговор!", bj_TIMETYPE_ADD, 0, false)
                            else
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
    call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
    call RemoveLocation(udg_Point)
    call UnitAddAbilityBJ(0x41303545, GetLastCreatedUnit())
    call UnitApplyTimedLifeBJ(1.50, 0x42544C46, GetLastCreatedUnit())
    set udg_Point = GetUnitLoc(udg_EM_BossUnit)
    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "clusterrockets", udg_Point)
    call RemoveLocation(udg_Point)
endfunction
function InitTrig_Boss_III_Portal_Timer takes nothing returns nothing
    set gg_trg_Boss_III_Portal_Timer = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Portal_Timer)
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Boss_III_Portal_Timer, udg_Boss3Timer)
    call TriggerAddAction(gg_trg_Boss_III_Portal_Timer, function Trig_Boss_III_Portal_Timer_Actions)
endfunction
function Trig_Boss_III_Portal_Damage_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303545))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303039))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Portal_Damage_Actions takes nothing returns nothing
    call TriggerSleepAction(0.70)
    set udg_AbilityPower = (100.00 * I2R(udg_Difficulty))
    call UnitDamageTargetBJ(udg_Arct, udg_EM_BossUnit, udg_AbilityPower, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
endfunction
function InitTrig_Boss_III_Portal_Damage takes nothing returns nothing
    set gg_trg_Boss_III_Portal_Damage = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Boss_III_Portal_Damage, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Boss_III_Portal_Damage, Condition(function Trig_Boss_III_Portal_Damage_Conditions))
    call TriggerAddAction(gg_trg_Boss_III_Portal_Damage, function Trig_Boss_III_Portal_Damage_Actions)
endfunction
function Trig_Boss_III_Attacks_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(GetAttacker()) == 0x6E303038))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Attacks_Func007Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Attacks_Func007C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Attacks_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetAttacker())
    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
    call UnitAddAbilityBJ(0x41303634, GetLastCreatedUnit())
    call RemoveLocation(udg_Point)
    call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
    set udg_RandomNumber = GetRandomInt(1, 3)
    if(Trig_Boss_III_Attacks_Func007C())then
        set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Left)
    else
        if(Trig_Boss_III_Attacks_Func007Func002C())then
            set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Center)
        else
            set udg_CO_Point = GetRandomLocInRect(gg_rct_Boss_3_Area_Right)
        endif
    endif
    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "clusterrockets", udg_CO_Point)
    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_CO_Point, bj_UNIT_FACING)
    call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
    call UnitAddAbilityBJ(0x41303635, GetLastCreatedUnit())
    call IssueImmediateOrderBJ(GetLastCreatedUnit(), "stomp")
    call RemoveLocation(udg_CO_Point)
endfunction
function InitTrig_Boss_III_Attacks takes nothing returns nothing
    set gg_trg_Boss_III_Attacks = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Boss_III_Attacks, EVENT_PLAYER_UNIT_ATTACKED)
    call TriggerAddCondition(gg_trg_Boss_III_Attacks, Condition(function Trig_Boss_III_Attacks_Conditions))
    call TriggerAddAction(gg_trg_Boss_III_Attacks, function Trig_Boss_III_Attacks_Actions)
endfunction
function Trig_Boss_III_Puke_Rain_Init_Actions takes nothing returns nothing
    set udg_Boss3Pukes = 0
    call EnableTrigger(gg_trg_Boss_III_Puke_Rain)
endfunction
function InitTrig_Boss_III_Puke_Rain_Init takes nothing returns nothing
    set gg_trg_Boss_III_Puke_Rain_Init = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Puke_Rain_Init)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_III_Puke_Rain_Init, 20.00)
    call TriggerAddAction(gg_trg_Boss_III_Puke_Rain_Init, function Trig_Boss_III_Puke_Rain_Init_Actions)
endfunction
function Trig_Boss_III_Phase_2_Init_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(udg_EM_BossUnit) == 0x6E303038))then
        return false
    endif
    if(not(GetUnitLifePercent(udg_EM_BossUnit) < 50.00))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Phase_2_Init_Actions takes nothing returns nothing
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Бледная Королева", gg_snd_AbominationYesAttack2, "Убью!", bj_TIMETYPE_ADD, 0, false)
    set udg_Boss3Pukes = 0
    call EnableTrigger(gg_trg_Boss_III_Phase_3_Init)
    call EnableTrigger(gg_trg_Boss_III_Puke_Rain)
    call DisableTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Boss_III_Phase_2_Init takes nothing returns nothing
    set gg_trg_Boss_III_Phase_2_Init = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Phase_2_Init)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_III_Phase_2_Init, 1.00)
    call TriggerAddCondition(gg_trg_Boss_III_Phase_2_Init, Condition(function Trig_Boss_III_Phase_2_Init_Conditions))
    call TriggerAddAction(gg_trg_Boss_III_Phase_2_Init, function Trig_Boss_III_Phase_2_Init_Actions)
endfunction
function Trig_Boss_III_Phase_3_Init_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(udg_EM_BossUnit) == 0x6E303038))then
        return false
    endif
    if(not(GetUnitLifePercent(udg_EM_BossUnit) < 25.00))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Phase_3_Init_Actions takes nothing returns nothing
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Бледная Королева", gg_snd_AbominationYesAttack1, "Смерть!", bj_TIMETYPE_ADD, 0, false)
    call UnitAddAbilityBJ(0x41303553, GetTriggerUnit())
    call DisableTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Boss_III_Phase_3_Init takes nothing returns nothing
    set gg_trg_Boss_III_Phase_3_Init = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Phase_3_Init)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_III_Phase_3_Init, 1.00)
    call TriggerAddCondition(gg_trg_Boss_III_Phase_3_Init, Condition(function Trig_Boss_III_Phase_3_Init_Conditions))
    call TriggerAddAction(gg_trg_Boss_III_Phase_3_Init, function Trig_Boss_III_Phase_3_Init_Actions)
endfunction
function Trig_Boss_III_Puke_Rain_Func001Func011Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Puke_Rain_Func001Func011C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Puke_Rain_Func001C takes nothing returns boolean
    if(not(udg_Boss3Pukes < 20))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Puke_Rain_Actions takes nothing returns nothing
    if(Trig_Boss_III_Puke_Rain_Func001C())then
        set udg_Boss3Pukes = (udg_Boss3Pukes + 1)
        set udg_Point = GetRectCenter(gg_rct_Boss_3_Spawn)
        call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
        call SetUnitUserData(GetLastCreatedUnit(), 33)
        call UnitAddAbilityBJ(0x4130354B, GetLastCreatedUnit())
        call UnitApplyTimedLifeBJ(3.00, 0x42544C46, GetLastCreatedUnit())
        set udg_RandomNumber = GetRandomInt(1, 3)
        if(Trig_Boss_III_Puke_Rain_Func001Func011C())then
            set udg_Point2 = GetRandomLocInRect(gg_rct_Boss_3_Area_Left)
        else
            if(Trig_Boss_III_Puke_Rain_Func001Func011Func001C())then
                set udg_Point2 = GetRandomLocInRect(gg_rct_Boss_3_Area_Center)
            else
                set udg_Point2 = GetRandomLocInRect(gg_rct_Boss_3_Area_Right)
            endif
        endif
        call IssuePointOrderLocBJ(GetLastCreatedUnit(), "carrionswarm", udg_Point2)
        call RemoveLocation(udg_Point)
        call RemoveLocation(udg_Point2)
    else
        call EnableTrigger(gg_trg_Boss_III_Puke_Rain_Init)
        set udg_Boss3Pukes = 0
        call DisableTrigger(GetTriggeringTrigger())
    endif
endfunction
function InitTrig_Boss_III_Puke_Rain takes nothing returns nothing
    set gg_trg_Boss_III_Puke_Rain = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Puke_Rain)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_III_Puke_Rain, 0.30)
    call TriggerAddAction(gg_trg_Boss_III_Puke_Rain, function Trig_Boss_III_Puke_Rain_Actions)
endfunction
function Trig_Boss_III_Explode_Damage_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303635))then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Explode_Damage_Func002Func001Func001C takes nothing returns boolean
    if((GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return true
    endif
    if((GetOwningPlayer(GetEnumUnit()) == Player(1)))then
        return true
    endif
    if((GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return true
    endif
    return false
endfunction
function Trig_Boss_III_Explode_Damage_Func002Func001C takes nothing returns boolean
    if(not Trig_Boss_III_Explode_Damage_Func002Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Boss_III_Explode_Damage_Func002A takes nothing returns nothing
    if(Trig_Boss_III_Explode_Damage_Func002Func001C())then
        set udg_AbilityPower = (100.00 * I2R(udg_Difficulty))
        call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
    else
    endif
endfunction
function Trig_Boss_III_Explode_Damage_Actions takes nothing returns nothing
    set udg_UnitGroup = GetUnitsInRangeOfLocAll(150.00, GetUnitLoc(GetTriggerUnit()))
    call ForGroupBJ(udg_UnitGroup, function Trig_Boss_III_Explode_Damage_Func002A)
    call DestroyGroup(udg_UnitGroup)
endfunction
function InitTrig_Boss_III_Explode_Damage takes nothing returns nothing
    set gg_trg_Boss_III_Explode_Damage = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Boss_III_Explode_Damage, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Boss_III_Explode_Damage, Condition(function Trig_Boss_III_Explode_Damage_Conditions))
    call TriggerAddAction(gg_trg_Boss_III_Explode_Damage, function Trig_Boss_III_Explode_Damage_Actions)
endfunction
function Trig_Boss_III_Portal_Timer_Order_Actions takes nothing returns nothing
    call EnableTrigger(gg_trg_Boss_III_Portal_Abort)
endfunction
function InitTrig_Boss_III_Portal_Timer_Order takes nothing returns nothing
    set gg_trg_Boss_III_Portal_Timer_Order = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Boss_III_Portal_Timer_Order, udg_Boss3TimerOrder)
    call TriggerAddAction(gg_trg_Boss_III_Portal_Timer_Order, function Trig_Boss_III_Portal_Timer_Order_Actions)
endfunction
function Trig_Meditation_Cast_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303147))then
        return false
    endif
    return true
endfunction
function Trig_Meditation_Cast_Func001Func002C takes nothing returns boolean
    if(not(IsTriggerEnabled(gg_trg_Combo_Ability_Use) == false))then
        return false
    endif
    return true
endfunction
function Trig_Meditation_Cast_Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) == 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Meditation_Cast_Actions takes nothing returns nothing
    if(Trig_Meditation_Cast_Func001C())then
        call CreateTextTagUnitBJ("Нет сил...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.50)
    else
        set udg_MeditationPower = GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)
        if(Trig_Meditation_Cast_Func001Func002C())then
            set udg_MeditationLogic = true
            call AddUnitAnimationPropertiesBJ(true, "gold", gg_unit_H000_0004)
            call SetUnitMoveSpeed(GetTriggerUnit(), 0.00)
            call SetUnitTurnSpeedBJ(GetTriggerUnit(), 0.00)
            call AddSpecialEffectTargetUnitBJ("origin", GetTriggerUnit(), "Abilities\\Spells\\NightElf\\Tranquility\\TranquilityTarget.mdl")
            set udg_MeditationEffect = GetLastCreatedEffectBJ()
            set udg_SprintLogic = false
            call DisableTrigger(gg_trg_Sprint_Energy)
            call EnableTrigger(gg_trg_Meditation_Heal)
            call EnableTrigger(gg_trg_Meditation_Turn_Off)
            call SetPlayerAbilityAvailableBJ(false, 0x41303555, Player(0))
            call SetPlayerAbilityAvailableBJ(false, 0x41303147, Player(0))
            call DisableTrigger(gg_trg_Camera_Hero)
            call DisableTrigger(gg_trg_Camera_Angle_Increase)
            call DisableTrigger(gg_trg_Camera_Angle_Decrease)
            call DisableTrigger(gg_trg_Camera_Increase)
            call DisableTrigger(gg_trg_Camera_Decrease)
            set udg_Point = GetUnitLoc(udg_Arct)
            call PanCameraToTimedLocForPlayer(Player(0), udg_Point, 0)
            call RemoveLocation(udg_Point)
        else
            call CreateTextTagUnitBJ("Я в бою!", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
            call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
            call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
            call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
            call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.50)
        endif
    endif
endfunction
function InitTrig_Meditation_Cast takes nothing returns nothing
    set gg_trg_Meditation_Cast = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Meditation_Cast, gg_unit_H000_0004, EVENT_UNIT_SPELL_CHANNEL)
    call TriggerAddCondition(gg_trg_Meditation_Cast, Condition(function Trig_Meditation_Cast_Conditions))
    call TriggerAddAction(gg_trg_Meditation_Cast, function Trig_Meditation_Cast_Actions)
endfunction
function Trig_Meditation_Turn_Off_Actions takes nothing returns nothing
    set udg_MeditationLogic = false
    call AddUnitAnimationPropertiesBJ(false, "gold", gg_unit_H000_0004)
    call SetUnitMoveSpeed(GetTriggerUnit(), GetUnitDefaultMoveSpeed(GetTriggerUnit()))
    call SetUnitTurnSpeedBJ(GetTriggerUnit(), 1.00)
    call DestroyEffectBJ(udg_MeditationEffect)
    call DisableTrigger(gg_trg_Meditation_Heal)
    call SetPlayerAbilityAvailableBJ(true, 0x41303555, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303147, Player(0))
    call EnableTrigger(gg_trg_Camera_Hero)
    call EnableTrigger(gg_trg_Camera_Angle_Increase)
    call EnableTrigger(gg_trg_Camera_Angle_Decrease)
    call EnableTrigger(gg_trg_Camera_Increase)
    call EnableTrigger(gg_trg_Camera_Decrease)
    call DisableTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Meditation_Turn_Off takes nothing returns nothing
    set gg_trg_Meditation_Turn_Off = CreateTrigger()
    call DisableTrigger(gg_trg_Meditation_Turn_Off)
    call TriggerRegisterUnitEvent(gg_trg_Meditation_Turn_Off, gg_unit_H000_0004, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerRegisterUnitEvent(gg_trg_Meditation_Turn_Off, gg_unit_H000_0004, EVENT_UNIT_ISSUED_POINT_ORDER)
    call TriggerAddAction(gg_trg_Meditation_Turn_Off, function Trig_Meditation_Turn_Off_Actions)
endfunction
function Trig_Meditation_Heal_Func001Func001Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) <= GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))then
        return false
    endif
    return true
endfunction
function Trig_Meditation_Heal_Func001Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) != GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_Arct)))then
        return false
    endif
    return true
endfunction
function Trig_Meditation_Heal_Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Meditation_Heal_Actions takes nothing returns nothing
    if(Trig_Meditation_Heal_Func001C())then
        if(Trig_Meditation_Heal_Func001Func001C())then
            if(Trig_Meditation_Heal_Func001Func001Func001C())then
                call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + (I2R(udg_MeditationPower) * 3.00)))
                call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "war3mapImported\\Holy_Heal.mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                call CreateTextTagUnitBJ(("+" + I2S((udg_MeditationPower * 3))), udg_Arct, 0, 8.00, 0.00, 100.00, 0.00, 0)
                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.50)
            else
                call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + I2R(udg_MeditationPower)))
                call CreateTextTagUnitBJ(("+" + I2S(udg_MeditationPower)), udg_Arct, 0, 8.00, 0.00, 100.00, 0.00, 0)
                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.50)
            endif
            call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - 1.50))
        else
        endif
    else
        set udg_MeditationLogic = false
        call AddUnitAnimationPropertiesBJ(false, "gold", gg_unit_H000_0004)
        call SetUnitMoveSpeed(gg_unit_H000_0004, GetUnitDefaultMoveSpeed(gg_unit_H000_0004))
        call SetUnitTurnSpeedBJ(gg_unit_H000_0004, 1.00)
        call DestroyEffectBJ(udg_MeditationEffect)
        call SetPlayerAbilityAvailableBJ(true, 0x41303555, Player(0))
        call SetPlayerAbilityAvailableBJ(true, 0x41303147, Player(0))
        call EnableTrigger(gg_trg_Camera_Hero)
        call EnableTrigger(gg_trg_Camera_Angle_Increase)
        call EnableTrigger(gg_trg_Camera_Angle_Decrease)
        call EnableTrigger(gg_trg_Camera_Increase)
        call EnableTrigger(gg_trg_Camera_Decrease)
        call DisableTrigger(GetTriggeringTrigger())
    endif
endfunction
function InitTrig_Meditation_Heal takes nothing returns nothing
    set gg_trg_Meditation_Heal = CreateTrigger()
    call DisableTrigger(gg_trg_Meditation_Heal)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Meditation_Heal, 1.00)
    call TriggerAddAction(gg_trg_Meditation_Heal, function Trig_Meditation_Heal_Actions)
endfunction
function Trig_Sprint_Cast_Func001C takes nothing returns boolean
    if((GetIssuedOrderIdBJ() == String2OrderIdBJ("manashieldon")))then
        return true
    endif
    if((GetIssuedOrderIdBJ() == String2OrderIdBJ("manashieldoff")))then
        return true
    endif
    return false
endfunction
function Trig_Sprint_Cast_Conditions takes nothing returns boolean
    if(not Trig_Sprint_Cast_Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Sprint_Cast_Func002Func001Func001Func005C takes nothing returns boolean
    if(not(udg_ART[19] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Sprint_Cast_Func002Func001Func001C takes nothing returns boolean
    if(not(GetIssuedOrderIdBJ() == String2OrderIdBJ("manashieldoff")))then
        return false
    endif
    return true
endfunction
function Trig_Sprint_Cast_Func002Func001Func006C takes nothing returns boolean
    if(not(udg_ART[19] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Sprint_Cast_Func002Func001C takes nothing returns boolean
    if(not(GetIssuedOrderIdBJ() == String2OrderIdBJ("manashieldon")))then
        return false
    endif
    return true
endfunction
function Trig_Sprint_Cast_Func002C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, GetTriggerUnit()) == 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Sprint_Cast_Actions takes nothing returns nothing
    if(Trig_Sprint_Cast_Func002C())then
        call CreateTextTagUnitBJ("Нет сил...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.50)
        call StartTimerBJ(udg_SprintTimer, false, 0.00)
    else
        if(Trig_Sprint_Cast_Func002Func001C())then
            set udg_SprintLogic = true
            call SetUnitMoveSpeed(GetTriggerUnit(), (GetUnitMoveSpeed(GetTriggerUnit()) + 120.00))
            call EnableTrigger(gg_trg_Sprint_Energy)
            call SetPlayerAbilityAvailableBJ(false, 0x41303147, Player(0))
            if(Trig_Sprint_Cast_Func002Func001Func006C())then
                set udg_ChanceBlock = (udg_ChanceBlock + (3.00 * I2R(udg_ART[19])))
            else
            endif
        else
            if(Trig_Sprint_Cast_Func002Func001Func001C())then
                set udg_SprintLogic = false
                call SetUnitMoveSpeed(GetTriggerUnit(), GetUnitDefaultMoveSpeed(GetTriggerUnit()))
                call DisableTrigger(gg_trg_Sprint_Energy)
                call SetPlayerAbilityAvailableBJ(true, 0x41303147, Player(0))
                if(Trig_Sprint_Cast_Func002Func001Func001Func005C())then
                    set udg_ChanceBlock = (udg_ChanceBlock - (3.00 * I2R(udg_ART[19])))
                else
                endif
            else
            endif
        endif
    endif
endfunction
function InitTrig_Sprint_Cast takes nothing returns nothing
    set gg_trg_Sprint_Cast = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Sprint_Cast, gg_unit_H000_0004, EVENT_UNIT_ISSUED_ORDER)
    call TriggerAddCondition(gg_trg_Sprint_Cast, Condition(function Trig_Sprint_Cast_Conditions))
    call TriggerAddAction(gg_trg_Sprint_Cast, function Trig_Sprint_Cast_Actions)
endfunction
function Trig_Sprint_Timer_Actions takes nothing returns nothing
    call IssueImmediateOrderBJ(udg_Arct, "manashieldoff")
endfunction
function InitTrig_Sprint_Timer takes nothing returns nothing
    set gg_trg_Sprint_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Sprint_Timer, udg_SprintTimer)
    call TriggerAddAction(gg_trg_Sprint_Timer, function Trig_Sprint_Timer_Actions)
endfunction
function Trig_Sprint_Energy_Func001C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Sprint_Energy_Actions takes nothing returns nothing
    if(Trig_Sprint_Energy_Func001C())then
        call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - 2.00))
        call CreateTextTagUnitBJ(I2S(R2I(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct))), udg_Arct, 0, 10.00, 0.00, 80.00, 100.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.50)
    else
        set udg_SprintLogic = false
        call SetUnitMoveSpeed(udg_Arct, GetUnitDefaultMoveSpeed(udg_Arct))
        call IssueImmediateOrderBJ(udg_Arct, "manashieldoff")
        call DisableTrigger(GetTriggeringTrigger())
    endif
endfunction
function InitTrig_Sprint_Energy takes nothing returns nothing
    set gg_trg_Sprint_Energy = CreateTrigger()
    call DisableTrigger(gg_trg_Sprint_Energy)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Sprint_Energy, 2.00)
    call TriggerAddAction(gg_trg_Sprint_Energy, function Trig_Sprint_Energy_Actions)
endfunction
function Trig_Abilities_Info_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303036))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func007C takes nothing returns boolean
    if(not(GetTriggerUnit() != gg_unit_h006_0035))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001Func002Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0067))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001Func002Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0073))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001Func002Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0069))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001Func002C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0071))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0080))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0078))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0076))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0082))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0079))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0077))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008Func001C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0075))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Func008C takes nothing returns boolean
    if(not(GetTriggerUnit() == gg_unit_h006_0081))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Info_Actions takes nothing returns nothing
    set udg_Target = GetTriggerUnit()
    call RemoveLocation(udg_TargetPoint)
    set udg_TargetPoint = GetUnitLoc(udg_Target)
    call ClearTextMessagesBJ(GetPlayersAll())
    if(Trig_Abilities_Info_Func007C())then
        call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, ("|cFFBFBFC2\"" + (udg_AS_Name[GetUnitUserData(udg_Target)] + "\"|r")))
        call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, ("Уровень/опыт: " + (I2S(udg_AS_AbilityLVL[GetUnitUserData(udg_Target)]) + ("/" + I2S(udg_AS_AbilityEXP[GetUnitUserData(udg_Target)])))))
    else
    endif
    if(Trig_Abilities_Info_Func008C())then
        call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Накладывает исцеление на 5/6/7/8/9/10 сек. и повышает броню на это время на 5/10/15/20/25 ед.")
    else
        if(Trig_Abilities_Info_Func008Func001C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Наносит урон всем вокруг и повышает шанс разгрома на 10% на 4/8/12/16/20 сек.")
        else
            if(Trig_Abilities_Info_Func008Func001Func001C())then
                call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Добавляет, помимо медитации и рывка, одноразовое умение невидимости, действующее 5/10/15/20/25 сек.")
            else
                if(Trig_Abilities_Info_Func008Func001Func001Func001C())then
                    call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Увеличивает скорость атаки на 50% на 3/6/9/12/15 сек. и добавляет вампиризм 30% к любому исходящему урону.")
                else
                    if(Trig_Abilities_Info_Func008Func001Func001Func001Func001C())then
                        call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Создаёт бесплотный призрак случайного монстра, сражающегося на стороне Аркта в течение 7/9/11/13/15 сек.")
                    else
                        if(Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001C())then
                            call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Пассивно периодически наносит урон случайному ближайшему противнику. При активации навыка следующие 1/2/3/4/5 ударов нанесут дополнительный урон.")
                        else
                            if(Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001C())then
                                call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Если запас энергии ниже 90%, то восстанавливает 3/4/5/6/7 ед., иначе происходит взрыв, наносящий урон в зависимости её количества.")
                            else
                                if(Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001C())then
                                    call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Запускает шар света: если приземлится на монстре - нанесет ему урон, если на Аркте - исцелит, после этого перепрыгивает на случайную цель ещё 3/4/5/6/7 раз.")
                                else
                                    if(Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001Func002C())then
                                        call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Создает в случайной точке недалеко от Аркта источник испепеляющего света на 2/4/6/8/10 сек., наносящего урон монстрам. Каждое третье применение повышает все хар-ки на 1 ед. (действует до конца выхода из подземелья).")
                                    else
                                        if(Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001Func002Func001C())then
                                            call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Бессрочно призывает духа помогающего в бою. Активация навыка когда дух уже призван - вызывает нову исходящую от духа, наносящую урон врагам и исцеляющую союзников. Сила духа растет с уровнем навыка.")
                                        else
                                            if(Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001Func002Func001Func001C())then
                                                call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Накладывает ледяной щит повышающий шанс блока на 20% на 4/8/12/16/20 сек. Во время этого любой блок нанесёт урон монстру и исцелит Аркта.")
                                            else
                                                if(Trig_Abilities_Info_Func008Func001Func001Func001Func001Func001Func001Func001Func002Func001Func001Func001C())then
                                                    call DisplayTimedTextToForce(GetPlayersAll(), 1000000000.00, "Создаёт под Арктом зону, находясь в которой его сила атаки возрастает на 20/40/60/80/100%, а враги ежесекундно получают урон.")
                                                else
                                                endif
                                            endif
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endfunction
function InitTrig_Abilities_Info takes nothing returns nothing
    set gg_trg_Abilities_Info = CreateTrigger()
    call TriggerRegisterPlayerSelectionEventBJ(gg_trg_Abilities_Info, Player(0), true)
    call TriggerAddCondition(gg_trg_Abilities_Info, Condition(function Trig_Abilities_Info_Conditions))
    call TriggerAddAction(gg_trg_Abilities_Info, function Trig_Abilities_Info_Actions)
endfunction
function Trig_Abilities_Study_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303241))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Study_Func001Func013Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h006_0067))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Study_Func001Func013Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h006_0073))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Study_Func001Func013Func001Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h006_0069))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Study_Func001Func013Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h006_0071))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Study_Func001Func013Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h006_0080))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Study_Func001Func013Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h006_0078))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Study_Func001Func013Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h006_0076))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Study_Func001Func013Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h006_0082))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Study_Func001Func013Func001Func001Func001C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h006_0079))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Study_Func001Func013Func001Func001C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h006_0077))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Study_Func001Func013Func001C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h006_0075))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Study_Func001Func013C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h006_0081))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Study_Func001C takes nothing returns boolean
    if(not(udg_AS_Points >= 300))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Study_Func002C takes nothing returns boolean
    if(not(udg_Tutorial[2] == true))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Study_Actions takes nothing returns nothing
    if(Trig_Abilities_Study_Func001C())then
        set udg_AS_Points = (udg_AS_Points - 300)
        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 1, ("Очки навыков: " + I2S(udg_AS_Points)))
        call AddSpecialEffectTargetUnitBJ("origin", GetTriggerUnit(), "SandTrap.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call UnitAddAbilityBJ(0x4130364A, udg_Target)
        call UnitAddAbilityBJ(0x4130364B, udg_Target)
        call UnitAddAbilityBJ(0x4130364C, udg_Target)
        call UnitAddAbilityBJ(0x4130364D, udg_Target)
        call UnitRemoveAbilityBJ(0x41303241, udg_Target)
        set udg_AS_AbilityStudied[GetUnitUserData(udg_Target)] = 1
        if(Trig_Abilities_Study_Func001Func013C())then
            call RemoveDestructable(gg_dest_B003_2936)
            call ShowDestructableBJ(true, gg_dest_B00B_1355)
        else
            if(Trig_Abilities_Study_Func001Func013Func001C())then
                call RemoveDestructable(gg_dest_B003_2937)
                call ShowDestructableBJ(true, gg_dest_B00B_1357)
            else
                if(Trig_Abilities_Study_Func001Func013Func001Func001C())then
                    call RemoveDestructable(gg_dest_B003_2939)
                    call ShowDestructableBJ(true, gg_dest_B00B_1354)
                else
                    if(Trig_Abilities_Study_Func001Func013Func001Func001Func001C())then
                        call RemoveDestructable(gg_dest_B003_2941)
                        call ShowDestructableBJ(true, gg_dest_B00B_1356)
                    else
                        if(Trig_Abilities_Study_Func001Func013Func001Func001Func001Func001C())then
                            call RemoveDestructable(gg_dest_B003_2935)
                            call ShowDestructableBJ(true, gg_dest_B00B_1366)
                        else
                            if(Trig_Abilities_Study_Func001Func013Func001Func001Func001Func001Func001C())then
                                call RemoveDestructable(gg_dest_B003_2938)
                                call ShowDestructableBJ(true, gg_dest_B00B_1367)
                            else
                                if(Trig_Abilities_Study_Func001Func013Func001Func001Func001Func001Func001Func001C())then
                                    call RemoveDestructable(gg_dest_B003_2940)
                                    call ShowDestructableBJ(true, gg_dest_B00B_1389)
                                else
                                    if(Trig_Abilities_Study_Func001Func013Func001Func001Func001Func001Func001Func001Func001C())then
                                        call RemoveDestructable(gg_dest_B003_2942)
                                        call ShowDestructableBJ(true, gg_dest_B00B_1390)
                                    else
                                        if(Trig_Abilities_Study_Func001Func013Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                            call RemoveDestructable(gg_dest_B003_2928)
                                            call ShowDestructableBJ(true, gg_dest_B00B_1359)
                                        else
                                            if(Trig_Abilities_Study_Func001Func013Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                call RemoveDestructable(gg_dest_B003_2929)
                                                call ShowDestructableBJ(true, gg_dest_B00B_1362)
                                            else
                                                if(Trig_Abilities_Study_Func001Func013Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                    call RemoveDestructable(gg_dest_B003_2932)
                                                    call ShowDestructableBJ(true, gg_dest_B00B_1361)
                                                else
                                                    if(Trig_Abilities_Study_Func001Func013Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                                        call RemoveDestructable(gg_dest_B003_2930)
                                                        call ShowDestructableBJ(true, gg_dest_B00B_1360)
                                                    else
                                                    endif
                                                endif
                                            endif
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    else
        call DisplayTimedTextToForce(GetPlayersAll(), 1.00, "Недостаточно очков умений (всего требуется 300 ед.).")
    endif
    if(Trig_Abilities_Study_Func002C())then
        set udg_Tutorial[2] = false
        set udg_Tutorial[3] = true
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_9F, "Советую выставить навык на 3 серию. Чем меньше серия - тем меньше кнопок подряд надо нажать и тем чаще Аркт будет применять его.", bj_TIMETYPE_ADD, 0.00, true)
    else
    endif
endfunction
function InitTrig_Abilities_Study takes nothing returns nothing
    set gg_trg_Abilities_Study = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Abilities_Study, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Abilities_Study, Condition(function Trig_Abilities_Study_Conditions))
    call TriggerAddAction(gg_trg_Abilities_Study, function Trig_Abilities_Study_Actions)
endfunction
function Trig_Abilities_Activate_Func005C takes nothing returns boolean
    if((GetSpellAbilityId() == 0x4130364A))then
        return true
    endif
    if((GetSpellAbilityId() == 0x4130364B))then
        return true
    endif
    if((GetSpellAbilityId() == 0x4130364C))then
        return true
    endif
    if((GetSpellAbilityId() == 0x4130364D))then
        return true
    endif
    return false
endfunction
function Trig_Abilities_Activate_Conditions takes nothing returns boolean
    if(not Trig_Abilities_Activate_Func005C())then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Activate_Func001Func002C takes nothing returns boolean
    if(not(udg_AS_Logic[1] == true))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Activate_Func001C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x4130364A))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Activate_Func002Func002C takes nothing returns boolean
    if(not(udg_AS_Logic[2] == true))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Activate_Func002C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x4130364B))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Activate_Func003Func001C takes nothing returns boolean
    if(not(udg_AS_Logic[3] == true))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Activate_Func003C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x4130364C))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Activate_Func004Func001C takes nothing returns boolean
    if(not(udg_AS_Logic[4] == true))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Activate_Func004C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x4130364D))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Activate_Actions takes nothing returns nothing
    if(Trig_Abilities_Activate_Func001C())then
        if(Trig_Abilities_Activate_Func001Func002C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Сначала необходимо деактивировать навык который уже присутствует на данной серии.")
        else
            call RemoveDestructable(udg_MagneticField[1])
            set udg_Point = GetUnitLoc(udg_Target)
            call CreateDestructableLoc(0x42303037, udg_Point, 0.00, 0.50, 0)
            call RemoveLocation(udg_Point)
            set udg_MagneticField[1] = GetLastCreatedDestructable()
            set udg_AS_Logic[1] = true
            set udg_AS_Value[GetUnitUserData(udg_Target)] = 1
            set udg_AS_SeriesNumber = 1
            set udg_AS_Effect[udg_AS_SeriesNumber] = GetUnitUserData(udg_Target)
            call CreateTextTagUnitBJ("3", udg_Target, 0, 15.00, 100, 100, 100, 0)
            set udg_AS_TextNumber[1] = GetLastCreatedTextTag()
            call ConditionalTriggerExecute(gg_trg_Abilities_Remove)
            call TriggerExecute(gg_trg_Abilities_Effect)
        endif
    else
    endif
    if(Trig_Abilities_Activate_Func002C())then
        if(Trig_Abilities_Activate_Func002Func002C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Сначала необходимо деактивировать навык который уже присутствует на данной серии.")
        else
            call RemoveDestructable(udg_MagneticField[2])
            set udg_Point = GetUnitLoc(udg_Target)
            call CreateDestructableLoc(0x42303037, udg_Point, 0.00, 0.50, 0)
            call RemoveLocation(udg_Point)
            set udg_MagneticField[2] = GetLastCreatedDestructable()
            set udg_AS_Logic[2] = true
            set udg_AS_Value[GetUnitUserData(udg_Target)] = 2
            set udg_AS_SeriesNumber = 2
            set udg_AS_Effect[udg_AS_SeriesNumber] = GetUnitUserData(udg_Target)
            call CreateTextTagUnitBJ("5", udg_Target, 0, 15.00, 100, 100, 100, 0)
            set udg_AS_TextNumber[2] = GetLastCreatedTextTag()
            call TriggerExecute(gg_trg_Abilities_Remove)
            call TriggerExecute(gg_trg_Abilities_Effect)
        endif
    else
    endif
    if(Trig_Abilities_Activate_Func003C())then
        if(Trig_Abilities_Activate_Func003Func001C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Сначала необходимо деактивировать навык который уже присутствует на данной серии.")
        else
            call RemoveDestructable(udg_MagneticField[3])
            set udg_Point = GetUnitLoc(udg_Target)
            call CreateDestructableLoc(0x42303037, udg_Point, 0.00, 0.50, 0)
            call RemoveLocation(udg_Point)
            set udg_MagneticField[3] = GetLastCreatedDestructable()
            set udg_AS_Logic[3] = true
            set udg_AS_Value[GetUnitUserData(udg_Target)] = 3
            set udg_AS_SeriesNumber = 3
            set udg_AS_Effect[udg_AS_SeriesNumber] = GetUnitUserData(udg_Target)
            call CreateTextTagUnitBJ("7", udg_Target, 0, 15.00, 100, 100, 100, 0)
            set udg_AS_TextNumber[3] = GetLastCreatedTextTag()
            call TriggerExecute(gg_trg_Abilities_Remove)
            call TriggerExecute(gg_trg_Abilities_Effect)
        endif
    else
    endif
    if(Trig_Abilities_Activate_Func004C())then
        if(Trig_Abilities_Activate_Func004Func001C())then
            call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Сначала необходимо деактивировать навык который уже присутствует на данной серии.")
        else
            call RemoveDestructable(udg_MagneticField[4])
            set udg_Point = GetUnitLoc(udg_Target)
            call CreateDestructableLoc(0x42303037, udg_Point, 0.00, 0.50, 0)
            call RemoveLocation(udg_Point)
            set udg_MagneticField[4] = GetLastCreatedDestructable()
            set udg_AS_Logic[4] = true
            set udg_AS_Value[GetUnitUserData(udg_Target)] = 4
            set udg_AS_SeriesNumber = 4
            set udg_AS_Effect[udg_AS_SeriesNumber] = GetUnitUserData(udg_Target)
            call CreateTextTagUnitBJ("9", udg_Target, 0, 15.00, 100, 100, 100, 0)
            set udg_AS_TextNumber[4] = GetLastCreatedTextTag()
            call TriggerExecute(gg_trg_Abilities_Remove)
            call TriggerExecute(gg_trg_Abilities_Effect)
        endif
    else
    endif
endfunction
function InitTrig_Abilities_Activate takes nothing returns nothing
    set gg_trg_Abilities_Activate = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Abilities_Activate, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Abilities_Activate, Condition(function Trig_Abilities_Activate_Conditions))
    call TriggerAddAction(gg_trg_Abilities_Activate, function Trig_Abilities_Activate_Actions)
endfunction
function Trig_Abilities_Deactivate_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303649))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Deactivate_Func006Func001Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Value[GetUnitUserData(udg_Target)] == 4))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Deactivate_Func006Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Value[GetUnitUserData(udg_Target)] == 3))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Deactivate_Func006Func001C takes nothing returns boolean
    if(not(udg_AS_Value[GetUnitUserData(udg_Target)] == 2))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Deactivate_Func006C takes nothing returns boolean
    if(not(udg_AS_Value[GetUnitUserData(udg_Target)] == 1))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Deactivate_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ(0x41303649, GetTriggerUnit())
    call UnitAddAbilityBJ(0x4130364A, udg_Target)
    call UnitAddAbilityBJ(0x4130364B, udg_Target)
    call UnitAddAbilityBJ(0x4130364C, udg_Target)
    call UnitAddAbilityBJ(0x4130364D, udg_Target)
    if(Trig_Abilities_Deactivate_Func006C())then
        call RemoveDestructable(udg_MagneticField[1])
        call DestroyTextTagBJ(udg_AS_TextNumber[1])
        set udg_AS_Logic[1] = false
        set udg_AS_Effect[1] = 0
    else
        if(Trig_Abilities_Deactivate_Func006Func001C())then
            call RemoveDestructable(udg_MagneticField[2])
            call DestroyTextTagBJ(udg_AS_TextNumber[2])
            set udg_AS_Logic[2] = false
            set udg_AS_Effect[2] = 0
        else
            if(Trig_Abilities_Deactivate_Func006Func001Func001C())then
                call RemoveDestructable(udg_MagneticField[3])
                call DestroyTextTagBJ(udg_AS_TextNumber[3])
                set udg_AS_Logic[3] = false
                set udg_AS_Effect[3] = 0
            else
                if(Trig_Abilities_Deactivate_Func006Func001Func001Func001C())then
                    call RemoveDestructable(udg_MagneticField[4])
                    call DestroyTextTagBJ(udg_AS_TextNumber[4])
                    set udg_AS_Logic[4] = false
                    set udg_AS_Effect[4] = 0
                else
                endif
            endif
        endif
    endif
    set udg_AS_Value[GetUnitUserData(udg_Target)] = 0
endfunction
function InitTrig_Abilities_Deactivate takes nothing returns nothing
    set gg_trg_Abilities_Deactivate = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Abilities_Deactivate, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Abilities_Deactivate, Condition(function Trig_Abilities_Deactivate_Conditions))
    call TriggerAddAction(gg_trg_Abilities_Deactivate, function Trig_Abilities_Deactivate_Actions)
endfunction
function Trig_Abilities_Remove_Actions takes nothing returns nothing
    call AddSpecialEffectTargetUnitBJ("origin", udg_Target, "Abilities\\Spells\\Undead\\ReplenishMana\\ReplenishManaCasterOverhead.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call UnitRemoveAbilityBJ(0x4130364A, udg_Target)
    call UnitRemoveAbilityBJ(0x4130364B, udg_Target)
    call UnitRemoveAbilityBJ(0x4130364C, udg_Target)
    call UnitRemoveAbilityBJ(0x4130364D, udg_Target)
    call UnitAddAbilityBJ(0x41303649, udg_Target)
endfunction
function InitTrig_Abilities_Remove takes nothing returns nothing
    set gg_trg_Abilities_Remove = CreateTrigger()
    call TriggerAddAction(gg_trg_Abilities_Remove, function Trig_Abilities_Remove_Actions)
endfunction
function Trig_Abilities_Effect_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(udg_Target)
    call DestroyEffectBJ(udg_Starfall)
    call AddSpecialEffectLocBJ(udg_Point, "StarfallTarget.mdx")
    set udg_Starfall = GetLastCreatedEffectBJ()
    call RemoveLocation(udg_Point)
endfunction
function InitTrig_Abilities_Effect takes nothing returns nothing
    set gg_trg_Abilities_Effect = CreateTrigger()
    call DisableTrigger(gg_trg_Abilities_Effect)
    call TriggerAddAction(gg_trg_Abilities_Effect, function Trig_Abilities_Effect_Actions)
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 12))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func001Func003C takes nothing returns boolean
    if(not(udg_AS_Effect11 == false))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 11))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003Func006Func001Func007C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003Func006Func001Func008C takes nothing returns boolean
    if((GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return true
    endif
    if((GetOwningPlayer(GetEnumUnit()) == Player(1)))then
        return true
    endif
    return false
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003Func006Func001C takes nothing returns boolean
    if(not Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003Func006Func001Func008C())then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003Func006A takes nothing returns nothing
    if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003Func006Func001C())then
        call SetUnitLifeBJ(GetEnumUnit(), (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
        call CreateTextTagUnitBJ(I2S(R2I(udg_AbilityPower)), GetEnumUnit(), 0, 8.00, 0.00, 100.00, 0.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.70)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.40)
    else
        if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003Func006Func001Func007C())then
            call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        else
        endif
    endif
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003C takes nothing returns boolean
    if(not(udg_AS_Effect10 == false))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 10))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func015Func005C takes nothing returns boolean
    if(not(udg_Training == false))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func015C takes nothing returns boolean
    if(not(udg_AS_Effect9Count == 3))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 9))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 8))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func007Func013Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func007Func013A takes nothing returns nothing
    if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func007Func013Func001C())then
        call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
    else
    endif
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func007C takes nothing returns boolean
    if(not(udg_AbilityPowerEnergy >= udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 7))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func009C takes nothing returns boolean
    if(not(udg_CO_LeftWeapon == true))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 6))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 5))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 4))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 3))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func018C takes nothing returns boolean
    if(not(udg_AS_Effect2 == false))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func020A takes nothing returns nothing
    set udg_AbilityPower = ((I2R(udg_CO_Power) * 1.00) + I2R(udg_CO_Combo))
    set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))
    call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
endfunction
function Trig_Abilities_Effects_Func001Func009Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 2))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 1))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func010C takes nothing returns boolean
    if(not(udg_Training == false))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 0))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func003Func008C takes nothing returns boolean
    if(not(udg_AS_AbilityLVL[udg_AS_EffectNumber] < 5))then
        return false
    endif
    if(not(udg_AS_AbilityEXP[udg_AS_EffectNumber] == 70))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func003C takes nothing returns boolean
    if(not Trig_Abilities_Effects_Func003Func008C())then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func005C takes nothing returns boolean
    if(not(udg_ART[18] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Actions takes nothing returns nothing
    if(Trig_Abilities_Effects_Func001C())then
        set udg_CO_Power = (GetHeroStatBJ(bj_HEROSTAT_AGI, udg_Arct, true) + GetHeroStatBJ(bj_HEROSTAT_STR, udg_Arct, true) + GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true))
        set udg_CO_Power = (udg_CO_Power / 3)
        set udg_AbilityPower = (I2R(udg_CO_Power) + I2R(udg_CO_Combo))
        set udg_AbilityPower = (udg_AbilityPower + 20.00)
        call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
        set udg_AbilityPower = (udg_AbilityPower - 10.00)
        call UnitDamageTargetBJ(udg_Arct, udg_AS_EnemyTarget, udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        call RemoveUnit(GetEnumUnit())
    else
        set udg_AbilityPower = (I2R(udg_CO_Power) + I2R(udg_CO_Combo))
        set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))
        call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
        call CreateTextTagUnitBJ(("+" + I2S(R2I(udg_AbilityPower))), udg_Arct, 0, 8.00, 0.00, 100.00, 0.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.60)
        if(Trig_Abilities_Effects_Func001Func009C())then
            set udg_AS_EffectNumber = 1
            set udg_AbilityPower = ((I2R(udg_CO_Power) * 2.00) + I2R(udg_CO_Combo))
            set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))
            call UnitDamageTargetBJ(udg_Arct, udg_AS_EnemyTarget, (10.00 + I2R(udg_CO_Combo)), ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
            call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
            call EnableTrigger(gg_trg_Effect_1_Heal)
            call StartTimerBJ(udg_AS_TimerEffect1, false, (5.00 * I2R(udg_AS_AbilityLVL[1])))
            set udg_Point = GetUnitLoc(udg_Arct)
            call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
            call RemoveLocation(udg_Point)
            call UnitAddAbilityBJ(0x41303543, GetLastCreatedUnit())
            call SetUnitAbilityLevelSwapped(0x41303543, GetLastCreatedUnit(), udg_AS_AbilityLVL[1])
            call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "innerfire", udg_Arct)
        else
            if(Trig_Abilities_Effects_Func001Func009Func001C())then
                set udg_AS_EffectNumber = 2
                call GroupClear(udg_CO_UnitGroup)
                call GroupClear(udg_CO_UnitGroup2)
                call DestroyGroup(udg_CO_UnitGroup)
                call DestroyGroup(udg_CO_UnitGroup2)
                set udg_CO_Point = GetUnitLoc(udg_Arct)
                set udg_CO_UnitGroup = GetUnitsInRangeOfLocAll(300.00, udg_CO_Point)
                call RemoveLocation(udg_CO_Point)
                set udg_CO_UnitGroup2 = GetUnitsOfPlayerAll(Player(0))
                call GroupRemoveGroup(udg_CO_UnitGroup2, udg_CO_UnitGroup)
                set udg_CO_UnitGroup2 = GetUnitsOfPlayerAll(Player(PLAYER_NEUTRAL_PASSIVE))
                call GroupRemoveGroup(udg_CO_UnitGroup2, udg_CO_UnitGroup)
                call ResetUnitAnimation(udg_Arct)
                call SetUnitAnimation(udg_Arct, "attack slam")
                call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "war3mapImported\\insWhirl(sound).mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                if(Trig_Abilities_Effects_Func001Func009Func001Func018C())then
                    set udg_AS_Effect2 = true
                    set udg_ChanceCrit = (udg_ChanceCrit + 10.00)
                    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
                else
                endif
                call StartTimerBJ(udg_AS_TimerEffect2, false, (4.00 * I2R(udg_AS_AbilityLVL[2])))
                call ForGroupBJ(udg_CO_UnitGroup, function Trig_Abilities_Effects_Func001Func009Func001Func020A)
            else
                if(Trig_Abilities_Effects_Func001Func009Func001Func001C())then
                    set udg_AS_EffectNumber = 3
                    call UnitRemoveAbilityBJ(0x4130334B, udg_Arct)
                    call UnitAddAbilityBJ(0x4130334B, udg_Arct)
                else
                    if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001C())then
                        set udg_AS_EffectNumber = 4
                        set udg_Point = GetUnitLoc(udg_Arct)
                        call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
                        call RemoveLocation(udg_Point)
                        call UnitAddAbilityBJ(0x41303547, GetLastCreatedUnit())
                        call SetUnitAbilityLevelSwapped(0x41303547, GetLastCreatedUnit(), udg_AS_AbilityLVL[4])
                        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
                        call IssueTargetOrderBJ(GetLastCreatedUnit(), "bloodlust", udg_Arct)
                        call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "war3mapImported\\StompRed.mdx")
                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                        call EnableTrigger(gg_trg_Effect_4_Vampirism)
                        call StartTimerBJ(udg_AS_TimerEffect4, false, (3.00 * I2R(udg_AS_AbilityLVL[4])))
                    else
                        if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001C())then
                            set udg_AS_EffectNumber = 5
                            set udg_CO_Point = GetUnitLoc(udg_Arct)
                            call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 5)], Player(0), udg_CO_Point, GetRandomReal(0, 360.00))
                            call UnitApplyTimedLifeBJ((5.00 + (2.00 * I2R(udg_AS_AbilityLVL[5]))), 0x42544C46, GetLastCreatedUnit())
                            call UnitAddAbilityBJ(0x416C6F63, GetLastCreatedUnit())
                            call AddSpecialEffectTargetUnitBJ("origin", GetLastCreatedUnit(), "Abilities\\Spells\\Demon\\DemonBoltImpact\\DemonBoltImpact.mdl")
                            call DestroyEffectBJ(GetLastCreatedEffectBJ())
                            call SetUnitVertexColorBJ(GetLastCreatedUnit(), 100.00, 100, 100, 50.00)
                            call RemoveLocation(udg_CO_Point)
                        else
                            if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001C())then
                                set udg_AS_EffectNumber = 6
                                set udg_CO_Effect6Power = (1 * udg_AS_AbilityLVL[6])
                                call EnableTrigger(gg_trg_Effect_6_Periodic)
                                call DestroyEffectBJ(udg_CO_Effect6Sweep[1])
                                call DestroyEffectBJ(udg_CO_Effect6Sweep[2])
                                call AddSpecialEffectTargetUnitBJ("weapon", udg_Arct, "war3mapImported\\Sweep_Lightning_Large.mdx")
                                set udg_CO_Effect6Sweep[1] = GetLastCreatedEffectBJ()
                                if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func009C())then
                                    call AddSpecialEffectTargetUnitBJ("foot, left", udg_Arct, "war3mapImported\\Sweep_Lightning_Large.mdx")
                                    set udg_CO_Effect6Sweep[2] = GetLastCreatedEffectBJ()
                                else
                                endif
                            else
                                if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001C())then
                                    set udg_AS_EffectNumber = 7
                                    set udg_AbilityPowerEnergy = GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct)
                                    call SetUnitManaPercentBJ(udg_Arct, 100)
                                    set udg_AbilityPower = (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) * 0.90)
                                    call SetUnitManaBJ(udg_Arct, udg_AbilityPowerEnergy)
                                    if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func007C())then
                                        set udg_Point = GetUnitLoc(udg_Arct)
                                        set udg_UnitGroup = GetUnitsInRangeOfLocAll(400.00, udg_Point)
                                        call RemoveLocation(udg_Point)
                                        set udg_AbilityPower = (I2R(udg_CO_Power) + I2R(udg_CO_Combo))
                                        set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))
                                        set udg_AbilityPower = (udg_AbilityPower + GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct))
                                        set udg_AbilityPower = (udg_AbilityPower / 2.00)
                                        call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "war3mapImported\\Thunder Slam.mdx")
                                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                        call ForGroupBJ(udg_UnitGroup, function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func007Func013A)
                                        call DestroyGroup(udg_UnitGroup)
                                    else
                                        call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) + (2.00 + I2R(udg_AS_AbilityLVL[7]))))
                                        call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Items\\AIma\\AImaTarget.mdl")
                                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                    endif
                                else
                                    if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001C())then
                                        set udg_AS_EffectNumber = 8
                                        call ConditionalTriggerExecute(gg_trg_Effect_8_Cast)
                                    else
                                        if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                            set udg_Point = GetUnitLoc(udg_Arct)
                                            set udg_Point2 = OffsetLocation(udg_Point, GetRandomReal(0, 200.00), GetRandomReal(0, 200.00))
                                            call CreateNUnitsAtLoc(1, 0x68303058, Player(0), udg_Point2, GetRandomDirectionDeg())
                                            call UnitApplyTimedLifeBJ((2.00 * I2R(udg_AS_AbilityLVL[9])), 0x42544C46, GetLastCreatedUnit())
                                            call GroupAddUnitSimple(GetLastCreatedUnit(), udg_AS_Effect9Group)
                                            call StartTimerBJ(udg_AS_TimerEffect9, false, (2.00 * I2R(udg_AS_AbilityLVL[9])))
                                            call EnableTrigger(gg_trg_Effect_9_Periodic)
                                            call AddSpecialEffectLocBJ(udg_Point2, "Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl")
                                            call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                            call RemoveLocation(udg_Point)
                                            call RemoveLocation(udg_Point2)
                                            set udg_AS_EffectNumber = 9
                                            set udg_AS_Effect9Count = (udg_AS_Effect9Count + 1)
                                            if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func015C())then
                                                call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Items\\AIma\\AImaTarget.mdl")
                                                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                                set udg_AS_Effect9Count = 0
                                                set udg_AS_Effect9Count2 = (udg_AS_Effect9Count2 + 1)
                                                if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func015Func005C())then
                                                    call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                                                    call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                                                    call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                                                else
                                                endif
                                            else
                                            endif
                                        else
                                            if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003C())then
                                                set udg_AS_EffectNumber = 10
                                                if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003C())then
                                                    set udg_AS_Effect10 = true
                                                    set udg_Point = GetUnitLoc(udg_Arct)
                                                    call CreateNUnitsAtLoc(1, 0x48303053, Player(1), udg_Point, bj_UNIT_FACING)
                                                    call UnitAddAbilityBJ(0x416C6F63, GetLastCreatedUnit())
                                                    call SetHeroLevelBJ(GetLastCreatedUnit(), udg_AS_AbilityLVL[10], false)
                                                    call SuspendHeroXPBJ(false, GetLastCreatedUnit())
                                                    set udg_AS_Effect10Unit = GetLastCreatedUnit()
                                                    call IssuePointOrderLocBJ(udg_AS_Effect10Unit, "attack", udg_Point)
                                                    call AddSpecialEffectTargetUnitBJ("origin", GetLastCreatedUnit(), "war3mapImported\\Flash.mdx")
                                                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                                    call SetUnitVertexColorBJ(GetLastCreatedUnit(), 100, 100, 100, 40.00)
                                                    call RemoveLocation(udg_Point)
                                                    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_FollowersGroup)
                                                    call EnableTrigger(gg_trg_Follower_Movement)
                                                else
                                                    call AddSpecialEffectTargetUnitBJ("origin", udg_AS_Effect10Unit, "war3mapImported\\Holy-Nova.mdx")
                                                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                                    set udg_Point = GetUnitLoc(udg_AS_Effect10Unit)
                                                    set udg_UnitGroup = GetUnitsInRangeOfLocAll(400.00, udg_Point)
                                                    set udg_AbilityPower = (I2R(udg_CO_Power) + (I2R(udg_CO_Combo) + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true))))
                                                    call ForGroupBJ(udg_UnitGroup, function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003Func006A)
                                                    call RemoveLocation(udg_Point)
                                                    call DestroyGroup(udg_UnitGroup)
                                                endif
                                            else
                                                if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func001C())then
                                                    set udg_AS_EffectNumber = 11
                                                    if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func001Func003C())then
                                                        set udg_AS_Effect11 = true
                                                        set udg_ChanceBlock = (udg_ChanceBlock + 20.00)
                                                        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
                                                        call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "war3mapImported\\FrozenShell.MDX")
                                                        call SetUnitVertexColorBJ(udg_Arct, 30.00, 80.00, 100, 0)
                                                        set udg_AS_Effect11SE = GetLastCreatedEffectBJ()
                                                        call StartTimerBJ(udg_AS_TimerEffect11, false, (4.00 * I2R(udg_AS_AbilityLVL[11])))
                                                    else
                                                    endif
                                                else
                                                    if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func001Func001C())then
                                                        set udg_AS_EffectNumber = 12
                                                        set udg_Point = GetUnitLoc(udg_Arct)
                                                        call SetTerrainTypeBJ(udg_Point, 0x446C7663, - 1, 2, 0)
                                                        call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
                                                        call UnitAddAbilityBJ(0x4130334C, GetLastCreatedUnit())
                                                        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
                                                        call SetUnitAbilityLevelSwapped(0x4130334C, GetLastCreatedUnit(), udg_AS_AbilityLVL[12])
                                                        call IssueTargetOrderBJ(GetLastCreatedUnit(), "innerfire", udg_Arct)
                                                        call RemoveLocation(udg_Point)
                                                    else
                                                    endif
                                                endif
                                            endif
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
        if(Trig_Abilities_Effects_Func001Func010C())then
            set udg_QG_Count[7] = (udg_QG_Count[7] + 1)
            call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
            set udg_AS_AbilityEXP[udg_AS_EffectNumber] = (udg_AS_AbilityEXP[udg_AS_EffectNumber] + 1)
            set udg_AS_Points = (udg_AS_Points + 1)
            call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 1, ("Очки навыков: " + I2S(udg_AS_Points)))
        else
        endif
    endif
    if(Trig_Abilities_Effects_Func003C())then
        set udg_AS_AbilityEXP[udg_AS_EffectNumber] = 0
        set udg_AS_AbilityLVL[udg_AS_EffectNumber] = (udg_AS_AbilityLVL[udg_AS_EffectNumber] + 1)
        set udg_AS_AbilityCountLVL = (udg_AS_AbilityCountLVL + 1)
        call ClearTextMessagesBJ(GetPlayersAll())
        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0.9, 1.0, 2.5, ("Навык улучшен: |cFF00CD00" + (udg_AS_Name[udg_AS_EffectNumber] + (" |r(" + (I2S(udg_AS_AbilityLVL[udg_AS_EffectNumber]) + ")")))))
        call AddSpecialEffectTargetUnitBJ("chest", gg_unit_H000_0004, "war3mapImported\\SoundEffect3.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
    else
    endif
    if(Trig_Abilities_Effects_Func005C())then
        set udg_CO_Combo = (udg_CO_Combo + (1 * udg_ART[18]))
    else
    endif
endfunction
function InitTrig_Abilities_Effects takes nothing returns nothing
    set gg_trg_Abilities_Effects = CreateTrigger()
    call TriggerAddAction(gg_trg_Abilities_Effects, function Trig_Abilities_Effects_Actions)
endfunction
function Trig_Effect_1_Heal_Actions takes nothing returns nothing
    set udg_AbilityPower = ((I2R(udg_CO_Power) * (0.50 + (0.20 * I2R(udg_AS_AbilityLVL[1])))) + I2R(udg_CO_Combo))
    set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))
    call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
    call CreateTextTagUnitBJ(("+" + I2S(R2I(udg_AbilityPower))), udg_Arct, 0, 8.00, 0.00, 100.00, 0.00, 0)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.60)
endfunction
function InitTrig_Effect_1_Heal takes nothing returns nothing
    set gg_trg_Effect_1_Heal = CreateTrigger()
    call DisableTrigger(gg_trg_Effect_1_Heal)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Effect_1_Heal, 2.00)
    call TriggerAddAction(gg_trg_Effect_1_Heal, function Trig_Effect_1_Heal_Actions)
endfunction
function Trig_Effect_1_Timer_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Effect_1_Heal)
endfunction
function InitTrig_Effect_1_Timer takes nothing returns nothing
    set gg_trg_Effect_1_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Effect_1_Timer, udg_AS_TimerEffect1)
    call TriggerAddAction(gg_trg_Effect_1_Timer, function Trig_Effect_1_Timer_Actions)
endfunction
function Trig_Effect_2_Timer_Func001C takes nothing returns boolean
    if(not(udg_AS_Effect2 == true))then
        return false
    endif
    return true
endfunction
function Trig_Effect_2_Timer_Actions takes nothing returns nothing
    if(Trig_Effect_2_Timer_Func001C())then
        set udg_AS_Effect2 = false
        set udg_ChanceCrit = (udg_ChanceCrit - 10.00)
        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
    else
    endif
endfunction
function InitTrig_Effect_2_Timer takes nothing returns nothing
    set gg_trg_Effect_2_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Effect_2_Timer, udg_AS_TimerEffect2)
    call TriggerAddAction(gg_trg_Effect_2_Timer, function Trig_Effect_2_Timer_Actions)
endfunction
function Trig_Effect_3_Use_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x4130334B))then
        return false
    endif
    return true
endfunction
function Trig_Effect_3_Use_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ(0x4130334B, udg_Arct)
    set udg_Point = GetUnitLoc(udg_Arct)
    call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
    call RemoveLocation(udg_Point)
    call UnitAddAbilityBJ(0x41303338, GetLastCreatedUnit())
    call SetUnitAbilityLevelSwapped(0x41303338, GetLastCreatedUnit(), udg_AS_AbilityLVL[3])
    call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
    call IssueTargetOrderBJ(GetLastCreatedUnit(), "invisibility", udg_Arct)
    call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "Abilities\\Spells\\Human\\Polymorph\\PolyMorphTarget.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
endfunction
function InitTrig_Effect_3_Use takes nothing returns nothing
    set gg_trg_Effect_3_Use = CreateTrigger()
    call TriggerRegisterPlayerUnitEventSimple(gg_trg_Effect_3_Use, Player(0), EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Effect_3_Use, Condition(function Trig_Effect_3_Use_Conditions))
    call TriggerAddAction(gg_trg_Effect_3_Use, function Trig_Effect_3_Use_Actions)
endfunction
function Trig_Effect_4_Vampirism_Func004C takes nothing returns boolean
    if(not(udg_DamageEventOverride == false))then
        return false
    endif
    if(not(udg_DamageEventSource == udg_Arct))then
        return false
    endif
    return true
endfunction
function Trig_Effect_4_Vampirism_Conditions takes nothing returns boolean
    if(not Trig_Effect_4_Vampirism_Func004C())then
        return false
    endif
    return true
endfunction
function Trig_Effect_4_Vampirism_Func003C takes nothing returns boolean
    if(not(udg_AbilityPower > 1.00))then
        return false
    endif
    return true
endfunction
function Trig_Effect_4_Vampirism_Actions takes nothing returns nothing
    set udg_AbilityPower = (udg_DamageEventAmount * 0.30)
    set udg_AbilityPower = (udg_AbilityPower + I2R(udg_CO_Combo))
    if(Trig_Effect_4_Vampirism_Func003C())then
        call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
        call CreateTextTagUnitBJ(("+" + I2S(R2I(udg_AbilityPower))), udg_Arct, 0, 7.50, 0.00, 100.00, 0.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.70)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.40)
    else
    endif
endfunction
function InitTrig_Effect_4_Vampirism takes nothing returns nothing
    set gg_trg_Effect_4_Vampirism = CreateTrigger()
    call DisableTrigger(gg_trg_Effect_4_Vampirism)
    call TriggerRegisterVariableEvent(gg_trg_Effect_4_Vampirism, "udg_DamageModifierEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Effect_4_Vampirism, Condition(function Trig_Effect_4_Vampirism_Conditions))
    call TriggerAddAction(gg_trg_Effect_4_Vampirism, function Trig_Effect_4_Vampirism_Actions)
endfunction
function Trig_Effect_4_Timer_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Effect_4_Vampirism)
endfunction
function InitTrig_Effect_4_Timer takes nothing returns nothing
    set gg_trg_Effect_4_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Effect_4_Timer, udg_AS_TimerEffect4)
    call TriggerAddAction(gg_trg_Effect_4_Timer, function Trig_Effect_4_Timer_Actions)
endfunction
function Trig_Effect_6_Periodic_Func004Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Effect_6_Periodic_Func004A takes nothing returns nothing
    if(Trig_Effect_6_Periodic_Func004Func001C())then
        set udg_AbilityPower = (I2R(udg_CO_Power) + I2R(udg_CO_Combo))
        set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))
        call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        call AddSpecialEffectTargetUnitBJ("chest", GetEnumUnit(), "Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
    else
    endif
endfunction
function Trig_Effect_6_Periodic_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(udg_Arct)
    set udg_UnitGroup = GetUnitsInRangeOfLocAll(300.00, udg_Point)
    call RemoveLocation(udg_Point)
    call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Effect_6_Periodic_Func004A)
    call DestroyGroup(udg_UnitGroup)
endfunction
function InitTrig_Effect_6_Periodic takes nothing returns nothing
    set gg_trg_Effect_6_Periodic = CreateTrigger()
    call DisableTrigger(gg_trg_Effect_6_Periodic)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Effect_6_Periodic, 5.00)
    call TriggerAddAction(gg_trg_Effect_6_Periodic, function Trig_Effect_6_Periodic_Actions)
endfunction
function Trig_Effect_8_Config_Actions takes nothing returns nothing
    set udg_BE_DummyType = 0x6E303053
    set udg_BE_Model = "Abilities\\Weapons\\FaerieDragonMissile\\FaerieDragonMissile.mdl"
    set udg_BE_Bounces[1] = 4
    set udg_BE_Bounces[2] = 5
    set udg_BE_Bounces[3] = 6
    set udg_BE_Bounces[4] = 7
    set udg_BE_Bounces[5] = 8
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 5
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_BE_SearchAoE[bj_forLoopAIndex] = 400.00
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_BE_CDamage[1] = 0.00
    set udg_BE_CHeal[1] = 0.00
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 5
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_BE_DamageAddition[bj_forLoopAIndex] = 3.00
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 5
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_BE_HealAddition[bj_forLoopAIndex] = 0.00
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 5
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_BE_Speed[bj_forLoopAIndex] = (400.00 * 0.03)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 5
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_BE_Height[bj_forLoopAIndex] = 300.00
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_BE_CSizeIncrement = 10.00
    set udg_BE_PosSpecialEffect = "war3mapImported\\HolySmiteMissileNew.mdx"
    set udg_BE_DamageType = DAMAGE_TYPE_MAGIC
    set udg_BE_AttackType = ATTACK_TYPE_NORMAL
    set udg_BE_TempPoint = GetRectCenter(GetPlayableMapRect())
    call CreateNUnitsAtLoc(1, 0x6E303053, Player(PLAYER_NEUTRAL_PASSIVE), udg_BE_TempPoint, bj_UNIT_FACING)
    set udg_BE_PreloadUnit = GetLastCreatedUnit()
    call RemoveUnit(GetLastCreatedUnit())
    call RemoveLocation(udg_BE_TempPoint)
endfunction
function InitTrig_Effect_8_Config takes nothing returns nothing
    set gg_trg_Effect_8_Config = CreateTrigger()
    call TriggerAddAction(gg_trg_Effect_8_Config, function Trig_Effect_8_Config_Actions)
endfunction
function Trig_Effect_8_Cast_Func001C takes nothing returns boolean
    if(not(udg_BE_MaxIndex == 0))then
        return false
    endif
    return true
endfunction
function Trig_Effect_8_Cast_Func010Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Effect_8_Cast_Func013Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Effect_8_Cast_Func016Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Effect_8_Cast_Func018Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Effect_8_Cast_Func018A takes nothing returns nothing
    if(Trig_Effect_8_Cast_Func018Func001C())then
        set udg_BE_Target[udg_BE_MaxIndex] = GetEnumUnit()
    else
    endif
endfunction
function Trig_Effect_8_Cast_Actions takes nothing returns nothing
    if(Trig_Effect_8_Cast_Func001C())then
        call EnableTrigger(gg_trg_Effect_8_Loop)
    else
    endif
    set udg_BE_MaxIndex = (udg_BE_MaxIndex + 1)
    set udg_BE_Caster[udg_BE_MaxIndex] = udg_Arct
    set udg_Point = GetUnitLoc(udg_Arct)
    set udg_UnitGroup = GetUnitsInRangeOfLocAll(400.00, udg_Point)
    call RemoveLocation(udg_Point)
    set udg_D_Pick = GetUnitsOfPlayerAll(Player(0))
    call GroupRemoveGroup(udg_D_Pick, udg_UnitGroup)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfPlayerAll(Player(1))
    call GroupRemoveGroup(udg_D_Pick, udg_UnitGroup)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfPlayerAll(Player(PLAYER_NEUTRAL_PASSIVE))
    call GroupRemoveGroup(udg_D_Pick, udg_UnitGroup)
    call DestroyGroup(udg_D_Pick)
    call ForGroupBJ(GetRandomSubGroup(1, udg_UnitGroup), function Trig_Effect_8_Cast_Func018A)
    call DestroyGroup(udg_UnitGroup)
    set udg_BE_AbilityIndex[udg_BE_MaxIndex] = udg_AS_AbilityLVL[8]
    set udg_BE_DistanceTravelled[udg_BE_MaxIndex] = 0.00
    set udg_AbilityPower = (I2R(udg_CO_Power) + I2R(udg_CO_Combo))
    set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))
    set udg_BE_Damage[udg_BE_MaxIndex] = udg_AbilityPower
    set udg_BE_Heal[udg_BE_MaxIndex] = udg_AbilityPower
    set udg_BE_SizeIncrement[udg_BE_MaxIndex] = udg_BE_CSizeIncrement
    set udg_BE_CurrentBounces[udg_BE_MaxIndex] = 0
    set udg_BE_Player[udg_BE_MaxIndex] = GetTriggerPlayer()
    set udg_BE_TempPoint2 = GetUnitLoc(udg_BE_Caster[udg_BE_MaxIndex])
    set udg_BE_TempPoint3 = GetUnitLoc(udg_BE_Target[udg_BE_MaxIndex])
    set udg_BE_Angle[udg_BE_MaxIndex] = AngleBetweenPoints(udg_BE_TempPoint2, udg_BE_TempPoint3)
    call CreateNUnitsAtLoc(1, udg_BE_DummyType, udg_BE_Player[udg_BE_MaxIndex], udg_BE_TempPoint2, udg_BE_Angle[udg_BE_MaxIndex])
    set udg_BE_Dummy[udg_BE_MaxIndex] = GetLastCreatedUnit()
    call AddSpecialEffectTargetUnitBJ("origin", udg_BE_Dummy[udg_BE_MaxIndex], udg_BE_Model)
    set udg_BE_FX[udg_BE_MaxIndex] = GetLastCreatedEffectBJ()
    call RemoveLocation(udg_BE_TempPoint2)
    call RemoveLocation(udg_BE_TempPoint3)
endfunction
function InitTrig_Effect_8_Cast takes nothing returns nothing
    set gg_trg_Effect_8_Cast = CreateTrigger()
    call TriggerAddAction(gg_trg_Effect_8_Cast, function Trig_Effect_8_Cast_Actions)
endfunction
function Trig_Effect_8_Loop_Func001Func001Func016C takes nothing returns boolean
    if(not(udg_BE_MaxIndex == 0))then
        return false
    endif
    return true
endfunction
function Trig_Effect_8_Loop_Func001Func001Func030Func001C takes nothing returns boolean
    if(not(IsUnitAlly(udg_BE_Target[udg_BE_TempIndex], udg_BE_Player[udg_BE_TempIndex]) == true))then
        return false
    endif
    return true
endfunction
function Trig_Effect_8_Loop_Func001Func001Func030Func004Func002Func005C takes nothing returns boolean
    if((GetOwningPlayer(udg_BE_PickedUnits) == Player(0)))then
        return true
    endif
    if((GetOwningPlayer(udg_BE_PickedUnits) == Player(11)))then
        return true
    endif
    return false
endfunction
function Trig_Effect_8_Loop_Func001Func001Func030Func004Func002C takes nothing returns boolean
    if(not(IsUnitType(udg_BE_PickedUnits, UNIT_TYPE_STRUCTURE) == false))then
        return false
    endif
    if(not(IsUnitAliveBJ(udg_BE_PickedUnits) == true))then
        return false
    endif
    if(not(udg_BE_PickedUnits != udg_BE_Target[udg_BE_TempIndex]))then
        return false
    endif
    if(not Trig_Effect_8_Loop_Func001Func001Func030Func004Func002Func005C())then
        return false
    endif
    return true
endfunction
function Trig_Effect_8_Loop_Func001Func001Func030Func004A takes nothing returns nothing
    set udg_BE_PickedUnits = GetEnumUnit()
    if(Trig_Effect_8_Loop_Func001Func001Func030Func004Func002C())then
    else
        call GroupRemoveUnitSimple(udg_BE_PickedUnits, udg_BE_Group)
    endif
endfunction
function Trig_Effect_8_Loop_Func001Func001Func030Func006C takes nothing returns boolean
    if(not(CountUnitsInGroup(udg_BE_Group) == 0))then
        return false
    endif
    return true
endfunction
function Trig_Effect_8_Loop_Func001Func001Func030C takes nothing returns boolean
    if(not(udg_BE_Distance[udg_BE_TempIndex] <= 50.00))then
        return false
    endif
    return true
endfunction
function Trig_Effect_8_Loop_Func001Func001C takes nothing returns boolean
    if(not(udg_BE_CurrentBounces[udg_BE_TempIndex] <= udg_BE_Bounces[udg_BE_AbilityIndex[udg_BE_TempIndex]]))then
        return false
    endif
    return true
endfunction
function Trig_Effect_8_Loop_Actions takes nothing returns nothing
    set udg_BE_TempIndex = 1
    loop
        exitwhen udg_BE_TempIndex > udg_BE_MaxIndex
        if(Trig_Effect_8_Loop_Func001Func001C())then
            set udg_BE_TempPoint3 = GetUnitLoc(udg_BE_Target[udg_BE_TempIndex])
            set udg_BE_TempPoint2 = GetUnitLoc(udg_BE_Dummy[udg_BE_TempIndex])
            set udg_BE_Distance[udg_BE_TempIndex] = DistanceBetweenPoints(udg_BE_TempPoint3, udg_BE_TempPoint2)
            set udg_BE_DistanceTravelled[udg_BE_TempIndex] = (udg_BE_DistanceTravelled[udg_BE_TempIndex] + udg_BE_Speed[udg_BE_AbilityIndex[udg_BE_TempIndex]])
            set udg_BE_TotalDistance = (udg_BE_DistanceTravelled[udg_BE_TempIndex] + udg_BE_Distance[udg_BE_TempIndex])
            set udg_BE_Angle[udg_BE_TempIndex] = AngleBetweenPoints(udg_BE_TempPoint2, udg_BE_TempPoint3)
            set udg_BE_TempPoint = PolarProjectionBJ(udg_BE_TempPoint2, udg_BE_Speed[udg_BE_AbilityIndex[udg_BE_TempIndex]], udg_BE_Angle[udg_BE_TempIndex])
            call SetUnitFlyHeightBJ(udg_BE_Dummy[udg_BE_TempIndex], ((4.00 * udg_BE_Height[udg_BE_AbilityIndex[udg_BE_TempIndex]]) * (udg_BE_DistanceTravelled[udg_BE_TempIndex] * ((udg_BE_TotalDistance - udg_BE_DistanceTravelled[udg_BE_TempIndex]) / (udg_BE_TotalDistance * udg_BE_TotalDistance)))), 0.00)
            call SetUnitPositionLocFacingBJ(udg_BE_Dummy[udg_BE_TempIndex], udg_BE_TempPoint, udg_BE_Angle[udg_BE_TempIndex])
            if(Trig_Effect_8_Loop_Func001Func001Func030C())then
                if(Trig_Effect_8_Loop_Func001Func001Func030Func001C())then
                    call SetUnitLifeBJ(udg_BE_Target[udg_BE_TempIndex], (GetUnitStateSwap(UNIT_STATE_LIFE, udg_BE_Target[udg_BE_TempIndex]) + udg_BE_Heal[udg_BE_TempIndex]))
                    call AddSpecialEffectLocBJ(udg_BE_TempPoint3, udg_BE_PosSpecialEffect)
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                    call CreateTextTagUnitBJ(("+" + I2S(R2I(udg_BE_Heal[udg_BE_TempIndex]))), udg_BE_Target[udg_BE_TempIndex], 0, 8.00, 0.00, 100.00, 0.00, 0)
                    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
                    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
                    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.60)
                else
                    call UnitDamageTargetBJ(udg_BE_Caster[udg_BE_TempIndex], udg_BE_Target[udg_BE_TempIndex], udg_BE_Damage[udg_BE_TempIndex], udg_BE_AttackType, udg_BE_DamageType)
                    call AddSpecialEffectLocBJ(udg_BE_TempPoint3, udg_BE_PosSpecialEffect)
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                    call CreateTextTagUnitBJ(I2S(R2I(udg_BE_Damage[udg_BE_TempIndex])), udg_BE_Target[udg_BE_TempIndex], 0, 8.00, 100.00, 0.00, 0.00, 0)
                    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
                    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.70)
                    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.40)
                endif
                set udg_BE_Group = GetUnitsInRangeOfLocAll(udg_BE_SearchAoE[udg_BE_AbilityIndex[udg_BE_TempIndex]], udg_BE_TempPoint2)
                call ForGroupBJ(udg_BE_Group, function Trig_Effect_8_Loop_Func001Func001Func030Func004A)
                if(Trig_Effect_8_Loop_Func001Func001Func030Func006C())then
                    set udg_BE_CurrentBounces[udg_BE_TempIndex] = udg_BE_Bounces[udg_BE_AbilityIndex[udg_BE_TempIndex]]
                else
                endif
                set udg_BE_Target[udg_BE_TempIndex] = GroupPickRandomUnit(udg_BE_Group)
                call SetUnitScalePercent(udg_BE_Dummy[udg_BE_TempIndex], (100.00 + udg_BE_SizeIncrement[udg_BE_TempIndex]), (100.00 + udg_BE_SizeIncrement[udg_BE_TempIndex]), (100.00 + udg_BE_SizeIncrement[udg_BE_TempIndex]))
                set udg_BE_Damage[udg_BE_TempIndex] = (udg_BE_Damage[udg_BE_TempIndex] + udg_BE_DamageAddition[udg_BE_AbilityIndex[udg_BE_TempIndex]])
                set udg_BE_Heal[udg_BE_TempIndex] = (udg_BE_Heal[udg_BE_TempIndex] + udg_BE_HealAddition[udg_BE_AbilityIndex[udg_BE_TempIndex]])
                set udg_BE_CurrentBounces[udg_BE_TempIndex] = (udg_BE_CurrentBounces[udg_BE_TempIndex] + 1)
                set udg_BE_SizeIncrement[udg_BE_TempIndex] = (udg_BE_SizeIncrement[udg_BE_TempIndex] + udg_BE_CSizeIncrement)
                set udg_BE_DistanceTravelled[udg_BE_TempIndex] = 0.00
                call DestroyGroup(udg_BE_Group)
            else
            endif
            call RemoveLocation(udg_BE_TempPoint)
            call RemoveLocation(udg_BE_TempPoint2)
            call RemoveLocation(udg_BE_TempPoint3)
        else
            call DestroyEffectBJ(udg_BE_FX[udg_BE_TempIndex])
            set udg_BE_FX[udg_BE_TempIndex] = udg_BE_FX[udg_BE_MaxIndex]
            call KillUnit(udg_BE_Dummy[udg_BE_TempIndex])
            set udg_BE_Dummy[udg_BE_TempIndex] = udg_BE_Dummy[udg_BE_MaxIndex]
            set udg_BE_Target[udg_BE_TempIndex] = udg_BE_Target[udg_BE_MaxIndex]
            set udg_BE_Caster[udg_BE_TempIndex] = udg_BE_Caster[udg_BE_MaxIndex]
            set udg_BE_Player[udg_BE_TempIndex] = udg_BE_Player[udg_BE_MaxIndex]
            set udg_BE_CurrentBounces[udg_BE_TempIndex] = udg_BE_CurrentBounces[udg_BE_MaxIndex]
            set udg_BE_Angle[udg_BE_TempIndex] = udg_BE_Angle[udg_BE_MaxIndex]
            set udg_BE_Distance[udg_BE_TempIndex] = udg_BE_Distance[udg_BE_MaxIndex]
            set udg_BE_DistanceTravelled[udg_BE_TempIndex] = udg_BE_DistanceTravelled[udg_BE_MaxIndex]
            set udg_BE_SizeIncrement[udg_BE_TempIndex] = udg_BE_SizeIncrement[udg_BE_MaxIndex]
            set udg_BE_TempIndex = (udg_BE_TempIndex - 1)
            set udg_BE_MaxIndex = (udg_BE_MaxIndex - 1)
            if(Trig_Effect_8_Loop_Func001Func001Func016C())then
                call DisableTrigger(gg_trg_Effect_8_Loop)
            else
            endif
        endif
        set udg_BE_TempIndex = udg_BE_TempIndex + 1
    endloop
endfunction
function InitTrig_Effect_8_Loop takes nothing returns nothing
    set gg_trg_Effect_8_Loop = CreateTrigger()
    call DisableTrigger(gg_trg_Effect_8_Loop)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Effect_8_Loop, 0.03)
    call TriggerAddAction(gg_trg_Effect_8_Loop, function Trig_Effect_8_Loop_Actions)
endfunction
function Trig_Effect_9_Periodic_Func001Func006Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Effect_9_Periodic_Func001Func006A takes nothing returns nothing
    if(Trig_Effect_9_Periodic_Func001Func006Func001C())then
        call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        call CreateTextTagUnitBJ(I2S(R2I(udg_AbilityPower)), GetEnumUnit(), 0, 8.00, 100.00, 0.00, 0.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.70)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.40)
    else
    endif
endfunction
function Trig_Effect_9_Periodic_Func001A takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetEnumUnit())
    set udg_UnitGroup = GetUnitsInRangeOfLocAll(250.00, udg_Point)
    call RemoveLocation(udg_Point)
    set udg_AbilityPower = (I2R(udg_CO_Power) + (I2R(udg_CO_Combo) + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true))))
    set udg_AbilityPower = (udg_AbilityPower / 2.00)
    call ForGroupBJ(udg_UnitGroup, function Trig_Effect_9_Periodic_Func001Func006A)
    call DestroyGroup(udg_UnitGroup)
endfunction
function Trig_Effect_9_Periodic_Actions takes nothing returns nothing
    call ForGroupBJ(udg_AS_Effect9Group, function Trig_Effect_9_Periodic_Func001A)
endfunction
function InitTrig_Effect_9_Periodic takes nothing returns nothing
    set gg_trg_Effect_9_Periodic = CreateTrigger()
    call DisableTrigger(gg_trg_Effect_9_Periodic)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Effect_9_Periodic, 1.00)
    call TriggerAddAction(gg_trg_Effect_9_Periodic, function Trig_Effect_9_Periodic_Actions)
endfunction
function Trig_Effect_9_Stop_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Effect_9_Periodic)
    call GroupClear(udg_AS_Effect9Group)
endfunction
function InitTrig_Effect_9_Stop takes nothing returns nothing
    set gg_trg_Effect_9_Stop = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Effect_9_Stop, udg_AS_TimerEffect9)
    call TriggerAddAction(gg_trg_Effect_9_Stop, function Trig_Effect_9_Stop_Actions)
endfunction
function Trig_Effect_11_Timer_Func001C takes nothing returns boolean
    if(not(udg_AS_Effect11 == true))then
        return false
    endif
    return true
endfunction
function Trig_Effect_11_Timer_Actions takes nothing returns nothing
    if(Trig_Effect_11_Timer_Func001C())then
        set udg_AS_Effect11 = false
        set udg_ChanceBlock = (udg_ChanceBlock - 20.00)
        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
        call DestroyEffectBJ(udg_AS_Effect11SE)
        call SetUnitVertexColorBJ(udg_Arct, 100.00, 100.00, 100, 0)
    else
    endif
endfunction
function InitTrig_Effect_11_Timer takes nothing returns nothing
    set gg_trg_Effect_11_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Effect_11_Timer, udg_AS_TimerEffect11)
    call TriggerAddAction(gg_trg_Effect_11_Timer, function Trig_Effect_11_Timer_Actions)
endfunction
function Trig_Effect_12_Periodic_Func002Func007Func002C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    if(not(GetTerrainTypeBJ(udg_Point2) == 0x446C7663))then
        return false
    endif
    return true
endfunction
function Trig_Effect_12_Periodic_Func002Func007A takes nothing returns nothing
    set udg_Point2 = GetUnitLoc(GetEnumUnit())
    if(Trig_Effect_12_Periodic_Func002Func007Func002C())then
        set udg_AbilityPower = (I2R(udg_CO_Power) + (I2R(udg_CO_Combo) + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true))))
        call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        call CreateTextTagUnitBJ(I2S(R2I(udg_AbilityPower)), GetEnumUnit(), 0, 8.00, 100.00, 0.00, 0.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.70)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.40)
        call AddSpecialEffectTargetUnitBJ("chest", GetEnumUnit(), "Abilities\\Weapons\\FireBallMissile\\FireBallMissile.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
    else
    endif
    call RemoveLocation(udg_Point2)
endfunction
function Trig_Effect_12_Periodic_Func002C takes nothing returns boolean
    if(not(GetTerrainTypeBJ(udg_Point) == 0x446C7663))then
        return false
    endif
    return true
endfunction
function Trig_Effect_12_Periodic_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(udg_Arct)
    if(Trig_Effect_12_Periodic_Func002C())then
        call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
        call UnitAddAbilityBJ(0x4130334C, GetLastCreatedUnit())
        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
        call SetUnitAbilityLevelSwapped(0x4130334C, GetLastCreatedUnit(), udg_AS_AbilityLVL[12])
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "innerfire", udg_Arct)
        set udg_UnitGroup = GetUnitsInRangeOfLocAll(250.00, udg_Point)
        call ForGroupBJ(udg_UnitGroup, function Trig_Effect_12_Periodic_Func002Func007A)
        call DestroyGroup(udg_UnitGroup)
    else
    endif
    call RemoveLocation(udg_Point)
endfunction
function InitTrig_Effect_12_Periodic takes nothing returns nothing
    set gg_trg_Effect_12_Periodic = CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_Effect_12_Periodic, 1.00)
    call TriggerAddAction(gg_trg_Effect_12_Periodic, function Trig_Effect_12_Periodic_Actions)
endfunction
function Trig_Damage_Effects_Func002C takes nothing returns boolean
    if(not(udg_DamageEventOverride == false))then
        return false
    endif
    if(not(GetUnitTypeId(udg_DamageEventSource) != 0x68666F6F))then
        return false
    endif
    if(not(GetUnitTypeId(udg_DamageEventTarget) != 0x686B6E69))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Conditions takes nothing returns boolean
    if(not Trig_Damage_Effects_Func002C())then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func001C takes nothing returns boolean
    if(not(udg_DamageEventTarget == udg_Arct))then
        return false
    endif
    if(not(UnitHasBuffBJ(udg_Arct, 0x4230304A) == true))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func005C takes nothing returns boolean
    if((GetUnitTypeId(udg_DamageEventSource) == 0x6E303059))then
        return true
    endif
    if((GetUnitTypeId(udg_DamageEventSource) == 0x55303031))then
        return true
    endif
    return false
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(udg_DamageEventTarget) == Player(11)))then
        return false
    endif
    if(not(udg_CO_Effect6Power > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func002C takes nothing returns boolean
    if(not(udg_DamageEventSource == udg_Arct))then
        return false
    endif
    if(not(UnitHasBuffBJ(udg_DamageEventTarget, 0x42303046) == true))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func003C takes nothing returns boolean
    if(not(udg_DamageEventSource == udg_Arct))then
        return false
    endif
    if(not(GetRandomInt(1, 100) <= R2I(udg_ChanceCrit)))then
        return false
    endif
    if(not(GetUnitCurrentOrder(udg_DamageEventSource) != String2OrderIdBJ("blizzard")))then
        return false
    endif
    if(not(GetUnitTypeId(udg_DamageEventSource) != 0x68303045))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func016C takes nothing returns boolean
    if(not(udg_ART[17] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func017Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) <= (3 * udg_ART[21])))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func017C takes nothing returns boolean
    if(not(udg_ART[21] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func018Func017Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) != Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func018Func017A takes nothing returns nothing
    if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func018Func017Func001C())then
        call GroupRemoveUnitSimple(GetEnumUnit(), udg_PoisonGroup)
    else
    endif
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func018C takes nothing returns boolean
    if(not(udg_IG_ItemEnchantInt[2] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func019C takes nothing returns boolean
    if(not(udg_IG_ItemEnchantInt[3] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func020C takes nothing returns boolean
    if(not(udg_IG_ItemEnchantInt[4] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func021Func008C takes nothing returns boolean
    if(not(udg_EnchantCritBool == false))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func021C takes nothing returns boolean
    if(not(udg_IG_ItemEnchantInt[5] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func022Func008Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func022Func008A takes nothing returns nothing
    if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func022Func008Func001C())then
        call UnitDamageTargetBJ(GetLastCreatedUnit(), GetEnumUnit(), udg_DamageEventAmount, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
    else
    endif
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func022C takes nothing returns boolean
    if(not(udg_IG_ItemEnchantInt[6] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015C takes nothing returns boolean
    if(not Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func003C())then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001C takes nothing returns boolean
    if(not(udg_DamageEventSource == udg_Arct))then
        return false
    endif
    if(not(UnitHasBuffBJ(udg_Arct, 0x42303048) == true))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(udg_DamageEventTarget) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002C takes nothing returns boolean
    if(not(GetOwningPlayer(udg_DamageEventTarget) == Player(11)))then
        return false
    endif
    if(not(GetRandomInt(1, 100) <= 10))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func008C takes nothing returns boolean
    if(not(udg_CO_Effect6Power == 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006C takes nothing returns boolean
    if(not Trig_Damage_Effects_Func001Func002Func006Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002C takes nothing returns boolean
    if(not(udg_DamageEventTarget == udg_Arct))then
        return false
    endif
    if(not Trig_Damage_Effects_Func001Func002Func005C())then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func003C takes nothing returns boolean
    if(not(udg_DamageEventTarget == udg_Arct))then
        return false
    endif
    if(not(GetRandomInt(1, 100) <= R2I(udg_ChanceBlock)))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func004C takes nothing returns boolean
    if(not(udg_AS_Effect11 == true))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func008C takes nothing returns boolean
    if(not(udg_ART[15] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001C takes nothing returns boolean
    if(not Trig_Damage_Effects_Func001Func003C())then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Actions takes nothing returns nothing
    if(Trig_Damage_Effects_Func001C())then
        if(Trig_Damage_Effects_Func001Func004C())then
            set udg_AbilityPower = (I2R(udg_CO_Power) + (I2R(udg_CO_Combo) + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true))))
            call UnitDamageTargetBJ(udg_Arct, udg_DamageEventSource, udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
            call AddSpecialEffectTargetUnitBJ("origin", udg_DamageEventSource, "Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
            call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
            call CreateTextTagUnitBJ(("+" + I2S(R2I(udg_AbilityPower))), udg_Arct, 0, 8.00, 0.00, 100.00, 0.00, 0)
            call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
            call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
            call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.70)
            call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.35)
        else
        endif
        set udg_DamageEventAmount = 0.00
        call AddSpecialEffectTargetUnitBJ("chest", udg_DamageEventTarget, "Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        if(Trig_Damage_Effects_Func001Func008C())then
            set udg_Point = GetUnitLoc(udg_Arct)
            set udg_Point2 = PolarProjectionBJ(udg_Point, 200.00, GetRandomDirectionDeg())
            call CreateNUnitsAtLoc(1, 0x48303030, Player(1), udg_Point2, bj_UNIT_FACING)
            call RemoveLocation(udg_Point)
            call RemoveLocation(udg_Point2)
            call SuspendHeroXPBJ(false, GetLastCreatedUnit())
            call UnitApplyTimedLifeBJ(10.00, 0x42544C46, GetLastCreatedUnit())
            call SetUnitLifeBJ(GetLastCreatedUnit(), GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct))
            call UnitAddAbilityBJ(0x416C6F63, GetLastCreatedUnit())
            call UnitRemoveAbilityBJ(0x41303459, GetLastCreatedUnit())
            call ModifyHeroStat(bj_HEROSTAT_STR, GetLastCreatedUnit(), bj_MODIFYMETHOD_ADD, (10 * udg_ART[15]))
            call ModifyHeroStat(bj_HEROSTAT_AGI, GetLastCreatedUnit(), bj_MODIFYMETHOD_ADD, (10 * udg_ART[15]))
            call ModifyHeroStat(bj_HEROSTAT_INT, GetLastCreatedUnit(), bj_MODIFYMETHOD_ADD, (10 * udg_ART[15]))
            call UnitAddItemByIdSwapped(0x4930304C, GetLastCreatedUnit())
            call SetUnitVertexColorBJ(GetLastCreatedUnit(), 50.00, 50.00, 100, 20.00)
        else
        endif
    else
        if(Trig_Damage_Effects_Func001Func001C())then
            set udg_DamageEventAmount = 0.05
        else
        endif
        if(Trig_Damage_Effects_Func001Func002C())then
            set udg_Point = GetUnitLoc(udg_DamageEventTarget)
            call SetTerrainTypeBJ(udg_Point, 0x446C6176, - 1, 1, 0)
            call RemoveLocation(udg_Point)
        else
            if(Trig_Damage_Effects_Func001Func002Func006C())then
                set udg_CO_Effect6Power = (udg_CO_Effect6Power - 1)
                set udg_AbilityPower = (I2R(udg_CO_Power) + I2R(udg_CO_Combo))
                call UnitDamageTargetBJ(udg_Arct, udg_DamageEventTarget, udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
                call AddSpecialEffectTargetUnitBJ("chest", udg_DamageEventTarget, "Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                if(Trig_Damage_Effects_Func001Func002Func006Func008C())then
                    call DestroyEffectBJ(udg_CO_Effect6Sweep[1])
                    call DestroyEffectBJ(udg_CO_Effect6Sweep[2])
                else
                endif
            else
                if(Trig_Damage_Effects_Func001Func002Func006Func002C())then
                    set udg_DamageEventAmount = 0.00
                    call AddSpecialEffectTargetUnitBJ("chest", GetAttackedUnitBJ(), "Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl")
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                else
                    if(Trig_Damage_Effects_Func001Func002Func006Func002Func001C())then
                        if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001C())then
                            set udg_DamageEventAmount = (udg_DamageEventAmount * 3.00)
                            set udg_DamageEventAmountINT = R2I(udg_DamageEventAmount)
                            call TriggerExecute(gg_trg_Crit_Specialeffect)
                            set udg_Point = GetUnitLoc(udg_DamageEventTarget)
                            call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\BloodEX-Small.mdx")
                            call DestroyEffectBJ(GetLastCreatedEffectBJ())
                            call RemoveLocation(udg_Point)
                            call CreateTextTagUnitBJ((I2S(udg_DamageEventAmountINT) + "!"), udg_DamageEventTarget, 0, 12.00, 100.00, 100.00, 0.00, 0.00)
                            call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 125.00, 90.00)
                            call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                            call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.50)
                            call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.00)
                        else
                            if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015C())then
                                set udg_DamageEventAmount = (udg_DamageEventAmount * 3.00)
                                set udg_DamageEventAmountINT = R2I(udg_DamageEventAmount)
                                call TriggerExecute(gg_trg_Crit_Specialeffect)
                                set udg_Point = GetUnitLoc(udg_DamageEventTarget)
                                call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\BloodEX-Small.mdx")
                                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                call RemoveLocation(udg_Point)
                                call CreateTextTagUnitBJ((I2S(udg_DamageEventAmountINT) + "!"), udg_DamageEventTarget, 0, 12.00, 100.00, 100.00, 0.00, 0.00)
                                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 125.00, 90.00)
                                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.50)
                                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.00)
                                if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func016C())then
                                    call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) + (1 * I2R(udg_ART[17]))))
                                else
                                endif
                                if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func017C())then
                                    if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func017Func001C())then
                                        set udg_AS_SeriesNumber = 4
                                        call ConditionalTriggerExecute(gg_trg_Abilities_Effects)
                                    else
                                    endif
                                else
                                endif
                                if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func018C())then
                                    set udg_Point = GetUnitLoc(udg_Arct)
                                    call CreateNUnitsAtLoc(1, 0x68303045, Player(0), udg_Point, bj_UNIT_FACING)
                                    call UnitApplyTimedLifeBJ(0.20, 0x42544C46, GetLastCreatedUnit())
                                    call RemoveLocation(udg_Point)
                                    call UnitAddAbilityBJ(0x41303442, GetLastCreatedUnit())
                                    set udg_Point = GetUnitLoc(udg_DamageEventTarget)
                                    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "breathoffrost", udg_Point)
                                    call RemoveLocation(udg_Point)
                                    set udg_Point = GetUnitLoc(udg_Arct)
                                    set udg_Point2 = PolarProjectionBJ(udg_Point, 200.00, GetUnitFacing(udg_Arct))
                                    call RemoveLocation(udg_Point)
                                    set udg_UnitGroup = GetUnitsInRangeOfLocAll(400.00, udg_Point2)
                                    call RemoveLocation(udg_Point2)
                                    call GroupAddGroup(udg_UnitGroup, udg_PoisonGroup)
                                    call DestroyGroup(udg_UnitGroup)
                                    call ForGroupBJ(udg_PoisonGroup, function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func018Func017A)
                                else
                                endif
                                if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func019C())then
                                    set udg_Point = GetUnitLoc(udg_Arct)
                                    call CreateNUnitsAtLoc(1, 0x68303045, Player(0), udg_Point, bj_UNIT_FACING)
                                    call UnitApplyTimedLifeBJ(0.20, 0x42544C46, GetLastCreatedUnit())
                                    call RemoveLocation(udg_Point)
                                    call UnitAddAbilityBJ(0x41303441, GetLastCreatedUnit())
                                    call IssueTargetOrderBJ(GetLastCreatedUnit(), "slow", udg_DamageEventTarget)
                                    call SetUnitManaBJ(udg_DamageEventTarget, (GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventTarget) - 10.00))
                                    call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) + (I2R(udg_CO_Power) / 3.00)))
                                else
                                endif
                                if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func020C())then
                                    set udg_Point = GetUnitLoc(udg_Arct)
                                    call CreateNUnitsAtLoc(1, 0x68303045, Player(0), udg_Point, bj_UNIT_FACING)
                                    call UnitApplyTimedLifeBJ(0.20, 0x42544C46, GetLastCreatedUnit())
                                    call RemoveLocation(udg_Point)
                                    call UnitAddAbilityBJ(0x41303439, GetLastCreatedUnit())
                                    call IssueTargetOrderBJ(GetLastCreatedUnit(), "faeriefire", udg_DamageEventTarget)
                                    call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + (udg_DamageEventAmount / 2.00)))
                                else
                                endif
                                if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func021C())then
                                    set udg_Point = GetUnitLoc(udg_Arct)
                                    call CreateNUnitsAtLoc(1, 0x68303045, Player(0), udg_Point, bj_UNIT_FACING)
                                    call UnitApplyTimedLifeBJ(0.20, 0x42544C46, GetLastCreatedUnit())
                                    call RemoveLocation(udg_Point)
                                    call UnitAddAbilityBJ(0x41303446, GetLastCreatedUnit())
                                    call IssueTargetOrderBJ(GetLastCreatedUnit(), "thunderbolt", udg_DamageEventTarget)
                                    if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func021Func008C())then
                                        set udg_EnchantCritBool = true
                                        set udg_ChanceCrit = (udg_ChanceCrit + 5.00)
                                        call StartTimerBJ(udg_EnchantCritTimer, false, 5.00)
                                        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
                                    else
                                    endif
                                else
                                endif
                                if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func022C())then
                                    set udg_Point = GetUnitLoc(udg_DamageEventTarget)
                                    set udg_UnitGroup = GetUnitsInRangeOfLocAll(300.00, udg_Point)
                                    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Arcane Nova.mdx")
                                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                    call RemoveLocation(udg_Point)
                                    call GroupRemoveUnitSimple(udg_DamageEventTarget, udg_UnitGroup)
                                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                    call ForGroupBJ(udg_UnitGroup, function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func022Func008A)
                                    call DestroyGroup(udg_UnitGroup)
                                else
                                endif
                            else
                                if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func002C())then
                                    call UnitDamageTargetBJ(udg_DamageEventTarget, udg_DamageEventSource, udg_DamageEventAmount, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
                                else
                                endif
                            endif
                        endif
                    else
                    endif
                endif
            endif
        endif
    endif
endfunction
function InitTrig_Damage_Effects takes nothing returns nothing
    set gg_trg_Damage_Effects = CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Damage_Effects, "udg_DamageModifierEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Damage_Effects, Condition(function Trig_Damage_Effects_Conditions))
    call TriggerAddAction(gg_trg_Damage_Effects, function Trig_Damage_Effects_Actions)
endfunction
function Trig_Unit_Indexer_Func005Func002C takes nothing returns boolean
    if(not(udg_UnitIndexLock[udg_UDex] == 0))then
        return false
    endif
    return true
endfunction
function Trig_Unit_Indexer_Func005C takes nothing returns boolean
    if(not(GetUnitUserData(udg_UDexUnits[udg_UDex]) == 0))then
        return false
    endif
    return true
endfunction
function Trig_Unit_Indexer_Func011Func003C takes nothing returns boolean
    if(not(udg_UDexWasted == 15))then
        return false
    endif
    return true
endfunction
function Trig_Unit_Indexer_Func011Func005C takes nothing returns boolean
    if(not(udg_UDexRecycle == 0))then
        return false
    endif
    return true
endfunction
function Trig_Unit_Indexer_Func011C takes nothing returns boolean
    if(not(udg_UnitIndexerEnabled == true))then
        return false
    endif
    if(not(GetUnitUserData(GetFilterUnit()) == 0))then
        return false
    endif
    return true
endfunction
function Trig_Unit_Indexer_Actions takes nothing returns nothing
    call ExecuteFunc("InitializeUnitIndexer")
endfunction
function ClearUnitIndex takes nothing returns nothing
    if(Trig_Unit_Indexer_Func005C())then
        set udg_UnitIndexLock[udg_UDex] = (udg_UnitIndexLock[udg_UDex] - 1)
        if(Trig_Unit_Indexer_Func005Func002C())then
            set udg_UDexNext[udg_UDexPrev[udg_UDex]] = udg_UDexNext[udg_UDex]
            set udg_UDexPrev[udg_UDexNext[udg_UDex]] = udg_UDexPrev[udg_UDex]
            set udg_UDexPrev[udg_UDex] = 0
            set udg_UnitIndexEvent = 0.00
            set udg_UnitIndexEvent = 2.00
            set udg_UnitIndexEvent = 0.00
            set udg_UDexUnits[udg_UDex] = null
            set udg_UDexNext[udg_UDex] = udg_UDexRecycle
            set udg_UDexRecycle = udg_UDex
        else
        endif
    else
    endif
endfunction
function IndexUnit takes nothing returns boolean
    local integer pdex = udg_UDex
    local integer ndex
    if(Trig_Unit_Indexer_Func011C())then
        set udg_UDexWasted = (udg_UDexWasted + 1)
        if(Trig_Unit_Indexer_Func011Func003C())then
            set udg_UDexWasted = 0
            set udg_UDex = udg_UDexNext[0]
            loop
                exitwhen udg_UDex == 0
                set ndex = udg_UDexNext[udg_UDex]
                call ClearUnitIndex()
                set udg_UDex = ndex
            endloop
        else
        endif
        if(Trig_Unit_Indexer_Func011Func005C())then
            set udg_UDex = (udg_UDexGen + 1)
            set udg_UDexGen = udg_UDex
        else
            set udg_UDex = udg_UDexRecycle
            set udg_UDexRecycle = udg_UDexNext[udg_UDex]
        endif
        set udg_UDexUnits[udg_UDex] = GetFilterUnit()
        call SetUnitUserData(udg_UDexUnits[udg_UDex], udg_UDex)
        set udg_UDexPrev[udg_UDexNext[0]] = udg_UDex
        set udg_UDexNext[udg_UDex] = udg_UDexNext[0]
        set udg_UDexNext[0] = udg_UDex
        set udg_UnitIndexLock[udg_UDex] = 1
        set udg_UnitIndexEvent = 0.00
        set udg_UnitIndexEvent = 1.00
        set udg_UnitIndexEvent = 0.00
        set udg_UDex = pdex
    else
    endif
    return false
endfunction
function InitializeUnitIndexer takes nothing returns nothing
    local integer i = 16
    local boolexpr b = Filter(function IndexUnit)
    local region re = CreateRegion()
    local trigger t = GetTriggeringTrigger()
    local rect r = GetWorldBounds()
    call RegionAddRect(re, r)
    call TriggerRegisterEnterRegion(t, re, b)
    call TriggerClearActions(t)
    call TriggerAddAction(t, function ClearUnitIndex)
    set udg_UnitIndexerEnabled = true
    loop
        set i = i - 1
        call GroupEnumUnitsOfPlayer(bj_lastCreatedGroup, Player(i), b)
        exitwhen i == 0
    endloop
    call RemoveRect(r)
    set re = null
    set r = null
    set t = null
    set b = null
    set udg_UnitIndexEvent = 3.00
    set udg_UnitIndexEvent = 0.00
endfunction
function InitTrig_Unit_Indexer takes nothing returns nothing
    set gg_trg_Unit_Indexer = CreateTrigger()
    call TriggerAddAction(gg_trg_Unit_Indexer, function Trig_Unit_Indexer_Actions)
endfunction
function Trig_Damage_Engine_Func009C takes nothing returns boolean
    if(not(IsUnitType(udg_TempUnit, UNIT_TYPE_STRUCTURE) == false))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func044C takes nothing returns boolean
    if(not(udg_DamageEventAmount == 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func049Func002Func003C takes nothing returns boolean
    if(not(udg_DamageEventExplodesUnit == true))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func049Func002Func008Func004C takes nothing returns boolean
    if(not(udg_DmgEvN == 1))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func049Func002Func008C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_DamageEventTarget) < udg_DmgEvLife))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func049Func002C takes nothing returns boolean
    if(not(udg_DamageEventAmount > udg_DamageEventPrevAmt))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func049C takes nothing returns boolean
    if(not(udg_DamageEventAmount != udg_DamageEventPrevAmt))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func081C takes nothing returns boolean
    if(not(udg_DamageEvent == 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func092Func006Func003Func007C takes nothing returns boolean
    if(not(udg_UnitDamageRegistered[udg_UDex] == true))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func092Func006Func003C takes nothing returns boolean
    if(not(udg_DamageEventsWasted == 15))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func092Func006C takes nothing returns boolean
    if(not(udg_UnitDamageRegistered[udg_UDex] == true))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Func092C takes nothing returns boolean
    if(not(udg_UnitIndexEvent == 1.00))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Engine_Actions takes nothing returns nothing
    set udg_DamageBlockingAbility = 0x41303032
    set udg_DamageTypeSpell = 1
    set udg_DamageTypeDOT = 2
    set udg_DamageTypeRanged = 3
    call ExecuteFunc("InitDamageEvent")
endfunction
function DmgEvFilter takes nothing returns boolean
    if(Trig_Damage_Engine_Func009C())then
        return true
    else
    endif
    return false
endfunction
function DmgEvRemoveAbilities takes nothing returns nothing
    local real r
    loop
        set udg_DmgEvN = (udg_DmgEvN - 1)
        set r = GetWidgetLife(udg_DmgEvStack[udg_DmgEvN])
        call UnitRemoveAbilityBJ(udg_DamageBlockingAbility, udg_DmgEvStack[udg_DmgEvN])
        call SetWidgetLife(udg_DmgEvStack[udg_DmgEvN], r)
        set udg_DmgEvStack[udg_DmgEvN] = null
        exitwhen udg_DmgEvN == 0
    endloop
endfunction
function DmgEvSetVars takes nothing returns nothing
    set udg_DamageEventAmount = GetEventDamage()
    set udg_DamageEventSource = GetEventDamageSource()
    set udg_DamageEventTarget = GetTriggerUnit()
endfunction
function FireDmgEv takes nothing returns nothing
    local boolean b = GetUnitAbilityLevel(udg_DamageEventTarget, udg_DamageBlockingAbility) > 0
    local real life = 0
    local real pain = 0
    if b then
        set life = GetWidgetLife(udg_DamageEventTarget)
        call UnitRemoveAbilityBJ(udg_DamageBlockingAbility, udg_DamageEventTarget)
        call SetWidgetLife(udg_DamageEventTarget, life)
        set pain = GetWidgetLife(udg_DamageEventTarget)
    endif
    set udg_DamageEventPrevAmt = udg_DamageEventAmount
    set udg_DamageEventExplodesUnit = false
    set udg_DamageEventOverride = false
    if(Trig_Damage_Engine_Func044C())then
        set udg_DamageEvent = 2.00
    else
        set udg_DamageModifierEvent = 1.00
        set udg_DamageEvent = 1.00
    endif
    if b then
        call UnitAddAbilityBJ(udg_DamageBlockingAbility, udg_DamageEventTarget)
        call SetWidgetLife(udg_DamageEventTarget, life + GetWidgetLife(udg_DamageEventTarget) - pain)
    endif
    if(Trig_Damage_Engine_Func049C())then
        set udg_DmgEvLife = (GetUnitStateSwap(UNIT_STATE_LIFE, udg_DamageEventTarget) + (udg_DamageEventPrevAmt - udg_DamageEventAmount))
        if(Trig_Damage_Engine_Func049Func002C())then
            call SetUnitLifeBJ(udg_DamageEventTarget, RMaxBJ(0.41, udg_DmgEvLife))
            if udg_DmgEvLife <= .405 then
                if(Trig_Damage_Engine_Func049Func002Func003C())then
                    call SetUnitExplodedBJ(udg_DamageEventTarget, true)
                else
                endif
                call DisableTrigger(udg_DamageEventTrigger)
                call UnitDamageTarget(udg_DamageEventSource, udg_DamageEventTarget, 999, false, false, null, null, null)
                call EnableTrigger(udg_DamageEventTrigger)
            endif
        else
            if(Trig_Damage_Engine_Func049Func002Func008C())then
                call UnitAddAbilityBJ(udg_DamageBlockingAbility, udg_DamageEventTarget)
                set udg_DmgEvStack[udg_DmgEvN] = udg_DamageEventTarget
                set udg_DmgEvN = (udg_DmgEvN + 1)
                if(Trig_Damage_Engine_Func049Func002Func008Func004C())then
                    call TimerStart(udg_DmgEvTimer, 0, false, function DmgEvRemoveAbilities)
                else
                endif
            else
            endif
            call SetUnitLifeBJ(udg_DamageEventTarget, udg_DmgEvLife)
        endif
    else
    endif
endfunction
function FireRecursiveDmgEv takes nothing returns nothing
    local real d = udg_DamageEventAmount
    local unit s = udg_DamageEventSource
    local unit t = udg_DamageEventTarget
    local integer ptype = udg_DmgTypPrev
    local boolean explode = udg_DamageEventExplodesUnit
    local boolean override = udg_DamageEventOverride
    local real prev = udg_DamageEventPrevAmt
    call DmgEvSetVars()
    if udg_DamageEventTarget != t or udg_DamageEventSource != s or udg_DamageEventAmount != d or udg_DamageEventType != ptype then
        set udg_DamageEvent = 0.00
        set udg_DamageModifierEvent = 0.00
        call FireDmgEv()
    else
        call ClearTextMessagesBJ(GetPlayersAll())
        call DisplayTimedTextToForce(GetPlayersAll(), 999.00, "WARNING: Recursion error when dealing damage! Make sure when you deal damage from within a DamageEvent trigger, do it like this:|n|n    Trigger - Turn off DamageEventTrigger|n    Unit - Cause...|n    Trigger - Turn on DamageEventTrigger")
    endif
    set udg_DamageEventOverride = override
    set udg_DamageEventExplodesUnit = explode
    set udg_DamageEventPrevAmt = prev
    set udg_DmgTypPrev = ptype
    set udg_DamageEventAmount = d
    set udg_DamageEventSource = s
    set udg_DamageEventTarget = t
    set s = null
    set t = null
endfunction
function OnDmgEv takes nothing returns boolean
    if(Trig_Damage_Engine_Func081C())then
        set udg_DmgTypPrev = udg_DamageEventType
        call DmgEvSetVars()
        call FireDmgEv()
        set udg_DamageModifierEvent = 0.00
        set udg_DamageEvent = 0.00
        set udg_DamageEventType = 0
    else
        call FireRecursiveDmgEv()
    endif
    return false
endfunction
function CreateDmgEv takes nothing returns nothing
    set udg_DamageEventTrigger = CreateTrigger()
    call TriggerAddCondition(udg_DamageEventTrigger, Filter(function OnDmgEv))
endfunction
function SetupDmgEv takes nothing returns boolean
    local integer pdex = udg_UDex
    if(Trig_Damage_Engine_Func092C())then
        set udg_TempUnit = udg_UDexUnits[udg_UDex]
        if GetUnitAbilityLevel(udg_TempUnit, 0x416C6F63) == 0 and DmgEvFilter()then
            set udg_UnitDamageRegistered[udg_UDex] = true
            call TriggerRegisterUnitEvent(udg_DamageEventTrigger, udg_TempUnit, EVENT_UNIT_DAMAGED)
        endif
    else
        if(Trig_Damage_Engine_Func092Func006C())then
            set udg_UnitDamageRegistered[udg_UDex] = false
            set udg_DamageEventsWasted = (udg_DamageEventsWasted + 1)
            if(Trig_Damage_Engine_Func092Func006Func003C())then
                set udg_DamageEventsWasted = 0
                call DestroyTrigger(udg_DamageEventTrigger)
                call CreateDmgEv()
                set udg_UDex = udg_UDexNext[0]
                loop
                    exitwhen udg_UDex == 0
                    if(Trig_Damage_Engine_Func092Func006Func003Func007C())then
                        call TriggerRegisterUnitEvent(udg_DamageEventTrigger, udg_UDexUnits[udg_UDex], EVENT_UNIT_DAMAGED)
                    else
                    endif
                    set udg_UDex = udg_UDexNext[udg_UDex]
                endloop
                set udg_UDex = pdex
            else
            endif
        else
        endif
    endif
    return false
endfunction
function InitDamageEvent takes nothing returns nothing
    call CreateDmgEv()
    call TriggerAddCondition(GetTriggeringTrigger(), Filter(function SetupDmgEv))
    set udg_UnitIndexerEnabled = false
    set udg_TempUnit = CreateUnit(Player(15), 0x756C6F63, 0, 0, 0)
    set udg_UnitIndexerEnabled = true
    call UnitAddAbilityBJ(udg_DamageBlockingAbility, udg_TempUnit)
    call RemoveUnit(udg_TempUnit)
    call StartTimerBJ(udg_DmgEvTimer, false, 0.00)
    call ConditionalTriggerExecute(GetTriggeringTrigger())
endfunction
function InitTrig_Damage_Engine takes nothing returns nothing
    set gg_trg_Damage_Engine = CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Damage_Engine, "udg_UnitIndexEvent", EQUAL, 1.00)
    call TriggerRegisterVariableEvent(gg_trg_Damage_Engine, "udg_UnitIndexEvent", EQUAL, 2.00)
    call TriggerAddAction(gg_trg_Damage_Engine, function Trig_Damage_Engine_Actions)
endfunction
function Trig_Crit_Specialeffect_Actions takes nothing returns nothing
    call CameraSetEQNoiseForPlayer(Player(0), 3.00)
    call TriggerSleepAction(0.15)
    call CameraClearNoiseForPlayer(Player(0))
endfunction
function InitTrig_Crit_Specialeffect takes nothing returns nothing
    set gg_trg_Crit_Specialeffect = CreateTrigger()
    call TriggerAddAction(gg_trg_Crit_Specialeffect, function Trig_Crit_Specialeffect_Actions)
endfunction
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
function Trig_Augment_Buy_Conditions takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303047))then
        return false
    endif
    return true
endfunction
function Trig_Augment_Buy_Func001Func010Func001Func001C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h012_0013))then
        return false
    endif
    return true
endfunction
function Trig_Augment_Buy_Func001Func010Func001C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h012_0011))then
        return false
    endif
    return true
endfunction
function Trig_Augment_Buy_Func001Func010C takes nothing returns boolean
    if(not(udg_Target == gg_unit_h012_0012))then
        return false
    endif
    return true
endfunction
function Trig_Augment_Buy_Func001C takes nothing returns boolean
    if(not(GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_GOLD) >= udg_AugmentCost[udg_AugmentValue]))then
        return false
    endif
    return true
endfunction
function Trig_Augment_Buy_Actions takes nothing returns nothing
    if(Trig_Augment_Buy_Func001C())then
        set udg_AugmentValue = GetUnitUserData(udg_Target)
        set udg_AugmentLevel[udg_AugmentValue] = (udg_AugmentLevel[udg_AugmentValue] + 1)
        call DestroyTextTagBJ(udg_GiftText[udg_AugmentValue])
        set udg_Point = GetUnitLoc(udg_Target)
        call CreateTextTagLocBJ(I2S(udg_AugmentLevel[udg_AugmentValue]), udg_Point, 150.00, 10, 100, 100, 100, 0)
        call RemoveLocation(udg_Point)
        set udg_GiftText[udg_AugmentValue] = GetLastCreatedTextTag()
        set udg_AugmentPrice = udg_AugmentCost[udg_AugmentValue]
        call ClearTextMessagesBJ(GetPlayersAll())
        if(Trig_Augment_Buy_Func001Func010C())then
            call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
            call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Повышает ловкость на |cFF00D8001|r.")
        else
            if(Trig_Augment_Buy_Func001Func010Func001C())then
                call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Повышает стойкость на |cFF00D8001|r.")
            else
                if(Trig_Augment_Buy_Func001Func010Func001Func001C())then
                    call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                    call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Повышает мудрость на |cFF00D8001|r.")
                else
                endif
            endif
        endif
        set udg_AugmentCost[udg_AugmentValue] = (udg_AugmentCost[udg_AugmentValue] + 10)
        call DisplayTimedTextToForce(GetPlayersAll(), 5.00, ("Стоимость: " + I2S(udg_AugmentCost[udg_AugmentValue])))
        call SetPlayerStateBJ(Player(0), PLAYER_STATE_RESOURCE_GOLD, (GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_GOLD) - udg_AugmentPrice))
    else
        call PlaySoundOnUnitBJ(gg_snd_Error, 100, udg_Target)
    endif
    call AddItemToStockBJ(0x49303047, GetTriggerUnit(), 0, 1)
endfunction
function InitTrig_Augment_Buy takes nothing returns nothing
    set gg_trg_Augment_Buy = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Augment_Buy, EVENT_PLAYER_UNIT_SELL_ITEM)
    call TriggerAddCondition(gg_trg_Augment_Buy, Condition(function Trig_Augment_Buy_Conditions))
    call TriggerAddAction(gg_trg_Augment_Buy, function Trig_Augment_Buy_Actions)
endfunction
function Trig_WhosYourDaddy_Conditions takes nothing returns boolean
    if(not(GetTriggerUnit() == udg_AntiCheatUnit[2]))then
        return false
    endif
    return true
endfunction
function Trig_WhosYourDaddy_Actions takes nothing returns nothing
    call CustomDefeatBJ(Player(0), "Боги наблюдают на тобой.")
endfunction
function InitTrig_WhosYourDaddy takes nothing returns nothing
    set gg_trg_WhosYourDaddy = CreateTrigger()
    call TriggerRegisterPlayerUnitEventSimple(gg_trg_WhosYourDaddy, Player(10), EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_WhosYourDaddy, Condition(function Trig_WhosYourDaddy_Conditions))
    call TriggerAddAction(gg_trg_WhosYourDaddy, function Trig_WhosYourDaddy_Actions)
endfunction
function Trig_GreedIsGood_Conditions takes nothing returns boolean
    if(not(GetPlayerState(Player(10), PLAYER_STATE_RESOURCE_GOLD) > 0))then
        return false
    endif
    return true
endfunction
function Trig_GreedIsGood_Actions takes nothing returns nothing
    call CustomDefeatBJ(Player(0), "Жадность губит твою душу.")
endfunction
function InitTrig_GreedIsGood takes nothing returns nothing
    set gg_trg_GreedIsGood = CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_GreedIsGood, 2.00)
    call TriggerAddCondition(gg_trg_GreedIsGood, Condition(function Trig_GreedIsGood_Conditions))
    call TriggerAddAction(gg_trg_GreedIsGood, function Trig_GreedIsGood_Actions)
endfunction
function Trig_ISeeDeadPeople_Actions takes nothing returns nothing
endfunction
function InitTrig_ISeeDeadPeople takes nothing returns nothing
    set gg_trg_ISeeDeadPeople = CreateTrigger()
    call DisableTrigger(gg_trg_ISeeDeadPeople)
    call TriggerRegisterTimerEventPeriodic(gg_trg_ISeeDeadPeople, 2.00)
    call TriggerAddAction(gg_trg_ISeeDeadPeople, function Trig_ISeeDeadPeople_Actions)
endfunction
function Trig_Camera_Hero_Actions takes nothing returns nothing
    call SetCameraTargetController(udg_Arct, 0, 0, false)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_TARGET_DISTANCE, I2R(udg_CameraDistance), 0.32)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_ANGLE_OF_ATTACK, I2R(udg_CameraAngle), 0.32)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_ROTATION, udg_CameraTurn, 0.32)
endfunction
function InitTrig_Camera_Hero takes nothing returns nothing
    set gg_trg_Camera_Hero = CreateTrigger()
    call DisableTrigger(gg_trg_Camera_Hero)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Camera_Hero, 0.32)
    call TriggerAddAction(gg_trg_Camera_Hero, function Trig_Camera_Hero_Actions)
endfunction
function Trig_Camera_Tree_Actions takes nothing returns nothing
    call PanCameraToTimed(GetLocationX(udg_TargetPoint), GetLocationY(udg_TargetPoint), 0.32)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_TARGET_DISTANCE, I2R(udg_CameraDistance), 0.32)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_ANGLE_OF_ATTACK, I2R(udg_CameraAngle), 0.32)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_ROTATION, 90.00, 0.32)
endfunction
function InitTrig_Camera_Tree takes nothing returns nothing
    set gg_trg_Camera_Tree = CreateTrigger()
    call DisableTrigger(gg_trg_Camera_Tree)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Camera_Tree, 0.04)
    call TriggerAddAction(gg_trg_Camera_Tree, function Trig_Camera_Tree_Actions)
endfunction
function Trig_Camera_Fix_Actions takes nothing returns nothing
    call CameraSetupApplyForceDuration(udg_Camera, true, 0.00)
endfunction
function InitTrig_Camera_Fix takes nothing returns nothing
    set gg_trg_Camera_Fix = CreateTrigger()
    call DisableTrigger(gg_trg_Camera_Fix)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Camera_Fix, 0.04)
    call TriggerAddAction(gg_trg_Camera_Fix, function Trig_Camera_Fix_Actions)
endfunction
function Trig_Camera_Boss_Actions takes nothing returns nothing
    call SetCameraTargetController(udg_Arct, 0, 0, false)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_TARGET_DISTANCE, I2R(udg_CameraDistance), 0.32)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_ANGLE_OF_ATTACK, 316.00, 0.32)
    set udg_Point = GetUnitLoc(udg_Arct)
    set udg_Point2 = GetUnitLoc(udg_EM_BossUnit)
    call SetCameraFieldForPlayer(Player(0), CAMERA_FIELD_ROTATION, AngleBetweenPoints(udg_Point, udg_Point2), 0.32)
    call RemoveLocation(udg_Point)
    call RemoveLocation(udg_Point2)
endfunction
function InitTrig_Camera_Boss takes nothing returns nothing
    set gg_trg_Camera_Boss = CreateTrigger()
    call DisableTrigger(gg_trg_Camera_Boss)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Camera_Boss, 0.04)
    call TriggerAddAction(gg_trg_Camera_Boss, function Trig_Camera_Boss_Actions)
endfunction
function Trig_Camera_Angle_Increase_Func001C takes nothing returns boolean
    if(not(R2I(udg_CameraTurn) < 360))then
        return false
    endif
    return true
endfunction
function Trig_Camera_Angle_Increase_Actions takes nothing returns nothing
    if(Trig_Camera_Angle_Increase_Func001C())then
        set udg_CameraTurn = (udg_CameraTurn + 20.00)
    else
    endif
endfunction
function InitTrig_Camera_Angle_Increase takes nothing returns nothing
    set gg_trg_Camera_Angle_Increase = CreateTrigger()
    call DisableTrigger(gg_trg_Camera_Angle_Increase)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_Camera_Angle_Increase, Player(0), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_RIGHT)
    call TriggerAddAction(gg_trg_Camera_Angle_Increase, function Trig_Camera_Angle_Increase_Actions)
endfunction
function Trig_Camera_Angle_Decrease_Func001C takes nothing returns boolean
    if(not(R2I(udg_CameraTurn) > 0))then
        return false
    endif
    return true
endfunction
function Trig_Camera_Angle_Decrease_Actions takes nothing returns nothing
    if(Trig_Camera_Angle_Decrease_Func001C())then
        set udg_CameraTurn = (udg_CameraTurn - 20.00)
    else
    endif
endfunction
function InitTrig_Camera_Angle_Decrease takes nothing returns nothing
    set gg_trg_Camera_Angle_Decrease = CreateTrigger()
    call DisableTrigger(gg_trg_Camera_Angle_Decrease)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_Camera_Angle_Decrease, Player(0), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_LEFT)
    call TriggerAddAction(gg_trg_Camera_Angle_Decrease, function Trig_Camera_Angle_Decrease_Actions)
endfunction
function Trig_Camera_Increase_Func001C takes nothing returns boolean
    if(not(udg_CameraDistance < udg_CameraMax))then
        return false
    endif
    return true
endfunction
function Trig_Camera_Increase_Actions takes nothing returns nothing
    if(Trig_Camera_Increase_Func001C())then
        set udg_CameraDistance = (udg_CameraDistance + 100)
    else
    endif
endfunction
function InitTrig_Camera_Increase takes nothing returns nothing
    set gg_trg_Camera_Increase = CreateTrigger()
    call DisableTrigger(gg_trg_Camera_Increase)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_Camera_Increase, Player(0), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_DOWN)
    call TriggerAddAction(gg_trg_Camera_Increase, function Trig_Camera_Increase_Actions)
endfunction
function Trig_Camera_Decrease_Func001C takes nothing returns boolean
    if(not(udg_CameraDistance > udg_CameraMin))then
        return false
    endif
    return true
endfunction
function Trig_Camera_Decrease_Actions takes nothing returns nothing
    if(Trig_Camera_Decrease_Func001C())then
        set udg_CameraDistance = (udg_CameraDistance - 100)
    else
    endif
endfunction
function InitTrig_Camera_Decrease takes nothing returns nothing
    set gg_trg_Camera_Decrease = CreateTrigger()
    call DisableTrigger(gg_trg_Camera_Decrease)
    call TriggerRegisterPlayerKeyEventBJ(gg_trg_Camera_Decrease, Player(0), bj_KEYEVENTTYPE_DEPRESS, bj_KEYEVENTKEY_UP)
    call TriggerAddAction(gg_trg_Camera_Decrease, function Trig_Camera_Decrease_Actions)
endfunction
function Trig_Trees_Camera_Off_Func009Func002Func002Func005Func004Func002C takes nothing returns boolean
    if(not(udg_EM_BossCreate[2] == true))then
        return false
    endif
    return true
endfunction
function Trig_Trees_Camera_Off_Func009Func002Func002Func005Func004C takes nothing returns boolean
    if(not(udg_EM_BossCreate[3] == true))then
        return false
    endif
    return true
endfunction
function Trig_Trees_Camera_Off_Func009Func002Func002Func005Func006C takes nothing returns boolean
    if(not(udg_ER_Logic == true))then
        return false
    endif
    return true
endfunction
function Trig_Trees_Camera_Off_Func009Func002Func002Func005C takes nothing returns boolean
    if(not(udg_EM_BossRoom == true))then
        return false
    endif
    return true
endfunction
function Trig_Trees_Camera_Off_Func009Func002Func002C takes nothing returns boolean
    if(not(udg_CS_Bool == true))then
        return false
    endif
    return true
endfunction
function Trig_Trees_Camera_Off_Func009Func002C takes nothing returns boolean
    if(not(udg_OnkieRoom == true))then
        return false
    endif
    return true
endfunction
function Trig_Trees_Camera_Off_Func009C takes nothing returns boolean
    if(not(udg_EnchantingRoom == true))then
        return false
    endif
    return true
endfunction
function Trig_Trees_Camera_Off_Func018C takes nothing returns boolean
    if(not(udg_Tutorial[3] == true))then
        return false
    endif
    return true
endfunction
function Trig_Trees_Camera_Off_Actions takes nothing returns nothing
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 1.50, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
    call CameraSetSmoothingFactorBJ(0.00)
    call SelectUnitSingle(udg_Arct)
    call ClearTextMessagesBJ(GetPlayersAll())
    call DisableTrigger(gg_trg_Camera_Tree)
    call EnableTrigger(gg_trg_Camera_Fix)
    call EnableTrigger(gg_trg_Leave_Hero_Regions)
    call AddUnitAnimationPropertiesBJ(false, "gold", gg_unit_H000_0004)
    if(Trig_Trees_Camera_Off_Func009C())then
        call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Cavern)
        set udg_Point = GetRectCenter(gg_rct_Enchanting_Room_Enter)
        set udg_Camera = gg_cam_Enchanting_Cavern
    else
        if(Trig_Trees_Camera_Off_Func009Func002C())then
            call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Onkie)
            set udg_Point = GetRectCenter(gg_rct_Onkie_Room_Enter)
            set udg_Camera = gg_cam_Onkie_Room
        else
            call SetCameraBoundsToRect(GetPlayableMapRect())
            if(Trig_Trees_Camera_Off_Func009Func002Func002C())then
                call ConditionalTriggerExecute(gg_trg_Coliseum_Start)
                set udg_Point = GetRectCenter(gg_rct_Coliseum_Enter)
                call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 3.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
            else
                if(Trig_Trees_Camera_Off_Func009Func002Func002Func005C())then
                    call SetCameraBoundsToRect(GetPlayableMapRect())
                    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 0.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
                    set udg_Point = GetRectCenter(gg_rct_Boss_Room_Enter)
                    if(Trig_Trees_Camera_Off_Func009Func002Func002Func005Func004C())then
                        call RemoveLocation(udg_Point)
                        set udg_Point = GetRectCenter(gg_rct_Boss_3_Room_Enter)
                        call EnableTrigger(gg_trg_Camera_Boss)
                    else
                        call EnableTrigger(gg_trg_Camera_Hero)
                        if(Trig_Trees_Camera_Off_Func009Func002Func002Func005Func004Func002C())then
                            call RemoveLocation(udg_Point)
                            set udg_Point = GetRectCenter(gg_rct_Boss_2_Room_Enter)
                        else
                        endif
                    endif
                    call DisableTrigger(gg_trg_Camera_Fix)
                else
                    if(Trig_Trees_Camera_Off_Func009Func002Func002Func005Func006C())then
                        set udg_Point = GetRectCenter(gg_rct_Arena_Enter)
                        call EnableTrigger(gg_trg_Camera_Hero)
                        call DisableTrigger(gg_trg_Camera_Fix)
                    else
                        call SetCameraBoundsToRect(gg_rct_Camera_Bound_Portal)
                        set udg_Point = GetRectCenter(gg_rct_Trees_Leave)
                        set udg_Camera = gg_cam_Camera_Portal_Room
                    endif
                endif
            endif
        endif
    endif
    call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
    call SetTerrainFogExBJ(0, 1100.00, 15000.00, 0.50, 0.00, 20.00, 100)
    call SetUnitPositionLoc(udg_Arct, udg_Point)
    call RemoveLocation(udg_Point)
    call CameraSetupApplyForceDuration(udg_Camera, true, 0.00)
    set udg_CameraDistance = 1700
    set udg_CameraAngle = 300
    call TriggerSleepAction(0.10)
    if(Trig_Trees_Camera_Off_Func018C())then
        call ConditionalTriggerExecute(gg_trg_Tutorial02)
    else
    endif
    call DisableTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Trees_Camera_Off takes nothing returns nothing
    set gg_trg_Trees_Camera_Off = CreateTrigger()
    call DisableTrigger(gg_trg_Trees_Camera_Off)
    call TriggerRegisterPlayerEventEndCinematic(gg_trg_Trees_Camera_Off, Player(0))
    call TriggerAddAction(gg_trg_Trees_Camera_Off, function Trig_Trees_Camera_Off_Actions)
endfunction
function Trig_Trees_Choose_ESC_Actions takes nothing returns nothing
    call CameraSetSmoothingFactorBJ(10.00)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 1.50, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
    call ClearTextMessagesBJ(GetPlayersAll())
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call ResetTerrainFogBJ()
    call EnableTrigger(gg_trg_Trees_Camera_Off)
    call DisableTrigger(gg_trg_Camera_Fix)
    set udg_Point = GetRectCenter(gg_rct_Stop_Unit)
    call SetUnitPositionLoc(udg_Arct, udg_Point)
    call RemoveLocation(udg_Point)
    call DisableTrigger(gg_trg_Camera_Increase)
    call DisableTrigger(gg_trg_Camera_Hero)
    call DisableTrigger(gg_trg_Camera_Boss)
    call DisableTrigger(gg_trg_Camera_Fix)
    call DisableTrigger(gg_trg_Camera_Decrease)
    call SetCameraBoundsToRect(gg_rct_Abilities)
    call EnableTrigger(gg_trg_Camera_Tree)
    set udg_Target = gg_unit_h006_0035
    call RemoveLocation(udg_TargetPoint)
    set udg_TargetPoint = GetUnitLoc(udg_Target)
    call DisableTrigger(gg_trg_Leave_Hero_Regions)
    set udg_Camera = gg_cam_Abilities_Tree
    call CameraSetupApplyForceDuration(udg_Camera, true, 0.00)
    call SelectUnitSingle(gg_unit_h006_0035)
    set udg_CameraDistance = 1400
    set udg_CameraAngle = 270
    call TriggerExecute(gg_trg_Trees_Specialeffects)
    call DisableTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Trees_Choose_ESC takes nothing returns nothing
    set gg_trg_Trees_Choose_ESC = CreateTrigger()
    call DisableTrigger(gg_trg_Trees_Choose_ESC)
    call TriggerRegisterPlayerEventEndCinematic(gg_trg_Trees_Choose_ESC, Player(0))
    call TriggerAddAction(gg_trg_Trees_Choose_ESC, function Trig_Trees_Choose_ESC_Actions)
endfunction
function Trig_Enter_Regions_Conditions takes nothing returns boolean
    if(not(GetEnteringUnit() == gg_unit_H000_0004))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Regions_Func007C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region1, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Regions_Func008C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region2, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Regions_Func009C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region10, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Regions_Func010Func003C takes nothing returns boolean
    if(not(udg_TutorialHintsOn == true))then
        return false
    endif
    if(not(udg_TutorialHint[6] == false))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Regions_Func010C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region11, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Regions_Func011Func010C takes nothing returns boolean
    if(not(udg_Tutorial[1] == true))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Regions_Func011C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region9, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Regions_Func012C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region4, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Regions_Func013Func003C takes nothing returns boolean
    if(not(udg_TutorialHintsOn == true))then
        return false
    endif
    if(not(udg_TutorialHint[1] == false))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Regions_Func013C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region5, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Regions_Func014C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region8, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Regions_Func015C takes nothing returns boolean
    if(not(IsUnitInRegion(udg_Region7, gg_unit_H000_0004) == true))then
        return false
    endif
    return true
endfunction
function Trig_Enter_Regions_Func018002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Enter_Regions_Func021002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Enter_Regions_Actions takes nothing returns nothing
    call SetPlayerAbilityAvailableBJ(false, 0x41303138, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303537, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303530, Player(0))
    call DisableTrigger(gg_trg_Artefactorium_Damage)
    call SetTerrainFogExBJ(0, 1100.00, 15000.00, 0.50, 0.00, 20.00, 100)
    call SetUnitManaPercentBJ(udg_Arct, 100)
    if(Trig_Enter_Regions_Func007C())then
        call SetCameraBoundsToRect(gg_rct_Camera_Bound_Meditate)
        call AddUnitAnimationPropertiesBJ(true, "gold", gg_unit_H000_0004)
        set udg_Camera = gg_cam_Camera_Abilities
        call EnableTrigger(gg_trg_Trees_Choose_ESC)
        call DisplayTimedTextToForce(GetPlayersAll(), 5.00, "Чтобы открыть новые умения нажмите ESC.")
    else
    endif
    if(Trig_Enter_Regions_Func008C())then
        call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Workshop_2)
        set udg_Camera = gg_cam_Camera_Workshop_2
    else
    endif
    if(Trig_Enter_Regions_Func009C())then
        call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Workshop)
        set udg_Camera = gg_cam_Camera_Workshop
    else
    endif
    if(Trig_Enter_Regions_Func010C())then
        call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Workshop_1)
        set udg_Camera = gg_cam_Camera_Workshop_1
        if(Trig_Enter_Regions_Func010Func003C())then
            set udg_TutorialHint[6] = true
            call DialogClearBJ(udg_TeleportDialog)
            call DialogSetMessageBJ(udg_TeleportDialog, "Ядро - это магический механизм |nдля раскрытия секретов (талантов),|nдающих Аркту пассивные умения. |nСейчас я раскрою тебе один из них|nи дам необходимые элементы, |nа дальше сам разберёшься. Не|nмаленький уже.")
            call DialogAddButtonBJ(udg_TeleportDialog, "Ничего не понял, но спасибо!")
            call DialogDisplayBJ(true, udg_TeleportDialog, Player(0))
            set udg_Point = GetRectCenter(gg_rct_Workshop_Core)
            call CreateItemLoc(0x49303132, udg_Point)
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 3
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                call CreateItemLoc(0x4930305A, udg_Point)
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 2
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                call CreateItemLoc(0x49303130, udg_Point)
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            call RemoveLocation(udg_Point)
        else
        endif
        call EnableTrigger(gg_trg_Core_Item_Pickup)
        call DisableTrigger(gg_trg_Item_Pickup)
    else
    endif
    if(Trig_Enter_Regions_Func011C())then
        call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
        call SetCameraBoundsToRect(gg_rct_Camera_Bound_Portal)
        set udg_Camera = gg_cam_Camera_Portal_Room
        set udg_Point = GetRectCenter(gg_rct_Room_Portal_Enter)
        call SetUnitPositionLoc(GetEnteringUnit(), udg_Point)
        call RemoveLocation(udg_Point)
        set udg_Point = GetRectCenter(gg_rct_Trees_Leave)
        call SetUnitFacingToFaceLocTimed(GetEnteringUnit(), udg_Point, 0)
        call RemoveLocation(udg_Point)
        if(Trig_Enter_Regions_Func011Func010C())then
            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_8F, "Возле камина Аркт может войти в медитацию в которой может изучить новые навыки. Прямо сейчас у него имеется 1 очко навыка, так что можешь намедитировать что-нибудь новенькое.", bj_TIMETYPE_ADD, 0.00, false)
            set udg_Tutorial[1] = false
        else
        endif
    else
    endif
    if(Trig_Enter_Regions_Func012C())then
        call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
        call SetTerrainFogExBJ(0, 1500.00, 10000.00, 0.50, 0.00, 50.00, 100)
        call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Workshop)
        set udg_Camera = gg_cam_Camera_Workshop
        set udg_Point = GetRectCenter(gg_rct_Room_Workshop_Enter)
        call SetUnitPositionLoc(GetEnteringUnit(), udg_Point)
        call RemoveLocation(udg_Point)
        set udg_Point = GetRectCenter(gg_rct_Training)
        call SetUnitFacingToFaceLocTimed(GetEnteringUnit(), udg_Point, 0)
        call RemoveLocation(udg_Point)
    else
    endif
    if(Trig_Enter_Regions_Func013C())then
        call SetCameraBoundsToRect(gg_rct_Camera_Bound_Gate)
        set udg_Camera = gg_cam_Camera_Portal
        if(Trig_Enter_Regions_Func013Func003C())then
            set udg_TutorialHint[1] = true
            call DialogClearBJ(udg_TeleportDialog)
            call DialogSetMessageBJ(udg_TeleportDialog, "Сложность можно менять в любое|nвремя, но в начале игры менять её |nне советую: сперва привыкни к |nбоевой системе. На лёгком уровне |nсложности монстры не применяют |nумения. И да, за повышение уровня|nАркта после прохождения подземе-|nлий повышается случайная хар-ка.")
            call DialogAddButtonBJ(udg_TeleportDialog, "Понятно, спасибо!")
            call DialogDisplayBJ(true, udg_TeleportDialog, Player(0))
        else
        endif
    else
    endif
    if(Trig_Enter_Regions_Func014C())then
        call SuspendHeroXPBJ(false, udg_Arct)
        call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
        call LeaderboardDisplayBJ(true, udg_CO_ComboBoard)
        call EnablePreSelect(true, true)
        set udg_Target = udg_Arct
        call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Artefactorium)
        set udg_Camera = gg_cam_Camera_Artefactorium
        set udg_Artefactorium = true
        set udg_Point = GetRectCenter(gg_rct_Artefactorium_Enter)
        call SetUnitPositionLoc(GetEnteringUnit(), udg_Point)
        call RemoveLocation(udg_Point)
        set udg_Point = GetRectCenter(gg_rct_Artefactorium_Spawn)
        call SetUnitFacingToFaceLocTimed(GetEnteringUnit(), udg_Point, 0)
        call RemoveLocation(udg_Point)
        call SetPlayerAbilityAvailableBJ(true, 0x41303138, Player(0))
        call SetPlayerAbilityAvailableBJ(true, 0x41303537, Player(0))
        call SetPlayerAbilityAvailableBJ(true, 0x41303530, Player(0))
        call EnableTrigger(gg_trg_Artefactorium_Damage)
    else
    endif
    if(Trig_Enter_Regions_Func015C())then
        call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
        call SetTerrainFogExBJ(0, 1500.00, 10000.00, 0.50, 0.00, 50.00, 100)
        call LeaderboardDisplayBJ(false, udg_CO_ComboBoard)
        call EnablePreSelect(false, false)
        call SetTerrainFogExBJ(0, 500.00, 10000.00, 0.50, 0.00, 50.00, 100)
        call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Workshop_2)
        set udg_Camera = gg_cam_Camera_Workshop_2
        set udg_Artefactorium = false
        set udg_Point = GetRectCenter(gg_rct_Vault_Machinery_Enter)
        call SetUnitPositionLoc(GetEnteringUnit(), udg_Point)
        call RemoveLocation(udg_Point)
        set udg_Point = GetRectCenter(gg_rct_Room_Portal_Enter_2)
        call SetUnitFacingToFaceLocTimed(GetEnteringUnit(), udg_Point, 0)
        call RemoveLocation(udg_Point)
        call DestroyEffectBJ(udg_AR_SealEffect)
        call ClearTextMessagesBJ(GetPlayersAll())
    else
    endif
    call CameraSetupApplyForceDuration(udg_Camera, true, 0.00)
    set udg_UnitGroup = GetUnitsOfPlayerAll(Player(11))
    call ForGroupBJ(udg_UnitGroup, function Trig_Enter_Regions_Func018002)
    call DestroyGroup(udg_UnitGroup)
    set udg_UnitGroup = GetUnitsOfPlayerAll(Player(9))
    call ForGroupBJ(udg_UnitGroup, function Trig_Enter_Regions_Func021002)
    call DestroyGroup(udg_UnitGroup)
endfunction
function InitTrig_Enter_Regions takes nothing returns nothing
    set gg_trg_Enter_Regions = CreateTrigger()
    call DisableTrigger(gg_trg_Enter_Regions)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Training)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Vault_Leave)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Room_Portal_Leave)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Portal)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Artefatorium_Leave)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Artefatorium_Leave_2)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Vault_Machinery_Leave)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Room_Workshop_Leave)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Vault_Machinery)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Workshop_Machinery)
    call TriggerRegisterEnterRectSimple(gg_trg_Enter_Regions, gg_rct_Workshop_Core)
    call TriggerAddCondition(gg_trg_Enter_Regions, Condition(function Trig_Enter_Regions_Conditions))
    call TriggerAddAction(gg_trg_Enter_Regions, function Trig_Enter_Regions_Actions)
endfunction
function Trig_Leave_Hero_Regions_Conditions takes nothing returns boolean
    if(not(GetLeavingUnit() == udg_Arct))then
        return false
    endif
    return true
endfunction
function Trig_Leave_Hero_Regions_Actions takes nothing returns nothing
    call SetCameraBoundsToRect(gg_rct_Camera_Bound_Portal)
    call AddUnitAnimationPropertiesBJ(false, "gold", gg_unit_H000_0004)
    set udg_Camera = gg_cam_Camera_Portal_Room
    call CameraSetupApplyForceDuration(udg_Camera, true, 0.00)
    call DisableTrigger(gg_trg_Trees_Choose_ESC)
endfunction
function InitTrig_Leave_Hero_Regions takes nothing returns nothing
    set gg_trg_Leave_Hero_Regions = CreateTrigger()
    call TriggerRegisterLeaveRectSimple(gg_trg_Leave_Hero_Regions, gg_rct_Training)
    call TriggerRegisterLeaveRectSimple(gg_trg_Leave_Hero_Regions, gg_rct_Portal)
    call TriggerAddCondition(gg_trg_Leave_Hero_Regions, Condition(function Trig_Leave_Hero_Regions_Conditions))
    call TriggerAddAction(gg_trg_Leave_Hero_Regions, function Trig_Leave_Hero_Regions_Actions)
endfunction
function Trig_Leave_Core_Conditions takes nothing returns boolean
    if(not(GetLeavingUnit() == udg_Arct))then
        return false
    endif
    return true
endfunction
function Trig_Leave_Core_Func006C takes nothing returns boolean
    if(not(udg_AutosaveBool == true))then
        return false
    endif
    return true
endfunction
function Trig_Leave_Core_Actions takes nothing returns nothing
    call SetCameraBoundsToRect(gg_rct_Camera_Bounds_Workshop)
    set udg_Camera = gg_cam_Camera_Workshop
    call CameraSetupApplyForceDuration(udg_Camera, true, 0.00)
    call EnableTrigger(gg_trg_Item_Pickup)
    call DisableTrigger(gg_trg_Core_Item_Pickup)
    if(Trig_Leave_Core_Func006C())then
        set udg_AutosaveBool = false
        call EnableTrigger(gg_trg_Core_Autosave)
        set udg_Autosave = GetPlayerState(Player(0), PLAYER_STATE_RESOURCE_GOLD)
        call SetPlayerStateBJ(Player(0), PLAYER_STATE_RESOURCE_GOLD, 15000)
    else
    endif
    call ClearTextMessagesBJ(GetPlayersAll())
endfunction
function InitTrig_Leave_Core takes nothing returns nothing
    set gg_trg_Leave_Core = CreateTrigger()
    call TriggerRegisterLeaveRectSimple(gg_trg_Leave_Core, gg_rct_Workshop_Core)
    call TriggerAddCondition(gg_trg_Leave_Core, Condition(function Trig_Leave_Core_Conditions))
    call TriggerAddAction(gg_trg_Leave_Core, function Trig_Leave_Core_Actions)
endfunction
function Trig_Core_Autosave_Actions takes nothing returns nothing
    call SetPlayerStateBJ(Player(0), PLAYER_STATE_RESOURCE_GOLD, udg_Autosave)
    call ExecuteFunc("Autosave")
    call DisableTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Core_Autosave takes nothing returns nothing
    set gg_trg_Core_Autosave = CreateTrigger()
    call DisableTrigger(gg_trg_Core_Autosave)
    call TriggerRegisterPlayerStateEvent(gg_trg_Core_Autosave, Player(0), PLAYER_STATE_RESOURCE_GOLD, GREATER_THAN_OR_EQUAL, 15000.00)
    call TriggerAddAction(gg_trg_Core_Autosave, function Trig_Core_Autosave_Actions)
endfunction
function Trig_Attributes_Multiboard_Actions takes nothing returns nothing
    call CreateMultiboardBJ(1, 3, "|cFFFFFFFFХарактеристики:|r ")
    set udg_AttributesBoard = GetLastCreatedMultiboard()
    call MultiboardSetItemIconBJ(udg_AttributesBoard, 1, 1, "ReplaceableTextures\\CommandButtons\\BTNArcturus.blp")
    call MultiboardSetItemIconBJ(udg_AttributesBoard, 1, 2, "ReplaceableTextures\\CommandButtons\\PASSkill20.blp")
    call MultiboardSetItemIconBJ(udg_AttributesBoard, 1, 3, "ReplaceableTextures\\CommandButtons\\PASSkill4.blp")
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 3
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call MultiboardSetItemWidthBJ(udg_AttributesBoard, 1, bj_forLoopAIndex, 12.00)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 1, ("Очки навыков: " + I2S(udg_AS_Points)))
    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
endfunction
function InitTrig_Attributes_Multiboard takes nothing returns nothing
    set gg_trg_Attributes_Multiboard = CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg_Attributes_Multiboard, 3.00)
    call TriggerAddAction(gg_trg_Attributes_Multiboard, function Trig_Attributes_Multiboard_Actions)
endfunction
function Trig_Hero_Levelup_Actions takes nothing returns nothing
    set udg_EX_LevelUp = (udg_EX_LevelUp + 1)
    call AddSpecialEffectTargetUnitBJ("origin", GetTriggerUnit(), "war3mapImported\\Holy_Retribution.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call SetUnitManaPercentBJ(GetTriggerUnit(), 100)
    call SetUnitLifePercentBJ(GetTriggerUnit(), 100)
endfunction
function InitTrig_Hero_Levelup takes nothing returns nothing
    set gg_trg_Hero_Levelup = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Hero_Levelup, gg_unit_H000_0004, EVENT_UNIT_HERO_LEVEL)
    call TriggerAddAction(gg_trg_Hero_Levelup, function Trig_Hero_Levelup_Actions)
endfunction
function Trig_Dummy_Remove_Func002C takes nothing returns boolean
    if((GetUnitTypeId(GetTriggerUnit()) == 0x68303039))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x68303045))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x68303034))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x68303133))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x68303134))then
        return true
    endif
    if((GetUnitTypeId(GetTriggerUnit()) == 0x68303035))then
        return true
    endif
    return false
endfunction
function Trig_Dummy_Remove_Conditions takes nothing returns boolean
    if(not Trig_Dummy_Remove_Func002C())then
        return false
    endif
    return true
endfunction
function Trig_Dummy_Remove_Actions takes nothing returns nothing
    call RemoveUnit(GetTriggerUnit())
endfunction
function InitTrig_Dummy_Remove takes nothing returns nothing
    set gg_trg_Dummy_Remove = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Dummy_Remove, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Dummy_Remove, Condition(function Trig_Dummy_Remove_Conditions))
    call TriggerAddAction(gg_trg_Dummy_Remove, function Trig_Dummy_Remove_Actions)
endfunction
function Trig_Music_Edemium_Func004Func002Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Music_Edemium_Func004Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Music_Edemium_Func004C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Music_Edemium_Actions takes nothing returns nothing
    call StopMusicBJ(false)
    call ClearMapMusicBJ()
    set udg_RandomNumber = GetRandomInt(1, 4)
    if(Trig_Music_Edemium_Func004C())then
        call PlayMusic((("/Edemium/MusicEdemium1.mp3")))
    else
        if(Trig_Music_Edemium_Func004Func002C())then
            call PlayMusic((("/Edemium/MusicEdemium2.mp3")))
        else
            if(Trig_Music_Edemium_Func004Func002Func001C())then
                call PlayMusic((("/Edemium/MusicEdemium3.mp3")))
            else
                call PlayMusic((("/Edemium/MusicEdemium4.mp3")))
            endif
        endif
    endif
endfunction
function InitTrig_Music_Edemium takes nothing returns nothing
    set gg_trg_Music_Edemium = CreateTrigger()
    call TriggerAddAction(gg_trg_Music_Edemium, function Trig_Music_Edemium_Actions)
endfunction
function Trig_Music_Castle_Func004Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Music_Castle_Func004Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Music_Castle_Func004C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Music_Castle_Actions takes nothing returns nothing
    call StopMusicBJ(false)
    call ClearMapMusicBJ()
    set udg_RandomNumber = GetRandomInt(1, 4)
    if(Trig_Music_Castle_Func004C())then
        call PlayMusic((("/Edemium/MusicCastle1.mp3")))
    else
        if(Trig_Music_Castle_Func004Func001C())then
            call PlayMusic((("/Edemium/MusicCastle2.mp3")))
        else
            if(Trig_Music_Castle_Func004Func001Func001C())then
                call PlayMusic((("/Edemium/MusicCastle3.mp3")))
            else
                call PlayMusic((("/Edemium/MusicCastle4.mp3")))
            endif
        endif
    endif
endfunction
function InitTrig_Music_Castle takes nothing returns nothing
    set gg_trg_Music_Castle = CreateTrigger()
    call TriggerAddAction(gg_trg_Music_Castle, function Trig_Music_Castle_Actions)
endfunction
function Trig_Trees_Specialeffects_Actions takes nothing returns nothing
    call TriggerSleepAction(0.05)
    call AddSpecialEffectTargetUnitBJ("chest", gg_unit_h001_0037, "Stomp.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
endfunction
function InitTrig_Trees_Specialeffects takes nothing returns nothing
    set gg_trg_Trees_Specialeffects = CreateTrigger()
    call TriggerAddAction(gg_trg_Trees_Specialeffects, function Trig_Trees_Specialeffects_Actions)
endfunction
function Trig_Tile_Damage_Func002Func003C takes nothing returns boolean
    if(not(GetTerrainTypeBJ(udg_Point) == 0x446C6176))then
        return false
    endif
    return true
endfunction
function Trig_Tile_Damage_Func002C takes nothing returns boolean
    if(not(UnitHasBuffBJ(udg_Arct, 0x42486473) == false))then
        return false
    endif
    if(not(GetTerrainTypeBJ(udg_Point) == 0x43706F73))then
        return false
    endif
    return true
endfunction
function Trig_Tile_Damage_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(udg_Arct)
    if(Trig_Tile_Damage_Func002C())then
        set udg_AbilityPower = 15.00
        set udg_AbilityPower = (udg_AbilityPower * I2R(udg_Difficulty))
        call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) - udg_AbilityPower))
        call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "Abilities\\Weapons\\snapMissile\\snapMissile.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
    else
        if(Trig_Tile_Damage_Func002Func003C())then
            set udg_AbilityPower = 25.00
            set udg_AbilityPower = (udg_AbilityPower * I2R(udg_Difficulty))
            call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) - udg_AbilityPower))
            call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "Abilities\\Weapons\\LavaSpawnMissile\\LavaSpawnMissile.mdl")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
        else
        endif
    endif
    call RemoveLocation(udg_Point)
endfunction
function InitTrig_Tile_Damage takes nothing returns nothing
    set gg_trg_Tile_Damage = CreateTrigger()
    call DisableTrigger(gg_trg_Tile_Damage)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Tile_Damage, 0.75)
    call TriggerAddAction(gg_trg_Tile_Damage, function Trig_Tile_Damage_Actions)
endfunction
function Trig_Fade_Loop_Func001Func005C takes nothing returns boolean
    if(not(udg_TempBool == true))then
        return false
    endif
    return true
endfunction
function Trig_Fade_Loop_Func001Func006Func004001001 takes nothing returns boolean
    return(udg_TempBool == true)
endfunction
function Trig_Fade_Loop_Func001Func006Func004001002 takes nothing returns boolean
    return(LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash) <= LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeEnd"), udg_FadeSystemHash))
endfunction
function Trig_Fade_Loop_Func001Func006Func004001 takes nothing returns boolean
    return GetBooleanAnd(Trig_Fade_Loop_Func001Func006Func004001001(), Trig_Fade_Loop_Func001Func006Func004001002())
endfunction
function Trig_Fade_Loop_Func001Func006Func004002001 takes nothing returns boolean
    return(udg_TempBool == false)
endfunction
function Trig_Fade_Loop_Func001Func006Func004002002 takes nothing returns boolean
    return(LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash) >= LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeEnd"), udg_FadeSystemHash))
endfunction
function Trig_Fade_Loop_Func001Func006Func004002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Fade_Loop_Func001Func006Func004002001(), Trig_Fade_Loop_Func001Func006Func004002002())
endfunction
function Trig_Fade_Loop_Func001Func006C takes nothing returns boolean
    if(not GetBooleanOr(Trig_Fade_Loop_Func001Func006Func004001(), Trig_Fade_Loop_Func001Func006Func004002()))then
        return false
    endif
    return true
endfunction
function Trig_Fade_Loop_Func001A takes nothing returns nothing
    set udg_TempUnit = GetEnumUnit()
    set udg_FadeUnitKey = GetHandleId(udg_TempUnit)
    set udg_TempBool = LoadBooleanBJ(udg_FadeUnitKey, StringHashBJ("FadeIn"), udg_FadeSystemHash)
    call SetUnitVertexColorBJ(udg_TempUnit, 100.00, 100.00, 100.00, LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash))
    if(Trig_Fade_Loop_Func001Func005C())then
        call SaveRealBJ((LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash) - LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeSpeed"), udg_FadeSystemHash)), udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash)
    else
        call SaveRealBJ((LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash) + LoadRealBJ(udg_FadeUnitKey, StringHashBJ("FadeSpeed"), udg_FadeSystemHash)), udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash)
    endif
    if(Trig_Fade_Loop_Func001Func006C())then
        call GroupRemoveUnitSimple(udg_TempUnit, udg_FadeSystemGroup)
        call RemoveUnit(udg_TempUnit)
        call FlushChildHashtableBJ(udg_FadeUnitKey, udg_FadeSystemHash)
    else
    endif
endfunction
function Trig_Fade_Loop_Func002C takes nothing returns boolean
    if(not(CountUnitsInGroup(udg_FadeSystemGroup) == 0))then
        return false
    endif
    return true
endfunction
function Trig_Fade_Loop_Actions takes nothing returns nothing
    call ForGroupBJ(udg_FadeSystemGroup, function Trig_Fade_Loop_Func001A)
    if(Trig_Fade_Loop_Func002C())then
        call DisableTrigger(GetTriggeringTrigger())
    else
    endif
endfunction
function InitTrig_Fade_Loop takes nothing returns nothing
    set gg_trg_Fade_Loop = CreateTrigger()
    call DisableTrigger(gg_trg_Fade_Loop)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Fade_Loop, 0.05)
    call TriggerAddAction(gg_trg_Fade_Loop, function Trig_Fade_Loop_Actions)
endfunction
function Trig_Edemium_Transparent_Func004C takes nothing returns boolean
    if(not(udg_Transparent <= 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Edemium_Transparent_Actions takes nothing returns nothing
    set udg_Transparent = (udg_Transparent - 4.00)
    call SetUnitVertexColorBJ(udg_Arct, 100, 100, 100, udg_Transparent)
    if(Trig_Edemium_Transparent_Func004C())then
        call DisableTrigger(GetTriggeringTrigger())
    else
    endif
endfunction
function InitTrig_Edemium_Transparent takes nothing returns nothing
    set gg_trg_Edemium_Transparent = CreateTrigger()
    call DisableTrigger(gg_trg_Edemium_Transparent)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Edemium_Transparent, 0.10)
    call TriggerAddAction(gg_trg_Edemium_Transparent, function Trig_Edemium_Transparent_Actions)
endfunction
function Trig_Follower_Movement_Func001Func001Func003C takes nothing returns boolean
    if(not(DistanceBetweenPoints(udg_Point, udg_Point2) >= 400.00))then
        return false
    endif
    return true
endfunction
function Trig_Follower_Movement_Func001Func001C takes nothing returns boolean
    if(not(CountUnitsInGroup(udg_FollowersGroup) > 0))then
        return false
    endif
    return true
endfunction
function Trig_Follower_Movement_Func001A takes nothing returns nothing
    if(Trig_Follower_Movement_Func001Func001C())then
        set udg_Point = GetUnitLoc(udg_Arct)
        set udg_Point2 = GetUnitLoc(GetEnumUnit())
        if(Trig_Follower_Movement_Func001Func001Func003C())then
            call RemoveLocation(udg_Point2)
            set udg_Point2 = OffsetLocation(udg_Point, GetRandomReal(120.00, 150.00), GetRandomReal(50.00, 100.00))
            call IssuePointOrderLoc(GetEnumUnit(), "attack", udg_Point2)
        else
        endif
        call RemoveLocation(udg_Point)
        call RemoveLocation(udg_Point2)
    else
    endif
endfunction
function Trig_Follower_Movement_Actions takes nothing returns nothing
    call ForGroupBJ(udg_FollowersGroup, function Trig_Follower_Movement_Func001A)
endfunction
function InitTrig_Follower_Movement takes nothing returns nothing
    set gg_trg_Follower_Movement = CreateTrigger()
    call DisableTrigger(gg_trg_Follower_Movement)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Follower_Movement, 1.00)
    call TriggerAddAction(gg_trg_Follower_Movement, function Trig_Follower_Movement_Actions)
endfunction
function Trig_Follower_Dies_Conditions takes nothing returns boolean
    if(not(IsUnitInGroup(GetTriggerUnit(), udg_FollowersGroup) == true))then
        return false
    endif
    return true
endfunction
function Trig_Follower_Dies_Actions takes nothing returns nothing
    call GroupRemoveUnitSimple(GetTriggerUnit(), udg_FollowersGroup)
endfunction
function InitTrig_Follower_Dies takes nothing returns nothing
    set gg_trg_Follower_Dies = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Follower_Dies, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Follower_Dies, Condition(function Trig_Follower_Dies_Conditions))
    call TriggerAddAction(gg_trg_Follower_Dies, function Trig_Follower_Dies_Actions)
endfunction
function Trig_Item_Disperse_Func017C takes nothing returns boolean
    if((GetItemType(GetSpellTargetItem()) == ITEM_TYPE_CHARGED))then
        return true
    endif
    if((GetItemType(GetSpellTargetItem()) == ITEM_TYPE_ARTIFACT))then
        return true
    endif
    return false
endfunction
function Trig_Item_Disperse_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303349))then
        return false
    endif
    if(not Trig_Item_Disperse_Func017C())then
        return false
    endif
    return true
endfunction
function Trig_Item_Disperse_Func002Func001C takes nothing returns boolean
    if(not(GetItemLevel(GetSpellTargetItem()) == 4))then
        return false
    endif
    return true
endfunction
function Trig_Item_Disperse_Func002C takes nothing returns boolean
    if(not(GetItemType(GetSpellTargetItem()) == ITEM_TYPE_CHARGED))then
        return false
    endif
    return true
endfunction
function Trig_Item_Disperse_Actions takes nothing returns nothing
    local integer price
    if(Trig_Item_Disperse_Func002C())then
        if(Trig_Item_Disperse_Func002Func001C())then
            set price = (S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 1, 1)) + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 2, 2)) + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 3, 3)))
            set price = (price + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 4, 4)) + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 5, 5)) + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 6, 6)))
            set price = (price + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 7, 7)) + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 8, 8)))
            set price = (price + (3 * udg_ART[6]))
            call AdjustPlayerStateBJ(price, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD)
            call CreateTextTagUnitBJ(("+" + I2S(price)), udg_Arct, 0, 12.00, 100.00, 100.00, 0.00, 0.00)
        else
            set price = (S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 1, 1)) + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 2, 2)) + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 3, 3)))
            set price = (price + S2I(SubStringBJ(I2S(GetItemUserData(GetSpellTargetItem())), 4, 4)))
            set price = (price + (3 * udg_ART[6]))
            call AdjustPlayerStateBJ(price, GetOwningPlayer(GetSpellAbilityUnit()), PLAYER_STATE_RESOURCE_GOLD)
            call CreateTextTagUnitBJ(("+" + I2S(price)), udg_Arct, 0, 12.00, 100.00, 100.00, 0.00, 0.00)
        endif
    else
    endif
    set udg_QG_Count[6] = (udg_QG_Count[6] + 1)
    call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
    call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 75.00, 90.00)
    call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
    call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.50)
    call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.00)
    set udg_Point = GetItemLoc(GetSpellTargetItem())
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Heal_Small.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call RemoveLocation(udg_Point)
    call RemoveItem(GetSpellTargetItem())
endfunction
function InitTrig_Item_Disperse takes nothing returns nothing
    set gg_trg_Item_Disperse = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Item_Disperse, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Item_Disperse, Condition(function Trig_Item_Disperse_Conditions))
    call TriggerAddAction(gg_trg_Item_Disperse, function Trig_Item_Disperse_Actions)
endfunction
function Trig_Item_Pickup_Func001Func001Func001Func001C takes nothing returns boolean
    if(not(GetItemType(GetManipulatedItem()) == ITEM_TYPE_POWERUP))then
        return false
    endif
    return true
endfunction
function Trig_Item_Pickup_Func001Func001Func001C takes nothing returns boolean
    if(not(GetItemType(GetManipulatedItem()) == ITEM_TYPE_PURCHASABLE))then
        return false
    endif
    return true
endfunction
function Trig_Item_Pickup_Func001Func001C takes nothing returns boolean
    if(not(GetItemType(GetManipulatedItem()) == ITEM_TYPE_CAMPAIGN))then
        return false
    endif
    return true
endfunction
function Trig_Item_Pickup_Func001C takes nothing returns boolean
    if(not(GetItemTypeId(GetManipulatedItem()) == 0x4930304D))then
        return false
    endif
    return true
endfunction
function Trig_Item_Pickup_Actions takes nothing returns nothing
    if(Trig_Item_Pickup_Func001C())then
        call AdjustPlayerStateBJ(1, Player(0), PLAYER_STATE_RESOURCE_LUMBER)
        call RemoveItem(GetManipulatedItem())
    else
        if(Trig_Item_Pickup_Func001Func001C())then
            set udg_CC_Ingredient[GetItemLevel(GetManipulatedItem())] = (udg_CC_Ingredient[GetItemLevel(GetManipulatedItem())] + 1)
            call RemoveItem(GetManipulatedItem())
        else
            if(Trig_Item_Pickup_Func001Func001Func001C())then
                call ShowUnitShow(udg_CC_SecretUnit[GetItemLevel(GetManipulatedItem())])
                set udg_CC_SecretUnlocked[GetItemLevel(GetManipulatedItem())] = true
                call RemoveItem(GetManipulatedItem())
                call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Human\\Slow\\SlowCaster.mdl")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                call AddSpecialEffectTargetUnitBJ("overhead", gg_unit_H000_0004, "war3mapImported\\SoundEffect3.mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                call CreateTextTagUnitBJ("Секрет раскрыт!", udg_Arct, 0, 11.00, 100.00, 100.00, 100.00, 0)
                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.50)
                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
            else
                if(Trig_Item_Pickup_Func001Func001Func001Func001C())then
                    call RemoveItem(GetManipulatedItem())
                else
                endif
            endif
        endif
    endif
endfunction
function InitTrig_Item_Pickup takes nothing returns nothing
    set gg_trg_Item_Pickup = CreateTrigger()
    call DisableTrigger(gg_trg_Item_Pickup)
    call TriggerRegisterUnitEvent(gg_trg_Item_Pickup, gg_unit_H000_0004, EVENT_UNIT_PICKUP_ITEM)
    call TriggerAddAction(gg_trg_Item_Pickup, function Trig_Item_Pickup_Actions)
endfunction
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
            else
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
                else
                endif
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        else
        endif
    else
        if(Trig_Item_Type_System_Func004Func001C())then
            set udg_ItemInt = 0
            set udg_Slot_Integer = 1
            loop
                exitwhen udg_Slot_Integer > 6
                if(Trig_Item_Type_System_Func004Func001Func003Func001C())then
                    set udg_ItemInt = (udg_ItemInt + 1)
                else
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
                    else
                    endif
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
            else
            endif
        else
            if(Trig_Item_Type_System_Func004Func001Func001C())then
                set udg_ItemInt = 0
                set udg_Slot_Integer = 1
                loop
                    exitwhen udg_Slot_Integer > 6
                    if(Trig_Item_Type_System_Func004Func001Func001Func003Func001C())then
                        set udg_ItemInt = (udg_ItemInt + 1)
                    else
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
                        else
                        endif
                        set bj_forLoopAIndex = bj_forLoopAIndex + 1
                    endloop
                else
                endif
            else
                if(Trig_Item_Type_System_Func004Func001Func001Func001C())then
                    set udg_ItemInt = 0
                    set udg_Slot_Integer = 1
                    loop
                        exitwhen udg_Slot_Integer > 6
                        if(Trig_Item_Type_System_Func004Func001Func001Func001Func002Func001C())then
                            set udg_ItemInt = (udg_ItemInt + 1)
                        else
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
                            else
                            endif
                            set bj_forLoopAIndex = bj_forLoopAIndex + 1
                        endloop
                    else
                    endif
                else
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
function Trig_Onkie_Sells_Func001Func001Func001C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303057))then
        return false
    endif
    return true
endfunction
function Trig_Onkie_Sells_Func001Func001C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303056))then
        return false
    endif
    return true
endfunction
function Trig_Onkie_Sells_Func001C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303156))then
        return false
    endif
    return true
endfunction
function Trig_Onkie_Sells_Func002Func003Func003C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303053))then
        return false
    endif
    return true
endfunction
function Trig_Onkie_Sells_Func002Func003C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303052))then
        return false
    endif
    return true
endfunction
function Trig_Onkie_Sells_Func002C takes nothing returns boolean
    if(not(GetItemTypeId(GetSoldItem()) == 0x49303051))then
        return false
    endif
    return true
endfunction
function Trig_Onkie_Sells_Actions takes nothing returns nothing
    if(Trig_Onkie_Sells_Func001C())then
        set udg_IG_ItemQuality = 1
        set udg_IG_Point = GetUnitLoc(udg_Arct)
        call ConditionalTriggerExecute(gg_trg_IG_Generate)
    else
        if(Trig_Onkie_Sells_Func001Func001C())then
            set udg_IG_ItemQuality = 2
            set udg_IG_Point = GetUnitLoc(udg_Arct)
            call ConditionalTriggerExecute(gg_trg_IG_Generate)
        else
            if(Trig_Onkie_Sells_Func001Func001Func001C())then
                set udg_IG_ItemQuality = 3
                set udg_IG_Point = GetUnitLoc(udg_Arct)
                call ConditionalTriggerExecute(gg_trg_IG_Generate)
            else
            endif
        endif
    endif
    if(Trig_Onkie_Sells_Func002C())then
        set udg_IG_Point = GetUnitLoc(udg_Arct)
        call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(1, 3)], udg_IG_Point)
    else
        if(Trig_Onkie_Sells_Func002Func003C())then
            set udg_IG_Point = GetUnitLoc(udg_Arct)
            call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(4, 5)], udg_IG_Point)
        else
            if(Trig_Onkie_Sells_Func002Func003Func003C())then
                set udg_IG_Point = GetUnitLoc(udg_Arct)
                call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(6, 9)], udg_IG_Point)
            else
            endif
        endif
    endif
    call RemoveLocation(udg_IG_Point)
endfunction
function InitTrig_Onkie_Sells takes nothing returns nothing
    set gg_trg_Onkie_Sells = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Onkie_Sells, gg_unit_n009_0061, EVENT_UNIT_SELL_ITEM)
    call TriggerAddAction(gg_trg_Onkie_Sells, function Trig_Onkie_Sells_Actions)
endfunction
function Trig_Onkie_List_Func004C takes nothing returns boolean
    if(not(udg_CC_SecretUnlocked[udg_RandomNumber] == false))then
        return false
    endif
    return true
endfunction
function Trig_Onkie_List_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 20
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call RemoveItemFromStockBJ(udg_SecretsList[bj_forLoopAIndex], gg_unit_n009_0061)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_RandomNumber = GetRandomInt(1, 20)
    if(Trig_Onkie_List_Func004C())then
        call AddItemToStockBJ(udg_SecretsList[udg_RandomNumber], gg_unit_n009_0061, 1, 1)
    else
    endif
endfunction
function InitTrig_Onkie_List takes nothing returns nothing
    set gg_trg_Onkie_List = CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_Onkie_List, 300.00)
    call TriggerAddAction(gg_trg_Onkie_List, function Trig_Onkie_List_Actions)
endfunction
function Trig_Poison_Damage_Func001A takes nothing returns nothing
    call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), I2R(udg_CO_Power), ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
endfunction
function Trig_Poison_Damage_Actions takes nothing returns nothing
    call ForGroupBJ(udg_PoisonGroup, function Trig_Poison_Damage_Func001A)
endfunction
function InitTrig_Poison_Damage takes nothing returns nothing
    set gg_trg_Poison_Damage = CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_Poison_Damage, 1.00)
    call TriggerAddAction(gg_trg_Poison_Damage, function Trig_Poison_Damage_Actions)
endfunction
function Trig_Poison_Timer_Actions takes nothing returns nothing
    call DestroyGroup(udg_PoisonGroup)
    call DisableTrigger(gg_trg_Poison_Damage)
endfunction
function InitTrig_Poison_Timer takes nothing returns nothing
    set gg_trg_Poison_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Poison_Timer, udg_PoisonTimer)
    call TriggerAddAction(gg_trg_Poison_Timer, function Trig_Poison_Timer_Actions)
endfunction
function Trig_Magic_Timer_Actions takes nothing returns nothing
    set udg_ChanceCrit = (udg_ChanceCrit - 5.00)
    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
    set udg_EnchantCritBool = false
endfunction
function InitTrig_Magic_Timer takes nothing returns nothing
    set gg_trg_Magic_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Magic_Timer, udg_EnchantCritTimer)
    call TriggerAddAction(gg_trg_Magic_Timer, function Trig_Magic_Timer_Actions)
endfunction
function Trig_Scroll_Pickup_Func001Func001Func001C takes nothing returns boolean
    if(not(GetItemTypeId(GetManipulatedItem()) == 0x49303143))then
        return false
    endif
    return true
endfunction
function Trig_Scroll_Pickup_Func001Func001C takes nothing returns boolean
    if(not(GetItemTypeId(GetManipulatedItem()) == 0x49303131))then
        return false
    endif
    return true
endfunction
function Trig_Scroll_Pickup_Func001C takes nothing returns boolean
    if(not(GetItemTypeId(GetManipulatedItem()) == 0x49303055))then
        return false
    endif
    return true
endfunction
function Trig_Scroll_Pickup_Actions takes nothing returns nothing
    if(Trig_Scroll_Pickup_Func001C())then
        call UnitAddAbilityBJ(0x41303648, GetTriggerUnit())
        call IssueTargetOrderBJ(GetTriggerUnit(), "lightningshield", GetTriggerUnit())
        call RemoveItem(GetManipulatedItem())
    else
        if(Trig_Scroll_Pickup_Func001Func001C())then
            call UnitAddAbilityBJ(0x41303645, GetTriggerUnit())
            call IssueTargetOrderBJ(GetTriggerUnit(), "unholyfrenzy", GetTriggerUnit())
            call RemoveItem(GetManipulatedItem())
        else
            if(Trig_Scroll_Pickup_Func001Func001Func001C())then
                call UnitAddAbilityBJ(0x41303646, GetTriggerUnit())
                call IssueTargetOrderBJ(GetTriggerUnit(), "bloodlust", GetTriggerUnit())
                call StartTimerBJ(udg_ScrollTimer, false, 40.00)
                call EnableTrigger(gg_trg_Scroll_Periodic)
                call RemoveItem(GetManipulatedItem())
            else
            endif
        endif
    endif
endfunction
function InitTrig_Scroll_Pickup takes nothing returns nothing
    set gg_trg_Scroll_Pickup = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Scroll_Pickup, gg_unit_H000_0004, EVENT_UNIT_PICKUP_ITEM)
    call TriggerAddAction(gg_trg_Scroll_Pickup, function Trig_Scroll_Pickup_Actions)
endfunction
function Trig_Scroll_Timer_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Scroll_Periodic)
endfunction
function InitTrig_Scroll_Timer takes nothing returns nothing
    set gg_trg_Scroll_Timer = CreateTrigger()
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Scroll_Timer, udg_ScrollTimer)
    call TriggerAddAction(gg_trg_Scroll_Timer, function Trig_Scroll_Timer_Actions)
endfunction
function Trig_Scroll_Periodic_Func017Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Scroll_Periodic_Func017A takes nothing returns nothing
    if(Trig_Scroll_Periodic_Func017Func001C())then
        set udg_AbilityPower = ((I2R(udg_CO_Power) * 1.00) + I2R(udg_CO_Combo))
        set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))
        set udg_AbilityPower = (udg_AbilityPower * 3.00)
        call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        set udg_CO_Point = GetUnitLoc(GetEnumUnit())
        call AddSpecialEffectLocBJ(udg_CO_Point, "war3mapImported\\Blue Lightning.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call RemoveLocation(udg_CO_Point)
    else
    endif
endfunction
function Trig_Scroll_Periodic_Actions takes nothing returns nothing
    set udg_CO_Point = GetUnitLoc(udg_Arct)
    set udg_CO_UnitGroup = GetUnitsInRangeOfLocAll(400.00, udg_CO_Point)
    call RemoveLocation(udg_CO_Point)
    set udg_CO_UnitGroup2 = GetUnitsOfPlayerAll(Player(0))
    call GroupRemoveGroup(udg_CO_UnitGroup2, udg_CO_UnitGroup)
    call DestroyGroup(udg_CO_UnitGroup2)
    set udg_CO_UnitGroup2 = GetUnitsOfPlayerAll(Player(1))
    call GroupRemoveGroup(udg_CO_UnitGroup2, udg_CO_UnitGroup)
    call DestroyGroup(udg_CO_UnitGroup2)
    set udg_CO_UnitGroup2 = GetUnitsOfPlayerAll(Player(9))
    call GroupRemoveGroup(udg_CO_UnitGroup2, udg_CO_UnitGroup)
    call DestroyGroup(udg_CO_UnitGroup2)
    call ForGroupBJ(GetRandomSubGroup(1, udg_CO_UnitGroup), function Trig_Scroll_Periodic_Func017A)
    call GroupClear(udg_CO_UnitGroup)
    call DestroyGroup(udg_CO_UnitGroup)
endfunction
function InitTrig_Scroll_Periodic takes nothing returns nothing
    set gg_trg_Scroll_Periodic = CreateTrigger()
    call DisableTrigger(gg_trg_Scroll_Periodic)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Scroll_Periodic, 3.00)
    call TriggerAddAction(gg_trg_Scroll_Periodic, function Trig_Scroll_Periodic_Actions)
endfunction
function Trig_Scroll_Use_Func001C takes nothing returns boolean
    if((GetSpellAbilityId() == 0x41303648))then
        return true
    endif
    if((GetSpellAbilityId() == 0x41303645))then
        return true
    endif
    if((GetSpellAbilityId() == 0x41303646))then
        return true
    endif
    return false
endfunction
function Trig_Scroll_Use_Conditions takes nothing returns boolean
    if(not Trig_Scroll_Use_Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Scroll_Use_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ(GetSpellAbilityId(), GetTriggerUnit())
endfunction
function InitTrig_Scroll_Use takes nothing returns nothing
    set gg_trg_Scroll_Use = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Scroll_Use, gg_unit_H000_0004, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Scroll_Use, Condition(function Trig_Scroll_Use_Conditions))
    call TriggerAddAction(gg_trg_Scroll_Use, function Trig_Scroll_Use_Actions)
endfunction
function Trig_Armor_Use_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x4130334D))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func002C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false)
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING) == false)
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002001 takes nothing returns boolean
    return(IsUnitDeadBJ(GetFilterUnit()) == false)
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002001 takes nothing returns boolean
    return(IsUnitAlly(GetFilterUnit(), GetOwningPlayer(udg_Arct)) == false)
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002002001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_MECHANICAL) == false)
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002002002 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false)
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002002001(), Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002002002())
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002001(), Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002002())
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002001(), Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002())
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002001(), Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002())
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003 takes nothing returns boolean
    return GetBooleanAnd(Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003001(), Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002())
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func009Func002C takes nothing returns boolean
    if(not(udg_KB_Skip == 0))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func009A takes nothing returns nothing
    call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_SB_Damage[1], ATTACK_TYPE_NORMAL, DAMAGE_TYPE_FORCE)
    if(Trig_Armor_Use_Func002Func003Func001Func001Func002Func009Func002C())then
        call EnableTrigger(gg_trg_Knockback_System)
    else
    endif
    set udg_KB_Skip = (udg_KB_Skip + 1)
    set udg_KB_Times = (udg_KB_Times + 1)
    set udg_KB_Off[udg_KB_Times] = true
    set udg_KB_Target[udg_KB_Times] = GetEnumUnit()
    call PauseUnitBJ(true, udg_KB_Target[udg_KB_Times])
    call DestroyEffectBJ(udg_CreepCastEffect[GetUnitUserData(udg_KB_Target[udg_KB_Times])])
    set udg_KB_Point[1] = GetUnitLoc(udg_KB_Target[udg_KB_Times])
    set udg_KB_Angle[udg_KB_Times] = AngleBetweenPoints(udg_KB_Point[0], udg_KB_Point[1])
    set udg_KB_Distance[udg_KB_Times] = 200.00
    set udg_KB_Speed[udg_KB_Times] = (udg_KB_Distance[udg_KB_Times] / 25.00)
    set udg_KB_Spam[udg_KB_Times] = 10
    call RemoveLocation(udg_KB_Point[1])
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[1] == 5))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003Func001Func003Func004Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003Func001Func003Func004C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003Func001Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[1] == 4))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[1] == 3))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[1] == 2))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Actions takes nothing returns nothing
    if(Trig_Armor_Use_Func002C())then
        set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_Arct) * 20.00) / 100.00)
        if(Trig_Armor_Use_Func002Func002C())then
            call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) - udg_AbilityPower))
            set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 10.00) / 100.00)
            call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) + udg_AbilityPower))
            call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "war3mapImported\\Mana Burn Red.mdx")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
        else
        endif
    else
        if(Trig_Armor_Use_Func002Func003C())then
            set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
            if(Trig_Armor_Use_Func002Func003Func003C())then
                call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_Arct) * 20.00) / 100.00)
                call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
                call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "war3mapImported\\Mana Burn.mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
            else
            endif
        else
            if(Trig_Armor_Use_Func002Func003Func001C())then
                set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 50.00) / 100.00)
                if(Trig_Armor_Use_Func002Func003Func001Func003C())then
                    call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                    set udg_Point = GetUnitLoc(udg_Arct)
                    set udg_RandomNumber = GetRandomInt(1, 3)
                    if(Trig_Armor_Use_Func002Func003Func001Func003Func004C())then
                        call CreateItemLoc(0x49303131, udg_Point)
                    else
                        if(Trig_Armor_Use_Func002Func003Func001Func003Func004Func001C())then
                            call CreateItemLoc(0x49303055, udg_Point)
                        else
                            call CreateItemLoc(0x49303143, udg_Point)
                        endif
                    endif
                    call PlaySoundAtPointBJ(gg_snd_FrogWhat1, 100.00, udg_Point, 150.00)
                    call RemoveLocation(udg_Point)
                    call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "war3mapImported\\Holy_Heal_Small.mdx")
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                else
                endif
            else
                if(Trig_Armor_Use_Func002Func003Func001Func001C())then
                    set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
                    if(Trig_Armor_Use_Func002Func003Func001Func001Func002C())then
                        call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                        set udg_SB_Damage[1] = (30.00 + (I2R(GetHeroStatBJ(bj_HEROSTAT_STR, udg_Arct, true)) + I2R(GetHeroStatBJ(bj_HEROSTAT_AGI, udg_Arct, true))))
                        set udg_KB_Point[3] = GetUnitLoc(udg_Arct)
                        call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "war3mapImported\\ArcaneExplosion.mdx")
                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                        set udg_KB_Point[0] = udg_KB_Point[3]
                        set udg_SB_Group[1] = GetUnitsInRangeOfLocMatching(300.00, udg_KB_Point[3], Condition(function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003))
                        call ForGroupBJ(udg_SB_Group[1], function Trig_Armor_Use_Func002Func003Func001Func001Func002Func009A)
                        call DestroyGroup(udg_SB_Group[1])
                        call RemoveLocation(udg_KB_Point[0])
                        call RemoveLocation(udg_KB_Point[3])
                    else
                    endif
                else
                endif
            endif
        endif
    endif
endfunction
function InitTrig_Armor_Use takes nothing returns nothing
    set gg_trg_Armor_Use = CreateTrigger()
    call DisableTrigger(gg_trg_Armor_Use)
    call TriggerRegisterUnitEvent(gg_trg_Armor_Use, gg_unit_H000_0004, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Armor_Use, Condition(function Trig_Armor_Use_Conditions))
    call TriggerAddAction(gg_trg_Armor_Use, function Trig_Armor_Use_Actions)
endfunction
function Trig_Talisman_Use_Func001C takes nothing returns boolean
    if((GetSpellAbilityId() == 0x41303532))then
        return true
    endif
    if((GetSpellAbilityId() == 0x41303347))then
        return true
    endif
    return false
endfunction
function Trig_Talisman_Use_Conditions takes nothing returns boolean
    if(not Trig_Talisman_Use_Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func001Func002C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[2] == 9))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func003Func007Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func003Func007A takes nothing returns nothing
    if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func003Func007Func001C())then
        call IssueTargetOrderBJ(GetEnumUnit(), "attack", GetLastCreatedUnit())
    else
    endif
endfunction
function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[2] == 8))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[2] == 7))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func003Func002C takes nothing returns boolean
    if(not(GetUnitAbilityLevelSwapped(0x41303345, GetSpellTargetUnit()) == 1))then
        return false
    endif
    if(not(GetUnitStateSwap(UNIT_STATE_LIFE, GetSpellTargetUnit()) < I2R(udg_RandomNumber)))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[2] == 6))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func001Func001Func003Func001C takes nothing returns boolean
    if(not(GetUnitAbilityLevelSwapped(0x41303345, GetSpellTargetUnit()) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func001Func001Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[2] == 5))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func001Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[2] == 4))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func003Func013Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001Func003Func013A takes nothing returns nothing
    if(Trig_Talisman_Use_Func002Func001Func003Func013Func001C())then
        call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
    else
    endif
endfunction
function Trig_Talisman_Use_Func002Func001Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[2] == 3))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func003Func002C takes nothing returns boolean
    if(not(udg_SB_Skip == 0))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Func002C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[2] == 2))then
        return false
    endif
    return true
endfunction
function Trig_Talisman_Use_Actions takes nothing returns nothing
    if(Trig_Talisman_Use_Func002C())then
        set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 10.00) / 100.00)
        if(Trig_Talisman_Use_Func002Func003C())then
            call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
            if(Trig_Talisman_Use_Func002Func003Func002C())then
                call EnableTrigger(gg_trg_Lightspeed_Loop)
            else
            endif
            set udg_SB_Skip = (udg_SB_Skip + 1)
            set udg_SB_Times = (udg_SB_Times + 1)
            set udg_SB_On[udg_SB_Times] = true
            set udg_SB_Hero[udg_SB_Times] = GetTriggerUnit()
            set udg_SB_Level[udg_SB_Times] = 1
            set udg_SB_Point[0] = GetUnitLoc(GetTriggerUnit())
            set udg_SB_Point[1] = GetSpellTargetLoc()
            set udg_SB_Distance[udg_SB_Times] = DistanceBetweenPoints(udg_SB_Point[0], udg_SB_Point[1])
            set udg_SB_Angle[udg_SB_Times] = AngleBetweenPoints(udg_SB_Point[0], udg_SB_Point[1])
            set udg_SB_Speed[udg_SB_Times] = 15.00
            set udg_SB_Damage[udg_SB_Times] = (30.00 + I2R(GetHeroStatBJ(bj_HEROSTAT_STR, udg_Arct, true)))
            set udg_SB_Spam[udg_SB_Times] = 0
            call PauseUnitBJ(true, GetTriggerUnit())
            call SetUnitAnimation(GetTriggerUnit(), "Attack Slam")
            call RemoveLocation(udg_SB_Point[0])
            call RemoveLocation(udg_SB_Point[1])
        else
        endif
    else
        if(Trig_Talisman_Use_Func002Func001C())then
            set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
            if(Trig_Talisman_Use_Func002Func001Func003C())then
                call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                set udg_Point = GetUnitLoc(udg_Arct)
                set udg_PointTalisman = GetSpellTargetLoc()
                call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
                call RemoveLocation(udg_Point)
                call UnitAddAbilityBJ(0x4130364E, GetLastCreatedUnit())
                call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
                call IssuePointOrderLocBJ(GetLastCreatedUnit(), "clusterrockets", udg_PointTalisman)
                call PolledWait(0.60)
                set udg_AbilityPower = (2.00 * (I2R(GetHeroStatBJ(bj_HEROSTAT_STR, udg_Arct, true)) + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true))))
                set udg_AbilityPower = (udg_AbilityPower + 30.00)
                set udg_UnitGroup = GetUnitsInRangeOfLocAll(300.00, udg_PointTalisman)
                call ForGroupBJ(udg_UnitGroup, function Trig_Talisman_Use_Func002Func001Func003Func013A)
                call RemoveLocation(udg_PointTalisman)
                call GroupClear(udg_UnitGroup)
                call DestroyGroup(udg_UnitGroup)
            else
            endif
        else
            if(Trig_Talisman_Use_Func002Func001Func001C())then
                set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
                if(Trig_Talisman_Use_Func002Func001Func001Func003C())then
                    call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                    set udg_Point = GetUnitLoc(GetSpellTargetUnit())
                    call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
                    call RemoveLocation(udg_Point)
                    call UnitAddAbilityBJ(0x53303030, GetLastCreatedUnit())
                    call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
                    call IssueTargetOrderBJ(GetLastCreatedUnit(), "cripple", GetSpellTargetUnit())
                else
                endif
            else
                if(Trig_Talisman_Use_Func002Func001Func001Func001C())then
                    set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
                    if(Trig_Talisman_Use_Func002Func001Func001Func001Func003C())then
                        if(Trig_Talisman_Use_Func002Func001Func001Func001Func003Func001C())then
                            call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                            call SetUnitOwner(GetSpellTargetUnit(), Player(1), true)
                            call GroupAddUnitSimple(GetSpellTargetUnit(), udg_FollowersGroup)
                            call UnitApplyTimedLifeBJ(I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)), 0x42544C46, GetSpellTargetUnit())
                            call EnableTrigger(gg_trg_Follower_Movement)
                            call AddSpecialEffectTargetUnitBJ("origin", GetSpellTargetUnit(), "war3mapImported\\DarknessLeechTarget_Portrait.mdx")
                            call DestroyEffectBJ(GetLastCreatedEffectBJ())
                        else
                        endif
                    else
                    endif
                else
                    if(Trig_Talisman_Use_Func002Func001Func001Func001Func001C())then
                        set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
                        if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func003C())then
                            set udg_RandomNumber = ((R2I(GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetSpellTargetUnit())) * 50) / 100)
                            if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func003Func002C())then
                                call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                                call AddSpecialEffectTargetUnitBJ("origin", GetSpellTargetUnit(), "war3mapImported\\BloodEX-Special-2.mdx")
                                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                call KillUnit(GetSpellTargetUnit())
                                set udg_RandomNumber = (GetHeroStatBJ(bj_HEROSTAT_AGI, udg_Arct, true) / 5)
                                set udg_LightOrbs[2] = (udg_LightOrbs[2] + udg_RandomNumber)
                                set udg_LightIterations = (udg_LightIterations + udg_RandomNumber)
                                call EnableTrigger(gg_trg_Orbs_Spawn)
                            else
                            endif
                        else
                        endif
                    else
                        if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001C())then
                            set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
                            if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func003C())then
                                call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                                set udg_Point = GetUnitLoc(GetSpellTargetUnit())
                                set udg_Point2 = PolarProjectionBJ(udg_Point, GetRandomReal(300.00, 450.00), GetRandomDirectionDeg())
                                call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
                                call RemoveLocation(udg_Point)
                                call UnitAddAbilityBJ(0x4130364F, GetLastCreatedUnit())
                                call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
                                call IssueTargetOrderBJ(GetLastCreatedUnit(), "hex", GetSpellTargetUnit())
                                call IssuePointOrderLocBJ(GetSpellTargetUnit(), "move", udg_Point2)
                                call RemoveLocation(udg_Point2)
                            else
                            endif
                        else
                            if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001C())then
                                set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
                                if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func003C())then
                                    call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                                    set udg_Point = GetSpellTargetLoc()
                                    call CreateNUnitsAtLoc(1, 0x68303035, Player(0), udg_Point, bj_UNIT_FACING)
                                    call UnitApplyTimedLifeBJ(5.00, 0x42544C46, GetLastCreatedUnit())
                                    set udg_CO_UnitGroup = GetUnitsInRangeOfLocAll(450.00, udg_Point)
                                    call RemoveLocation(udg_Point)
                                    call ForGroupBJ(udg_CO_UnitGroup, function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func003Func007A)
                                    call GroupClear(udg_CO_UnitGroup)
                                    call DestroyGroup(udg_CO_UnitGroup)
                                else
                                endif
                            else
                                if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func001C())then
                                    set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
                                    if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func001Func002C())then
                                        call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                                        set udg_AbilityPower = (I2R(GetHeroStatBJ(bj_HEROSTAT_AGI, udg_Arct, true)) * 3.00)
                                        call UnitDamageTargetBJ(udg_Arct, GetSpellTargetUnit(), udg_AbilityPower, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
                                        call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
                                        call AddSpecialEffectTargetUnitBJ("origin", GetSpellTargetUnit(), "war3mapImported\\DarknessLeechTarget.mdx")
                                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                        call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "war3mapImported\\DarknessLeechTarget_Portrait.mdx")
                                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                    else
                                    endif
                                else
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endfunction
function InitTrig_Talisman_Use takes nothing returns nothing
    set gg_trg_Talisman_Use = CreateTrigger()
    call DisableTrigger(gg_trg_Talisman_Use)
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Talisman_Use, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Talisman_Use, Condition(function Trig_Talisman_Use_Conditions))
    call TriggerAddAction(gg_trg_Talisman_Use, function Trig_Talisman_Use_Actions)
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func004C takes nothing returns boolean
    if(not(udg_SB_Spam[udg_SB] == 0))then
        return false
    endif
    return true
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003001001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING) == false)
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003001002 takes nothing returns boolean
    return(IsUnitDeadBJ(GetFilterUnit()) == false)
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003001 takes nothing returns boolean
    return GetBooleanAnd(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003001001(), Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003001002())
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003002 takes nothing returns boolean
    return(GetFilterUnit() != udg_SB_Hero[udg_SB])
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003 takes nothing returns boolean
    return GetBooleanAnd(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003001(), Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003002())
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false)
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING) == false)
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002001 takes nothing returns boolean
    return(IsUnitDeadBJ(GetFilterUnit()) == false)
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002001 takes nothing returns boolean
    return(IsUnitAlly(GetFilterUnit(), GetOwningPlayer(udg_SB_Hero[udg_SB])) == false)
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002002001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_MECHANICAL) == false)
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002002002 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false)
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002002001(), Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002002002())
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002001(), Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002002())
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002001(), Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002002())
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002001(), Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002002())
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003 takes nothing returns boolean
    return GetBooleanAnd(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003001(), Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003002())
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func006Func002C takes nothing returns boolean
    if(not(udg_KB_Skip == 0))then
        return false
    endif
    return true
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func006A takes nothing returns nothing
    call UnitDamageTargetBJ(udg_SB_Hero[udg_SB], GetEnumUnit(), udg_SB_Damage[udg_SB], ATTACK_TYPE_NORMAL, DAMAGE_TYPE_FORCE)
    if(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func006Func002C())then
        call EnableTrigger(gg_trg_Knockback_System)
    else
    endif
    set udg_KB_Skip = (udg_KB_Skip + 1)
    set udg_KB_Times = (udg_KB_Times + 1)
    set udg_KB_Off[udg_KB_Times] = true
    set udg_KB_Target[udg_KB_Times] = GetEnumUnit()
    call DestroyEffectBJ(udg_CreepCastEffect[GetUnitUserData(udg_KB_Target[udg_KB_Times])])
    call PauseUnitBJ(true, udg_KB_Target[udg_KB_Times])
    set udg_KB_Point[1] = GetUnitLoc(udg_KB_Target[udg_KB_Times])
    set udg_KB_Angle[udg_KB_Times] = AngleBetweenPoints(udg_KB_Point[0], udg_KB_Point[1])
    set udg_KB_Distance[udg_KB_Times] = 200.00
    set udg_KB_Speed[udg_KB_Times] = (udg_KB_Distance[udg_KB_Times] / 50.00)
    set udg_KB_Spam[udg_KB_Times] = 10
    call RemoveLocation(udg_KB_Point[1])
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007C takes nothing returns boolean
    if(not(CountUnitsInGroup(udg_SB_Group[udg_SB]) > 0))then
        return false
    endif
    return true
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func011C takes nothing returns boolean
    if((IsUnitType(udg_SB_Hero[udg_SB], UNIT_TYPE_STUNNED) == true))then
        return true
    endif
    if((IsUnitDeadBJ(udg_SB_Hero[udg_SB]) == true))then
        return true
    endif
    return false
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func001C takes nothing returns boolean
    if(not Trig_Lightspeed_Loop_Func001Func001Func001Func001Func011C())then
        return false
    endif
    return true
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001Func007C takes nothing returns boolean
    if(not(udg_SB_Skip <= 0))then
        return false
    endif
    return true
endfunction
function Trig_Lightspeed_Loop_Func001Func001Func001C takes nothing returns boolean
    if(not(udg_SB_Distance[udg_SB] <= 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Lightspeed_Loop_Func001Func001C takes nothing returns boolean
    if(not(udg_SB_On[udg_SB] == true))then
        return false
    endif
    return true
endfunction
function Trig_Lightspeed_Loop_Actions takes nothing returns nothing
    set udg_SB = 1
    loop
        exitwhen udg_SB > udg_SB_Times
        if(Trig_Lightspeed_Loop_Func001Func001C())then
            if(Trig_Lightspeed_Loop_Func001Func001Func001C())then
                call ResetUnitAnimation(udg_SB_Hero[udg_SB])
                call PauseUnitBJ(false, udg_SB_Hero[udg_SB])
                call DestroyEffectBJ(udg_SB_Effect)
                set udg_SB_On[udg_SB] = false
                set udg_SB_Skip = (udg_SB_Skip - 1)
                if(Trig_Lightspeed_Loop_Func001Func001Func001Func007C())then
                    set udg_SB_Times = 0
                    call DisableTrigger(GetTriggeringTrigger())
                else
                endif
            else
                if(Trig_Lightspeed_Loop_Func001Func001Func001Func001C())then
                    set udg_SB_Distance[udg_SB] = 0.00
                else
                    set udg_SB_Point[2] = GetUnitLoc(udg_SB_Hero[udg_SB])
                    set udg_SB_Point[3] = PolarProjectionBJ(udg_SB_Point[2], udg_SB_Speed[udg_SB], udg_SB_Angle[udg_SB])
                    call SetUnitPositionLocFacingBJ(udg_SB_Hero[udg_SB], udg_SB_Point[3], udg_SB_Angle[udg_SB])
                    if(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func004C())then
                        set udg_SB_Spam[udg_SB] = 50
                        call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "war3mapImported\\Holy_Penance.mdx")
                        set udg_SB_Effect = GetLastCreatedEffectBJ()
                    else
                        set udg_SB_Spam[udg_SB] = (udg_SB_Spam[udg_SB] - 1)
                    endif
                    set udg_SB_Distance[udg_SB] = (udg_SB_Distance[udg_SB] - udg_SB_Speed[udg_SB])
                    set udg_SB_Group[udg_SB] = GetUnitsInRangeOfLocMatching(100.00, udg_SB_Point[3], Condition(function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func006002003))
                    if(Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007C())then
                        call DestroyGroup(udg_SB_Group[udg_SB])
                        set udg_SB_Distance[udg_SB] = 0.00
                        set udg_KB_Point[0] = udg_SB_Point[3]
                        set udg_SB_Group[udg_SB] = GetUnitsInRangeOfLocMatching(150.00, udg_SB_Point[3], Condition(function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func005002003))
                        call ForGroupBJ(udg_SB_Group[udg_SB], function Trig_Lightspeed_Loop_Func001Func001Func001Func001Func007Func006A)
                        call RemoveLocation(udg_KB_Point[0])
                    else
                        call DestroyGroup(udg_SB_Group[udg_SB])
                    endif
                    call RemoveLocation(udg_SB_Point[2])
                    call RemoveLocation(udg_SB_Point[3])
                endif
            endif
        else
        endif
        set udg_SB = udg_SB + 1
    endloop
endfunction
function InitTrig_Lightspeed_Loop takes nothing returns nothing
    set gg_trg_Lightspeed_Loop = CreateTrigger()
    call DisableTrigger(gg_trg_Lightspeed_Loop)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Lightspeed_Loop, 0.02)
    call TriggerAddAction(gg_trg_Lightspeed_Loop, function Trig_Lightspeed_Loop_Actions)
endfunction
function Trig_Knockback_System_Func001Func001Func001Func005Func001Func001C takes nothing returns boolean
    if((GetDestructableMaxLife(GetEnumDestructable()) == 10))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x4230304A))then
        return true
    endif
    return false
endfunction
function Trig_Knockback_System_Func001Func001Func001Func005Func001C takes nothing returns boolean
    if(not Trig_Knockback_System_Func001Func001Func001Func005Func001Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Knockback_System_Func001Func001Func001Func005A takes nothing returns nothing
    if(Trig_Knockback_System_Func001Func001Func001Func005Func001C())then
        set udg_KB_Bool = false
    else
    endif
endfunction
function Trig_Knockback_System_Func001Func001Func001Func006C takes nothing returns boolean
    if(not(udg_KB_Bool == true))then
        return false
    endif
    return true
endfunction
function Trig_Knockback_System_Func001Func001Func001Func009C takes nothing returns boolean
    if(not(udg_KB_Spam[udg_KB] >= 5))then
        return false
    endif
    return true
endfunction
function Trig_Knockback_System_Func001Func001Func001Func014C takes nothing returns boolean
    if(not(udg_KB < udg_KB_Times))then
        return false
    endif
    return true
endfunction
function Trig_Knockback_System_Func001Func001Func001Func018C takes nothing returns boolean
    if(not(udg_KB_Times == 0))then
        return false
    endif
    return true
endfunction
function Trig_Knockback_System_Func001Func001Func001C takes nothing returns boolean
    if(not(udg_KB_Distance[udg_KB] <= 0.00))then
        return false
    endif
    return true
endfunction
function Trig_Knockback_System_Func001Func001C takes nothing returns boolean
    if(not(udg_KB_Off[udg_KB] == true))then
        return false
    endif
    return true
endfunction
function Trig_Knockback_System_Actions takes nothing returns nothing
    set udg_KB = 1
    loop
        exitwhen udg_KB > udg_KB_Times
        if(Trig_Knockback_System_Func001Func001C())then
            if(Trig_Knockback_System_Func001Func001Func001C())then
                call PauseUnitBJ(false, udg_KB_Target[udg_KB])
                set udg_KB_Off[udg_KB] = false
                if(Trig_Knockback_System_Func001Func001Func001Func014C())then
                    set udg_KB_Off[udg_KB] = udg_KB_Off[udg_KB_Times]
                    set udg_KB_Target[udg_KB] = udg_KB_Target[udg_KB_Times]
                    set udg_KB_Distance[udg_KB] = udg_KB_Distance[udg_KB_Times]
                    set udg_KB_Speed[udg_KB] = udg_KB_Speed[udg_KB_Times]
                    set udg_KB_Spam[udg_KB] = udg_KB_Spam[udg_KB_Times]
                    set udg_KB_Angle[udg_KB] = udg_KB_Angle[udg_KB_Times]
                else
                endif
                set udg_KB_Times = (udg_KB_Times - 1)
                set udg_KB = (udg_KB - 1)
                set udg_KB_Skip = (udg_KB_Skip - 1)
                if(Trig_Knockback_System_Func001Func001Func001Func018C())then
                    call DisableTrigger(GetTriggeringTrigger())
                else
                endif
            else
                set udg_KB_Point[2] = GetUnitLoc(udg_KB_Target[udg_KB])
                set udg_KB_Point[3] = PolarProjectionBJ(udg_KB_Point[2], udg_KB_Speed[udg_KB], udg_KB_Angle[udg_KB])
                set udg_KB_Bool = true
                call EnumDestructablesInCircleBJ(250.00, udg_KB_Point[3], function Trig_Knockback_System_Func001Func001Func001Func005A)
                if(Trig_Knockback_System_Func001Func001Func001Func006C())then
                    call SetUnitX(udg_KB_Target[udg_KB], GetLocationX(udg_KB_Point[3]))
                    call SetUnitY(udg_KB_Target[udg_KB], GetLocationY(udg_KB_Point[3]))
                else
                    set udg_KB_Distance[udg_KB] = 0.00
                endif
                set udg_KB_Distance[udg_KB] = (udg_KB_Distance[udg_KB] - udg_KB_Speed[udg_KB])
                set udg_KB_Spam[udg_KB] = (udg_KB_Spam[udg_KB] + 1)
                if(Trig_Knockback_System_Func001Func001Func001Func009C())then
                    set udg_KB_Spam[udg_KB] = 0
                    call AddSpecialEffectLocBJ(udg_KB_Point[3], "Abilities\\Spells\\Human\\FlakCannons\\FlakTarget.mdl")
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                else
                endif
                call RemoveLocation(udg_KB_Point[2])
                call RemoveLocation(udg_KB_Point[3])
            endif
        else
        endif
        set udg_KB = udg_KB + 1
    endloop
endfunction
function InitTrig_Knockback_System takes nothing returns nothing
    set gg_trg_Knockback_System = CreateTrigger()
    call DisableTrigger(gg_trg_Knockback_System)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Knockback_System, 0.02)
    call TriggerAddAction(gg_trg_Knockback_System, function Trig_Knockback_System_Actions)
endfunction
function Trig_Tutorial01_Actions takes nothing returns nothing
    call CinematicModeExBJ(false, GetPlayersAll(), 999.00)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_1F, "Наконец-то - хоть кто-то с мозгами! Добро пожаловать. Меня Беба зовут.", bj_TIMETYPE_ADD, 0.00, true)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_2F, "Я тут как раз решил провести тренировку с этим бездарем, я и тебя заодно научу самому главному. Начнём с боевой системы.", bj_TIMETYPE_ADD, 0.00, true)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 3.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
    call CinematicModeExBJ(false, GetPlayersAll(), 3.00)
    call TriggerSleepAction(4.00)
    call CameraSetSmoothingFactorBJ(10.00)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_3F, "Смотри, всё просто. У Аркта есть три навыка, они различаются по цвету. Во время боя над монстром может появиться одна из трёх иконок.", bj_TIMETYPE_ADD, 0.00, true)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_4F, "Тебе нужно успеть нажать на такую же на панели умений Аркта, тогда монстр получит урон, а герой исцелится.", bj_TIMETYPE_ADD, 0.00, true)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_H000_0004, "Аркт", gg_snd_4BF, "С кем ты разговариваешь?", bj_TIMETYPE_ADD, 0.00, true)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_5F, "Погоди ты, не мешай. Так вот. Всё понятно? Сейчас я создам монстра, а ты попробуй с помощью Аркта его убить.", bj_TIMETYPE_ADD, 0.00, true)
    call TriggerSleepAction(2.00)
    call LeaderboardDisplayBJ(true, udg_CO_ComboBoard)
    set udg_Point = GetRandomLocInRect(gg_rct_Artefactorium_Spawn)
    call CreateNUnitsAtLoc(1, udg_D_CreepType[5], Player(11), udg_Point, bj_UNIT_FACING)
    call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", udg_Arct)
    set udg_TutorialCreep = GetLastCreatedUnit()
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Heal_Small.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call CameraSetSmoothingFactorBJ(0.00)
    call RemoveLocation(udg_Point)
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Tutorial01 takes nothing returns nothing
    set gg_trg_Tutorial01 = CreateTrigger()
    call DisableTrigger(gg_trg_Tutorial01)
    call TriggerRegisterTimerEventSingle(gg_trg_Tutorial01, 3.00)
    call TriggerAddAction(gg_trg_Tutorial01, function Trig_Tutorial01_Actions)
endfunction
function Trig_Tutorial02_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Enter_Regions)
    set udg_Tutorial[3] = false
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_10F, "Что же. Вы готовы. Можно отправляться в портал. Удачи.", bj_TIMETYPE_ADD, 0.00, true)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_H000_0004, "Аркт", gg_snd_11F, "Да с кем ты там разговариваешь!?", bj_TIMETYPE_ADD, 0.00, true)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_12F, "Заткнись.", bj_TIMETYPE_ADD, 0.00, true)
    call EnableTrigger(gg_trg_Enter_Dialog)
    call EnableTrigger(gg_trg_Damage_Effects)
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Tutorial02 takes nothing returns nothing
    set gg_trg_Tutorial02 = CreateTrigger()
    call TriggerAddAction(gg_trg_Tutorial02, function Trig_Tutorial02_Actions)
endfunction
function Trig_Tutorial_Initialisation_Actions takes nothing returns nothing
    set udg_Tutorial[4] = true
    set udg_Tutorial[5] = true
    set udg_TutorialHint[1] = true
    set udg_TutorialHintsOn = true
    call EnableTrigger(gg_trg_Escape_Dialog)
    call EnableTrigger(gg_trg_Camera_Fix)
    call EnableTrigger(gg_trg_Item_Pickup)
    call DisableTrigger(gg_trg_Damage_Effects)
    call SetPlayerAbilityAvailableBJ(true, 0x41303138, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303537, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303530, Player(0))
    set udg_Point = GetRectCenter(gg_rct_Artefactorium_Enter)
    call SuspendHeroXPBJ(false, udg_Arct)
    call SetUnitPositionLoc(udg_Arct, GetRectCenter(gg_rct_Artefactorium_Enter))
    call RemoveLocation(udg_Point)
    set udg_Camera = gg_cam_Camera_Artefactorium
    call CameraSetupApplyForceDuration(udg_Camera, true, 0.00)
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    set udg_Training = true
    set udg_Artefactorium = true
    set udg_Tutorial[1] = true
    set udg_Tutorial[2] = true
    set udg_Tutorial[3] = false
    set udg_Tutorial[4] = true
    set udg_Tutorial[5] = true
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Tutorial_Initialisation takes nothing returns nothing
    set gg_trg_Tutorial_Initialisation = CreateTrigger()
    call TriggerAddAction(gg_trg_Tutorial_Initialisation, function Trig_Tutorial_Initialisation_Actions)
endfunction
function Trig_Artefactorium_Damage_Func001C takes nothing returns boolean
    if((udg_DamageEventTarget == gg_unit_H000_0004))then
        return true
    endif
    if((udg_DamageEventTarget == gg_unit_h007_0065))then
        return true
    endif
    return false
endfunction
function Trig_Artefactorium_Damage_Conditions takes nothing returns boolean
    if(not Trig_Artefactorium_Damage_Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Artefactorium_Damage_Actions takes nothing returns nothing
    set udg_DamageEventAmount = 0.00
endfunction
function InitTrig_Artefactorium_Damage takes nothing returns nothing
    set gg_trg_Artefactorium_Damage = CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Artefactorium_Damage, "udg_DamageModifierEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Artefactorium_Damage, Condition(function Trig_Artefactorium_Damage_Conditions))
    call TriggerAddAction(gg_trg_Artefactorium_Damage, function Trig_Artefactorium_Damage_Actions)
endfunction
function Trig_Artefactorium_Creep_Kill_Conditions takes nothing returns boolean
    if(not(GetOwningPlayer(GetTriggerUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Artefactorium_Creep_Kill_Func008C takes nothing returns boolean
    if(not(GetTriggerUnit() == udg_TutorialCreep))then
        return false
    endif
    return true
endfunction
function Trig_Artefactorium_Creep_Kill_Actions takes nothing returns nothing
    call GroupAddUnitSimple(GetTriggerUnit(), udg_FadeSystemGroup)
    call SaveRealBJ(0.00, udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash)
    call SaveRealBJ(100.00, udg_FadeUnitKey, StringHashBJ("FadeEnd"), udg_FadeSystemHash)
    call SaveRealBJ(2.50, udg_FadeUnitKey, StringHashBJ("FadeSpeed"), udg_FadeSystemHash)
    call SaveBooleanBJ(false, udg_FadeUnitKey, StringHashBJ("FadeIn"), udg_FadeSystemHash)
    call EnableTrigger(gg_trg_Fade_Loop)
    call RemoveUnit(udg_CO_OpportunityUnit[GetUnitUserData(GetDyingUnit())])
    if(Trig_Artefactorium_Creep_Kill_Func008C())then
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_6F, "Ну, неплохо. Если хочешь ещё парочку призвать - нажми правой кнопкой на сферу. Когда наловчишься справляться с монстрами без проблем - пойди прогуляйся с Арктом по замку.", bj_TIMETYPE_ADD, 0.00, true)
        call EnableTrigger(gg_trg_Artefactorium_Spawn)
        call EnableTrigger(gg_trg_Enter_Regions)
        set udg_Target = gg_unit_h006_0081
        call RemoveDestructable(gg_dest_B003_2936)
        call ShowDestructableBJ(true, gg_dest_B00B_1355)
        set udg_Point = GetUnitLoc(gg_unit_h006_0081)
        call CreateDestructableLoc(0x42303037, udg_Point, 0.00, 0.50, 0)
        call RemoveLocation(udg_Point)
        set udg_MagneticField[2] = GetLastCreatedDestructable()
        set udg_AS_Logic[2] = true
        set udg_AS_Value[GetUnitUserData(udg_Target)] = 2
        set udg_AS_SeriesNumber = 2
        set udg_AS_Effect[udg_AS_SeriesNumber] = 1
        set udg_AS_AbilityStudied[1] = 1
        call CreateTextTagUnitBJ("5", gg_unit_h006_0081, 0, 15.00, 100, 100, 100, 0)
        set udg_AS_TextNumber[2] = GetLastCreatedTextTag()
        call UnitRemoveAbilityBJ(0x41303241, gg_unit_h006_0081)
        call UnitAddAbilityBJ(0x41303649, gg_unit_h006_0081)
        set udg_AS_Points = 300
        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 1, ("Очки навыков: " + I2S(udg_AS_Points)))
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_hrif_0000, "Беба", gg_snd_7F, "Кстати, теперь через каждые 5 правильных нажатий Аркт применяет навык, который повышает броню и периодически исцеляет. Можешь проверить.", bj_TIMETYPE_ADD, 0.00, true)
    else
    endif
endfunction
function InitTrig_Artefactorium_Creep_Kill takes nothing returns nothing
    set gg_trg_Artefactorium_Creep_Kill = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Artefactorium_Creep_Kill, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddCondition(gg_trg_Artefactorium_Creep_Kill, Condition(function Trig_Artefactorium_Creep_Kill_Conditions))
    call TriggerAddAction(gg_trg_Artefactorium_Creep_Kill, function Trig_Artefactorium_Creep_Kill_Actions)
endfunction
function Trig_Artefactorium_Spawn_Conditions takes nothing returns boolean
    if(not(GetOrderTargetUnit() == gg_unit_h007_0065))then
        return false
    endif
    return true
endfunction
function Trig_Artefactorium_Spawn_Func002C takes nothing returns boolean
    if(not(CountUnitsInGroup(udg_UnitGroup) < 5))then
        return false
    endif
    return true
endfunction
function Trig_Artefactorium_Spawn_Actions takes nothing returns nothing
    set udg_UnitGroup = GetUnitsInRectOfPlayer(gg_rct_Artefactorium_Pick, Player(11))
    if(Trig_Artefactorium_Spawn_Func002C())then
        set udg_Point = GetRandomLocInRect(gg_rct_Artefactorium_Spawn)
        call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 5)], Player(11), udg_Point, bj_UNIT_FACING)
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", udg_Arct)
        call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Heal_Small.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call RemoveLocation(udg_Point)
    else
    endif
    call DestroyGroup(udg_UnitGroup)
endfunction
function InitTrig_Artefactorium_Spawn takes nothing returns nothing
    set gg_trg_Artefactorium_Spawn = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Artefactorium_Spawn, gg_unit_H000_0004, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Artefactorium_Spawn, Condition(function Trig_Artefactorium_Spawn_Conditions))
    call TriggerAddAction(gg_trg_Artefactorium_Spawn, function Trig_Artefactorium_Spawn_Actions)
endfunction
function Trig_Tutorial_Cinematic_Actions takes nothing returns nothing
    call StopMusicBJ(false)
    call ClearMapMusicBJ()
    set udg_Transparent = 0.00
    call SetUnitPositionLocFacingBJ(gg_unit_H000_0004, udg_CinematicPosition, 90.00)
    call CameraSetSmoothingFactorBJ(0.00)
    call CinematicModeBJ(true, GetPlayersAll())
    call TriggerSleepAction(3.00)
    call SetCameraBoundsToRect(GetPlayableMapRect())
    call CameraSetupApplyForceDuration(gg_cam_Camera02, true, 0.00)
    call PlaySoundBJ(gg_snd_EdemiumHit)
    call TriggerSleepAction(0.25)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 0.00, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 100.00, 100.00, 100.00, 0)
    call TriggerSleepAction(6.00)
    call CameraSetupApplyForceDuration(gg_cam_Camera03, true, 0.00)
    call TriggerSleepAction(4.00)
    call SetUnitTimeScalePercent(udg_Arct, 25.00)
    set udg_Point = GetRectCenter(gg_rct_Edemium)
    call IssuePointOrderLocBJ(udg_Arct, "move", udg_Point)
    call RemoveLocation(udg_Point)
    call TriggerSleepAction(1.60)
    call CameraSetupApplyForceDuration(gg_cam_Camera01, true, 0.00)
    call TriggerSleepAction(3.00)
    call CameraSetupApplyForceDuration(gg_cam_Camera02, true, 0.00)
    call PlaySoundBJ(gg_snd_EdemiumRiser)
    call SetUnitTimeScalePercent(udg_Arct, 10.00)
    call SetUnitAnimation(udg_Arct, "spell")
    call CameraSetupApplyForceDuration(gg_cam_Camera04, true, 20.00)
    call TriggerSleepAction(4.00)
    call EnableTrigger(gg_trg_Cinematic_Transparent)
    call TriggerSleepAction(3.50)
    call CameraSetupApplyForceDuration(gg_cam_Camera05, true, 0.00)
    call TriggerSleepAction(4.00)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 0.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 100.00, 100.00, 100.00, 0)
    call DestroyTrigger(gg_trg_Cinematic_Transparent)
    call TriggerSleepAction(3.00)
    call ConditionalTriggerExecute(gg_trg_Music_Edemium)
    call DestroyFogModifier(GetLastCreatedFogModifier())
    call FogEnableOn()
    call FogMaskEnableOn()
    call SetUnitVertexColorBJ(udg_Arct, 100, 100, 100, 0.00)
    call SetUnitTimeScalePercent(udg_Arct, 100.00)
    call TriggerExecute(gg_trg_Map_Enter)
    call EnableTrigger(gg_trg_Enter_Dialog)
    call EnableTrigger(gg_trg_Enter_Regions)
    call CinematicModeBJ(false, bj_FORCE_PLAYER[0])
    set udg_TutorialHint[1] = false
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Tutorial_Cinematic takes nothing returns nothing
    set gg_trg_Tutorial_Cinematic = CreateTrigger()
    call TriggerAddAction(gg_trg_Tutorial_Cinematic, function Trig_Tutorial_Cinematic_Actions)
endfunction
function Trig_Cinematic_Transparent_Actions takes nothing returns nothing
    set udg_Transparent = (udg_Transparent + 1.40)
    call SetUnitVertexColorBJ(udg_Arct, 100, 100, 100, udg_Transparent)
endfunction
function InitTrig_Cinematic_Transparent takes nothing returns nothing
    set gg_trg_Cinematic_Transparent = CreateTrigger()
    call DisableTrigger(gg_trg_Cinematic_Transparent)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Cinematic_Transparent, 0.10)
    call TriggerAddAction(gg_trg_Cinematic_Transparent, function Trig_Cinematic_Transparent_Actions)
endfunction
function Trig_Orbs_Spawn_Func002C takes nothing returns boolean
    if(not(udg_LightIterations > 0))then
        return false
    endif
    return true
endfunction
function Trig_Orbs_Spawn_Actions takes nothing returns nothing
    set udg_LightIterations = (udg_LightIterations - 1)
    if(Trig_Orbs_Spawn_Func002C())then
        set udg_Point = GetUnitLoc(udg_Arct)
        call CreateNUnitsAtLoc(1, 0x68303034, Player(0), udg_Point, bj_UNIT_FACING)
        set udg_Point2 = PolarProjectionBJ(udg_Point, GetRandomReal(100.00, 120.00), GetRandomReal(0, 360.00))
        call IssuePointOrderLocBJ(GetLastCreatedUnit(), "breathoffire", udg_Point2)
        call RemoveLocation(udg_Point)
        call RemoveLocation(udg_Point2)
    else
        call DisableTrigger(GetTriggeringTrigger())
    endif
endfunction
function InitTrig_Orbs_Spawn takes nothing returns nothing
    set gg_trg_Orbs_Spawn = CreateTrigger()
    call DisableTrigger(gg_trg_Orbs_Spawn)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Orbs_Spawn, 0.25)
    call TriggerAddAction(gg_trg_Orbs_Spawn, function Trig_Orbs_Spawn_Actions)
endfunction
function Trig_Orb_Arc_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x4130334A))then
        return false
    endif
    return true
endfunction
function Trig_Orb_Arc_Func002C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x4130334A))then
        return false
    endif
    return true
endfunction
function Trig_Orb_Arc_Actions takes nothing returns nothing
    if(Trig_Orb_Arc_Func002C())then
    else
    endif
    set udg_JDA_JumpHigh_Distance = 0.60
    set udg_JDA_Collusion = true
    set udg_JDA_TargetPoint = GetSpellTargetLoc()
    set udg_JDA_Unit = GetTriggerUnit()
    set udg_JDA_Speed = 9.00
    set udg_JDA_Animation = "walk"
    set udg_JDA_AnimationSpeed = 0.60
    call ConditionalTriggerExecute(gg_trg_Orbs_System_1)
endfunction
function InitTrig_Orb_Arc takes nothing returns nothing
    set gg_trg_Orb_Arc = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Orb_Arc, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Orb_Arc, Condition(function Trig_Orb_Arc_Conditions))
    call TriggerAddAction(gg_trg_Orb_Arc, function Trig_Orb_Arc_Actions)
endfunction
function Trig_Orbs_System_1_Func001C takes nothing returns boolean
    if(not(udg_JD_Integers[1] == 0))then
        return false
    endif
    return true
endfunction
function Trig_Orbs_System_1_Actions takes nothing returns nothing
    if(Trig_Orbs_System_1_Func001C())then
        call EnableTrigger(gg_trg_Orbs_System_2)
    else
    endif
    set udg_JD_Integers[1] = (udg_JD_Integers[1] + 1)
    set udg_JD_Integers[2] = (udg_JD_Integers[2] + 1)
    set udg_JD_TempPoint[1] = GetUnitLoc(udg_JDA_Unit)
    set udg_JD_Distances[udg_JD_Integers[2]] = DistanceBetweenPoints(udg_JD_TempPoint[1], udg_JDA_TargetPoint)
    set udg_JD_ReachedDistance[udg_JD_Integers[2]] = 0.00
    set udg_JD_SpeedUnits[udg_JD_Integers[2]] = udg_JDA_Speed
    set udg_JD_Unit[udg_JD_Integers[2]] = udg_JDA_Unit
    set udg_JD_Angle[udg_JD_Integers[2]] = AngleBetweenPoints(udg_JD_TempPoint[1], udg_JDA_TargetPoint)
    set udg_JD_Animations[udg_JD_Integers[2]] = udg_JDA_Animation
    set udg_JD_HighSettings[udg_JD_Integers[2]] = (udg_JDA_JumpHigh_Distance * udg_JD_Distances[udg_JD_Integers[2]])
    call SetUnitPathing(udg_JDA_Unit, true)
    call SetUnitTimeScalePercent(udg_JDA_Unit, (udg_JDA_AnimationSpeed * 100.00))
    call SetUnitAnimation(udg_JDA_Unit, udg_JDA_Animation)
    call GroupAddUnitSimple(udg_JDA_Unit, udg_JD_Group)
    call UnitAddAbilityBJ(0x41726176, udg_JDA_Unit)
    call UnitRemoveAbilityBJ(0x41726176, udg_JDA_Unit)
    call RemoveLocation(udg_JD_TempPoint[1])
    call RemoveLocation(udg_JDA_TargetPoint)
endfunction
function InitTrig_Orbs_System_1 takes nothing returns nothing
    set gg_trg_Orbs_System_1 = CreateTrigger()
    call TriggerAddAction(gg_trg_Orbs_System_1, function Trig_Orbs_System_1_Actions)
endfunction
function Trig_Orbs_System_2_Func001Func001Func001Func010Func002Func002C takes nothing returns boolean
    if(not(udg_LightOrbs[1] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Orbs_System_2_Func001Func001Func001Func010Func002C takes nothing returns boolean
    if(not(udg_LightOrbs[2] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Orbs_System_2_Func001Func001Func001Func010C takes nothing returns boolean
    if(not(udg_LightOrbs[3] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Orbs_System_2_Func001Func001Func001Func014C takes nothing returns boolean
    if(not(udg_JD_Integers[1] == 0))then
        return false
    endif
    return true
endfunction
function Trig_Orbs_System_2_Func001Func001Func001Func019C takes nothing returns boolean
    if(not(GetRandomInt(1, 5) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Orbs_System_2_Func001Func001Func001C takes nothing returns boolean
    if(not(udg_JD_ReachedDistance[udg_JD_Integers[3]] < udg_JD_Distances[udg_JD_Integers[3]]))then
        return false
    endif
    return true
endfunction
function Trig_Orbs_System_2_Func001Func001C takes nothing returns boolean
    if(not(IsUnitInGroup(udg_JD_Unit[udg_JD_Integers[3]], udg_JD_Group) == true))then
        return false
    endif
    return true
endfunction
function Trig_Orbs_System_2_Actions takes nothing returns nothing
    set udg_JD_Integers[3] = 1
    loop
        exitwhen udg_JD_Integers[3] > udg_JD_Integers[2]
        if(Trig_Orbs_System_2_Func001Func001C())then
            if(Trig_Orbs_System_2_Func001Func001Func001C())then
                call QueueUnitAnimationBJ(udg_JD_Unit[udg_JD_Integers[3]], udg_JD_Animations[udg_JD_Integers[3]])
                set udg_JD_TempPoint[1] = GetUnitLoc(udg_JD_Unit[udg_JD_Integers[3]])
                set udg_JD_TempPoint[2] = PolarProjectionBJ(udg_JD_TempPoint[1], udg_JD_SpeedUnits[udg_JD_Integers[3]], udg_JD_Angle[udg_JD_Integers[3]])
                call SetUnitPositionLoc(udg_JD_Unit[udg_JD_Integers[3]], udg_JD_TempPoint[2])
                set udg_JD_ReachedDistance[udg_JD_Integers[3]] = (udg_JD_ReachedDistance[udg_JD_Integers[3]] + udg_JD_SpeedUnits[udg_JD_Integers[3]])
                if(Trig_Orbs_System_2_Func001Func001Func001Func019C())then
                    call AddSpecialEffectTargetUnitBJ("chest", udg_JD_Unit[udg_JD_Integers[3]], udg_JD_Effect[udg_JD_Integers[3]])
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                else
                endif
                set udg_JD_RealTimer[udg_JD_Integers[3]] = (udg_JD_RealTimer[udg_JD_Integers[3]] + (180.00 / (udg_JD_Distances[udg_JD_Integers[3]] / udg_JD_SpeedUnits[udg_JD_Integers[3]])))
                set udg_JD_JumpHigh[udg_JD_Integers[3]] = (SinBJ(udg_JD_RealTimer[udg_JD_Integers[3]]) * udg_JD_HighSettings[udg_JD_Integers[3]])
                call SetUnitFlyHeightBJ(udg_JD_Unit[udg_JD_Integers[3]], udg_JD_JumpHigh[udg_JD_Integers[3]], 1000000000.00)
                call RemoveLocation(udg_JD_TempPoint[1])
                call RemoveLocation(udg_JD_TempPoint[2])
            else
                call SetUnitPathing(udg_JD_Unit[udg_JD_Integers[3]], true)
                call GroupRemoveUnitSimple(udg_JD_Unit[udg_JD_Integers[3]], udg_JD_Group)
                call SetUnitTimeScalePercent(udg_JD_Unit[udg_JD_Integers[3]], 100.00)
                call ResetUnitAnimation(udg_JD_Unit[udg_JD_Integers[3]])
                set udg_JD_RealTimer[udg_JD_Integers[3]] = 0.00
                set udg_JD_Integers[1] = (udg_JD_Integers[1] - 1)
                set udg_Point = GetUnitLoc(udg_JD_Unit[udg_JD_Integers[3]])
                if(Trig_Orbs_System_2_Func001Func001Func001Func010C())then
                    set udg_LightOrbs[3] = (udg_LightOrbs[3] - 1)
                    call CreateItemLoc(0x49303059, udg_Point)
                else
                    if(Trig_Orbs_System_2_Func001Func001Func001Func010Func002C())then
                        set udg_LightOrbs[2] = (udg_LightOrbs[2] - 1)
                        call CreateItemLoc(0x49303058, udg_Point)
                    else
                        if(Trig_Orbs_System_2_Func001Func001Func001Func010Func002Func002C())then
                            set udg_LightOrbs[1] = (udg_LightOrbs[1] - 1)
                            call CreateItemLoc(0x72686532, udg_Point)
                        else
                        endif
                    endif
                endif
                call RemoveUnit(udg_JD_Unit[udg_JD_Integers[3]])
                call RemoveLocation(udg_Point)
                if(Trig_Orbs_System_2_Func001Func001Func001Func014C())then
                    set udg_JD_Integers[2] = 0
                    call DisableTrigger(GetTriggeringTrigger())
                else
                endif
            endif
        else
        endif
        set udg_JD_Integers[3] = udg_JD_Integers[3] + 1
    endloop
endfunction

function InitTrig_Orbs_System_2 takes nothing returns nothing
    set gg_trg_Orbs_System_2 = CreateTrigger()
    call DisableTrigger(gg_trg_Orbs_System_2)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Orbs_System_2, 0.02)
    call TriggerAddAction(gg_trg_Orbs_System_2, function Trig_Orbs_System_2_Actions)
endfunction

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
function Trig_Quest_Progress_Actions takes nothing returns nothing
    set udg_QG_Count[udg_QG_ObjectiveState[1]] = (udg_QG_Count[udg_QG_ObjectiveState[1]] + 3)
    set udg_QG_Count[udg_QG_ObjectiveState[2]] = (udg_QG_Count[udg_QG_ObjectiveState[2]] + 3)
    call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
endfunction
function InitTrig_Quest_Progress takes nothing returns nothing
    set gg_trg_Quest_Progress = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Quest_Progress, Player(0), "-", true)
    call TriggerAddAction(gg_trg_Quest_Progress, function Trig_Quest_Progress_Actions)
endfunction
function Trig_Exp_Actions takes nothing returns nothing
    call AddHeroXPSwapped(100, gg_unit_H000_0004, false)
endfunction
function InitTrig_Exp takes nothing returns nothing
    set gg_trg_Exp = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Exp, Player(0), "ex", true)
    call TriggerAddAction(gg_trg_Exp, function Trig_Exp_Actions)
endfunction
function Trig_Check_Lvl_Actions takes nothing returns nothing
    call DisplayTimedTextToForce(GetPlayersAll(), 1.00, I2S(GetHeroLevel(udg_Arct)))
endfunction
function InitTrig_Check_Lvl takes nothing returns nothing
    set gg_trg_Check_Lvl = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Check_Lvl, Player(0), "cl", true)
    call TriggerAddAction(gg_trg_Check_Lvl, function Trig_Check_Lvl_Actions)
endfunction
function Trig_Level_Actions takes nothing returns nothing
    call SetHeroLevelBJ(udg_Arct, S2I(SubStringBJ(GetEventPlayerChatString(), 5, 6)), false)
endfunction
function InitTrig_Level takes nothing returns nothing
    set gg_trg_Level = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Level, Player(0), "lvl", false)
    call TriggerAddAction(gg_trg_Level, function Trig_Level_Actions)
endfunction
function Trig_Scrolls_Actions takes nothing returns nothing
    call CreateItemLoc(0x49303143, GetUnitLoc(udg_Arct))
    call CreateItemLoc(0x49303131, GetUnitLoc(udg_Arct))
    call CreateItemLoc(0x49303055, GetUnitLoc(udg_Arct))
endfunction
function InitTrig_Scrolls takes nothing returns nothing
    set gg_trg_Scrolls = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Scrolls, Player(0), "sc", true)
    call TriggerAddAction(gg_trg_Scrolls, function Trig_Scrolls_Actions)
endfunction
function Trig_Suicide_Actions takes nothing returns nothing
    call KillUnit(gg_unit_H000_0004)
endfunction
function InitTrig_Suicide takes nothing returns nothing
    set gg_trg_Suicide = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Suicide, Player(0), "8", true)
    call TriggerAddAction(gg_trg_Suicide, function Trig_Suicide_Actions)
endfunction
function Trig_Unlock_Difficulties_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 3
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_Difficulty_Unlocked[bj_forLoopAIndex] = true
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
endfunction
function InitTrig_Unlock_Difficulties takes nothing returns nothing
    set gg_trg_Unlock_Difficulties = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Unlock_Difficulties, Player(0), "4", true)
    call TriggerAddAction(gg_trg_Unlock_Difficulties, function Trig_Unlock_Difficulties_Actions)
endfunction
function Trig_Talent_Level_Actions takes nothing returns nothing
    set udg_ART[S2I(SubStringBJ(GetEventPlayerChatString(), 2, 3))] = S2I(SubStringBJ(GetEventPlayerChatString(), 4, 5))
endfunction
function InitTrig_Talent_Level takes nothing returns nothing
    set gg_trg_Talent_Level = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Talent_Level, Player(0), "t", false)
    call TriggerAddAction(gg_trg_Talent_Level, function Trig_Talent_Level_Actions)
endfunction
function Trig_Camera_Disable_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Camera_Fix)
    call DisableTrigger(gg_trg_Camera_Hero)
    call DisableTrigger(gg_trg_Camera_Tree)
    call SetCameraBoundsToRectForPlayerBJ(Player(0), GetPlayableMapRect())
    call CameraSetupApplyForceDuration(gg_cam_Center, true, 0.00)
endfunction
function InitTrig_Camera_Disable takes nothing returns nothing
    set gg_trg_Camera_Disable = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Camera_Disable, Player(0), "cd", true)
    call TriggerAddAction(gg_trg_Camera_Disable, function Trig_Camera_Disable_Actions)
endfunction
function Trig_Set_Ingredients_Actions takes nothing returns nothing
    set udg_CC_Ingredient[S2I(SubStringBJ(GetEventPlayerChatString(), 2, 2))] = S2I(SubStringBJ(GetEventPlayerChatString(), 4, 5))
endfunction
function InitTrig_Set_Ingredients takes nothing returns nothing
    set gg_trg_Set_Ingredients = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Set_Ingredients, Player(0), "i", false)
    call TriggerAddAction(gg_trg_Set_Ingredients, function Trig_Set_Ingredients_Actions)
endfunction
function Trig_Add_Ingredients_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 10
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_CC_Ingredient[bj_forLoopAIndex] = 10
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
endfunction
function InitTrig_Add_Ingredients takes nothing returns nothing
    set gg_trg_Add_Ingredients = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Add_Ingredients, Player(0), "i+", true)
    call TriggerAddAction(gg_trg_Add_Ingredients, function Trig_Add_Ingredients_Actions)
endfunction
function Trig_Unhide_Recipes_Func002002 takes nothing returns nothing
    call ShowUnitShow(GetEnumUnit())
endfunction
function Trig_Unhide_Recipes_Actions takes nothing returns nothing
    set udg_UnitGroup = GetUnitsInRectOfPlayer(gg_rct_Secrets, Player(PLAYER_NEUTRAL_PASSIVE))
    call ForGroupBJ(udg_UnitGroup, function Trig_Unhide_Recipes_Func002002)
    call DestroyGroup(udg_UnitGroup)
endfunction
function InitTrig_Unhide_Recipes takes nothing returns nothing
    set gg_trg_Unhide_Recipes = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Unhide_Recipes, Player(0), "ur", true)
    call TriggerAddAction(gg_trg_Unhide_Recipes, function Trig_Unhide_Recipes_Actions)
endfunction
function Trig_God_Mode_Actions takes nothing returns nothing
    call DestroyTrigger(gg_trg_WhosYourDaddy)
    call DestroyTrigger(gg_trg_GreedIsGood)
    call Cheat("whosyourdaddy")
    call SetUnitMoveSpeed(udg_Arct, 522.00)
endfunction
function InitTrig_God_Mode takes nothing returns nothing
    set gg_trg_God_Mode = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_God_Mode, Player(0), "5", true)
    call TriggerAddAction(gg_trg_God_Mode, function Trig_God_Mode_Actions)
endfunction
function Trig_Boss_Func003Func001Func003C takes nothing returns boolean
    return GetEventPlayerChatString() == "boss3"
endfunction
function Trig_Boss_Func003Func001C takes nothing returns boolean
    return GetEventPlayerChatString() == "boss2"
endfunction
function Trig_Boss_Func003C takes nothing returns boolean
    return GetEventPlayerChatString() == "boss1"
endfunction
function Trig_Boss_Actions takes nothing returns nothing
    set udg_Difficulty_Unlocked[1] = true
    call SuspendHeroXPBJ(true, gg_unit_H000_0004)
    if(Trig_Boss_Func003C())then
        call SetHeroLevelBJ(gg_unit_H000_0004, 10, false)
        call AdjustPlayerStateBJ(100, Player(0), PLAYER_STATE_RESOURCE_GOLD)
        call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, 10)
        call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, 10)
        call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, 10)
    else
        if(Trig_Boss_Func003Func001C())then
            set udg_EM_Boss[1] = true
            set udg_EM_Generate = 2
            call SetHeroLevelBJ(gg_unit_H000_0004, 20, false)
            call AdjustPlayerStateBJ(200, Player(0), PLAYER_STATE_RESOURCE_GOLD)
            call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, 15)
            call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, 15)
            call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, 15)
            call ConditionalTriggerExecute(gg_trg_Map_Generate)
        else
            if(Trig_Boss_Func003Func001Func003C())then
                set udg_EM_Boss[1] = true
                set udg_EM_Boss[2] = true
                set udg_EM_Generate = 3
                call SetHeroLevelBJ(gg_unit_H000_0004, 40, false)
                call AdjustPlayerStateBJ(300, Player(0), PLAYER_STATE_RESOURCE_GOLD)
                call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, 20)
                call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, 20)
                call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, 20)
                call ConditionalTriggerExecute(gg_trg_Map_Generate)
            else
                set udg_EM_Boss[1] = true
                set udg_EM_Boss[2] = true
                set udg_EM_Boss[3] = true
                set udg_EM_Generate = 4
                call SetHeroLevelBJ(gg_unit_H000_0004, 60, false)
                call AdjustPlayerStateBJ(500, Player(0), PLAYER_STATE_RESOURCE_GOLD)
                call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, 20)
                call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, 20)
                call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, 20)
                call ConditionalTriggerExecute(gg_trg_Map_Generate)
            endif
        endif
    endif
    call ConditionalTriggerExecute(gg_trg_Attributes_Multiboard)
    call AdjustPlayerStateBJ(50, Player(0), PLAYER_STATE_RESOURCE_LUMBER)
    call SuspendHeroXPBJ(false, gg_unit_H000_0004)
endfunction
function InitTrig_Boss takes nothing returns nothing
    set gg_trg_Boss = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Boss, Player(0), "boss1", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Boss, Player(0), "boss2", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Boss, Player(0), "boss3", true)
    call TriggerRegisterPlayerChatEvent(gg_trg_Boss, Player(0), "boss4", true)
    call TriggerAddAction(gg_trg_Boss, function Trig_Boss_Actions)
endfunction
function Trig_Attributes_Func001C takes nothing returns boolean
    return SubStringBJ(GetEventPlayerChatString(), 2, 2) == "a"
endfunction
function Trig_Attributes_Func002C takes nothing returns boolean
    return SubStringBJ(GetEventPlayerChatString(), 2, 2) == "f"
endfunction
function Trig_Attributes_Func003C takes nothing returns boolean
    return SubStringBJ(GetEventPlayerChatString(), 2, 2) == "w"
endfunction
function Trig_Attributes_Actions takes nothing returns nothing
    if(Trig_Attributes_Func001C())then
        call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_SET, S2I(SubStringBJ(GetEventPlayerChatString(), 4, 5)))
    else
    endif
    if(Trig_Attributes_Func002C())then
        call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_SET, S2I(SubStringBJ(GetEventPlayerChatString(), 4, 5)))
    else
    endif
    if(Trig_Attributes_Func003C())then
        call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_SET, S2I(SubStringBJ(GetEventPlayerChatString(), 4, 5)))
    else
    endif
endfunction
function InitTrig_Attributes takes nothing returns nothing
    set gg_trg_Attributes = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Attributes, Player(0), "-a", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_Attributes, Player(0), "-f", false)
    call TriggerRegisterPlayerChatEvent(gg_trg_Attributes, Player(0), "-w", false)
    call TriggerAddAction(gg_trg_Attributes, function Trig_Attributes_Actions)
endfunction
function Trig_Item_Generate_Actions takes nothing returns nothing
    set udg_IG_ItemQuality = GetRandomInt(1, 3)
    set udg_IG_Point = GetUnitLoc(udg_Arct)
    call ConditionalTriggerExecute(gg_trg_IG_Generate)
endfunction
function InitTrig_Item_Generate takes nothing returns nothing
    set gg_trg_Item_Generate = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Item_Generate, Player(0), "/", true)
    call TriggerAddAction(gg_trg_Item_Generate, function Trig_Item_Generate_Actions)
endfunction
function Trig_Item_Clear_Func001A takes nothing returns nothing
    call RemoveItem(GetEnumItem())
endfunction
function Trig_Item_Clear_Actions takes nothing returns nothing
    call EnumItemsInRectBJ(gg_rct_Ambient_Portal_Room, function Trig_Item_Clear_Func001A)
endfunction
function InitTrig_Item_Clear takes nothing returns nothing
    set gg_trg_Item_Clear = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Item_Clear, Player(0), "//", true)
    call TriggerAddAction(gg_trg_Item_Clear, function Trig_Item_Clear_Actions)
endfunction
function Trig_Ability_Points_Actions takes nothing returns nothing
    set udg_AS_Points = S2I(SubStringBJ(GetEventPlayerChatString(), 2, 5))
    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 1, ("Очки навыков: " + I2S(udg_AS_Points)))
endfunction
function InitTrig_Ability_Points takes nothing returns nothing
    set gg_trg_Ability_Points = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Ability_Points, Player(0), ".", false)
    call TriggerAddAction(gg_trg_Ability_Points, function Trig_Ability_Points_Actions)
endfunction
function Trig_Item_Max_Lvl_Actions takes nothing returns nothing
    set udg_IG_ItemLVL_Max = S2I(SubStringBJ(GetEventPlayerChatString(), 2, 2))
endfunction
function InitTrig_Item_Max_Lvl takes nothing returns nothing
    set gg_trg_Item_Max_Lvl = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Item_Max_Lvl, Player(0), "+", false)
    call TriggerAddAction(gg_trg_Item_Max_Lvl, function Trig_Item_Max_Lvl_Actions)
endfunction
function Trig_Heal_Actions takes nothing returns nothing
    call SetUnitLifePercentBJ(udg_Arct, 100)
    call SetUnitManaPercentBJ(udg_Arct, 100)
endfunction
function InitTrig_Heal takes nothing returns nothing
    set gg_trg_Heal = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Heal, Player(0), "q", true)
    call TriggerAddAction(gg_trg_Heal, function Trig_Heal_Actions)
endfunction
function Trig_Damage_Actions takes nothing returns nothing
    call SetUnitLifePercentBJ(udg_Arct, 50.00)
    call SetUnitManaPercentBJ(udg_Arct, 0.00)
endfunction
function InitTrig_Damage takes nothing returns nothing
    set gg_trg_Damage = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Damage, Player(0), "d", true)
    call TriggerAddAction(gg_trg_Damage, function Trig_Damage_Actions)
endfunction
function Trig_ChanceCrit_Actions takes nothing returns nothing
    call ClearTextMessagesBJ(GetPlayersAll())
    call DisplayTimedTextToForce(GetPlayersAll(), 1.00, R2S(udg_ChanceCrit))
endfunction
function InitTrig_ChanceCrit takes nothing returns nothing
    set gg_trg_ChanceCrit = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_ChanceCrit, Player(0), "cr", true)
    call TriggerAddAction(gg_trg_ChanceCrit, function Trig_ChanceCrit_Actions)
endfunction
function Trig_ChanceBlock_Actions takes nothing returns nothing
    call ClearTextMessagesBJ(GetPlayersAll())
    call DisplayTimedTextToForce(GetPlayersAll(), 1.00, R2S(udg_ChanceBlock))
endfunction
function InitTrig_ChanceBlock takes nothing returns nothing
    set gg_trg_ChanceBlock = CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_ChanceBlock, Player(0), "bl", true)
    call TriggerAddAction(gg_trg_ChanceBlock, function Trig_ChanceBlock_Actions)
endfunction
function Trig_Ending_Init_Actions takes nothing returns nothing
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 2.00, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 100.00, 100.00, 100.00, 20.00)
    call DisableTrigger(gg_trg_Camera_Boss)
    call EnableTrigger(gg_trg_Camera_Hero)
    call SetUnitLifePercentBJ(udg_Arct, 100)
    call SetUnitManaPercentBJ(udg_Arct, 100)
    call StopMusicBJ(true)
    call UnitAddAbilityBJ(0x4176756C, udg_Arct)
    call DestroyLightningBJ(udg_Boss3PortalEffect)
    call DisableTrigger(gg_trg_Boss_III_Creep_Spawn)
    call DisableTrigger(gg_trg_Boss_III_Portal_Use)
    call DisableTrigger(gg_trg_Boss_III_Portal_Spawn)
    call DisableTrigger(gg_trg_Boss_III_Portal_Abort)
    call DisableTrigger(gg_trg_Boss_III_Portal_Timer)
    call DisableTrigger(gg_trg_Boss_III_Puke_Rain_Init)
    call DisableTrigger(gg_trg_Boss_III_Puke_Rain)
    call ConditionalTriggerExecute(gg_trg_Boss_Units_Remove)
    set udg_Point = GetRectCenter(gg_rct_Boss_3_Spawn)
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\BloodEX-Special-2.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call RemoveLocation(udg_Point)
    call TriggerSleepAction(5.00)
    set udg_Point = GetUnitLoc(gg_unit_h00V_0029)
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Retribution.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call RemoveLocation(udg_Point)
    call TriggerSleepAction(0.80)
    call ShowUnitShow(gg_unit_h00V_0029)
    call UnitAddAbilityBJ(0x416C6F63, gg_unit_h00V_0029)
    call TriggerSleepAction(3.00)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_h00V_0029, "Эдемор", gg_snd_Edemor1, "Путь Пилигрима пройден. Что ты чувствуешь?", bj_TIMETYPE_ADD, 0.00, true)
    call DialogClearBJ(udg_EndingDialog)
    call DialogSetMessageBJ(udg_EndingDialog, "Что ты чувствуешь?")
    call DialogAddButtonBJ(udg_EndingDialog, "Грусть")
    set udg_DialogButton[1] = GetLastCreatedButtonBJ()
    call DialogAddButtonBJ(udg_EndingDialog, "Облегчение")
    set udg_DialogButton[2] = GetLastCreatedButtonBJ()
    call DialogAddButtonBJ(udg_EndingDialog, "Радость")
    set udg_DialogButton[3] = GetLastCreatedButtonBJ()
    call DialogAddButtonBJ(udg_EndingDialog, "Воодушевление")
    set udg_DialogButton[4] = GetLastCreatedButtonBJ()
    call DialogAddButtonBJ(udg_EndingDialog, "Безразличие")
    set udg_DialogButton[5] = GetLastCreatedButtonBJ()
    call DialogAddButtonBJ(udg_EndingDialog, "Голод")
    set udg_DialogButton[6] = GetLastCreatedButtonBJ()
    call DialogDisplayBJ(true, udg_EndingDialog, Player(0))
    call EnableTrigger(gg_trg_Ending_Dialogue_1)
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Ending_Init takes nothing returns nothing
    set gg_trg_Ending_Init = CreateTrigger()
    call TriggerAddAction(gg_trg_Ending_Init, function Trig_Ending_Init_Actions)
endfunction

function Trig_Ending_Dialogue_1_Actions takes nothing returns nothing
    if GetClickedButton() == udg_DialogButton[1] or GetClickedButton() == udg_DialogButton[5] or GetClickedButton() == udg_DialogButton[6] then
        call TriggerSleepAction(1.00)
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_h00V_0029, "Эдемор", gg_snd_Edemor2, "Если это всё что ты чувствуешь на пороге в Эдем, мне становится неясно - зачем тогда ты прошёл весь этот путь не имея высшей цели. Эдем не открывается тем, кому он не нужен. Может когда-нибудь тебе снова выпадет шанс оказаться предо мной, но не в этой жизни.", bj_TIMETYPE_ADD, 1.00, true)
        call ConditionalTriggerExecute(gg_trg_Bad_Ending_Good_Job)
    else
        call TriggerSleepAction(1.00)
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_h00V_0029, "Эдемор", gg_snd_Edemor3, "Ты достоин войти в Эдем, но готов ли ты ради этого отбросить свои привязанности, отпустить любимых и простить врагов, отказаться от всех желаний и испытать настоящую смерть?", bj_TIMETYPE_ADD, 1.00, true)
        call DialogClearBJ(udg_EndingDialog)
        call DialogSetMessageBJ(udg_EndingDialog, "Готов ли ты?")
        call DialogAddButtonBJ(udg_EndingDialog, "Да")
        set udg_DialogButton[1] = GetLastCreatedButtonBJ()
        call DialogAddButtonBJ(udg_EndingDialog, "Нет")
        set udg_DialogButton[2] = GetLastCreatedButtonBJ()
        call DialogDisplayBJ(true, udg_EndingDialog, Player(0))
        call EnableTrigger(gg_trg_Ending_Dialogue_2)
        call DestroyTrigger(GetTriggeringTrigger())
    endif
endfunction
function InitTrig_Ending_Dialogue_1 takes nothing returns nothing
    set gg_trg_Ending_Dialogue_1 = CreateTrigger()
    call DisableTrigger(gg_trg_Ending_Dialogue_1)
    call TriggerRegisterDialogEventBJ(gg_trg_Ending_Dialogue_1, udg_EndingDialog)
    call TriggerAddAction(gg_trg_Ending_Dialogue_1, function Trig_Ending_Dialogue_1_Actions)
endfunction

function Trig_Ending_Dialogue_2_Actions takes nothing returns nothing
    if GetClickedButton() == udg_DialogButton[1] then
        call TriggerSleepAction(1.00)
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_h00V_0029, "Эдемор", gg_snd_Edemor4, "Отвечай честно.", bj_TIMETYPE_ADD, 1.00, true)
        call DialogClearBJ(udg_EndingDialog)
        call DialogSetMessageBJ(udg_EndingDialog, "Отвечай честно.")
        call DialogAddButtonBJ(udg_EndingDialog, "Я готов")
        set udg_DialogButton[1] = GetLastCreatedButtonBJ()
        call DialogAddButtonBJ(udg_EndingDialog, "Я не готов")
        set udg_DialogButton[2] = GetLastCreatedButtonBJ()
        call DialogDisplayBJ(true, udg_EndingDialog, Player(0))
        call EnableTrigger(gg_trg_Ending_Dialogue_3)
    else
        call TriggerSleepAction(1.00)
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_h00V_0029, "Эдемор", gg_snd_Edemor5, "Тогда путь был проделан зря. Твои деяния потеряли значение. Возвращайся обратно и доживай свой век на поводу у своих слабостей. Может когда-нибудь тебе снова выпадет шанс оказаться предо мной, но не в этой жизни.", bj_TIMETYPE_ADD, 1.00, true)
        call ConditionalTriggerExecute(gg_trg_Bad_Ending_Good_Job)
    endif
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Ending_Dialogue_2 takes nothing returns nothing
    set gg_trg_Ending_Dialogue_2 = CreateTrigger()
    call DisableTrigger(gg_trg_Ending_Dialogue_2)
    call TriggerRegisterDialogEventBJ(gg_trg_Ending_Dialogue_2, udg_EndingDialog)
    call TriggerAddAction(gg_trg_Ending_Dialogue_2, function Trig_Ending_Dialogue_2_Actions)
endfunction

function Trig_Ending_Dialogue_3_Actions takes nothing returns nothing
    if GetClickedButton() == udg_DialogButton[1] then
        call TriggerSleepAction(3.00)
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_h00V_0029, "Эдемор", gg_snd_Edemor6, "Идём со мной.", bj_TIMETYPE_ADD, 1.00, true)
        set udg_Transparent = 0.00
        call EnableTrigger(gg_trg_Edemor_Transparent_2)
        call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 4.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 100.00, 100.00, 100.00, 0.00)
        call CinematicModeExBJ(true, bj_FORCE_PLAYER[0], 5.00)
        call TriggerSleepAction(5.00)
        call DisplayTimedTextToForce(GetPlayersAll(), 999.00, "Аркт достиг Эдема.")
        call StopMusicBJ(false)
        call ClearMapMusicBJ()
        call PlayMusic((("/Edemium/MusicEnding.mp3")))
        call TriggerSleepAction(10.00)
        call DisplayTimedTextToForce(GetPlayersAll(), 999.00, "Ты справился, красавчик! Спасибо тебе!|nОставь отзыв на сайте (xgm.guru/p/edemium) - сделай мир лучше!")
        call TriggerSleepAction(25.00)
        call DisplayTimedTextToForce(GetPlayersAll(), 999.00, "ALT + F4")
    else
        call TriggerSleepAction(1.00)
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), gg_unit_h00V_0029, "Эдемор", gg_snd_Edemor5, "Тогда путь был проделан зря. Твои деяния потеряли значение. Возвращайся обратно и доживай свой век на поводу у своих слабостей. Может когда-нибудь тебе снова выпадет шанс оказаться предо мной, но не в этой жизни.", bj_TIMETYPE_ADD, 1.00, true)
        call ConditionalTriggerExecute(gg_trg_Bad_Ending_Good_Job)
    endif
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
function InitTrig_Ending_Dialogue_3 takes nothing returns nothing
    set gg_trg_Ending_Dialogue_3 = CreateTrigger()
    call DisableTrigger(gg_trg_Ending_Dialogue_3)
    call TriggerRegisterDialogEventBJ(gg_trg_Ending_Dialogue_3, udg_EndingDialog)
    call TriggerAddAction(gg_trg_Ending_Dialogue_3, function Trig_Ending_Dialogue_3_Actions)
endfunction
function Trig_Bad_Ending_Good_Job_Actions takes nothing returns nothing
    call StopMusicBJ(false)
    call ClearMapMusicBJ()
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 4.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 100.00, 100.00, 100.00, 0.00)
    call CinematicModeExBJ(true, bj_FORCE_PLAYER[0], 5.00)
    call TriggerSleepAction(5.00)
    call PlayMusic((("/Edemium/MusicEnding.mp3")))
    call DisplayTimedTextToForce(GetPlayersAll(), 999.00, "Аркт не достиг Эдема.")
    call TriggerSleepAction(10.00)
    call DisplayTimedTextToForce(GetPlayersAll(), 999.00, "Ты не справился, но всё равно спасибо тебе!|nОставь отзыв на сайте (xgm.guru/p/edemium) - сделай мир лучше!")
    call TriggerSleepAction(25.00)
    call DisplayTimedTextToForce(GetPlayersAll(), 999.00, "ALT + F4")
endfunction
function InitTrig_Bad_Ending_Good_Job takes nothing returns nothing
    set gg_trg_Bad_Ending_Good_Job = CreateTrigger()
    call TriggerAddAction(gg_trg_Bad_Ending_Good_Job, function Trig_Bad_Ending_Good_Job_Actions)
endfunction
function Trig_Edemor_Transparent_2_Func004C takes nothing returns boolean
    return udg_Transparent >= 100.00
endfunction
function Trig_Edemor_Transparent_2_Actions takes nothing returns nothing
    set udg_Transparent = (udg_Transparent + 3.00)
    call SetUnitVertexColorBJ(gg_unit_h00V_0029, 100, 100, 100, udg_Transparent)
    call SetUnitVertexColorBJ(gg_unit_H000_0004, 100, 100, 100, udg_Transparent)
    if(Trig_Edemor_Transparent_2_Func004C())then
        call ShowUnitHide(gg_unit_h00V_0029)
        call ShowUnitHide(gg_unit_H000_0004)
        set udg_Transparent = 0.00
        call DestroyTrigger(GetTriggeringTrigger())
    else
    endif
endfunction
function InitTrig_Edemor_Transparent_2 takes nothing returns nothing
    set gg_trg_Edemor_Transparent_2 = CreateTrigger()
    call DisableTrigger(gg_trg_Edemor_Transparent_2)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Edemor_Transparent_2, 0.10)
    call TriggerAddAction(gg_trg_Edemor_Transparent_2, function Trig_Edemor_Transparent_2_Actions)
endfunction