
function Trig_Gen_Exit_Conditions takes nothing returns boolean
    return GetClickedButton() == udg_LeaveButton
endfunction

function Trig_Gen_Exit_Func010002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Gen_Exit_Func013002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Gen_Exit_Func016002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Gen_Exit_Func019002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Gen_Exit_Func022002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Gen_Exit_Func025002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Gen_Exit_Func028002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Gen_Exit_Func031002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Gen_Exit_Func035002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Gen_Exit_Func038002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Gen_Exit_Func041002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Gen_Exit_Func046002 takes nothing returns nothing
    call RemoveItem(GetEnumItem())
endfunction

function Trig_Gen_Exit_Func047002 takes nothing returns nothing
    call RemoveItem(GetEnumItem())
endfunction

function Trig_Gen_Exit_Func048002 takes nothing returns nothing
    call RemoveItem(GetEnumItem())
endfunction

function Trig_Gen_Exit_Func049002 takes nothing returns nothing
    call RemoveItem(GetEnumItem())
endfunction

function Trig_Gen_Exit_Func050A takes nothing returns nothing
    if GetDestructableTypeId(GetEnumDestructable()) != 0x42303131 and GetDestructableTypeId(GetEnumDestructable()) != 0x4230304A then
        call RemoveDestructable(GetEnumDestructable())
    endif
endfunction

