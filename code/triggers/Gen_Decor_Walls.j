function Trig_Gen_Decor_Walls_Actions takes nothing returns nothing
    set udg_RandomNumber = GetRandomInt(1, 9)
    if udg_D_WallType == 1 then
        if udg_RandomNumber == 1 then
            if udg_D_Torches != 5 then
                set udg_D_Torches = (udg_D_Torches + 1)
                call CreateDestructableLoc(0x42303051, udg_D_PointOffset, 0.00, 1.80, 0)
            endif
        endif
        if udg_RandomNumber == 2 then
            call CreateDestructableLoc(0x4230304C, udg_D_PointOffset, 90.00, 2.30, 0)
        endif
        if udg_RandomNumber == 3 then
            call CreateDestructableLoc(0x4230304D, udg_D_PointOffset, 90.00, 2.70, 0)
            if GetRandomInt(1, 2) == 1 then
                call CreateDestructableLoc(0x4230304F, udg_D_PointOffset, GetRandomReal(0, 360.00), 1.30, 0)
            else
                call CreateDestructableLoc(0x4230304E, udg_D_PointOffset, GetRandomReal(0, 360.00), 1.00, 0)
            endif
        endif
        if udg_RandomNumber == 4 then
            call CreateDestructableLoc(0x4230304B, udg_D_PointOffset, 0.00, 2.40, 0)
        endif
        if udg_RandomNumber == 5 then
            call CreateDestructableLoc(0x42303052, udg_D_PointOffset, 90.00, 2.40, 0)
        endif
        if udg_RandomNumber == 6 or udg_RandomNumber == 7 then
            set udg_Point = OffsetLocation(udg_D_PointOffset, 30.00, 0.00)
            call CreateDestructableLoc(0x42303053, udg_Point, 0.00, 0.90, 0)
            call RemoveLocation(udg_Point)
        endif
        if udg_RandomNumber == 8 then
            call CreateDestructableLoc(0x42303135, udg_D_PointOffset, 90.00, 1.50, 0)
        endif
    endif
    if udg_D_WallType == 2 then
        if udg_RandomNumber == 1 then
            if udg_D_Torches != 5 then
                set udg_D_Torches = (udg_D_Torches + 1)
                call CreateDestructableLoc(0x42303051, udg_D_PointOffset, 270.00, 1.80, 0)
            endif
        endif
        if udg_RandomNumber == 2 then
            call CreateDestructableLoc(0x4230304C, udg_D_PointOffset, 0.00, 2.30, 0)
        endif
        if udg_RandomNumber == 3 then
            call CreateDestructableLoc(0x4230304D, udg_D_PointOffset, 0.00, 2.70, 0)
            if GetRandomInt(1, 2) == 1 then
                call CreateDestructableLoc(0x4230304F, udg_D_PointOffset, GetRandomReal(0, 360.00), 1.30, 0)
            else
                call CreateDestructableLoc(0x4230304E, udg_D_PointOffset, GetRandomReal(0, 360.00), 1.00, 0)
            endif
        endif
        if udg_RandomNumber == 4 then
            call CreateDestructableLoc(0x4230304B, udg_D_PointOffset, 270.00, 2.40, 0)
        endif
        if udg_RandomNumber == 5 then
            call CreateDestructableLoc(0x42303052, udg_D_PointOffset, 180.00, 2.40, 0)
        endif
        if udg_RandomNumber == 6 or udg_RandomNumber == 7 then
            set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, - 30.00)
            call CreateDestructableLoc(0x42303053, udg_Point, 270.00, 0.90, 0)
            call RemoveLocation(udg_Point)
        endif
        if udg_RandomNumber == 8 then
            call CreateDestructableLoc(0x42303135, udg_D_PointOffset, 0.00, 1.50, 0)
        endif
    endif
    if udg_D_WallType == 3 then
        if udg_RandomNumber == 1 then
            if udg_D_Torches != 5 then
                set udg_D_Torches = (udg_D_Torches + 1)
                call CreateDestructableLoc(0x42303051, udg_D_PointOffset, 180.00, 1.80, 0)
            endif
        endif
        if udg_RandomNumber == 2 then
            call CreateDestructableLoc(0x4230304C, udg_D_PointOffset, 270.00, 2.30, 0)
        endif
        if udg_RandomNumber == 3 then
            call CreateDestructableLoc(0x4230304D, udg_D_PointOffset, 270.00, 2.70, 0)
            if GetRandomInt(1, 2) == 1 then
                call CreateDestructableLoc(0x4230304F, udg_D_PointOffset, GetRandomReal(0, 360.00), 1.30, 0)
            else
                call CreateDestructableLoc(0x4230304E, udg_D_PointOffset, GetRandomReal(0, 360.00), 1.00, 0)
            endif
        endif
        if udg_RandomNumber == 4 then
            call CreateDestructableLoc(0x4230304B, udg_D_PointOffset, 180.00, 2.40, 0)
        endif
        if udg_RandomNumber == 5 then
            call CreateDestructableLoc(0x42303052, udg_D_PointOffset, 270.00, 2.40, 0)
        endif
        if udg_RandomNumber == 6 or udg_RandomNumber == 7 then
            set udg_Point = OffsetLocation(udg_D_PointOffset, - 30.00, 0.00)
            call CreateDestructableLoc(0x42303053, udg_Point, 180.00, 0.90, 0)
            call RemoveLocation(udg_Point)
        endif
        if udg_RandomNumber == 8 then
            call CreateDestructableLoc(0x42303135, udg_D_PointOffset, 270.00, 1.50, 0)
        endif
    endif
    if udg_D_WallType == 4 then
        if udg_RandomNumber == 1 then
            if udg_D_Torches != 5 then
                set udg_D_Torches = (udg_D_Torches + 1)
                call CreateDestructableLoc(0x42303051, udg_D_PointOffset, 90.00, 1.80, 0)
            endif
        endif
        if udg_RandomNumber == 2 then
            call CreateDestructableLoc(0x4230304C, udg_D_PointOffset, 190.00, 2.30, 0)
        endif
        if udg_RandomNumber == 3 then
            call CreateDestructableLoc(0x4230304D, udg_D_PointOffset, 180.00, 2.70, 0)
            if GetRandomInt(1, 2) == 1 then
                call CreateDestructableLoc(0x4230304F, udg_D_PointOffset, GetRandomReal(0, 360.00), 1.30, 0)
            else
                call CreateDestructableLoc(0x4230304E, udg_D_PointOffset, GetRandomReal(0, 360.00), 1.00, 0)
            endif
        endif
        if udg_RandomNumber == 4 then
            call CreateDestructableLoc(0x4230304B, udg_D_PointOffset, 90.00, 2.40, 0)
        endif
        if udg_RandomNumber == 5 then
            call CreateDestructableLoc(0x42303052, udg_D_PointOffset, 0.00, 2.40, 0)
        endif
        if udg_RandomNumber == 6 or udg_RandomNumber == 7 then
            set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, 30.00)
            call CreateDestructableLoc(0x42303053, udg_Point, 90.00, 0.90, 0)
            call RemoveLocation(udg_Point)
        endif
        if udg_RandomNumber == 8 then
            call CreateDestructableLoc(0x42303135, udg_D_PointOffset, 180.00, 1.50, 0)
        endif
    endif
    call RemoveLocation(udg_D_PointOffset)
endfunction

function InitTrig_Gen_Decor_Walls takes nothing returns nothing
    set gg_trg_Gen_Decor_Walls = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Decor_Walls, function Trig_Gen_Decor_Walls_Actions)
endfunction
