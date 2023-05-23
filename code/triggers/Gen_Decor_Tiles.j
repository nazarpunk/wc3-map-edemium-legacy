
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
