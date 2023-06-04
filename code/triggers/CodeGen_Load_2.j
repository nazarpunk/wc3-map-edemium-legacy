function Trig_CodeGen_Load_2_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 4
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call RemoveItem(UnitItemInSlotBJ(ArctUnit, bj_forLoopAIndex))
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_Code = udg_ImportCode2
    call CodeGen_Load(udg_Code)
    if not udg_SaveLoad_Valid then
        return
    endif
    set udg_LoadCount = 0
    set udg_Hero = ArctUnit
    set udg_LoadCount = (udg_LoadCount + 1)
    call SetPlayerStateBJ(GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER, udg_Load[udg_LoadCount])
    set udg_LoadCount = (udg_LoadCount + 1)
    call SetHeroXP(udg_Hero, udg_Load[udg_LoadCount], false)
    set udg_LoadCount = (udg_LoadCount + 1)
    set udg_QG_QuestCompleted = udg_Load[udg_LoadCount]
    set udg_EX_Rate = (0.10 * I2R(udg_QG_QuestCompleted))
    set udg_EX_Rate = (udg_EX_Rate + 1.00)
    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = 12
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set udg_LoadCount = (udg_LoadCount + 1)
        set udg_AS_AbilityLVL[bj_forLoopBIndex] = udg_Load[udg_LoadCount]
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = 12
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set udg_LoadCount = (udg_LoadCount + 1)
        set udg_AS_AbilityEXP[bj_forLoopBIndex] = udg_Load[udg_LoadCount]
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = 12
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        set udg_LoadCount = (udg_LoadCount + 1)
        set udg_AS_AbilityStudied[bj_forLoopBIndex] = udg_Load[udg_LoadCount]
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
    set udg_Point = GetRectCenter(gg_rct_Trees_Leave)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 4
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_LoadCount = (udg_LoadCount + 1)
        call CreateItemLoc(udg_SaveLoad_Item[udg_Load[udg_LoadCount]], udg_Point)
        set udg_LoadedItem[bj_forLoopAIndex] = GetLastCreatedItem()
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call RemoveLocation(udg_Point)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 4
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_LoadCount = (udg_LoadCount + 1)
        call SetItemUserData(udg_LoadedItem[bj_forLoopAIndex], udg_Load[udg_LoadCount])
        call UnitAddItemSwapped(udg_LoadedItem[bj_forLoopAIndex], udg_Hero)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_LoadCount = (udg_LoadCount + 1)
    set udg_EM_TargetCV = udg_Load[udg_LoadCount]
    call ConditionalTriggerExecute(gg_trg_CodeGen_Load_3)
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_CodeGen_Load_2 takes nothing returns nothing
    set gg_trg_CodeGen_Load_2 = CreateTrigger()
    call TriggerAddAction(gg_trg_CodeGen_Load_2, function Trig_CodeGen_Load_2_Actions)
endfunction