
function Trig_Dungeon_Cold_Text_Func001Func001Func001C takes nothing returns boolean
    if(not(udg_DungeonColdLevel == 3))then
        return false
    endif
    return true
endfunction

function Trig_Dungeon_Cold_Text_Func001Func001C takes nothing returns boolean
    if(not(udg_DungeonColdLevel == 2))then
        return false
    endif
    return true
endfunction

function Trig_Dungeon_Cold_Text_Func001C takes nothing returns boolean
    if(not(udg_DungeonColdLevel == 1))then
        return false
    endif
    return true
endfunction

function Trig_Dungeon_Cold_Text_Actions takes nothing returns nothing
    if(Trig_Dungeon_Cold_Text_Func001C())then
        call SetTextTagTextBJ(udg_DungeonColdText, "|cFF449EFFI|rII", 11.00)
    else
        if(Trig_Dungeon_Cold_Text_Func001Func001C())then
            call SetTextTagTextBJ(udg_DungeonColdText, "|cFF449EFFII|rI", 11.00)
        else
            if(Trig_Dungeon_Cold_Text_Func001Func001Func001C())then
                call SetTextTagTextBJ(udg_DungeonColdText, "|cFF449EFFIII|r", 11.00)
            else
                call SetTextTagTextBJ(udg_DungeonColdText, "III", 11.00)
            endif
        endif
    endif
    call SetTextTagPosUnitBJ(udg_DungeonColdText, udg_Arct, 0.00)
endfunction

function InitTrig_Dungeon_Cold_Text takes nothing returns nothing
    set gg_trg_Dungeon_Cold_Text = CreateTrigger()
    call DisableTrigger(gg_trg_Dungeon_Cold_Text)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Dungeon_Cold_Text, 0.03)
    call TriggerAddAction(gg_trg_Dungeon_Cold_Text, function Trig_Dungeon_Cold_Text_Actions)
endfunction
