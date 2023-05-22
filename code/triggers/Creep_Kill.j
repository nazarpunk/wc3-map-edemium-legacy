
function Trig_Creep_Kill_Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x48303148))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func002C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x48303030))then
        return false
    endif
    if(not(GetOwningPlayer(GetTriggerUnit()) == Player(1)))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func002Func001C takes nothing returns boolean
    if((GetOwningPlayer(GetTriggerUnit()) == Player(11)))then
        return true
    endif
    if((GetOwningPlayer(GetTriggerUnit()) == Player(1)))then
        return true
    endif
    return false
endfunction

function Trig_Creep_Kill_Func003Func002Func002C takes nothing returns boolean
    if((GetUnitAbilityLevelSwapped(0x41303345, GetTriggerUnit()) == 1))then
        return true
    endif
    if((GetUnitAbilityLevelSwapped(0x41303559, GetTriggerUnit()) == 1))then
        return true
    endif
    return false
endfunction

function Trig_Creep_Kill_Func003Func002C takes nothing returns boolean
    if(not Trig_Creep_Kill_Func003Func002Func001C())then
        return false
    endif
    if(not Trig_Creep_Kill_Func003Func002Func002C())then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 5) == 1))then
        return false
    endif
    if(not(GetUnitTypeId(GetTriggerUnit()) != 0x6E303038))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func002Func001C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x6E303034))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func002C takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x6E303035))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func003Func002C takes nothing returns boolean
    if(not(GetUnitTypeId(GetDyingUnit()) == 0x6E303038))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func003Func005Func002C takes nothing returns boolean
    if(not(udg_Difficulty_Unlocked[1] == false))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func003Func005Func003Func001C takes nothing returns boolean
    if(not(udg_Difficulty_Unlocked[2] == false))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func003Func005Func003Func002C takes nothing returns boolean
    if(not(udg_CC_SecretUnlocked[20] == false))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func003Func005Func003C takes nothing returns boolean
    if(not(GetUnitTypeId(udg_EM_BossUnit) == 0x6E303047))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func003Func005Func004C takes nothing returns boolean
    if(not(udg_CC_SecretUnlocked[5] == false))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func003Func005C takes nothing returns boolean
    if(not(GetUnitTypeId(udg_EM_BossUnit) == 0x6E30304C))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func003Func018Func003Func003001 takes nothing returns boolean
    return(udg_RandomNumber >= 2)
endfunction

function Trig_Creep_Kill_Func003Func012Func003Func018Func003Func003002 takes nothing returns boolean
    return(udg_RandomNumber <= 4)
endfunction

function Trig_Creep_Kill_Func003Func012Func003Func018Func003C takes nothing returns boolean
    if(not GetBooleanAnd(Trig_Creep_Kill_Func003Func012Func003Func018Func003Func003001(), Trig_Creep_Kill_Func003Func012Func003Func018Func003Func003002()))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func003Func018C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func003C takes nothing returns boolean
    if(not(GetTriggerUnit() == udg_EM_BossUnit))then
        return false
    endif
    if(not(GetUnitTypeId(udg_EM_BossUnit) != 0x6E303038))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func004Func001C takes nothing returns boolean
    if(not(udg_EM_BossRoom == false))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func004Func002Func002C takes nothing returns boolean
    if(not(udg_EM_BossRoom == false))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func004Func002C takes nothing returns boolean
    if(not(GetUnitAbilityLevelSwapped(0x41303345, GetTriggerUnit()) == 1))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func004Func003C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) >= (80 - (1 * udg_ART[3]))))then
        return false
    endif
    if(not(GetUnitAbilityLevelSwapped(0x41303345, GetTriggerUnit()) == 1))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func004C takes nothing returns boolean
    if(not Trig_Creep_Kill_Func003Func012Func004Func003C())then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012Func006Func004C takes nothing returns boolean
    if((GetTriggerUnit() == udg_ChestKeyOwner[1]))then
        return true
    endif
    if((GetTriggerUnit() == udg_ChestKeyOwner[2]))then
        return true
    endif
    if((GetTriggerUnit() == udg_ChestKeyOwner[3]))then
        return true
    endif
    if((GetTriggerUnit() == udg_ChestKeyOwner[4]))then
        return true
    endif
    return false
