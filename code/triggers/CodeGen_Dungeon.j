function Trig_CodeGen_Dungeon_Func002A takes nothing returns nothing
    call RemoveDestructable(GetEnumDestructable())
endfunction

function Trig_CodeGen_Dungeon_Actions takes nothing returns nothing
    local integer ud = GetUnitUserData(udg_Target)
    set udg_Point = GetUnitLoc(udg_Target)
    call EnumDestructablesInCircleBJ(50.00, udg_Point, function Trig_CodeGen_Dungeon_Func002A)
    if ud == 1 then
        call CreateDestructableLoc(0x42303142, udg_Point, 270.00, 12.00, 0)
        return
    endif

    if ud == 3 then
        call CreateDestructableLoc(0x42303143, udg_Point, 270.00, 12.00, 0)
        return
    endif

    if ud == 4 then
        call CreateDestructableLoc(0x42303144, udg_Point, 270.00, 12.00, 0)
        return
    endif

    if ud == 6 then
        call CreateDestructableLoc(0x42303137, udg_Point, 270.00, 12.00, 0)
        return
    endif

    if ud == 71then
        call CreateDestructableLoc(0x42303145, udg_Point, 270.00, 12.00, 0)
        return
    endif

    if ud == 72 then
        call CreateDestructableLoc(0x42303341, udg_Point, 270.00, 12.00, 0)
        return
    endif

    if ud == 73 then
        call CreateDestructableLoc(0x42303138, udg_Point, 270.00, 12.00, 0)
        return
    endif

    if ud == 74 then
        call CreateDestructableLoc(0x42303342, udg_Point, 270.00, 12.00, 0)
        return
    endif

    call CreateDestructableLoc(0x42303139, udg_Point, 270.00, 12.00, 0)

endfunction

function InitTrig_CodeGen_Dungeon takes nothing returns nothing
    set gg_trg_CodeGen_Dungeon = CreateTrigger()
    call TriggerAddAction(gg_trg_CodeGen_Dungeon, function Trig_CodeGen_Dungeon_Actions)
endfunction