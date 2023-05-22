
function Trig_Dungeon_Cold_Func001Func006Func001Func001C takes nothing returns boolean
    if(not(udg_DungeonColdLevel == 3))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Func001Func006Func001C takes nothing returns boolean
    if(not(udg_DungeonColdLevel == 2))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Func001Func006C takes nothing returns boolean
    if(not(udg_DungeonColdLevel == 1))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Func001C takes nothing returns boolean
    if(not(udg_DungeonColdLevel < 3))then
        return false
    endif
    return true
endfunction
function Trig_Dungeon_Cold_Actions takes nothing returns nothing
    if(Trig_Dungeon_Cold_Func001C())then
        set udg_DungeonColdLevel = (udg_DungeonColdLevel + 1)
        set udg_Point = GetUnitLoc(udg_Arct)
        call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
        call RemoveLocation(udg_Point)
        if(Trig_Dungeon_Cold_Func001Func006C())then
            call UnitAddAbilityBJ(0x41303146, GetLastCreatedUnit())
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "faeriefire", udg_Arct)
        else
            if(Trig_Dungeon_Cold_Func001Func006Func001C())then
                call UnitAddAbilityBJ(0x41303337, GetLastCreatedUnit())
                call IssueTargetOrderBJ(GetLastCreatedUnit(), "slow", udg_Arct)
            else
                if(Trig_Dungeon_Cold_Func001Func006Func001Func001C())then
                    call UnitAddAbilityBJ(0x41303339, GetLastCreatedUnit())
                    call IssueTargetOrderBJ(GetLastCreatedUnit(), "acidbomb", udg_Arct)
                else
                endif
            endif
        endif
    else
    endif
    call StartTimerBJ(udg_DungeonColdTimer, false, 30)
endfunction
function InitTrig_Dungeon_Cold takes nothing returns nothing
    set gg_trg_Dungeon_Cold = CreateTrigger()
    call DisableTrigger(gg_trg_Dungeon_Cold)
    call TriggerRegisterTimerExpireEventBJ(gg_trg_Dungeon_Cold, udg_DungeonColdTimer)
    call TriggerAddAction(gg_trg_Dungeon_Cold, function Trig_Dungeon_Cold_Actions)
endfunction