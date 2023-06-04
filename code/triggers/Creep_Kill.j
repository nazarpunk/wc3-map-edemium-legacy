function Trig_Creep_Kill_Actions takes nothing returns nothing
    if GetUnitTypeId(GetTriggerUnit()) == 0x48303148 then
        call GroupRemoveUnitSimple(GetTriggerUnit(), udg_FollowersGroup)
        call RemoveUnit(GetTriggerUnit())
        set udg_Point = GetUnitLoc(GetTriggerUnit())
        call AddSpecialEffectLocBJ(udg_Point, "Objects\\Spawnmodels\\Undead\\UndeadDissipate\\UndeadDissipate.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call RemoveLocation(udg_Point)
    endif
    if GetUnitTypeId(GetTriggerUnit()) == 0x48303030 and GetOwningPlayer(GetTriggerUnit()) == Player(1) then
        set udg_Point = GetUnitLoc(GetTriggerUnit())
        call AddSpecialEffectLocBJ(udg_Point, "Abilities\\Spells\\Human\\Polymorph\\PolyMorphTarget.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call RemoveLocation(udg_Point)
        call RemoveUnit(GetTriggerUnit())
    endif
    if (GetOwningPlayer(GetTriggerUnit()) == Player(11) or GetOwningPlayer(GetTriggerUnit()) == Player(1)) and (GetUnitAbilityLevelSwapped(0x41303345, GetTriggerUnit()) == 1 or GetUnitAbilityLevelSwapped(0x41303559, GetTriggerUnit()) == 1) then
        set udg_FadeUnitKey = GetHandleId(GetTriggerUnit())
        call GroupAddUnitSimple(GetTriggerUnit(), udg_FadeSystemGroup)
        call SaveRealBJ(0.00, udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash)
        call SaveRealBJ(100.00, udg_FadeUnitKey, StringHashBJ("FadeEnd"), udg_FadeSystemHash)
        call SaveRealBJ(2.50, udg_FadeUnitKey, StringHashBJ("FadeSpeed"), udg_FadeSystemHash)
        call SaveBooleanBJ(false, udg_FadeUnitKey, StringHashBJ("FadeIn"), udg_FadeSystemHash)
        call EnableTrigger(gg_trg_Fade_Loop)
        call RemoveUnit(udg_CO_OpportunityUnit[GetUnitUserData(GetDyingUnit())])
        call DestroyEffectBJ(udg_CreepCastEffect[GetUnitUserData(GetTriggerUnit())])
        if not udg_Artefactorium then
            if GetRandomInt(1, 5) == 1 and GetUnitTypeId(GetTriggerUnit()) != 0x6E303038 then
                set udg_Point = GetUnitLoc(GetTriggerUnit())
                call CreateItemLoc(udg_CC_IngredientItem[GetUnitLevel(GetTriggerUnit())], udg_Point)
                call RemoveLocation(udg_Point)
            endif
            if GetUnitTypeId(GetTriggerUnit()) == 0x6E303035 then
                set udg_Point = GetUnitLoc(GetTriggerUnit())
                call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
                call RemoveLocation(udg_Point)
                call UnitAddAbilityBJ(0x41303356, GetLastCreatedUnit())
                call UnitApplyTimedLifeBJ(2.00, 0x42544C46, GetLastCreatedUnit())
                call IssueImmediateOrderBJ(GetLastCreatedUnit(), "roar")
            else
                if GetUnitTypeId(GetTriggerUnit()) == 0x6E303034 then
                    set udg_Point = GetUnitLoc(GetTriggerUnit())
                    call CreateNUnitsAtLoc(3, 0x6E30304D, Player(11), udg_Point, bj_UNIT_FACING)
                    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\BloodEX-Small.mdx")
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                    call RemoveLocation(udg_Point)
                endif
            endif
            if GetTriggerUnit() == udg_EM_BossUnit and GetUnitTypeId(udg_EM_BossUnit) != 0x6E303038 then
                call DisableTrigger(gg_trg_Boss_Creep_Spawn)
                if GetUnitTypeId(udg_EM_BossUnit) == 0x6E30304C then
                    if not udg_Difficulty_Unlocked[1] then
                        set udg_Difficulty_Unlocked[1] = true
                        set udg_TierUnlocked = 1
                        call DisplayTimedTextToForce(GetPlayersAll(), 30, "|cFF00C850Открыта новая сложность!|r")
                        set udg_IG_Point = GetUnitLoc(udg_IG_Monster)
                        set udg_IG_ItemQuality = 3
                        call ConditionalTriggerExecute(gg_trg_IG_Generate)
                    endif
                    if not udg_CC_SecretUnlocked[5] then
                        set udg_Point = GetUnitLoc(ArctUnit)
                        call CreateItemLoc(0x49303135, udg_Point)
                        call RemoveLocation(udg_Point)
                    endif
                else
                    if GetUnitTypeId(udg_EM_BossUnit) == 0x6E303047 then
                        if not udg_Difficulty_Unlocked[2] then
                            set udg_Difficulty_Unlocked[2] = true
                            set udg_Difficulty_Unlocked[3] = true
                            set udg_TierUnlocked = 2
                            call DisplayTimedTextToForce(GetPlayersAll(), 30, "|cFF00C850Открыты новые сложности!|r")
                            set udg_IG_Point = GetUnitLoc(udg_IG_Monster)
                            set udg_IG_ItemQuality = 3
                            call ConditionalTriggerExecute(gg_trg_IG_Generate)
                        endif
                        if not udg_CC_SecretUnlocked[20] then
                            set udg_Point = GetUnitLoc(ArctUnit)
                            call CreateItemLoc(0x49303050, udg_Point)
                            call RemoveLocation(udg_Point)
                        endif
                    endif
                endif
                call DisplayTimedTextToForce(GetPlayersAll(), 30.00, "Для выхода нажмите ESC.")
                set bj_forLoopAIndex = 1
                set bj_forLoopAIndexEnd = 4
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    set udg_EM_BossDead[bj_forLoopAIndex] = true
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
                call ConditionalTriggerExecute(gg_trg_Boss_Kill_Check)
                call EnableTrigger(gg_trg_Escape_Dialog_Dummy)
                call EnableTrigger(gg_trg_Escape_Dialog)
                call AddSpecialEffectTargetUnitBJ("origin", GetTriggerUnit(), "war3mapImported\\Holy_Heal.mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                set udg_IG_Point = GetUnitLoc(ArctUnit)
                set udg_RandomNumber = GetRandomInt(1, 10)
                call AddSpecialEffectLocBJ(udg_IG_Point, "war3mapImported\\Holy_Heal.mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                if udg_RandomNumber == 1 then
                    set udg_IG_ItemQuality = 3
                    call ConditionalTriggerExecute(gg_trg_IG_Generate)
                else
                    if udg_RandomNumber >= 2 and udg_RandomNumber <= 4 then
                        set udg_IG_ItemQuality = 2
                        call ConditionalTriggerExecute(gg_trg_IG_Generate)
                    else
                        set udg_IG_ItemQuality = 1
                        call ConditionalTriggerExecute(gg_trg_IG_Generate)
                    endif
                endif
                call RemoveLocation(udg_Point)
            else
                if GetUnitTypeId(GetDyingUnit()) == 0x6E303038 then
                    call ConditionalTriggerExecute(gg_trg_Ending_Init)
                endif
            endif
            if GetRandomInt(1, 100) >= (80 - (1 * udg_ART[3])) and GetUnitAbilityLevelSwapped(0x41303345, GetTriggerUnit()) == 1 then
                if not udg_EM_BossRoom then
                    set udg_IG_Monster = GetTriggerUnit()
                    call ConditionalTriggerExecute(gg_trg_Creep_Kill_Reward)
                endif
            else
                if GetUnitAbilityLevelSwapped(0x41303345, GetTriggerUnit()) == 1 then
                    if not udg_EM_BossRoom then
                        set udg_RewardDustReal = (udg_RewardDustReal + 1.00)
                        call ConditionalTriggerExecute(gg_trg_Creep_Kill_Recipes)
                        set udg_QG_Count[1] = (udg_QG_Count[1] + 1)
                        call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
                    endif
                endif
            endif
            if GetTriggerUnit() == udg_ChestKeyOwner[1] or GetTriggerUnit() == udg_ChestKeyOwner[2] or GetTriggerUnit() == udg_ChestKeyOwner[3] or GetTriggerUnit() == udg_ChestKeyOwner[4] then
                set udg_Point = GetUnitLoc(GetTriggerUnit())
                call CreateItemLoc(0x4930304D, udg_Point)
                call RemoveLocation(udg_Point)
            endif
        endif
    endif
endfunction

function InitTrig_Creep_Kill takes nothing returns nothing
    set gg_trg_Creep_Kill = CreateTrigger()
    call DisableTrigger(gg_trg_Creep_Kill)
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Creep_Kill, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddAction(gg_trg_Creep_Kill, function Trig_Creep_Kill_Actions)
endfunction
