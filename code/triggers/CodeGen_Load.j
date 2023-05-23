function Trig_CodeGen_Load_Actions takes nothing returns nothing
    set udg_Code = udg_ImportCode1
    call CodeGen_Load(udg_Code)
    if not udg_SaveLoad_Valid then
        return
    endif
    set udg_LoadCount = 0
    set udg_Hero = gg_unit_H000_0004
    set udg_LoadCount = (udg_LoadCount + 1)
    call DisableTrigger(gg_trg_Hero_Levelup)
    call SetHeroLevelBJ(udg_Hero, udg_Load[udg_LoadCount], false)
    call EnableTrigger(gg_trg_Hero_Levelup)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 3
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_LoadCount = (udg_LoadCount + 1)
        set udg_AugmentLevel[bj_forLoopAIndex] = udg_Load[udg_LoadCount]
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 20
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_LoadCount = (udg_LoadCount + 1)
        set udg_SecretUnlocked[bj_forLoopAIndex] = udg_Load[udg_LoadCount]
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_LoadCount = (udg_LoadCount + 1)
    set udg_TierUnlocked = udg_Load[udg_LoadCount]
    set udg_LoadCount = (udg_LoadCount + 1)
    call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD, udg_Load[udg_LoadCount])
    set udg_LoadCount = (udg_LoadCount + 1)
    call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_FOOD_USED, udg_Load[udg_LoadCount])
    set udg_LoadCount = (udg_LoadCount + 1)
    set udg_AS_Points = udg_Load[udg_LoadCount]
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_LoadCount = (udg_LoadCount + 1)
        set udg_CC_Ingredient[bj_forLoopAIndex] = udg_Load[udg_LoadCount]
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 20
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_LoadCount = (udg_LoadCount + 1)
        set udg_ART[bj_forLoopAIndex] = udg_Load[udg_LoadCount]
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call ConditionalTriggerExecute(gg_trg_CodeGen_Load_2)
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_CodeGen_Load takes nothing returns nothing
    set gg_trg_CodeGen_Load = CreateTrigger()
    call TriggerAddAction(gg_trg_CodeGen_Load, function Trig_CodeGen_Load_Actions)
endfunction