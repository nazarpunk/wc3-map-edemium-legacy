function Trig_Gen_Decor_Tiles_Func002Func002A takes nothing returns nothing
    set udg_D_Point2 = GetUnitLoc(GetEnumUnit())
    set udg_D_Point1 = OffsetLocation(udg_D_Point2, GetRandomReal(- 300.00, 300.00), GetRandomReal(- 300.00, 300.00))
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_D_Pick)
    if udg_RandomNumber == 1 then
        call CreateDestructableLoc(0x42303056, udg_D_Point1, GetRandomReal(0, 360.00), 2.50, 0)
    else
        if udg_RandomNumber == 2 then
            call CreateDestructableLoc(0x42303057, udg_D_Point1, GetRandomReal(0, 360.00), 2.50, 0)
        else
            if udg_RandomNumber == 3 then
                call CreateDestructableLoc(0x42303058, udg_D_Point1, GetRandomReal(0, 360.00), 2.30, 0)
            else
                if udg_RandomNumber == 4 then
                    call CreateDestructableLoc(0x42303059, udg_D_Point1, GetRandomReal(0, 360.00), 2.20, 0)
                else
                    if udg_RandomNumber == 5 then
                        call CreateDestructableLoc(0x4230305A, udg_D_Point1, GetRandomReal(0, 360.00), 2.30, 0)
                    else
                        if udg_RandomNumber == 6 then
                            call CreateDestructableLoc(0x4230304E, udg_D_Point1, GetRandomReal(0, 360.00), 1.00, 0)
                        else
                            if udg_RandomNumber == 7 then
                                call CreateDestructableLoc(0x4230304F, udg_D_Point1, GetRandomReal(0, 360.00), 1.30, 0)
                            else
                                if udg_RandomNumber == 8 then
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

function Trig_Gen_Decor_Tiles_Func004A takes nothing returns nothing
    local integer id = GetDestructableTypeId(GetEnumDestructable())
    if id == 0x42303235 or or id == 0x42303244 or id == 0x44546737 or id == 0x42303256 then
        set udg_D_WallType = 1
        set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
        set udg_D_PointOffset = OffsetLocation(udg_D_Point1, 60.00, udg_Offset[GetRandomInt(1, 5)])
        call RemoveLocation(udg_D_Point1)
        call ConditionalTriggerExecute(gg_trg_Gen_Decor_Walls)
    else
        if id == 0x42303234 or id == 0x42303242 or id == 0x44546735 or id == 0x42303252 then
            set udg_D_WallType = 2
            set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
            set udg_D_PointOffset = OffsetLocation(udg_D_Point1, udg_Offset[GetRandomInt(1, 5)], - 60.00)
            call RemoveLocation(udg_D_Point1)
            call ConditionalTriggerExecute(gg_trg_Gen_Decor_Walls)
        else
            if id == 0x42303232 or id == 0x42303243 or id == 0x42303133 or id == 0x42303255 then
                set udg_D_WallType = 3
                set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
                set udg_D_PointOffset = OffsetLocation(udg_D_Point1, - 60.00, udg_Offset[GetRandomInt(1, 5)])
                call RemoveLocation(udg_D_Point1)
                call ConditionalTriggerExecute(gg_trg_Gen_Decor_Walls)
            else
                if id == 0x42303233 or id == 0x42303241 or id == 0x42303132 or id == 0x42303251 then
                    set udg_D_WallType = 4
                    set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
                    set udg_D_PointOffset = OffsetLocation(udg_D_Point1, udg_Offset[GetRandomInt(1, 5)], 60.00)
                    call RemoveLocation(udg_D_Point1)
                    call ConditionalTriggerExecute(gg_trg_Gen_Decor_Walls)
                else
                    if id == 0x42303257 or id == 0x42303149 or id == 0x42303247 or id == 0x42303238 then
                        set udg_D_WallType = 5
                        set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
                        set udg_D_PointOffset = OffsetLocation(udg_D_Point1, - 60.00, udg_Offset[GetRandomInt(2, 4)])
                        call RemoveLocation(udg_D_Point1)
                        call ConditionalTriggerExecute(gg_trg_Gen_Decor_Rooms)
                    else
                        if id == 0x42303236 or id == 0x42303245 or id == 0x4230314A or id == 0x42303253 then
                            set udg_D_WallType = 6
                            set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
                            set udg_D_PointOffset = OffsetLocation(udg_D_Point1, udg_Offset[GetRandomInt(2, 4)], 60.00)
                            call RemoveLocation(udg_D_Point1)
                            call ConditionalTriggerExecute(gg_trg_Gen_Decor_Rooms)
                        else
                            if id == 0x42303239 or id == 0x42303248 or id == 0x42303152 or id == 0x42303258 then
                                set udg_D_WallType = 7
                                set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
                                set udg_D_PointOffset = OffsetLocation(udg_D_Point1, 60.00, udg_Offset[GetRandomInt(2, 4)])
                                call RemoveLocation(udg_D_Point1)
                                call ConditionalTriggerExecute(gg_trg_Gen_Decor_Rooms)
                            else
                                if id == 0x42303237 or id == 0x42303246 or id == 0x42303151 or id == 0x42303254 then
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
