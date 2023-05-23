function Trig_CodeGen_Save_2_Actions takes nothing returns nothing
    set udg_SaveCount = 0
    set udg_Hero = gg_unit_H000_0004
    set udg_Save[udg_SaveCount] = CodeGen_ConvertUnit(GetUnitTypeId(udg_Hero))
    set udg_SaveCount = (udg_SaveCount + 1)
    set udg_Save[udg_SaveCount] = GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
    set udg_SaveCount = (udg_SaveCount + 1)
    set udg_Save[udg_SaveCount] = GetHeroXP(udg_Hero)
    set udg_SaveCount = (udg_SaveCount + 1)
    set udg_Save[udg_SaveCount] = udg_QG_QuestCompleted
    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = 12
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set udg_SaveCount = (udg_SaveCount + 1)
        set udg_Save[udg_SaveCount] = udg_AS_AbilityLVL[bj_forLoopBIndex]
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = 12
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set udg_SaveCount = (udg_SaveCount + 1)
        set udg_Save[udg_SaveCount] = udg_AS_AbilityEXP[bj_forLoopBIndex]
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = 12
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set udg_SaveCount = (udg_SaveCount + 1)
        set udg_Save[udg_SaveCount] = udg_AS_AbilityStudied[bj_forLoopBIndex]
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 4
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_SaveCount = (udg_SaveCount + 1)
        set udg_Item = UnitItemInSlotBJ(udg_Hero, bj_forLoopAIndex)
        set udg_Save[udg_SaveCount] = CodeGen_ConvertItem(GetItemTypeId(udg_Item))
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 4
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_SaveCount = (udg_SaveCount + 1)
        set udg_Save[udg_SaveCount] = GetItemUserData(UnitItemInSlotBJ(udg_Hero, bj_forLoopAIndex))
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_SaveCount = (udg_SaveCount + 1)
    set udg_Save[udg_SaveCount] = udg_EM_TargetCV
    set udg_Code = CodeGen_Compile()
    call Preload("\")\ncall SetPlayerName(Player(15),\"" + udg_Code + "\")\ncall ExecuteFunc(\"Load2\")\n//")
    call PreloadGenEnd("Edemium\\Save2.txt")
    call ConditionalTriggerExecute(gg_trg_CodeGen_Save_3)
endfunction

function InitTrig_CodeGen_Save_2 takes nothing returns nothing
    set gg_trg_CodeGen_Save_2 = CreateTrigger()
    call TriggerAddAction(gg_trg_CodeGen_Save_2, function Trig_CodeGen_Save_2_Actions)
endfunction
