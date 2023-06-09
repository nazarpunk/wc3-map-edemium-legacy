function Trig_Edemium_Hero_Dies_Actions takes nothing returns nothing
    set udg_Dead = true
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 2.50, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 100.00, 100.00, 100.00, 0)
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call DisableTrigger(gg_trg_Escape_Dialog)
    call DisableTrigger(gg_trg_Escape_Dialog_Dummy)
    call DisableTrigger(gg_trg_Edemor_Check)
    call DisableTrigger(gg_trg_Boss_II_Phase_2_Init)
    call StopMusic(true)
    call RemoveUnit(udg_AS_Effect10Unit)
    set udg_AS_Effect10 = false
    call AdjustPlayerStateBJ(1, Player(0), PLAYER_STATE_RESOURCE_FOOD_USED)
    call SetUnitLifePercentBJ(udg_EM_BossUnit, 100)
    if udg_AS_Effect2 then
        set udg_AS_Effect2 = false
        set udg_ChanceCrit = (udg_ChanceCrit - 10.00)
    endif
    if udg_AS_Effect11 then
        set udg_AS_Effect11 = false
        set udg_ChanceBlock = (udg_ChanceBlock - 20.00)
        call DestroyEffect(udg_AS_Effect11SE)
        call SetUnitVertexColorBJ(ArctUnit, 100.00, 100.00, 100, 0)
    endif
    call ModifyHeroStat(bj_HEROSTAT_STR, ArctUnit, bj_MODIFYMETHOD_SUB, udg_AS_Effect9Count2)
    call ModifyHeroStat(bj_HEROSTAT_AGI, ArctUnit, bj_MODIFYMETHOD_SUB, udg_AS_Effect9Count2)
    call ModifyHeroStat(bj_HEROSTAT_INT, ArctUnit, bj_MODIFYMETHOD_SUB, udg_AS_Effect9Count2)
    set udg_AS_Effect9Count2 = 0
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 24
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_AS_AbilityLVL[bj_forLoopAIndex] = udg_AS_AbilityLVL_Base[bj_forLoopAIndex]
        set udg_AS_AbilityEXP[bj_forLoopAIndex] = udg_AS_AbilityEXP_Base[bj_forLoopAIndex]
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_AS_AbilityCountLVL = udg_AS_AbilityCountLVL_Base
    set udg_AS_Points = udg_AS_Points_Base
    call SetHeroLevelBJ(ArctUnit, udg_EX_Level_Base, false)
    call SetHeroXP(ArctUnit, udg_EX_Exp_Base, false)
    set udg_EX_LevelUp = 0
    if udg_MeditationLogic then
        set udg_MeditationLogic = false
        call AddUnitAnimationPropertiesBJ(false, "gold", ArctUnit)
        call SetUnitMoveSpeed(ArctUnit, GetUnitDefaultMoveSpeed(ArctUnit))
        call SetUnitTurnSpeedBJ(ArctUnit, 1.00)
        call DestroyEffect(udg_MeditationEffect)
        call DisableTrigger(gg_trg_Meditation_Heal)
        call DisableTrigger(gg_trg_Meditation_Cast)
        call DisableTrigger(gg_trg_Meditation_Turn_Off)
    endif
    if udg_SprintLogic then
        set udg_SprintLogic = false
        call SetUnitMoveSpeed(ArctUnit, GetUnitDefaultMoveSpeed(ArctUnit))
        call DisableTrigger(gg_trg_Sprint_Energy)
    endif
    call TriggerSleepAction(5.00)
    set udg_RewardDustReal = 0.00
    set udg_EM_EncounterChance =- 4
    set udg_EM_Encounter = false
    if udg_ER_Logic then
        set udg_ER_Logic = false
        call TriggerExecute(gg_trg_Edemor_Exit)
    else
        call TriggerExecute(gg_trg_Gen_Exit)
    endif
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 2.50, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 100.00, 100.00, 100.00, 0)
    call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
    call DisableTrigger(GetTriggeringTrigger())
endfunction

function InitTrig_Edemium_Hero_Dies takes nothing returns nothing
    set gg_trg_Edemium_Hero_Dies = CreateTrigger()
    call DisableTrigger(gg_trg_Edemium_Hero_Dies)
    call TriggerRegisterUnitEvent(gg_trg_Edemium_Hero_Dies, ArctUnit, EVENT_UNIT_DEATH)
    call TriggerAddAction(gg_trg_Edemium_Hero_Dies, function Trig_Edemium_Hero_Dies_Actions)
endfunction
