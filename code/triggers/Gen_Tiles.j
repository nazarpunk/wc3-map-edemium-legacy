
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
        endif
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
