
function Trig_Dungeon_Cold_Hearth_Conditions takes nothing returns boolean
    return GetUnitTypeId(GetOrderTargetUnit()) == 0x6E303134
endfunction

function Trig_Dungeon_Cold_Hearth_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetOrderTargetUnit())
    set udg_Point2 = GetUnitLoc(udg_Arct)
    if DistanceBetweenPoints(udg_Point, udg_Point2) < 300.00 then
        call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\BlinkCaster.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        if udg_DungeonColdLevel > 0 then
            set udg_DungeonColdLevel = (udg_DungeonColdLevel - 1)
            if udg_DungeonColdLevel == 2 then
                call UnitRemoveBuffBJ(0x4230304C, udg_Arct)
            else
                if udg_DungeonColdLevel == 1 then
                    call UnitRemoveBuffBJ(0x4230304B, udg_Arct)
                else
                    if udg_DungeonColdLevel == 0 then
                        call UnitRemoveBuffBJ(0x42303047, udg_Arct)
                    endif
                endif
            endif
            call StartTimerBJ(udg_DungeonColdTimer, false, 30)
        endif
        call RemoveUnit(GetOrderTargetUnit())
    else
        call IssuePointOrderLocBJ(udg_Arct, "move", udg_Point)
        if GetRandomInt(1, 2) == 1 then
            call CreateTextTagUnitBJ("Поближе бы...", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
        else
            call CreateTextTagUnitBJ("Слишком далеко.", udg_Arct, 0, 10.00, 100.00, 100.00, 100.00, 0)
        endif
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 2.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.50)
    endif
    call RemoveLocation(udg_Point)
    call RemoveLocation(udg_Point2)
endfunction

function InitTrig_Dungeon_Cold_Hearth takes nothing returns nothing
    set gg_trg_Dungeon_Cold_Hearth = CreateTrigger()
    call DisableTrigger(gg_trg_Dungeon_Cold_Hearth)
    call TriggerRegisterUnitEvent(gg_trg_Dungeon_Cold_Hearth, gg_unit_H000_0004, EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerAddCondition(gg_trg_Dungeon_Cold_Hearth, Condition(function Trig_Dungeon_Cold_Hearth_Conditions))
    call TriggerAddAction(gg_trg_Dungeon_Cold_Hearth, function Trig_Dungeon_Cold_Hearth_Actions)
endfunction
