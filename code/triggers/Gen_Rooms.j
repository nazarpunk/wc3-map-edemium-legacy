function Trig_Gen_Rooms_Func002Func001Func005C takes nothing returns boolean
    if(not(CountUnitsInGroup(udg_D_Pick2) == 3))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Rooms_Func002Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Gen_Rooms_Func002A takes nothing returns nothing
    if(Trig_Gen_Rooms_Func002Func001C())then
        set udg_D_Pick2 = GetUnitsInRangeOfLocAll(800.00, GetUnitLoc(GetEnumUnit()))
        set udg_D_Pick3 = GetUnitsOfTypeIdAll(0x6830304D)
        call GroupRemoveGroup(udg_D_Pick3, udg_D_Pick2)
        call DestroyGroup(udg_D_Pick3)
        if(Trig_Gen_Rooms_Func002Func001Func005C())then
            set udg_D_Point1 = GetUnitLoc(GetEnumUnit())
            call RemoveUnit(GetEnumUnit())
            call CreateNUnitsAtLoc(1, 0x68303054, Player(0), udg_D_Point1, bj_UNIT_FACING)
            call SetTerrainTypeBJ(udg_D_Point1, 0x58626C6D, - 1, 4, 1)
            call SetTerrainTypeBJ(udg_D_Point1, udg_D_TextureType, - 1, 3, 1)
            call RemoveLocation(udg_D_Point1)
        else
        endif
        call DestroyGroup(udg_D_Pick2)
    else
    endif
endfunction
function Trig_Gen_Rooms_Actions takes nothing returns nothing
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304C)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Rooms_Func002A)
    call DestroyGroup(udg_D_Pick)
    call ConditionalTriggerExecute(gg_trg_Gen_Rooms_Walls)
endfunction
function InitTrig_Gen_Rooms takes nothing returns nothing
    set gg_trg_Gen_Rooms = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Rooms, function Trig_Gen_Rooms_Actions)
endfunction