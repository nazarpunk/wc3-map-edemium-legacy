function Trig_Gen_Tiles_Func003A takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetEnumUnit())

    if GetRandomInt(0, 100) >= 95 then
        if GetTerrainTypeBJ(udg_D_Point1) != 0x4F616279 then
            set udg_RandomNumber = GetRandomInt(1, 2)
            call CreateNUnitsAtLoc(1, 0x68303057, Player(1), udg_D_Point1, bj_UNIT_FACING)
            call SetUnitVertexColorBJ(GetLastCreatedUnit(), 100, 100, 100, 100.00)
            if udg_RandomNumber == 1 then
                call UnitAddAbilityBJ(0x41303051, GetLastCreatedUnit())
            else
                call UnitAddAbilityBJ(0x41303052, GetLastCreatedUnit())
            endif
            call GroupRemoveUnitSimple(GetEnumUnit(), udg_D_Pick)
        endif
    endif

    if GetUnitUserData(udg_EM_Target) == 74 then
        set udg_RandomNumber = GetRandomInt(1, 2)
    else
        set udg_RandomNumber = GetRandomInt(1, 3)
    endif

    if udg_D_DungeonTier == 1 and udg_RandomNumber == 1 then
        set udg_Point = OffsetLocation(udg_D_Point1, GetRandomReal(0, 300.00), GetRandomReal(0, 300.00))
        
        if GetUnitUserData(udg_EM_Target) == 74 then
            set udg_RandomNumber = GetRandomInt(3, 4)
        else
            set udg_RandomNumber = GetRandomInt(1, 2)
        endif
        call SetTerrainTypeBJ(udg_Point, 0x43706F73, - 1, udg_RandomNumber, 0)
        call RemoveLocation(udg_Point)
    endif

    if GetUnitUserData(udg_EM_Target) == 74 then
        set udg_RandomNumber = GetRandomInt(1, 2)
    else
        set udg_RandomNumber = GetRandomInt(1, 3)
    endif

    if (udg_D_DungeonTier == 2 or udg_D_DungeonTier == 3) and udg_RandomNumber == 1 then
        set udg_Point = OffsetLocation(udg_D_Point1, GetRandomReal(0, 300.00), GetRandomReal(0, 300.00))
        if GetUnitUserData(udg_EM_Target) == 74 then
            set udg_RandomNumber = GetRandomInt(3, 4)
        else
            set udg_RandomNumber = GetRandomInt(1, 2)
        endif
        call SetTerrainTypeBJ(udg_Point, 0x446C6176, - 1, udg_RandomNumber, 0)
        call RemoveLocation(udg_Point)
    endif

    call RemoveLocation(udg_D_Point1)
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
    if GetRandomInt(0, 100) >= 50 then
        set udg_Point = OffsetLocation(udg_D_Point1, GetRandomReal(0, 300.00), GetRandomReal(0, 300.00))
        call SetTerrainTypeBJ(udg_Point, 0x43706F73, - 1, 2, 0)
        call RemoveLocation(udg_Point)
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
