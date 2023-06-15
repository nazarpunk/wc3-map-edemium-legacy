function InitGlobalsOld takes nothing returns nothing
    local integer i = 0
    set udg_CameraDistance = 0
    set udg_TeleportDialog = DialogCreate()
    set udg_DamageEventAmount = 0
    set udg_ChanceCrit = 0
    set udg_ChanceBlock = 0
    set udg_CameraMax = 0
    set udg_CameraMin = 0
    set udg_ItemInt = 0
    set udg_AbilityPower = 0
    set udg_RandomNumber = 0
    set udg_UnitGroup = CreateGroup()
    set udg_AbilityEnergyRegen = 0
    set udg_D_CreepsTotal = 0
    set udg_LeaveDialog = DialogCreate()
    set udg_Dead = false
    set udg_FadeSystemGroup = CreateGroup()
    set udg_TempBool = false
    set udg_FadeUnitKey = 0
    set udg_CameraAngle = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_ER_Creeps[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_AbilityLogic[i] = false
        set i = i + 1
    endloop
    set udg_ChestDust = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BackpackScrolls[i] = 0
        set i = i + 1
    endloop
    set udg_RewardDustReal = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_Offset[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BackpackPotions[i] = 0
        set i = i + 1
    endloop
    set udg_Difficulty = 1
    set udg_DifficultyDialog = DialogCreate()
    set udg_Transparent = 0
    set udg_UnitGroupPlayer = CreateGroup()
    set udg_PauseTimer = CreateTimer()
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_AugmentCost[i] = 0
        set i = i + 1
    endloop
    set udg_AttributesBoard = CreateMultiboard()
    set udg_ChanceCritBase = 8.00
    set udg_ChanceBlockBase = 8.00
    set udg_TimerPilgrim = CreateTimer()
    set udg_TimerLead = CreateTimer()
    set udg_D_Pick = CreateGroup()
    set udg_D_Rooms = 0
    set udg_D_Portals = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_D_PortalLogic[i] = false
        set i = i + 1
    endloop
    set udg_D_Pick2 = CreateGroup()
    set udg_D_Timer = CreateTimer()
    set udg_D_WallType = 0
    set udg_D_Walls = 0
    set udg_D_TimerPortals = CreateTimer()
    set udg_CameraTurn = 0
    set udg_CO_UnitGroup = CreateGroup()
    set udg_CO_UnitGroup2 = CreateGroup()
    set udg_CO_Combo = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_CO_ComboSeries[i] = 0
        set i = i + 1
    endloop
    set udg_CO_CombatTimer = CreateTimer()
    set udg_CO_CustomValue = 0
    set udg_CO_CombatTimer2 = CreateTimer()
    set udg_D_Torches = 0
    set udg_CO_Power = 0
    set udg_MeditationPower = 0
    set udg_CO_Time = 2.00
    set udg_D_Chests = 0
    set udg_D_ChestsMax = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_AS_Logic[i] = false
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_AS_Value[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_AS_Effect[i] = 0
        set i = i + 1
    endloop
    set udg_AS_SeriesNumber = 0
    set udg_CO_Damage = false
    set i = 0
    loop
        exitwhen(i > 24)
        set udg_AS_AbilityLVL[i] = 1
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_AS_AbilityEXP[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 24)
        set udg_AS_AbilityLVL_Base[i] = 1
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_AS_AbilityEXP_Base[i] = 0
        set i = i + 1
    endloop
    set udg_CO_Timer = CreateTimer()
    set udg_SprintLogic = false
    set udg_AS_EffectNumber = 0
    set udg_AS_AbilityCountLVL = 0
    set udg_AS_AbilityCountLVL_Base = 0
    set udg_AS_Points_Base = 0
    set udg_AS_TimerEffect1 = CreateTimer()
    set udg_ChestDialog = DialogCreate()
    set udg_ChestEnergy = 0
    set i = 0
    loop
        exitwhen(i > 24)
        set udg_AS_Name[i] = ""
        set i = i + 1
    endloop
    set udg_IG_RandomNumber = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_IG_ItemAtt[i] = ""
        set i = i + 1
    endloop
    set udg_IG_ItemCode = ""
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_IG_ItemValue[i] = 0
        set i = i + 1
    endloop
    set udg_IG_ItemQuality = 0
    set udg_SprintTimer = CreateTimer()
    set udg_EM_Bool = false
    set udg_EM_Cost = 0
    set udg_EM_Generate = 1
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_ART[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_AugmentLevel[i] = 0
        set i = i + 1
    endloop
    set udg_AugmentPrice = 0
    set udg_AugmentValue = 0
    set udg_EM_EncounterChance =- 4
    set udg_EnchantingRoom = false
    set udg_AS_TimerEffect4 = CreateTimer()
    set udg_AS_Effect8Group = CreateGroup()
    set udg_AS_TimerEffect8 = CreateTimer()
    set udg_AS_Effect9Count = 0
    set udg_AS_Effect9Count2 = 0
    set udg_AS_Effect10 = false
    set udg_AS_Effect2 = false
    set udg_AS_TimerEffect2 = CreateTimer()
    set udg_AS_Effect11 = false
    set udg_AS_TimerEffect11 = CreateTimer()
    set udg_OnkieRoom = false
    set udg_ER_Logic = false
    set udg_ER_Reward = 0
    set udg_ER_Count = 0
    set udg_ER_RewardReal = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_Tutorial[i] = false
        set i = i + 1
    endloop
    set udg_Training = false
    set udg_IG_InfoBool = false
    set udg_EndingDialog = DialogCreate()
    set udg_DamageEventAmountINT = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_EM_BossDead[i] = false
        set i = i + 1
    endloop
    set udg_CO_LeftWeapon = false
    set udg_TrapTimer = CreateTimer()
    set udg_CO_Effect6Power = 0
    set udg_AbilityPowerEnergy = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_EM_Boss[i] = false
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_TutorialHint[i] = false
        set i = i + 1
    endloop
    set udg_TutorialHintsOn = true
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_Difficulty_Unlocked[i] = false
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_IG_ItemEnchantName[i] = ""
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_IG_ItemEnchantInt[i] = 0
        set i = i + 1
    endloop
    set udg_LoadTimer = CreateTimer()
    set udg_PoisonGroup = CreateGroup()
    set udg_PoisonTimer = CreateTimer()
    set udg_EnchantCritBool = false
    set udg_EnchantCritTimer = CreateTimer()
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_CC_Ingredient[i] = 0
        set i = i + 1
    endloop
    set udg_CC_ItemLevel = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_CC_IngredientAdded[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_CC_IngredientName[i] = ""
        set i = i + 1
    endloop
    set udg_CC_Timer = CreateTimer()
    set udg_Artefactorium = false
    set udg_D_Timer2 = CreateTimer()
    set udg_D_Pick3 = CreateGroup()
    set udg_D_Timer3 = CreateTimer()
    set udg_D_TimerFinal = CreateTimer()
    set udg_CC_IngredientDrop = 2
    set udg_AS_TimerEffect9 = CreateTimer()
    set udg_AS_Effect9Group = CreateGroup()
    set udg_EM_EventGroup = CreateGroup()
    set udg_EventAttribute = 0
    set udg_EventLux = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_CC_SecretUnlocked[i] = false
        set i = i + 1
    endloop
    set udg_CC_SecretNumber = 0
    set udg_MeditationLogic = false
    set udg_LightIterations = 0
    set udg_ItemPickup__Radius = 0
    set udg_ItemPickup__AddUnit = false
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_JD_Integers[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_JD_Distances[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_JD_ReachedDistance[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_JD_SpeedUnits[i] = 0
        set i = i + 1
    endloop
    set udg_JDA_Speed = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_JD_Angle[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_JD_Animations[i] = ""
        set i = i + 1
    endloop
    set udg_JDA_Animation = ""
    set udg_JDA_DestroyTrees_Dash = false
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_JD_HighSettings[i] = 0
        set i = i + 1
    endloop
    set udg_JDA_JumpHigh_Distance = 0
    set udg_JDA_AnimationSpeed = 0
    set udg_JD_Group = CreateGroup()
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_JD_RealTimer[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_JD_Effect[i] = ""
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_JD_JumpHigh[i] = 0
        set i = i + 1
    endloop
    set udg_JDA_Collusion = false
    set udg_ItemPickup_Index = 0
    set udg_ItemPickup_Max = 0
    set udg_ItemPickup_Timer = CreateTimer()
    set udg_EventDialog = DialogCreate()
    set udg_EdemEventDialog = DialogCreate()
    set udg_EdemEventType = 0
    set udg_CreepSpellType = 0
    set udg_BL_Skip = 0
    set udg_BL_Times = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BL_Off[i] = false
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BL_Angle[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BL_Distance[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BL_Speed[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BL_Dmg[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BL_AoE[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BL_Collision[i] = 0
        set i = i + 1
    endloop
    set udg_BL_Scale = 0
    set udg_BL_Group = CreateGroup()
    set udg_BL_Idol = false
    set udg_BE_Model = ""
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BE_Bounces[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BE_SearchAoE[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BE_CDamage[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BE_CHeal[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BE_DamageAddition[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BE_HealAddition[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BE_Speed[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BE_Height[i] = 0
        set i = i + 1
    endloop
    set udg_BE_CSizeIncrement = 0
    set udg_BE_PosSpecialEffect = ""
    set udg_BE_NegSpecialEffect = ""
    set udg_BE_MaxIndex = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BE_AbilityIndex[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BE_DistanceTravelled[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BE_Damage[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BE_Heal[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BE_SizeIncrement[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BE_CurrentBounces[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BE_Angle[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_BE_Distance[i] = 0
        set i = i + 1
    endloop
    set udg_BE_TotalDistance = 0
    set udg_BE_Group = CreateGroup()
    set udg_FallenGroup = CreateGroup()
    set udg_Combat = false
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_ARTInteger[i] = 0
        set i = i + 1
    endloop
    set udg_SecretGroup = CreateGroup()
    set udg_FollowersGroup = CreateGroup()
    set udg_DifficultyRate = 1.00
    set udg_CustomValues = 0
    set udg_Boss2Timer = CreateTimer()
    set udg_EM_BossRoom = false
    set udg_D_DungeonTier = 0
    set udg_SaveLoad_SaveToDisk = false
    set udg_SaveLoad_Directory = ""
    set udg_SaveLoad_Alphabet = ""
    set udg_SaveLoad_CheckName = false
    set udg_SaveLoad_Security = false
    set udg_SaveLoad_HyphenSpace = 0
    set udg_SaveLoad_SeperationChar = ""
    set udg_SaveLoad_Lower = ""
    set udg_SaveLoad_Number = ""
    set udg_SaveLoad_Upper = ""
    set udg_SaveLoad_MaxValue = 0
    set udg_SaveLoad_HeroCount = 0
    set udg_SaveLoad_AbilityCount = 0
    set udg_SaveLoad_ItemCount = 0
    set udg_SaveLoad_Full = ""
    set udg_SaveLoad_Error = ""
    set udg_SaveLoad_Base = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_SaveLoad_Char[i] = ""
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_Load[i] = 0
        set i = i + 1
    endloop
    set udg_LoadCount = 0
    set udg_SaveCount = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_Save[i] = 0
        set i = i + 1
    endloop
    set udg_SaveLoad_Filename = ""
    set udg_Code = ""
    set udg_SaveLoad_Valid = false
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_AS_AbilityStudied[i] = 0
        set i = i + 1
    endloop
    set udg_TierUnlocked = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_SecretUnlocked[i] = 0
        set i = i + 1
    endloop
    set udg_InitDialog = DialogCreate()
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_EM_BossCreate[i] = false
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_LightOrbs[i] = 0
        set i = i + 1
    endloop
    set udg_Boss3Timer = CreateTimer()
    set udg_Boss3PortalCounter = 0
    set udg_Boss3TimerOrder = CreateTimer()
    set udg_IG_ItemLVL_Max = 4
    set udg_Boss3Pukes = 0
    set udg_ImportCode1 = ""
    set udg_ImportCode2 = ""
    set udg_LoadingTimer = CreateTimer()
    set udg_LoadSucces = false
    set udg_EM_Encounter = false
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_D_RoomDecorScale[i] = 0
        set i = i + 1
    endloop
    set udg_CS_Bool = false
    set udg_CS_Timer = CreateTimer()
    set udg_CS_KeeperBool = false
    set udg_CS_Reward = 0
    set udg_CS_TargetPower = 0
    set udg_CS_Round = 0
    set udg_ScrollTimer = CreateTimer()
    set udg_CinematicTimer = CreateTimer()
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_EM_LevelCV[i] = 0
        set i = i + 1
    endloop
    set udg_ImportCode3 = ""
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_EM_LevelDiscovered[i] = 0
        set i = i + 1
    endloop
    set udg_ImportCode4 = ""
    set udg_MapBossDialog = DialogCreate()
    set udg_EM_BossEnterDialog = 0
    set udg_EM_TargetCV = 0
    set udg_AS_Points = 0
    set udg_SaveTimer2 = CreateTimer()
    set udg_SaveTimer = CreateTimer()
    set udg_SaveTimer3 = CreateTimer()
    set udg_SaveTimer4 = CreateTimer()
    set udg_SaveTimer5 = CreateTimer()
    set udg_ComboSpawnTimer = CreateTimer()
    set udg_ComboSpawnAllowed = false
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_EdemEventBool[i] = false
        set i = i + 1
    endloop
    set udg_DungeonColdTimer = CreateTimer()
    set udg_DungeonColdLevel = 0
    set udg_DungeonDarkTimer = CreateTimer()
    set udg_Autosave = 0
    set udg_AutosaveBool = false
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_QG_Count[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_QG_ObjectiveStateMax[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_QG_ObjectiveState[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_QG_CountMax[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_QG_ObjectiveName[i] = ""
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_QG_Objective[i] = ""
        set i = i + 1
    endloop
    set udg_EventSucces = false
    set udg_EX_Level_Base = 0
    set udg_EX_Exp_Base = 0
    set udg_EX_LevelUp = 0
    set udg_EX_Rate = 1.00
    set udg_QG_QuestCompleted = 0
    set udg_CS_RewardReal = 0
    set udg_DungeonDeadlyCleansing = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_IG_ItemEnchant[i] = 0
        set i = i + 1
    endloop
    set udg_SB_Skip = 0
    set udg_SB_Times = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_SB_On[i] = false
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_SB_Level[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_SB_Distance[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_SB_Angle[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_SB_Speed[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_SB_Damage[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_SB_Spam[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_SB_Group[i] = CreateGroup()
        set i = i + 1
    endloop
    set udg_KB_Skip = 0
    set udg_KB_Times = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_KB_Off[i] = false
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_KB_Angle[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_KB_Distance[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_KB_Speed[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_KB_Spam[i] = 0
        set i = i + 1
    endloop
    set udg_KB_Bool = false
    set udg_IG_ItemRandom = 0
endfunction

function CreateAllDestructablesOld takes nothing returns nothing
    local destructable d
    local trigger t
    local real life
    set gg_dest_B003_2942 = CreateDestructableZ(0x42303033, 7104.0, 768.0, 86.0, 62.964, 1.000, 0)
    set gg_dest_B003_2941 = CreateDestructableZ(0x42303033, 7552.0, 1600.0, 86.0, 62.964, 1.000, 0)
    set gg_dest_B003_2940 = CreateDestructableZ(0x42303033, 7168.0, 1024.0, 86.0, 62.964, 1.000, 0)
    set gg_dest_B003_2939 = CreateDestructableZ(0x42303033, 7424.0, 1408.0, 86.0, 62.964, 1.000, 0)
    set gg_dest_B003_2938 = CreateDestructableZ(0x42303033, 6976.0, 1216.0, 86.0, 62.964, 1.000, 0)
    set gg_dest_B003_2937 = CreateDestructableZ(0x42303033, 7168.0, 1408.0, 86.0, 62.964, 1.000, 0)
    set gg_dest_B003_2936 = CreateDestructableZ(0x42303033, 7040.0, 1600.0, 86.0, 62.964, 1.000, 0)
    set gg_dest_B003_2935 = CreateDestructableZ(0x42303033, 6720.0, 1152.0, 86.0, 62.964, 1.000, 0)
    set gg_dest_B003_2932 = CreateDestructableZ(0x42303033, 7424.0, 1024.0, 86.0, 356.609, 1.000, 0)
    set gg_dest_B003_2930 = CreateDestructableZ(0x42303033, 7488.0, 768.0, 86.0, 356.609, 1.000, 0)
    set gg_dest_B003_2929 = CreateDestructableZ(0x42303033, 7616.0, 1216.0, 86.0, 356.609, 1.000, 0)
    set gg_dest_B003_2928 = CreateDestructableZ(0x42303033, 7872.0, 1152.0, 86.0, 356.609, 1.000, 0)
    set gg_dest_B00B_1390 = CreateDestructable(0x42303042, 7104.0, 768.0, 346.768, 0.500, 0)
    set gg_dest_B00B_1389 = CreateDestructable(0x42303042, 7168.0, 1024.0, 78.869, 0.500, 0)
    set gg_dest_B00B_1367 = CreateDestructable(0x42303042, 6976.0, 1216.0, 170.601, 0.500, 0)
    set gg_dest_B00B_1366 = CreateDestructable(0x42303042, 6720.0, 1152.0, 258.523, 0.500, 0)
    set gg_dest_B00B_1362 = CreateDestructable(0x42303042, 7616.0, 1216.0, 184.594, 0.500, 0)
    set gg_dest_B00B_1361 = CreateDestructable(0x42303042, 7424.0, 1024.0, 89.385, 0.500, 0)
    set gg_dest_B00B_1360 = CreateDestructable(0x42303042, 7488.0, 768.0, 355.500, 0.500, 0)
    set gg_dest_B00B_1359 = CreateDestructable(0x42303042, 7872.0, 1152.0, 270.525, 0.500, 0)
    set gg_dest_B00B_1357 = CreateDestructable(0x42303042, 7168.0, 1408.0, 183.085, 0.500, 0)
    set gg_dest_B00B_1356 = CreateDestructable(0x42303042, 7552.0, 1600.0, 356.814, 0.500, 0)
    set gg_dest_B00B_1355 = CreateDestructable(0x42303042, 7040.0, 1600.0, 269.121, 0.500, 0)
    set gg_dest_B00B_1354 = CreateDestructable(0x42303042, 7424.0, 1408.0, 90.981, 0.500, 0)
endfunction


function CreateBuildingsForPlayer0Old takes nothing returns nothing
    local player p = Player(0)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u = CreateUnit(p, 0x68303049, 4224.0, 2752.0, 270.000)
    set u = null
endfunction


function CreateUnitsForPlayer0Old takes nothing returns nothing
    local player p = Player(0)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set gg_unit_hrif_0000 = CreateUnit(p, 0x68726966, 4221.0, 2566.2, 325.568)
    set gg_unit_H000_0004 = CreateUnit(p, 0x48303030, 11410.3, 1595.1, 270.000)
    set gg_unit_h009_0006 = CreateUnit(p, 0x68303039, 4163.3, 2107.2, 0.000)
    set gg_unit_h007_0065 = CreateUnit(p, 0x68303037, 10438.5, - 1267.5, 266.518)
endfunction


function CreateUnitsForPlayer1Old takes nothing returns nothing
    local player p = Player(1)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set gg_unit_h00N_0045 = CreateUnit(p, 0x6830304E, 4220.3, 1473.1, 270.000)
endfunction


function CreateNeutralPassiveBuildingsOld takes nothing returns nothing
    local player p = Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set gg_unit_h006_0035 = CreateUnit(p, 0x68303036, 7296.0, 1216.0, 270.000)
    set gg_unit_h006_0067 = CreateUnit(p, 0x68303036, 7488.0, 768.0, 270.000)
    set gg_unit_h006_0069 = CreateUnit(p, 0x68303036, 7616.0, 1216.0, 270.000)
    set gg_unit_h006_0071 = CreateUnit(p, 0x68303036, 7872.0, 1152.0, 270.000)
    set gg_unit_h006_0073 = CreateUnit(p, 0x68303036, 7424.0, 1024.0, 270.000)
    set gg_unit_h006_0075 = CreateUnit(p, 0x68303036, 7168.0, 1408.0, 270.000)
    set gg_unit_h006_0076 = CreateUnit(p, 0x68303036, 6976.0, 1216.0, 270.000)
    set gg_unit_h006_0077 = CreateUnit(p, 0x68303036, 7424.0, 1408.0, 270.000)
    set gg_unit_h006_0078 = CreateUnit(p, 0x68303036, 7168.0, 1024.0, 270.000)
    set gg_unit_h006_0079 = CreateUnit(p, 0x68303036, 7552.0, 1600.0, 270.000)
    set gg_unit_h006_0080 = CreateUnit(p, 0x68303036, 7104.0, 768.0, 270.000)
    set gg_unit_h006_0081 = CreateUnit(p, 0x68303036, 7040.0, 1600.0, 270.000)
    set gg_unit_h006_0082 = CreateUnit(p, 0x68303036, 6720.0, 1152.0, 270.000)
    set gg_unit_h00K_0095 = CreateUnit(p, 0x6830304B, 2816.0, - 64.0, 270.000)
    call SetUnitState(gg_unit_h00K_0095, UNIT_STATE_MANA, 1)
    set gg_unit_h00K_0096 = CreateUnit(p, 0x6830304B, 2688.0, 64.0, 270.000)
    call SetUnitState(gg_unit_h00K_0096, UNIT_STATE_MANA, 2)
    set gg_unit_h00K_0097 = CreateUnit(p, 0x6830304B, 2816.0, 64.0, 270.000)
    call SetUnitState(gg_unit_h00K_0097, UNIT_STATE_MANA, 2)
    set gg_unit_h00K_0098 = CreateUnit(p, 0x6830304B, 2944.0, 64.0, 270.000)
    call SetUnitState(gg_unit_h00K_0098, UNIT_STATE_MANA, 2)
    set gg_unit_h00K_0099 = CreateUnit(p, 0x6830304B, 2560.0, 128.0, 270.000)
    call SetUnitState(gg_unit_h00K_0099, UNIT_STATE_MANA, 3)
    set gg_unit_h00K_0100 = CreateUnit(p, 0x6830304B, 2560.0, 2240.0, 270.000)
    call SetUnitState(gg_unit_h00K_0100, UNIT_STATE_MANA, 15)
    set gg_unit_h00K_0101 = CreateUnit(p, 0x6830304B, 2816.0, 192.0, 270.000)
    call SetUnitState(gg_unit_h00K_0101, UNIT_STATE_MANA, 3)
    set gg_unit_h00K_0102 = CreateUnit(p, 0x6830304B, 3072.0, 128.0, 270.000)
    call SetUnitState(gg_unit_h00K_0102, UNIT_STATE_MANA, 3)
    set gg_unit_h00K_0103 = CreateUnit(p, 0x6830304B, 2560.0, 256.0, 270.000)
    call SetUnitState(gg_unit_h00K_0103, UNIT_STATE_MANA, 4)
    set gg_unit_h00K_0104 = CreateUnit(p, 0x6830304B, 2816.0, 1664.0, 270.000)
    call SetUnitState(gg_unit_h00K_0104, UNIT_STATE_MANA, 12)
    set gg_unit_h00K_0105 = CreateUnit(p, 0x6830304B, 2816.0, 512.0, 270.000)
    call SetUnitState(gg_unit_h00K_0105, UNIT_STATE_MANA, 5)
    set gg_unit_h00K_0106 = CreateUnit(p, 0x6830304B, 2816.0, 2048.0, 270.000)
    call SetUnitState(gg_unit_h00K_0106, UNIT_STATE_MANA, 15)
    set gg_unit_h00K_0107 = CreateUnit(p, 0x6830304B, 3072.0, 256.0, 270.000)
    call SetUnitState(gg_unit_h00K_0107, UNIT_STATE_MANA, 4)
    set gg_unit_h00K_0108 = CreateUnit(p, 0x6830304B, 2816.0, 640.0, 270.000)
    call SetUnitState(gg_unit_h00K_0108, UNIT_STATE_MANA, 6)
    set gg_unit_h00K_0109 = CreateUnit(p, 0x6830304B, 2688.0, 704.0, 270.000)
    call SetUnitState(gg_unit_h00K_0109, UNIT_STATE_MANA, 6)
    set gg_unit_h00K_0110 = CreateUnit(p, 0x6830304B, 2560.0, 768.0, 270.000)
    call SetUnitState(gg_unit_h00K_0110, UNIT_STATE_MANA, 7)
    set gg_unit_h00K_0111 = CreateUnit(p, 0x6830304B, 2816.0, 768.0, 270.000)
    call SetUnitState(gg_unit_h00K_0111, UNIT_STATE_MANA, 7)
    set gg_unit_h00K_0112 = CreateUnit(p, 0x6830304B, 2944.0, 704.0, 270.000)
    call SetUnitState(gg_unit_h00K_0112, UNIT_STATE_MANA, 6)
    set gg_unit_h00K_0113 = CreateUnit(p, 0x6830304B, 3072.0, 768.0, 270.000)
    call SetUnitState(gg_unit_h00K_0113, UNIT_STATE_MANA, 7)
    set gg_unit_h00K_0114 = CreateUnit(p, 0x6830304B, 2688.0, 832.0, 270.000)
    call SetUnitState(gg_unit_h00K_0114, UNIT_STATE_MANA, 8)
    set gg_unit_h00K_0115 = CreateUnit(p, 0x6830304B, 2944.0, 832.0, 270.000)
    call SetUnitState(gg_unit_h00K_0115, UNIT_STATE_MANA, 8)
    set gg_unit_h00K_0116 = CreateUnit(p, 0x6830304B, 2560.0, 896.0, 270.000)
    call SetUnitState(gg_unit_h00K_0116, UNIT_STATE_MANA, 8)
    set gg_unit_h00K_0117 = CreateUnit(p, 0x6830304B, 2688.0, 1728.0, 270.000)
    call SetUnitState(gg_unit_h00K_0117, UNIT_STATE_MANA, 13)
    set gg_unit_h00K_0118 = CreateUnit(p, 0x6830304B, 2816.0, 960.0, 270.000)
    call SetUnitState(gg_unit_h00K_0118, UNIT_STATE_MANA, 9)
    set gg_unit_h00K_0119 = CreateUnit(p, 0x6830304B, 2944.0, 1728.0, 270.000)
    call SetUnitState(gg_unit_h00K_0119, UNIT_STATE_MANA, 13)
    set gg_unit_h00K_0120 = CreateUnit(p, 0x6830304B, 3072.0, 896.0, 270.000)
    call SetUnitState(gg_unit_h00K_0120, UNIT_STATE_MANA, 8)
    set gg_unit_h00K_0121 = CreateUnit(p, 0x6830304B, 2560.0, 1024.0, 270.000)
    call SetUnitState(gg_unit_h00K_0121, UNIT_STATE_MANA, 9)
    set gg_unit_h00K_0122 = CreateUnit(p, 0x6830304B, 2688.0, 1088.0, 270.000)
    call SetUnitState(gg_unit_h00K_0122, UNIT_STATE_MANA, 10)
    set gg_unit_h00K_0123 = CreateUnit(p, 0x6830304B, 2816.0, 1280.0, 270.000)
    call SetUnitState(gg_unit_h00K_0123, UNIT_STATE_MANA, 10)
    set gg_unit_h00K_0124 = CreateUnit(p, 0x6830304B, 2944.0, 1088.0, 270.000)
    call SetUnitState(gg_unit_h00K_0124, UNIT_STATE_MANA, 10)
    set gg_unit_h00K_0125 = CreateUnit(p, 0x6830304B, 3072.0, 1024.0, 270.000)
    call SetUnitState(gg_unit_h00K_0125, UNIT_STATE_MANA, 9)
    set gg_unit_h00K_0126 = CreateUnit(p, 0x6830304B, 2560.0, 1152.0, 270.000)
    call SetUnitState(gg_unit_h00K_0126, UNIT_STATE_MANA, 10)
    set gg_unit_h00K_0127 = CreateUnit(p, 0x6830304B, 3072.0, 1152.0, 270.000)
    call SetUnitState(gg_unit_h00K_0127, UNIT_STATE_MANA, 10)
    set gg_unit_h00K_0128 = CreateUnit(p, 0x6830304B, 2560.0, 1408.0, 270.000)
    call SetUnitState(gg_unit_h00K_0128, UNIT_STATE_MANA, 11)
    set gg_unit_h00K_0129 = CreateUnit(p, 0x6830304B, 2816.0, 1408.0, 270.000)
    call SetUnitState(gg_unit_h00K_0129, UNIT_STATE_MANA, 11)
    set gg_unit_h00K_0130 = CreateUnit(p, 0x6830304B, 3072.0, 1408.0, 270.000)
    call SetUnitState(gg_unit_h00K_0130, UNIT_STATE_MANA, 11)
    set gg_unit_h00K_0131 = CreateUnit(p, 0x6830304B, 2560.0, 1664.0, 270.000)
    call SetUnitState(gg_unit_h00K_0131, UNIT_STATE_MANA, 12)
    set gg_unit_h00K_0132 = CreateUnit(p, 0x6830304B, 2688.0, 1600.0, 270.000)
    call SetUnitState(gg_unit_h00K_0132, UNIT_STATE_MANA, 12)
    set gg_unit_h00K_0133 = CreateUnit(p, 0x6830304B, 2816.0, 1536.0, 270.000)
    call SetUnitState(gg_unit_h00K_0133, UNIT_STATE_MANA, 11)
    set gg_unit_h00K_0134 = CreateUnit(p, 0x6830304B, 2944.0, 1600.0, 270.000)
    call SetUnitState(gg_unit_h00K_0134, UNIT_STATE_MANA, 12)
    set gg_unit_h00K_0135 = CreateUnit(p, 0x6830304B, 3072.0, 1664.0, 270.000)
    call SetUnitState(gg_unit_h00K_0135, UNIT_STATE_MANA, 12)
    set gg_unit_h00K_0136 = CreateUnit(p, 0x6830304B, 2560.0, 1792.0, 270.000)
    call SetUnitState(gg_unit_h00K_0136, UNIT_STATE_MANA, 13)
    set gg_unit_h00K_0138 = CreateUnit(p, 0x6830304B, 2816.0, 1856.0, 270.000)
    call SetUnitState(gg_unit_h00K_0138, UNIT_STATE_MANA, 14)
    set gg_unit_h00K_0139 = CreateUnit(p, 0x6830304B, 3072.0, 1792.0, 270.000)
    call SetUnitState(gg_unit_h00K_0139, UNIT_STATE_MANA, 13)
    set gg_unit_h00K_0140 = CreateUnit(p, 0x6830304B, 2560.0, 1920.0, 270.000)
    call SetUnitState(gg_unit_h00K_0140, UNIT_STATE_MANA, 14)
    set gg_unit_h00K_0141 = CreateUnit(p, 0x6830304B, 2688.0, 1984.0, 270.000)
    call SetUnitState(gg_unit_h00K_0141, UNIT_STATE_MANA, 15)
    set gg_unit_h00K_0142 = CreateUnit(p, 0x6830304B, 2816.0, 2432.0, 270.000)
    call SetUnitState(gg_unit_h00K_0142, UNIT_STATE_MANA, 15)
    set gg_unit_h00K_0143 = CreateUnit(p, 0x6830304B, 2944.0, 1984.0, 270.000)
    call SetUnitState(gg_unit_h00K_0143, UNIT_STATE_MANA, 15)
    set gg_unit_h00K_0144 = CreateUnit(p, 0x6830304B, 3072.0, 1920.0, 270.000)
    call SetUnitState(gg_unit_h00K_0144, UNIT_STATE_MANA, 14)
    set gg_unit_h00K_0145 = CreateUnit(p, 0x6830304B, 2560.0, 2048.0, 270.000)
    call SetUnitState(gg_unit_h00K_0145, UNIT_STATE_MANA, 15)
    set gg_unit_h00K_0146 = CreateUnit(p, 0x6830304B, 3072.0, 2048.0, 270.000)
    call SetUnitState(gg_unit_h00K_0146, UNIT_STATE_MANA, 15)
    set gg_unit_h00K_0147 = CreateUnit(p, 0x6830304B, 2688.0, 1216.0, 270.000)
    call SetUnitState(gg_unit_h00K_0147, UNIT_STATE_MANA, 10)
    set gg_unit_h00K_0148 = CreateUnit(p, 0x6830304B, 2944.0, 448.0, 270.000)
    call SetUnitState(gg_unit_h00K_0148, UNIT_STATE_MANA, 5)
    set gg_unit_h00K_0149 = CreateUnit(p, 0x6830304B, 2816.0, 384.0, 270.000)
    call SetUnitState(gg_unit_h00K_0149, UNIT_STATE_MANA, 5)
    set gg_unit_h00K_0150 = CreateUnit(p, 0x6830304B, 2944.0, 1216.0, 270.000)
    call SetUnitState(gg_unit_h00K_0150, UNIT_STATE_MANA, 10)
    set gg_unit_h00K_0151 = CreateUnit(p, 0x6830304B, 3072.0, 384.0, 270.000)
    call SetUnitState(gg_unit_h00K_0151, UNIT_STATE_MANA, 4)
    set gg_unit_h00K_0152 = CreateUnit(p, 0x6830304B, 2560.0, 384.0, 270.000)
    call SetUnitState(gg_unit_h00K_0152, UNIT_STATE_MANA, 4)
    set gg_unit_h00K_0153 = CreateUnit(p, 0x6830304B, 3072.0, 2240.0, 270.000)
    call SetUnitState(gg_unit_h00K_0153, UNIT_STATE_MANA, 15)
    set gg_unit_h00K_0154 = CreateUnit(p, 0x6830304B, 2688.0, 448.0, 270.000)
    call SetUnitState(gg_unit_h00K_0154, UNIT_STATE_MANA, 5)
    set gg_unit_h00K_0155 = CreateUnit(p, 0x6830304B, 2816.0, 2240.0, 270.000)
    call SetUnitState(gg_unit_h00K_0155, UNIT_STATE_MANA, 15)
endfunction


function CreateNeutralPassiveOld takes nothing returns nothing
    local player p = Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set gg_unit_h00H_0002 = CreateUnit(p, 0x68303048, 14686.2, 538.2, 90.000)
    set gg_unit_h00F_0003 = CreateUnit(p, 0x68303046, 14224.2, 1378.7, 304.020)
    set gg_unit_h00Y_0005 = CreateUnit(p, 0x68303059, 14686.1, 550.3, 89.610)
    set gg_unit_h00Z_0007 = CreateUnit(p, 0x6830305A, 14688.9, 608.9, 89.060)
    set gg_unit_h010_0008 = CreateUnit(p, 0x68303130, 14688.3, 627.7, 91.810)
    set gg_unit_h011_0009 = CreateUnit(p, 0x68303131, 14690.4, 627.7, 92.180)
    set gg_unit_h002_0010 = CreateUnit(p, 0x68303032, 14684.4, 692.9, 90.000)
    set gg_unit_h012_0011 = CreateUnit(p, 0x68303132, - 55.0, 2216.1, 313.578)
    set gg_unit_h012_0012 = CreateUnit(p, 0x68303132, - 200.9, 2258.2, 359.962)
    set gg_unit_h012_0013 = CreateUnit(p, 0x68303132, - 352.9, 2203.7, 61.990)
    set gg_unit_h003_0014 = CreateUnit(p, 0x68303033, 14687.5, 691.6, 90.000)
    set gg_unit_h00U_0015 = CreateUnit(p, 0x68303055, 14688.8, 683.2, 90.000)
    set gg_unit_h015_0016 = CreateUnit(p, 0x68303135, 14684.6, 559.1, 90.000)
    set gg_unit_h016_0017 = CreateUnit(p, 0x68303136, 14685.1, 391.3, 90.000)
    set gg_unit_h017_0018 = CreateUnit(p, 0x68303137, 14690.5, 327.9, 90.000)
    set gg_unit_h018_0019 = CreateUnit(p, 0x68303138, 14687.4, 337.3, 90.000)
    set gg_unit_h019_0020 = CreateUnit(p, 0x68303139, 14687.3, 401.5, 90.000)
    set gg_unit_h01A_0021 = CreateUnit(p, 0x68303141, 14687.6, 392.2, 90.000)
    set gg_unit_h01B_0022 = CreateUnit(p, 0x68303142, 14689.4, 807.3, 90.000)
    set gg_unit_h01C_0023 = CreateUnit(p, 0x68303143, 14689.3, 873.0, 90.000)
    set gg_unit_h01D_0024 = CreateUnit(p, 0x68303144, 14689.6, 807.3, 90.000)
    set gg_unit_h01E_0025 = CreateUnit(p, 0x68303145, 14688.1, 888.1, 90.000)
    set gg_unit_h01F_0026 = CreateUnit(p, 0x68303146, 14689.9, 805.5, 90.000)
    set gg_unit_h01G_0027 = CreateUnit(p, 0x68303147, 14689.9, 802.0, 90.000)
    set gg_unit_n006_0028 = CreateUnit(p, 0x6E303036, - 1350.2, - 22409.8, 271.072)
    call SetUnitColor(gg_unit_n006_0028, ConvertPlayerColor(9))
    set gg_unit_h00V_0029 = CreateUnit(p, 0x68303056, - 1400.3, - 27391.4, 88.245)
    set gg_unit_h001_0037 = CreateUnit(p, 0x68303031, 7296.0, 1230.6, 270.000)
    set gg_unit_n009_0061 = CreateUnit(p, 0x6E303039, - 2430.4, 896.7, 357.350)
    set gg_unit_h00V_0063 = CreateUnit(p, 0x68303056, - 1338.8, - 1751.2, 269.420)
endfunction


function CreatePlayerBuildingsOld takes nothing returns nothing
    call CreateBuildingsForPlayer0Old()
endfunction


function CreatePlayerUnitsOld takes nothing returns nothing
    call CreateUnitsForPlayer0Old()
    call CreateUnitsForPlayer1Old()
endfunction


function CreateAllUnitsOld takes nothing returns nothing
    call CreateNeutralPassiveBuildingsOld()
    call CreatePlayerBuildingsOld()
    call CreateNeutralPassiveOld()
    call CreatePlayerUnitsOld()
endfunction