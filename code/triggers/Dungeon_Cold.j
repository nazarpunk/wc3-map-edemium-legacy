function Trig_Dungeon_Cold_Actions takes nothing returns nothing
    if udg_DungeonColdLevel < 3 then
        set udg_DungeonColdLevel = (udg_DungeonColdLevel + 1)
        set udg_Point = GetUnitLoc(ArctUnit)
        call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
        call RemoveLocation(udg_Point)
        if udg_DungeonColdLevel == 1 then
            call UnitAddAbilityBJ(0x41303146, GetLastCreatedUnit())
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "faeriefire", ArctUnit)
        else
            if udg_DungeonColdLevel == 2 then
                call UnitAddAbilityBJ(0x41303337, GetLastCreatedUnit())
                call IssueTargetOrderBJ(GetLastCreatedUnit(), "slow", ArctUnit)
            else
                if udg_DungeonColdLevel == 3 then
                    call UnitAddAbilityBJ(0x41303339, GetLastCreatedUnit())
                    call IssueTargetOrderBJ(GetLastCreatedUnit(), "acidbomb", ArctUnit)
                endif
            endif
        endif
    endif
    call StartTimerBJ(udg_DungeonColdTimer, false, 30)
endfunction

function InitTrig_Dungeon_Cold takes nothing returns nothing
    set gg_trg_Dungeon_Cold = CreateTrigger()
    call DisableTrigger(gg_trg_Dungeon_Cold)
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Dungeon_Cold, udg_DungeonColdTimer)
    call TriggerAddAction(gg_trg_Dungeon_Cold, function Trig_Dungeon_Cold_Actions)
endfunction
