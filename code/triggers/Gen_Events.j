function Trig_Gen_Events_Func002Func001Func001Func005A takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetEnumUnit())
    call CreateNUnitsAtLoc(1, 0x6E303048, Player(PLAYER_NEUTRAL_PASSIVE), udg_Point, bj_UNIT_FACING)
    call SetUnitUserData(GetLastCreatedUnit(), 100)
    call RemoveLocation(udg_Point)
endfunction

function Trig_Gen_Events_Func002Func001Func005A takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetEnumUnit())
    call CreateNUnitsAtLoc(1, 0x6E303134, Player(PLAYER_NEUTRAL_PASSIVE), udg_Point, bj_UNIT_FACING)
    call RemoveLocation(udg_Point)
endfunction

function Trig_Gen_Events_Actions takes nothing returns nothing
    if GetUnitUserData(udg_EM_Target) == 71 then
        call SetDayNightModels("", "")
        call SetTerrainFogExBJ(0, 0.00, 4000.00, 0.50, 0.00, 0.00, 0.00)
        call StartTimerBJ(udg_DungeonDarkTimer, false, (120.00 + I2R(GetHeroStatBJ(bj_HEROSTAT_STR, udg_Arct, true))))
        call CreateTimerDialogBJ(GetLastCreatedTimerBJ(), "Бесстрашие: ")
        set udg_DungeonDarkTimerWindow = GetLastCreatedTimerDialogBJ()
        call EnableTrigger(gg_trg_Dungeon_Dark)
    else
        if GetUnitUserData(udg_EM_Target) == 72 then
            call SetTerrainFogExBJ(0, 500.00, 8000.00, 0.50, 0.00, 100.00, 100.00)
            set udg_UnitGroup = GetUnitsInRectOfPlayer(gg_rct_Dungeon_Camera, Player(11))
            call ForGroupBJ(GetRandomSubGroup(GetRandomInt(5, 7), udg_UnitGroup), function Trig_Gen_Events_Func002Func001Func005A)
            call StartTimerBJ(udg_DungeonColdTimer, false, 30)
            set udg_DungeonColdLevel = 0
            call ShowTextTagForceBJ(true, udg_DungeonColdText, bj_FORCE_PLAYER[0])
            call EnableTrigger(gg_trg_Dungeon_Cold)
            call EnableTrigger(gg_trg_Dungeon_Cold_Text)
            call EnableTrigger(gg_trg_Dungeon_Cold_Hearth)
        else
            if GetUnitUserData(udg_EM_Target) == 73 then
                set udg_UnitGroup = GetUnitsInRectOfPlayer(gg_rct_Dungeon_Camera, Player(11))
                call ForGroupBJ(GetRandomSubGroup(GetRandomInt(4, 5), udg_UnitGroup), function Trig_Gen_Events_Func002Func001Func001Func005A)
                call EnableTrigger(gg_trg_Dungeon_Battle_Portal)
            else
                if GetUnitUserData(udg_EM_Target) == 74 then
                    set udg_DungeonDeadlyCleansing = 3
                    call UnitAddAbilityBJ(0x41303348, udg_Arct)
                    call EnableTrigger(gg_trg_Dungeon_Deadly)
                endif
            endif
        endif
    endif
    if GetHeroLevel(udg_Arct) == 3 then
        set udg_EdemEventType = 1
    else
        set udg_EdemEventType = 0
    endif
    if not udg_EdemEventBool[udg_EdemEventType] and udg_EdemEventType != 0 then
        call EnableTrigger(gg_trg_Events_Elapsed)
    endif
endfunction

function InitTrig_Gen_Events takes nothing returns nothing
    set gg_trg_Gen_Events = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Events, function Trig_Gen_Events_Actions)
endfunction