function Trig_Gen_Exit_Func108002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Gen_Exit_Actions takes nothing returns nothing
    set udg_D_Point1 = GetRectCenter(gg_rct_Edemium_Leave)
    call SetUnitPositionLocFacingBJ(udg_Arct, udg_D_Point1, 0.00)
    call RemoveLocation(udg_D_Point1)
    set udg_D_Point1 = GetRectCenter(gg_rct_Dungeon_Exit)
    call SetUnitPositionLoc(udg_D_Exit, udg_D_Point1)
    call RemoveLocation(udg_D_Point1)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304C)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func010002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304D)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func013002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x68303054)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func016002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x68303038)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func019002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfPlayerAll(Player(11))
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func022002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Dungeon, Player(PLAYER_NEUTRAL_PASSIVE))
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func025002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6E726174)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func028002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Pick_Zone, Player(0))
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func031002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Dungeon, Player(1))
    call GroupRemoveUnitSimple(gg_unit_h00N_0045, udg_D_Pick)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func035002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Boss_3_Zone, Player(PLAYER_NEUTRAL_PASSIVE))
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func038002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Boss_3_Zone, Player(1))
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Exit_Func041002)
    call DestroyGroup(udg_D_Pick)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 3
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call RemoveUnit(udg_Secrets_Rune[bj_forLoopAIndex])
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 2
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call RemoveUnit(udg_AntiCheatUnit[bj_forLoopAIndex])
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call DestroyTimerDialogBJ(GetLastCreatedTimerDialogBJ())
    call EnumItemsInRectBJ(gg_rct_Dungeon, function Trig_Gen_Exit_Func046002)
    call EnumItemsInRectBJ(gg_rct_Boss_3_Zone, function Trig_Gen_Exit_Func047002)
    call EnumItemsInRectBJ(gg_rct_Boss_2_Zone, function Trig_Gen_Exit_Func048002)
    call EnumItemsInRectBJ(gg_rct_Boss_Zone, function Trig_Gen_Exit_Func049002)
    call EnumDestructablesInRectAll(gg_rct_Dungeon, function Trig_Gen_Exit_Func050A)
    call DisableTrigger(gg_trg_Camera_Hero)
    call DisableTrigger(gg_trg_Camera_Boss)
    call SetCameraBoundsToRect(gg_rct_Camera_Bound_Portal)
    call EnableTrigger(gg_trg_Camera_Fix)
    call DisableTrigger(gg_trg_Camera_Angle_Increase)
    call DisableTrigger(gg_trg_Camera_Angle_Decrease)
    call DisableTrigger(gg_trg_Camera_Increase)
    call DisableTrigger(gg_trg_Camera_Decrease)
    call EnableTrigger(gg_trg_Effect_6_Periodic)
    call ConditionalTriggerExecute(gg_trg_Music_Castle)
    call UnitRemoveAbilityBJ(0x4176756C, udg_Arct)
    call CameraSetupApplyForPlayer(true, gg_cam_Camera_Portal, Player(0), 0)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 1.50, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 100.00, 100.00, 100.00, 0)
    call ClearTextMessagesBJ(GetPlayersAll())
    call DestroyEffectBJ(udg_CO_Effect6Sweep[1])
    call DestroyEffectBJ(udg_CO_Effect6Sweep[2])
    set udg_CO_Effect6Power = 0
    if udg_AS_Effect2 then
        set udg_AS_Effect2 = false
        set udg_ChanceCrit = (udg_ChanceCrit - 10.00)
    endif
    if udg_AS_Effect11 then
        set udg_AS_Effect11 = false
        set udg_ChanceBlock = (udg_ChanceBlock - 20.00)
        call DestroyEffectBJ(udg_AS_Effect11SE)
        call SetUnitVertexColorBJ(udg_Arct, 100.00, 100.00, 100, 0)
    endif
    if udg_ART[13] > 0 then
        set udg_ARTInteger[3] = (udg_ARTInteger[3] + 1)
        if udg_ARTInteger[3] == 3 then
            set udg_ARTInteger[3] = 0
            set udg_RandomNumber = GetRandomInt(1, 3)
            if udg_RandomNumber == 1 then
                call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, (1 * udg_ART[13]))
            else
                if udg_RandomNumber == 2 then
                    call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, (1 * udg_ART[13]))
                else
                    call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, (1 * udg_ART[13]))
                endif
            endif
        endif
    endif
    if udg_Dead then
        set udg_Dead = false
        set udg_Point = GetUnitLoc(GetTriggerUnit())
        call ReviveHeroLoc(udg_Arct, udg_Point, false)
        call RemoveLocation(udg_Point)
        set udg_EX_LevelUp = 0
        if not udg_EM_BossRoom then
            set bj_forLoopAIndex = 1
            set bj_forLoopAIndexEnd = 4
            loop
                exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                call RemoveItem(UnitItemInSlotBJ(udg_Arct, bj_forLoopAIndex))
                set bj_forLoopAIndex = bj_forLoopAIndex + 1
            endloop
            call UnitAddItemByIdSwapped(0x4930304C, udg_Arct)
        else
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
        endif
    else
        if not udg_EM_Encounter then
            if udg_EX_LevelUp > 0 then
                set bj_forLoopAIndex = 1
                set bj_forLoopAIndexEnd = udg_EX_LevelUp
                loop
                    exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
                    set udg_RandomNumber = GetRandomInt(1, 3)
                    if udg_RandomNumber == 1 then
                        set udg_Target = gg_unit_h012_0011
                        call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                    else
                        if udg_RandomNumber == 2 then
                            set udg_Target = gg_unit_h012_0012
                            call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                        else
                            set udg_Target = gg_unit_h012_0013
                            call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                        endif
                    endif
                    set udg_AugmentValue = GetUnitUserData(udg_Target)
                    set udg_AugmentLevel[udg_AugmentValue] = (udg_AugmentLevel[udg_AugmentValue] + 1)
                    set udg_Point = GetUnitLoc(udg_Target)
                    call DestroyTextTagBJ(udg_GiftText[udg_AugmentValue])
                    call CreateTextTagLocBJ(I2S(udg_AugmentLevel[udg_AugmentValue]), udg_Point, 150.00, 10, 100, 100, 100, 0)
                    set udg_GiftText[udg_AugmentValue] = GetLastCreatedTextTag()
                    call RemoveLocation(udg_Point)
                    set udg_AugmentPrice = udg_AugmentCost[udg_AugmentValue]
                    set udg_AugmentCost[udg_AugmentValue] = (udg_AugmentCost[udg_AugmentValue] + 10)
                    set bj_forLoopAIndex = bj_forLoopAIndex + 1
                endloop
                set udg_EX_LevelUp = 0
            endif
            if GetUnitUserData(udg_EM_Target) == 7 or GetUnitUserData(udg_EM_Target) == 71 or GetUnitUserData(udg_EM_Target) == 72 or GetUnitUserData(udg_EM_Target) == 73 or GetUnitUserData(udg_EM_Target) == 74 or GetUnitUserData(udg_EM_Target) == 5 then
                set udg_QG_Count[2] = (udg_QG_Count[2] + 1)
                call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
                call SetUnitUserData(udg_EM_Target, 8)
                set udg_Point = GetUnitLoc(udg_EM_Target)
                call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Pearlescence.mdl")
                call RemoveLocation(udg_Point)
            endif
        endif
    endif
    set udg_EM_BossRoom = false
    call SetUnitLifePercentBJ(udg_Arct, 100)
    call SetUnitManaPercentBJ(udg_Arct, 100)
    if R2I(udg_RewardDustReal) > 0 then
        set udg_RewardDustReal = (udg_RewardDustReal * udg_DifficultyRate)
        set udg_RewardDustReal = (udg_RewardDustReal * udg_EX_Rate)
        call AdjustPlayerStateBJ(R2I(udg_RewardDustReal), Player(0), PLAYER_STATE_RESOURCE_GOLD)
        set udg_RewardDustReal = 0.00
    endif
    call DisableTrigger(gg_trg_Escape_Dialog_Dummy)
    call DisableTrigger(gg_trg_Tile_Damage)
    call DisableTrigger(gg_trg_Combo_Ability_Use)
    call DisableTrigger(gg_trg_Creep_Kill)
    call DisableTrigger(gg_trg_Armor_Use)
    call DisableTrigger(gg_trg_Talisman_Use)
    call DisableTrigger(gg_trg_Scroll_Periodic)
    call DisableTrigger(gg_trg_Chest_Unlock)
    call DisableTrigger(gg_trg_Trap_Periodic)
    call EnableTrigger(gg_trg_Artefactorium_Creep_Kill)
    call EnableTrigger(gg_trg_Artefactorium_Damage)
    call DisableTrigger(gg_trg_Secret_Search)
    call DisableTrigger(gg_trg_Boss_Creep_Spawn)
    call DisableTrigger(gg_trg_Boss_III_Creep_Spawn)
    call DisableTrigger(gg_trg_Boss_III_Portal_Spawn)
    call DisableTrigger(gg_trg_Boss_III_Puke_Rain)
    call DisableTrigger(gg_trg_Boss_III_Phase_2_Init)
    call DisableTrigger(gg_trg_Boss_III_Phase_3_Init)
    call DisableTrigger(gg_trg_Boss_III_Puke_Rain_Init)
    call DisableTrigger(gg_trg_Boss_III_Puke_Rain)
    call DisableTrigger(gg_trg_Effect_6_Periodic)
    call DisableTrigger(gg_trg_Follower_Movement)
    call DisableTrigger(gg_trg_Dungeon_Cold)
    call DisableTrigger(gg_trg_Dungeon_Cold_Text)
    call DisableTrigger(gg_trg_Dungeon_Cold_Hearth)
    call DisableTrigger(gg_trg_Dungeon_Dark)
    call DisableTrigger(gg_trg_Dungeon_Dark_Periodic)
    call DisableTrigger(gg_trg_Dungeon_Battle_Portal)
    call DisableTrigger(gg_trg_Dungeon_Deadly)
    call ForGroupBJ(udg_FollowersGroup, function Trig_Gen_Exit_Func108002)
    call GroupClear(udg_FollowersGroup)
    call DestroyTimerDialogBJ(udg_DungeonDarkTimerWindow)
    call ShowTextTagForceBJ(false, udg_DungeonColdText, bj_FORCE_PLAYER[0])
    call UnitRemoveAbilityBJ(0x41303348, udg_Arct)
    call RemoveUnit(udg_AS_Effect10Unit)
    if udg_MeditationLogic then
        set udg_MeditationLogic = false
        call AddUnitAnimationPropertiesBJ(false, "gold", udg_Arct)
        call SetUnitMoveSpeed(udg_Arct, GetUnitDefaultMoveSpeed(udg_Arct))
        call SetUnitTurnSpeedBJ(udg_Arct, 1.00)
        call DestroyEffectBJ(udg_MeditationEffect)
        call DisableTrigger(gg_trg_Meditation_Heal)
        call DisableTrigger(gg_trg_Meditation_Cast)
        call DisableTrigger(gg_trg_Meditation_Turn_Off)
    endif
    if udg_SprintLogic then
        set udg_SprintLogic = false
        call IssueImmediateOrderBJ(udg_Arct, "manashieldoff")
        call DisableTrigger(gg_trg_Sprint_Energy)
    endif
    call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_SUB, udg_AS_Effect9Count2)
    call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_SUB, udg_AS_Effect9Count2)
    call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_SUB, udg_AS_Effect9Count2)
    set udg_AS_Effect9Count2 = 0
    set udg_ARTInteger[4] = 0
    call EnableWeatherEffect(GetLastCreatedWeatherEffect(), false)
    call SetPlayerAbilityAvailableBJ(false, 0x41303138, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303537, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303530, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303147, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303555, Player(0))
    call UnitRemoveAbilityBJ(0x4130335A, udg_Arct)
    call UnitRemoveAbilityBJ(0x4130334B, udg_Arct)
    call DestroyFogModifier(GetLastCreatedFogModifier())
    call FogEnableOff()
    call FogMaskEnableOff()
    call CreateFogModifierRectBJ(true, Player(0), FOG_OF_WAR_VISIBLE, bj_mapInitialPlayableArea)
    call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
    call SetTerrainFogExBJ(0, 1100.00, 15000.00, 0.50, 0.00, 20.00, 100)
    call LeaderboardDisplayBJ(false, udg_CO_ComboBoard)
    set udg_AS_Effect10 = false
    set udg_EM_EncounterChance =- 4
    set udg_Training = true
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 4
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call DestroyEffectBJ(udg_ChestKeyEffect[bj_forLoopAIndex])
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call UnitRemoveBuffsBJ(bj_REMOVEBUFFS_ALL, udg_Arct)
    call SetUnitOwner(udg_Arct, Player(0), false)
    set udg_Point = GetRectCenter(gg_rct_Trees_Leave)
    call SetUnitFacingToFaceLocTimed(udg_Arct, udg_Point, 0)
    call SetUnitMoveSpeed(GetTriggerUnit(), GetUnitDefaultMoveSpeed(GetTriggerUnit()))
    call SetUnitTurnSpeedBJ(GetTriggerUnit(), 1.00)
    call RemoveLocation(udg_Point)
    call CameraSetSmoothingFactorBJ(0.00)
    call SelectUnitForPlayerSingle(udg_Arct, Player(0))
    call EnablePreSelect(false, false)
    call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Human\\ReviveHuman\\ReviveHuman.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    set udg_Transparent = 100.00
    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 1, ("Очки навыков: " + I2S(udg_AS_Points)))
    call EnableTrigger(gg_trg_Edemium_Transparent)
    call ExecuteFunc("Autosave")
endfunction

function InitTrig_Gen_Exit takes nothing returns nothing
    set gg_trg_Gen_Exit = CreateTrigger()
    call TriggerRegisterDialogEventBJ(gg_trg_Gen_Exit, udg_LeaveDialog)
    call TriggerAddCondition(gg_trg_Gen_Exit, Condition(function Trig_Gen_Exit_Conditions))
    call TriggerAddAction(gg_trg_Gen_Exit, function Trig_Gen_Exit_Actions)
endfunction
