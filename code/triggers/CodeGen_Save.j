function Trig_CodeGen_Save_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 20
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if udg_CC_SecretUnlocked[bj_forLoopAIndex] then
            set udg_SecretUnlocked[bj_forLoopAIndex] = 1
        endif
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_SaveCount = 0
    set udg_Hero = ArctUnit
    set udg_Save[udg_SaveCount] = CodeGen_ConvertUnit(GetUnitTypeId(udg_Hero))
    set udg_SaveCount = (udg_SaveCount + 1)
    set udg_Save[udg_SaveCount] = GetHeroLevel(udg_Hero)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 3
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_SaveCount = (udg_SaveCount + 1)
        set udg_Save[udg_SaveCount] = udg_AugmentLevel[bj_forLoopAIndex]
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 20
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_SaveCount = (udg_SaveCount + 1)
        set udg_Save[udg_SaveCount] = udg_SecretUnlocked[bj_forLoopAIndex]
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_SaveCount = (udg_SaveCount + 1)
    set udg_Save[udg_SaveCount] = udg_TierUnlocked
    set udg_SaveCount = (udg_SaveCount + 1)
    set udg_Save[udg_SaveCount] = GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD)
    set udg_SaveCount = (udg_SaveCount + 1)
    set udg_Save[udg_SaveCount] = GetPlayerState(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_FOOD_USED)
    set udg_SaveCount = (udg_SaveCount + 1)
    set udg_Save[udg_SaveCount] = udg_AS_Points
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_SaveCount = (udg_SaveCount + 1)
        set udg_Save[udg_SaveCount] = udg_CC_Ingredient[bj_forLoopAIndex]
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 20
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_SaveCount = (udg_SaveCount + 1)
        set udg_Save[udg_SaveCount] = udg_ART[bj_forLoopAIndex]
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_Code = CodeGen_Compile()
    call Preload("\")\ncall SetPlayerName(Player(15),\"" + udg_Code + "\")\ncall ExecuteFunc(\"Load1\")\n//")
    call PreloadGenEnd("Edemium\\Save1.txt")
    call ConditionalTriggerExecute(gg_trg_CodeGen_Save_2)
endfunction

function InitTrig_CodeGen_Save takes nothing returns nothing
    set gg_trg_CodeGen_Save = CreateTrigger()
    call TriggerAddAction(gg_trg_CodeGen_Save, function Trig_CodeGen_Save_Actions)
endfunction
