function Trig_Boss_III_Puke_Rain_Actions takes nothing returns nothing
    if udg_Boss3Pukes < 20 then
        set udg_Boss3Pukes = (udg_Boss3Pukes + 1)
        set udg_Point = GetRectCenter(gg_rct_Boss_3_Spawn)
        call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
        call SetUnitUserData(GetLastCreatedUnit(), 33)
        call UnitAddAbilityBJ(0x4130354B, GetLastCreatedUnit())
        call UnitApplyTimedLifeBJ(3.00, 0x42544C46, GetLastCreatedUnit())
        set udg_RandomNumber = GetRandomInt(1, 3)
        if udg_RandomNumber == 1 then
            set udg_Point2 = GetRandomLocInRect(gg_rct_Boss_3_Area_Left)
        else
            if udg_RandomNumber == 2 then
                set udg_Point2 = GetRandomLocInRect(gg_rct_Boss_3_Area_Center)
            else
                set udg_Point2 = GetRandomLocInRect(gg_rct_Boss_3_Area_Right)
            endif
        endif
        call IssuePointOrderLocBJ(GetLastCreatedUnit(), "carrionswarm", udg_Point2)
        call RemoveLocation(udg_Point)
        call RemoveLocation(udg_Point2)
    else
        call EnableTrigger(gg_trg_Boss_III_Puke_Rain_Init)
        set udg_Boss3Pukes = 0
        call DisableTrigger(GetTriggeringTrigger())
    endif
endfunction

function InitTrig_Boss_III_Puke_Rain takes nothing returns nothing
    set gg_trg_Boss_III_Puke_Rain = CreateTrigger()
    call DisableTrigger(gg_trg_Boss_III_Puke_Rain)
    call TriggerRegisterTimerEventPeriodic(gg_trg_Boss_III_Puke_Rain, 0.30)
    call TriggerAddAction(gg_trg_Boss_III_Puke_Rain, function Trig_Boss_III_Puke_Rain_Actions)
endfunction
