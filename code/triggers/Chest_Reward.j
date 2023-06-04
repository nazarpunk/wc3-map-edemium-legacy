function Trig_Chest_Reward_Actions takes nothing returns nothing
    set udg_QG_Count[4] = (udg_QG_Count[4] + 1)
    call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
    set udg_IG_Point = GetUnitLoc(udg_Chest)
    call KillUnit(udg_Chest)
    call AddSpecialEffectLocBJ(udg_IG_Point, "war3mapImported\\GoldCoinBuffLargeV.015.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    if GetUnitUserData(udg_Chest) == 10 then
        call CreateTextTagUnitBJ("ЛОВУШКА!", ArctUnit, 0, 11.00, 100.00, 100.00, 100.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 45.00, 90.00)
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.50)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.30)
        call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_IG_Point, bj_UNIT_FACING)
        call UnitAddAbilityBJ(0x4130344C, GetLastCreatedUnit())
        call UnitApplyTimedLifeBJ(1.70, 0x42544C46, GetLastCreatedUnit())
        call IssueImmediateOrderBJ(GetLastCreatedUnit(), "stomp")
    endif
    if udg_ART[10] > 0 then
        call CreateNUnitsAtLoc(1, 0x48303148, Player(1), udg_IG_Point, bj_UNIT_FACING)
        call GroupAddUnitSimple(GetLastCreatedUnit(), udg_FollowersGroup)
        call SetHeroLevelBJ(GetLastCreatedUnit(), udg_ART[10], false)
        call SuspendHeroXPBJ(false, GetLastCreatedUnit())
        call UnitApplyTimedLifeBJ(60.00, 0x42544C46, GetLastCreatedUnit())
        call EnableTrigger(gg_trg_Follower_Movement)
    endif
    if GetUnitTypeId(udg_Chest) == 0x6E303044 then
        if GetRandomInt(1, 2) == 1 then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 2
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(1, udg_CC_IngredientDrop)], udg_IG_Point)
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
        endif
        set udg_RandomNumber = GetRandomInt(2, 4)
        set udg_LightOrbs[2] = (udg_LightOrbs[2] + udg_RandomNumber)
        set udg_ChestDust = udg_RandomNumber
        set udg_IG_ItemQuality = 1
        call ConditionalTriggerExecute(gg_trg_IG_Generate)
    else
        if GetUnitTypeId(udg_Chest) == 0x6E303045 then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 2
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(1, udg_CC_IngredientDrop)], udg_IG_Point)
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            set udg_RandomNumber = GetRandomInt(4, 8)
            set udg_LightOrbs[2] = (udg_LightOrbs[2] + udg_RandomNumber)
            set udg_ChestDust = udg_RandomNumber
            set udg_IG_ItemQuality = 2
            call ConditionalTriggerExecute(gg_trg_IG_Generate)
        else
            if GetUnitTypeId(udg_Chest) == 0x6E303046 then
                set bj_forLoopAIndex = 2
                set bj_forLoopAIndexEnd = 4
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    call CreateItemLoc(udg_CC_IngredientItem[GetRandomInt(1, udg_CC_IngredientDrop)], udg_IG_Point)
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
                set udg_RandomNumber = GetRandomInt(4, 6)
                set udg_LightOrbs[3] = (udg_LightOrbs[3] + udg_RandomNumber)
                set udg_ChestDust = udg_RandomNumber
                set udg_IG_ItemQuality = 3
                call ConditionalTriggerExecute(gg_trg_IG_Generate)
            endif
        endif
    endif
    
    if GetRandomInt(1, 100) <= 5 then
        if not udg_CC_SecretUnlocked[13] then
            call CreateItemLoc(0x49303046, udg_IG_Point)
        endif
    endif

    if GetRandomInt(1, 100) <= 5 then
        if not udg_CC_SecretUnlocked[17] then
            call CreateItemLoc(0x4930304B, udg_IG_Point)
        endif
    endif

    set udg_LightIterations = (udg_LightIterations + udg_ChestDust)
    call EnableTrigger(gg_trg_Orbs_Spawn)
    call RemoveLocation(udg_IG_Point)
endfunction

function InitTrig_Chest_Reward takes nothing returns nothing
    set gg_trg_Chest_Reward = CreateTrigger()
    call TriggerAddAction(gg_trg_Chest_Reward, function Trig_Chest_Reward_Actions)
endfunction
