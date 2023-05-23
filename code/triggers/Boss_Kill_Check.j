function Trig_Boss_Kill_Check_Actions takes nothing returns nothing
    set udg_QG_Count[5] = (udg_QG_Count[5] + 1)
    call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 2.00, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 100.00, 100.00, 100.00, 20.00)
    set udg_Point = GetRectCenter(gg_rct_Boss_Zone_1)
    call SetTerrainTypeBJ(udg_Point, 0x51647272, - 1, 6, 1)
    call RemoveLocation(udg_Point)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 5
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_Point = GetRandomLocInRect(gg_rct_Boss_Zone_1)
        call SetTerrainTypeBJ(udg_Point, 0x58626C6D, - 1, 2, 0)
        call RemoveLocation(udg_Point)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    if udg_EM_BossLevel == gg_unit_h00K_0105 then
        if not udg_EM_Boss[1] then
            set udg_EM_Generate = 2
            set udg_EM_Boss[1] = true
            call ConditionalTriggerExecute(gg_trg_Map_Generate)
        endif
    else
        if udg_EM_BossLevel == gg_unit_h00K_0123 then
            if not udg_EM_Boss[2] then
                set udg_EM_Generate = 3
                set udg_EM_Boss[2] = true
                call ConditionalTriggerExecute(gg_trg_Map_Generate)
            endif
        else
            if not udg_EM_Boss[3] then
                set udg_EM_Boss[3] = true
            endif
        endif
    endif
    call SetUnitLifePercentBJ(udg_Arct, 100)
    call SetUnitManaPercentBJ(udg_Arct, 100)
    set udg_RandomNumber = (10 * udg_Difficulty)
    set udg_LightOrbs[2] = (udg_LightOrbs[2] + udg_RandomNumber)
    set udg_LightIterations = (udg_LightIterations + udg_RandomNumber)
    call EnableTrigger(gg_trg_Orbs_Spawn)
    call StopMusicBJ(true)
    call DisableTrigger(gg_trg_Boss_II_Channel_Periodic)
    call DisableTrigger(gg_trg_Boss_II_Channel_Init)
    call UnitAddAbilityBJ(0x4176756C, udg_Arct)
    call ConditionalTriggerExecute(gg_trg_Boss_Units_Remove)
endfunction

function InitTrig_Boss_Kill_Check takes nothing returns nothing
    set gg_trg_Boss_Kill_Check = CreateTrigger()
    call TriggerAddAction(gg_trg_Boss_Kill_Check, function Trig_Boss_Kill_Check_Actions)
endfunction