endfunction

function Trig_Creep_Kill_Func003Func012Func006C takes nothing returns boolean
    if(not Trig_Creep_Kill_Func003Func012Func006Func004C())then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003Func012C takes nothing returns boolean
    if(not(udg_Artefactorium == false))then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Func003C takes nothing returns boolean
    if(not Trig_Creep_Kill_Func003Func002C())then
        return false
    endif
    return true
endfunction

function Trig_Creep_Kill_Actions takes nothing returns nothing
    if(Trig_Creep_Kill_Func001C())then
        call GroupRemoveUnitSimple(GetTriggerUnit(), udg_FollowersGroup)
        call RemoveUnit(GetTriggerUnit())
        set udg_Point = GetUnitLoc(GetTriggerUnit())
        call AddSpecialEffectLocBJ(udg_Point, "Objects\\Spawnmodels\\Undead\\UndeadDissipate\\UndeadDissipate.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call RemoveLocation(udg_Point)
    else
    endif
    if(Trig_Creep_Kill_Func002C())then
        set udg_Point = GetUnitLoc(GetTriggerUnit())
        call AddSpecialEffectLocBJ(udg_Point, "Abilities\\Spells\\Human\\Polymorph\\PolyMorphTarget.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call RemoveLocation(udg_Point)
        call RemoveUnit(GetTriggerUnit())
    else
    endif
    if(Trig_Creep_Kill_Func003C())then
        set udg_FadeUnitKey = GetHandleId(GetTriggerUnit())
        call GroupAddUnitSimple(GetTriggerUnit(), udg_FadeSystemGroup)
        call SaveRealBJ(0.00, udg_FadeUnitKey, StringHashBJ("FadeStart"), udg_FadeSystemHash)
        call SaveRealBJ(100.00, udg_FadeUnitKey, StringHashBJ("FadeEnd"), udg_FadeSystemHash)
        call SaveRealBJ(2.50, udg_FadeUnitKey, StringHashBJ("FadeSpeed"), udg_FadeSystemHash)
        call SaveBooleanBJ(false, udg_FadeUnitKey, StringHashBJ("FadeIn"), udg_FadeSystemHash)
        call EnableTrigger(gg_trg_Fade_Loop)
        call RemoveUnit(udg_CO_OpportunityUnit[GetUnitUserData(GetDyingUnit())])
        call DestroyEffectBJ(udg_CreepCastEffect[GetUnitUserData(GetTriggerUnit())])
        if(Trig_Creep_Kill_Func003Func012C())then
            if(Trig_Creep_Kill_Func003Func012Func001C())then
                set udg_Point = GetUnitLoc(GetTriggerUnit())
                call CreateItemLoc(udg_CC_IngredientItem[GetUnitLevel(GetTriggerUnit())], udg_Point)
                call RemoveLocation(udg_Point)
            else
            endif
            if(Trig_Creep_Kill_Func003Func012Func002C())then
                set udg_Point = GetUnitLoc(GetTriggerUnit())
                call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
                call RemoveLocation(udg_Point)
                call UnitAddAbilityBJ(0x41303356, GetLastCreatedUnit())
                call UnitApplyTimedLifeBJ(2.00, 0x42544C46, GetLastCreatedUnit())
                call IssueImmediateOrderBJ(GetLastCreatedUnit(), "roar")
            else
                if(Trig_Creep_Kill_Func003Func012Func002Func001C())then
                    set udg_Point = GetUnitLoc(GetTriggerUnit())
                    call CreateNUnitsAtLoc(3, 0x6E30304D, Player(11), udg_Point, bj_UNIT_FACING)
                    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\BloodEX-Small.mdx")
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                    call RemoveLocation(udg_Point)
                else
                endif
            endif
            if(Trig_Creep_Kill_Func003Func012Func003C())then
                call DisableTrigger(gg_trg_Boss_Creep_Spawn)
                if(Trig_Creep_Kill_Func003Func012Func003Func005C())then
                    if(Trig_Creep_Kill_Func003Func012Func003Func005Func002C())then
                        set udg_Difficulty_Unlocked[1] = true
                        set udg_TierUnlocked = 1
                        call DisplayTimedTextToForce(GetPlayersAll(), 30, "|cFF00C850Открыта новая сложность!|r")
                        set udg_IG_Point = GetUnitLoc(udg_IG_Monster)
                        set udg_IG_ItemQuality = 3
                        call ConditionalTriggerExecute(gg_trg_IG_Generate)
                    else
                    endif
                    if(Trig_Creep_Kill_Func003Func012Func003Func005Func004C())then
                        set udg_Point = GetUnitLoc(udg_Arct)
                        call CreateItemLoc(0x49303135, udg_Point)
                        call RemoveLocation(udg_Point)
                    else
                    endif
                else
                    if(Trig_Creep_Kill_Func003Func012Func003Func005Func003C())then
                        if(Trig_Creep_Kill_Func003Func012Func003Func005Func003Func001C())then
                            set udg_Difficulty_Unlocked[2] = true
                            set udg_Difficulty_Unlocked[3] = true
                            set udg_TierUnlocked = 2
                            call DisplayTimedTextToForce(GetPlayersAll(), 30, "|cFF00C850Открыты новые сложности!|r")
                            set udg_IG_Point = GetUnitLoc(udg_IG_Monster)
                            set udg_IG_ItemQuality = 3
                            call ConditionalTriggerExecute(gg_trg_IG_Generate)
                        else
                        endif
                        if(Trig_Creep_Kill_Func003Func012Func003Func005Func003Func002C())then
                            set udg_Point = GetUnitLoc(udg_Arct)
                            call CreateItemLoc(0x49303050, udg_Point)
                            call RemoveLocation(udg_Point)
                        else
                        endif
                    else
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
                set udg_IG_Point = GetUnitLoc(udg_Arct)
                set udg_RandomNumber = GetRandomInt(1, 10)
                call AddSpecialEffectLocBJ(udg_IG_Point, "war3mapImported\\Holy_Heal.mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                if(Trig_Creep_Kill_Func003Func012Func003Func018C())then
                    set udg_IG_ItemQuality = 3
                    call ConditionalTriggerExecute(gg_trg_IG_Generate)
                else
                    if(Trig_Creep_Kill_Func003Func012Func003Func018Func003C())then
                        set udg_IG_ItemQuality = 2
                        call ConditionalTriggerExecute(gg_trg_IG_Generate)
                    else
                        set udg_IG_ItemQuality = 1
                        call ConditionalTriggerExecute(gg_trg_IG_Generate)
                    endif
                endif
                call RemoveLocation(udg_Point)
            else
                if(Trig_Creep_Kill_Func003Func012Func003Func002C())then
                    call ConditionalTriggerExecute(gg_trg_Ending_Init)
                else
                endif
            endif
            if(Trig_Creep_Kill_Func003Func012Func004C())then
                if(Trig_Creep_Kill_Func003Func012Func004Func001C())then
                    set udg_IG_Monster = GetTriggerUnit()
                    call ConditionalTriggerExecute(gg_trg_Creep_Kill_Reward)
                else
                endif
            else
                if(Trig_Creep_Kill_Func003Func012Func004Func002C())then
                    if(Trig_Creep_Kill_Func003Func012Func004Func002Func002C())then
                        set udg_RewardDustReal = (udg_RewardDustReal + 1.00)
                        call ConditionalTriggerExecute(gg_trg_Creep_Kill_Recipes)
                        set udg_QG_Count[1] = (udg_QG_Count[1] + 1)
                        call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
                    else
                    endif
                else
                endif
            endif
            if(Trig_Creep_Kill_Func003Func012Func006C())then
                set udg_Point = GetUnitLoc(GetTriggerUnit())
                call CreateItemLoc(0x4930304D, udg_Point)
                call RemoveLocation(udg_Point)
            else
            endif
        else
        endif
    else
    endif
endfunction

function InitTrig_Creep_Kill takes nothing returns nothing
    set gg_trg_Creep_Kill = CreateTrigger()
    call DisableTrigger(gg_trg_Creep_Kill)
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Creep_Kill, EVENT_PLAYER_UNIT_DEATH)
    call TriggerAddAction(gg_trg_Creep_Kill, function Trig_Creep_Kill_Actions)
endfunction
