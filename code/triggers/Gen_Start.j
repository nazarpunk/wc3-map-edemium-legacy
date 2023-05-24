function Trig_Gen_Start_Func011A takes nothing returns nothing
    if GetDestructableTypeId(GetEnumDestructable()) == 0x42303131 then
        set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
        call CreateNUnitsAtLocFacingLocBJ(1, 0x6830304C, Player(0), udg_D_Point1, GetUnitLoc(GetTriggerUnit()))
        call RemoveLocation(udg_D_Point1)
    endif
endfunction

function Trig_Gen_Start_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Camera_Fix)
    set udg_D_Point1 = GetRectCenter(gg_rct_Dungeon_Center)
    if GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) > 0.00 and GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) <= 5.00 then
        call SetTerrainFogExBJ(0, 500.00, 8000.00, 0.50, 0.00, 50.00, 25.00)
        set udg_D_DungeonTier = 1
        set udg_D_WallTierType[1] = 0x42303232
        set udg_D_WallTierType[2] = 0x42303235
        set udg_D_WallTierType[3] = 0x42303233
        set udg_D_WallTierType[4] = 0x42303234
        set udg_D_WallTierTypeRoom[1] = 0x42303236
        set udg_D_WallTierTypeRoom[2] = 0x42303237
        set udg_D_WallTierTypeRoom[3] = 0x42303238
        set udg_D_WallTierTypeRoom[4] = 0x42303239
        set udg_D_WallTierTypeDoor[1] = 0x4230314D
        set udg_D_WallTierTypeDoor[2] = 0x4230314F
        set udg_D_WallTierTypeDoor[3] = 0x4230314E
        set udg_D_WallTierTypeDoor[4] = 0x42303150
        set udg_D_TextureType = 0x51647272
        set udg_D_RoomDecorType[2] = 0x42303153
        set udg_D_RoomDecorScale[2] = 1.00
        set udg_D_RoomDecorType[3] = 0x42303154
        set udg_D_RoomDecorScale[3] = 1.30
        set udg_D_RoomDecorType[4] = 0x42303155
        set udg_D_RoomDecorScale[4] = 1.80
        set udg_D_RoomDecorType[7] = 0x42303157
        set udg_D_RoomDecorScale[7] = 1.30
    else
        if GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) > 5.00 and GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) <= 10.00 then
            call SetTerrainFogExBJ(0, 500.00, 8000.00, 0.50, 75.00, 50.00, 25.00)
            set udg_D_DungeonTier = 2
            set udg_D_WallTierType[1] = 0x42303243
            set udg_D_WallTierType[2] = 0x42303244
            set udg_D_WallTierType[3] = 0x42303241
            set udg_D_WallTierType[4] = 0x42303242
            set udg_D_WallTierTypeRoom[1] = 0x42303245
            set udg_D_WallTierTypeRoom[2] = 0x42303246
            set udg_D_WallTierTypeRoom[3] = 0x42303247
            set udg_D_WallTierTypeRoom[4] = 0x42303248
            set udg_D_WallTierTypeDoor[1] = 0x42303249
            set udg_D_WallTierTypeDoor[2] = 0x4230324A
            set udg_D_WallTierTypeDoor[3] = 0x4230324B
            set udg_D_WallTierTypeDoor[4] = 0x4230324C
            set udg_D_TextureType = 0x416C7664
            set udg_D_RoomDecorType[2] = 0x42303332
            set udg_D_RoomDecorScale[2] = 0.70
            set udg_D_RoomDecorType[3] = 0x42303333
            set udg_D_RoomDecorScale[3] = 1.30
            set udg_D_RoomDecorType[4] = 0x42303335
            set udg_D_RoomDecorScale[4] = 1.80
            set udg_D_RoomDecorType[7] = 0x42303334
            set udg_D_RoomDecorScale[7] = 1.40
        else
            if GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) > 10.00 and GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target) <= 15.00 then
                call SetTerrainFogExBJ(0, 500.00, 8000.00, 0.50, 50.00, 0.00, 0.00)
                set udg_D_DungeonTier = 3
                set udg_D_WallTierType[1] = 0x42303255
                set udg_D_WallTierType[2] = 0x42303256
                set udg_D_WallTierType[3] = 0x42303251
                set udg_D_WallTierType[4] = 0x42303252
                set udg_D_WallTierTypeRoom[1] = 0x42303253
                set udg_D_WallTierTypeRoom[2] = 0x42303254
                set udg_D_WallTierTypeRoom[3] = 0x42303257
                set udg_D_WallTierTypeRoom[4] = 0x42303258
                set udg_D_WallTierTypeDoor[1] = 0x4230324D
                set udg_D_WallTierTypeDoor[2] = 0x4230324E
                set udg_D_WallTierTypeDoor[3] = 0x4230324F
                set udg_D_WallTierTypeDoor[4] = 0x42303250
                set udg_D_TextureType = 0x4762726B
                set udg_D_RoomDecorType[2] = 0x42303336
                set udg_D_RoomDecorScale[2] = 0.50
                set udg_D_RoomDecorType[3] = 0x42303333
                set udg_D_RoomDecorScale[3] = 1.30
                set udg_D_RoomDecorType[4] = 0x42303338
                set udg_D_RoomDecorScale[4] = 2.00
                set udg_D_RoomDecorType[7] = 0x42303337
                set udg_D_RoomDecorScale[7] = 2.00
            endif
        endif
    endif
    call SuspendHeroXPBJ(false, udg_Arct)
    call SetTerrainTypeBJ(udg_D_Point1, 0x4F616279, - 1, 66, 1)
    call RemoveLocation(udg_D_Point1)
    call EnumDestructablesInRectAll(gg_rct_Dungeon, function Trig_Gen_Start_Func011A)
    set udg_D_Point1 = GetRectCenter(gg_rct_Dungeon_Center)
    call CreateNUnitsAtLoc(1, 0x6830304C, Player(0), udg_D_Point1, bj_UNIT_FACING)
    call ClearTextMessagesBJ(GetPlayersAll())
    set udg_D_Cell = GetLastCreatedUnit()
    call RemoveLocation(udg_D_Point1)
    set udg_D_Point1 = GetUnitLoc(udg_D_Cell)
    call SetTerrainTypeBJ(udg_D_Point1, 0x58626C6D, - 1, 4, 1)
    call SetTerrainTypeBJ(udg_D_Point1, udg_D_TextureType, - 1, 3, 1)
    call RemoveLocation(udg_D_Point1)
    set udg_D_Torches = 0
    set udg_D_Chests = 0
    if udg_Tutorial[5] then
        set udg_D_CreepsTotal = 42
        set udg_D_Rooms = 42
        set udg_D_ChestsMax = 4
    else
        set udg_D_Rooms = (20 + (R2I(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target)) * 2))
        set udg_D_CreepsTotal = (20 + (R2I(GetUnitStateSwap(UNIT_STATE_MANA, udg_EM_Target)) * 2))
        set udg_D_ChestsMax = GetRandomInt(2, 4)
    endif
    if udg_D_CreepsTotal > 75 then
        set udg_D_CreepsTotal = 75
    endif
    if udg_D_Rooms > 64 then
        set udg_D_Rooms = 64
    endif
    set udg_D_Portals = 0
    set udg_D_PortalLogic[2] = false
    call ConditionalTriggerExecute(gg_trg_Gen_Cells)
endfunction

function InitTrig_Gen_Start takes nothing returns nothing
    set gg_trg_Gen_Start = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Start, function Trig_Gen_Start_Actions)
endfunction
