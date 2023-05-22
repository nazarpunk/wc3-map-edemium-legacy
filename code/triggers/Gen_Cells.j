function Trig_Gen_Cells_Func001Func006Func003Func002C takes nothing returns boolean
    if(not(udg_D_PortalLogic[2] == false))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Cells_Func001Func006Func003A takes nothing returns nothing
    set udg_D_Cell = GetEnumUnit()
    if(Trig_Gen_Cells_Func001Func006Func003Func002C())then
        set udg_D_Point1 = GetUnitLoc(udg_D_CellPrevious)
        call CreateDestructableLoc(0x42303134, udg_D_Point1, GetRandomDirectionDeg(), 1, 0)
        call RemoveLocation(udg_D_Point1)
        set udg_D_PortalLogic[2] = true
        set udg_D_Portals = (udg_D_Portals + 1)
    else
    endif
    set udg_D_PortalLogic[1] = true
    call DestroyGroup(udg_D_Pick)
    set udg_D_Point1 = GetUnitLoc(udg_D_Cell)
    set udg_D_Pick = GetUnitsInRangeOfLocAll(800.00, udg_D_Point1)
    call RemoveLocation(udg_D_Point1)
    call GroupRemoveGroup(udg_D_Pick2, udg_D_Pick)
    call GroupRemoveUnitSimple(udg_D_Cell, udg_D_Pick)
endfunction
function Trig_Gen_Cells_Func001Func006C takes nothing returns boolean
    if(not(CountUnitsInGroup(udg_D_Pick) == 0))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Cells_Func001Func007Func008C takes nothing returns boolean
    if(not(udg_D_PortalLogic[1] == true))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Cells_Func001Func007A takes nothing returns nothing
    set udg_D_Cell = GetEnumUnit()
    set udg_D_Point1 = GetUnitLoc(udg_D_Cell)
    call CreateNUnitsAtLoc(1, 0x6830304D, Player(0), udg_D_Point1, bj_UNIT_FACING)
    set udg_D_CellPrevious = GetLastCreatedUnit()
    set udg_D_CellNumber[bj_forLoopAIndex] = GetLastCreatedUnit()
    call SetTerrainTypeBJ(udg_D_Point1, 0x58626C6D, - 1, 4, 1)
    call SetTerrainTypeBJ(udg_D_Point1, udg_D_TextureType, - 1, 3, 1)
    if(Trig_Gen_Cells_Func001Func007Func008C())then
        set udg_D_PortalLogic[1] = false
        call CreateDestructableLoc(0x42303134, udg_D_Point1, GetRandomDirectionDeg(), 1, 0)
        set udg_D_Portals = (udg_D_Portals + 1)
        call RemoveLocation(udg_D_Point1)
    else
    endif
endfunction
function Trig_Gen_Cells_Func001Func008Func002Func001C takes nothing returns boolean
    if(not(udg_EM_BossCreate[1] == false))then
        return false
    endif
    if(not(udg_EM_BossCreate[2] == false))then
        return false
    endif
    if(not(udg_EM_BossCreate[3] == false))then
        return false
    endif
    if(not(udg_EM_BossCreate[4] == false))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Cells_Func001Func008Func002C takes nothing returns boolean
    if(not Trig_Gen_Cells_Func001Func008Func002Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Gen_Cells_Func001Func008C takes nothing returns boolean
    if(not(bj_forLoopAIndex == udg_D_Rooms))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Cells_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = udg_D_Rooms
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_D_Pick = GetUnitsInRangeOfLocAll(800.00, GetUnitLoc(udg_D_Cell))
        set udg_D_Pick2 = GetUnitsOfTypeIdAll(0x6830304D)
        call GroupRemoveGroup(udg_D_Pick2, udg_D_Pick)
        call GroupRemoveUnitSimple(udg_D_Cell, udg_D_Pick)
        call RemoveUnit(udg_D_Cell)
        if(Trig_Gen_Cells_Func001Func006C())then
            call DestroyGroup(udg_D_Pick)
            set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304C)
            call ForGroupBJ(GetRandomSubGroup(1, udg_D_Pick), function Trig_Gen_Cells_Func001Func006Func003A)
        else
        endif
        call ForGroupBJ(GetRandomSubGroup(1, udg_D_Pick), function Trig_Gen_Cells_Func001Func007A)
        if(Trig_Gen_Cells_Func001Func008C())then
            set udg_D_Point1 = GetUnitLoc(udg_D_Cell)
            if(Trig_Gen_Cells_Func001Func008Func002C())then
                call SetUnitPositionLoc(udg_D_Exit, udg_D_Point1)
            else
            endif
            call RemoveLocation(udg_D_Point1)
            call RemoveUnit(udg_D_Cell)
            set udg_D_Point1 = GetRectCenter(gg_rct_Dungeon_Center)
            call CreateNUnitsAtLoc(1, 0x6830304D, Player(0), udg_D_Point1, bj_UNIT_FACING)
            set udg_D_CellLast = GetLastCreatedUnit()
            call RemoveLocation(udg_D_Point1)
            set udg_D_CellNumber[0] = GetLastCreatedUnit()
            set udg_D_Point1 = GetUnitLoc(udg_D_CellNumber[0])
            call DestroyGroup(udg_D_Pick)
            call StartTimerBJ(udg_D_Timer3, false, 0.10)
        else
        endif
        call DestroyGroup(udg_D_Pick)
        call DestroyGroup(udg_D_Pick2)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
endfunction
function InitTrig_Gen_Cells takes nothing returns nothing
    set gg_trg_Gen_Cells = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Cells, function Trig_Gen_Cells_Actions)
endfunction