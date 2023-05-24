function Trig_Gen_Decor_Rooms_Actions takes nothing returns nothing
    set udg_RandomNumber = GetRandomInt(1, 8)
    if udg_D_WallType == 5 then
        if udg_RandomNumber == 1 then
            if udg_D_Chests != udg_D_ChestsMax then
                if GetRandomInt(1, 100) >= 97 then
                    set udg_D_ChestType = 0x6E303046
                else
                    if GetRandomInt(1, 100) >= 91 then
                        set udg_D_ChestType = 0x6E303045
                    else
                        set udg_D_ChestType = 0x6E303044
                    endif
                endif
                set udg_D_Chests = (udg_D_Chests + 1)
                set udg_D_PointChest = OffsetLocation(udg_D_PointOffset, - 60.00, 0.00)
                call CreateNUnitsAtLoc(1, udg_D_ChestType, Player(PLAYER_NEUTRAL_PASSIVE), udg_D_PointChest, 180.00)
                call RemoveLocation(udg_D_PointChest)
                if GetRandomInt(1, 20) == 1 then
                    call SetUnitUserData(GetLastCreatedUnit(), 10)
                endif
            endif
        else
            if udg_RandomNumber == 2 then
                set udg_Point = OffsetLocation(udg_D_PointOffset, - 60.00, 0.00)
                call CreateDestructableLoc(udg_D_RoomDecorType[2], udg_Point, 180.00, udg_D_RoomDecorScale[2], 0)
                call RemoveLocation(udg_Point)
            else
                if udg_RandomNumber == 3 then
                    set udg_Point = OffsetLocation(udg_D_PointOffset, - 60.00, 0.00)
                    call CreateDestructableLoc(udg_D_RoomDecorType[3], udg_Point, 180.00, udg_D_RoomDecorScale[3], 0)
                    call RemoveLocation(udg_Point)
                else
                    if udg_RandomNumber == 4 then
                        call CreateDestructableLoc(udg_D_RoomDecorType[4], udg_D_PointOffset, 180.00, udg_D_RoomDecorScale[4], 0)
                    else
                        if udg_RandomNumber == 5 or udg_RandomNumber == 6 then
                            set udg_Point = OffsetLocation(udg_D_PointOffset, - 30.00, 0.00)
                            call CreateDestructableLoc(0x42303156, udg_Point, GetRandomReal(0, 360.00), 1.30, 0)
                            call RemoveLocation(udg_Point)
                        else
                            if udg_RandomNumber == 7 then
                                set udg_Point = OffsetLocation(udg_D_PointOffset, - 60.00, 0.00)
                                call CreateDestructableLoc(udg_D_RoomDecorType[7], udg_Point, GetRandomReal(0, 360.00), udg_D_RoomDecorScale[7], 0)
                                call RemoveLocation(udg_Point)
                            else
                                if udg_RandomNumber == 8 then
                                    set udg_Point = OffsetLocation(udg_D_PointOffset, - 25.00, 0.00)
                                    call CreateDestructableLoc(0x42303231, udg_Point, 90.00, 2.30, 0)
                                    call RemoveLocation(udg_Point)
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
    if udg_D_WallType == 6 then
        if udg_RandomNumber == 1 then
            if udg_D_Chests != udg_D_ChestsMax then
                if GetRandomInt(1, 100) >= 97 then
                    set udg_D_ChestType = 0x6E303046
                else
                    if GetRandomInt(1, 100) >= 91 then
                        set udg_D_ChestType = 0x6E303045
                    else
                        set udg_D_ChestType = 0x6E303044
                    endif
                endif
                set udg_D_Chests = (udg_D_Chests + 1)
                set udg_D_PointChest = OffsetLocation(udg_D_PointOffset, 0.00, 60.00)
                call CreateNUnitsAtLoc(1, udg_D_ChestType, Player(PLAYER_NEUTRAL_PASSIVE), udg_D_PointChest, 90.00)
                call RemoveLocation(udg_D_PointChest)
                if GetRandomInt(1, 20) == 1 then
                    call SetUnitUserData(GetLastCreatedUnit(), 10)
                endif
            endif
        else
            if udg_RandomNumber == 2 then
                set udg_Point = OffsetLocation(udg_D_PointOffset, udg_Offset[GetRandomInt(1, 5)], 60.00)
                call CreateDestructableLoc(udg_D_RoomDecorType[2], udg_Point, 90.00, udg_D_RoomDecorScale[2], 0)
                call RemoveLocation(udg_Point)
            else
                if udg_RandomNumber == 3 then
                    set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, 60.00)
                    call CreateDestructableLoc(udg_D_RoomDecorType[3], udg_Point, 90.00, udg_D_RoomDecorScale[3], 0)
                    call RemoveLocation(udg_Point)
                else
                    if udg_RandomNumber == 4 then
                        call CreateDestructableLoc(udg_D_RoomDecorType[4], udg_D_PointOffset, 90.00, udg_D_RoomDecorScale[4], 0)
                    else
                        if udg_RandomNumber == 5 or udg_RandomNumber == 6 then
                            set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, 30.00)
                            call CreateDestructableLoc(0x42303156, udg_Point, GetRandomReal(0, 360.00), 1.30, 0)
                            call RemoveLocation(udg_Point)
                        else
                            if udg_RandomNumber == 7 then
                                set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, 60.00)
                                call CreateDestructableLoc(udg_D_RoomDecorType[7], udg_Point, GetRandomReal(0, 360.00), udg_D_RoomDecorScale[7], 0)
                                call RemoveLocation(udg_Point)
                            else
                                if udg_RandomNumber == 8 then
                                    set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, 25.00)
                                    call CreateDestructableLoc(0x42303231, udg_Point, 180.00, 2.30, 0)
                                    call RemoveLocation(udg_Point)
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
    if udg_D_WallType == 7 then
        if udg_RandomNumber == 1 then
            if udg_D_Chests != udg_D_ChestsMax then
                if GetRandomInt(1, 100) >= 97 then
                    set udg_D_ChestType = 0x6E303046
                else
                    if GetRandomInt(1, 100) >= 91 then
                        set udg_D_ChestType = 0x6E303045
                    else
                        set udg_D_ChestType = 0x6E303044
                    endif
                endif
                set udg_D_Chests = (udg_D_Chests + 1)
                set udg_D_PointChest = OffsetLocation(udg_D_PointOffset, 60.00, 0.00)
                call CreateNUnitsAtLoc(1, udg_D_ChestType, Player(PLAYER_NEUTRAL_PASSIVE), udg_D_PointChest, 0.00)
                call RemoveLocation(udg_D_PointChest)
                if GetRandomInt(1, 20) == 1 then
                    call SetUnitUserData(GetLastCreatedUnit(), 10)
                endif
            endif
        else
            if udg_RandomNumber == 2 then
                set udg_Point = OffsetLocation(udg_D_PointOffset, 60.00, 0.00)
                call CreateDestructableLoc(udg_D_RoomDecorType[2], udg_Point, 0.00, udg_D_RoomDecorScale[2], 0)
                call RemoveLocation(udg_Point)
            else
                if udg_RandomNumber == 3 then
                    set udg_Point = OffsetLocation(udg_D_PointOffset, 60.00, 0.00)
                    call CreateDestructableLoc(udg_D_RoomDecorType[3], udg_Point, 0.00, udg_D_RoomDecorScale[3], 0)
                    call RemoveLocation(udg_Point)
                else
                    if udg_RandomNumber == 4 then
                        call CreateDestructableLoc(udg_D_RoomDecorType[4], udg_D_PointOffset, 0.00, udg_D_RoomDecorScale[4], 0)
                    else
                        if udg_RandomNumber == 5 or udg_RandomNumber == 6 then
                            set udg_Point = OffsetLocation(udg_D_PointOffset, 30.00, 0.00)
                            call CreateDestructableLoc(0x42303156, udg_Point, GetRandomReal(0, 360.00), 1.30, 0)
                            call RemoveLocation(udg_Point)
                        else
                            if udg_RandomNumber == 7 then
                                set udg_Point = OffsetLocation(udg_D_PointOffset, 60.00, 0.00)
                                call CreateDestructableLoc(udg_D_RoomDecorType[7], udg_Point, GetRandomReal(0, 360.00), udg_D_RoomDecorScale[7], 0)
                                call RemoveLocation(udg_Point)
                            else
                                if udg_RandomNumber == 8 then
                                    set udg_Point = OffsetLocation(udg_D_PointOffset, 25.00, 0.00)
                                    call CreateDestructableLoc(0x42303231, udg_Point, 90.00, 2.30, 0)
                                    call RemoveLocation(udg_Point)
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
    if udg_D_WallType == 8 then
        if udg_RandomNumber == 1 then
            if udg_D_Chests != udg_D_ChestsMax then
                if GetRandomInt(1, 100) >= 97 then
                    set udg_D_ChestType = 0x6E303046
                else
                    if GetRandomInt(1, 100) >= 91 then
                        set udg_D_ChestType = 0x6E303045
                    else
                        set udg_D_ChestType = 0x6E303044
                    endif
                endif
                set udg_D_Chests = (udg_D_Chests + 1)
                set udg_D_PointChest = OffsetLocation(udg_D_PointOffset, 0.00, - 60.00)
                call CreateNUnitsAtLoc(1, udg_D_ChestType, Player(PLAYER_NEUTRAL_PASSIVE), udg_D_PointChest, 270.00)
                call RemoveLocation(udg_D_PointChest)
                if GetRandomInt(1, 20) == 1 then
                    call SetUnitUserData(GetLastCreatedUnit(), 10)
                endif
            endif
        else
            if udg_RandomNumber == 2 then
                set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, - 60.00)
                call CreateDestructableLoc(udg_D_RoomDecorType[2], udg_Point, 270.00, udg_D_RoomDecorScale[2], 0)
                call RemoveLocation(udg_Point)
            else
                if udg_RandomNumber == 3 then
                    set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, - 60.00)
                    call CreateDestructableLoc(udg_D_RoomDecorType[3], udg_Point, 270.00, udg_D_RoomDecorScale[3], 0)
                    call RemoveLocation(udg_Point)
                else
                    if udg_RandomNumber == 4 then
                        call CreateDestructableLoc(udg_D_RoomDecorType[4], udg_D_PointOffset, 270.00, udg_D_RoomDecorScale[4], 0)
                    else
                        if udg_RandomNumber == 5 or udg_RandomNumber == 6 then
                            set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, - 30.00)
                            call CreateDestructableLoc(0x42303156, udg_Point, GetRandomReal(0, 360.00), 1.30, 0)
                            call RemoveLocation(udg_Point)
                        else
                            if udg_RandomNumber == 7 then
                                set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, - 60.00)
                                call CreateDestructableLoc(udg_D_RoomDecorType[7], udg_Point, GetRandomReal(0, 360.00), udg_D_RoomDecorScale[7], 0)
                                call RemoveLocation(udg_Point)
                            else
                                if udg_RandomNumber == 8 then
                                    set udg_Point = OffsetLocation(udg_D_PointOffset, 0.00, - 25.00)
                                    call CreateDestructableLoc(0x42303231, udg_Point, 180.00, 2.30, 0)
                                    call RemoveLocation(udg_Point)
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
    call RemoveLocation(udg_D_PointOffset)
endfunction

function InitTrig_Gen_Decor_Rooms takes nothing returns nothing
    set gg_trg_Gen_Decor_Rooms = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Decor_Rooms, function Trig_Gen_Decor_Rooms_Actions)
endfunction
