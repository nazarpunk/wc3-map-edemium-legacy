function InitGlobalsOld takes nothing returns nothing
    local integer i = 0
    set udg_CameraDistance = 0
    set udg_TeleportDialog = DialogCreate()
    set udg_UDex = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_UnitIndexLock[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_UDexPrev[i] = 0
        set i = i + 1
    endloop
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_UDexNext[i] = 0
        set i = i + 1
    endloop
    set udg_UnitIndexEvent = 0
    set udg_UDexRecycle = 0
    set udg_UnitIndexerEnabled = false
    set udg_UDexWasted = 0
    set udg_UDexGen = 0
    set udg_DamageTypeSpell = 0
    set udg_DamageTypeDOT = 0
    set udg_DamageTypeRanged = 0
    set udg_DmgEvN = 0
    set udg_DamageEventAmount = 0
    set udg_DamageEventPrevAmt = 0
    set udg_DamageEventExplodesUnit = false
    set udg_DamageEventOverride = false
    set udg_DamageModifierEvent = 0
    set udg_DamageEvent = 0
    set udg_DmgEvLife = 0
    set udg_DamageEventTrigger = CreateTrigger()
    set udg_DmgTypPrev = 0
    set udg_DamageEventType = 0
    set i = 0
    loop
        exitwhen(i > 1)
        set udg_UnitDamageRegistered[i] = false
        set i = i + 1
    endloop
    set udg_DamageEventsWasted = 0
    set udg_DmgEvTimer = CreateTimer()
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
    set udg_Region1 = CreateRegion()
    set udg_Region2 = CreateRegion()
    set udg_Region3 = CreateRegion()
    set udg_Region4 = CreateRegion()
    set udg_Region5 = CreateRegion()
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
    set udg_Region6 = CreateRegion()
    set udg_Region7 = CreateRegion()
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
    set udg_Region8 = CreateRegion()
    set udg_Region9 = CreateRegion()
    set udg_Region10 = CreateRegion()
    set udg_Region11 = CreateRegion()
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


function InitSoundsOld takes nothing returns nothing
    set gg_snd_QuestLog = CreateSound("Sound\\Interface\\QuestLog.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_QuestLog, "QuestUpdate")
    call SetSoundDuration(gg_snd_QuestLog, 2276)
    set gg_snd_Error = CreateSound("Sound\\Interface\\Error.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_Error, "InterfaceError")
    call SetSoundDuration(gg_snd_Error, 614)
    call SetSoundChannel(gg_snd_Error, 6)
    set gg_snd_FrostArmorTarget1 = CreateSound("Abilities\\Spells\\Undead\\FrostArmor\\FrostArmorTarget1.wav", false, false, false, 20, 1, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_FrostArmorTarget1, "FrostArmor")
    call SetSoundDuration(gg_snd_FrostArmorTarget1, 2995)
    call SetSoundChannel(gg_snd_FrostArmorTarget1, 13)
    set gg_snd_Ambient = CreateSound("Ambient.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_Ambient, 71210)
    call SetSoundChannel(gg_snd_Ambient, 10)
    call SetSoundVolume(gg_snd_Ambient, 60)
    call SetSoundPitch(gg_snd_Ambient, 1.0)
    set gg_snd_Avatar = CreateSound("Abilities\\Spells\\Human\\Avatar\\Avatar.wav", false, true, true, 10, 10, "SpellsEAX")
    call SetSoundParamsFromLabel(gg_snd_Avatar, "Avatar")
    call SetSoundDuration(gg_snd_Avatar, 1411)
    set gg_snd_GamePause = CreateSound("Sound\\Interface\\GamePause.wav", false, false, false, 10, 10, "")
    call SetSoundParamsFromLabel(gg_snd_GamePause, "PauseGame")
    call SetSoundDuration(gg_snd_GamePause, 643)
    set gg_snd_QuestFail = CreateSound("QuestFail.mp3", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_QuestFail, 4826)
    call SetSoundChannel(gg_snd_QuestFail, 0)
    call SetSoundVolume(gg_snd_QuestFail, 127)
    call SetSoundPitch(gg_snd_QuestFail, 1.0)
    set gg_snd_AssassinDeath1 = CreateSound("Units\\Creeps\\Assassin\\AssassinDeath1.wav", false, true, true, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_AssassinDeath1, "AssassinDeath")
    call SetSoundDuration(gg_snd_AssassinDeath1, 4556)
    set gg_snd_AmbientMachines = CreateSound("AmbientMachines.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_AmbientMachines, 59585)
    call SetSoundChannel(gg_snd_AmbientMachines, 0)
    call SetSoundVolume(gg_snd_AmbientMachines, 75)
    call SetSoundPitch(gg_snd_AmbientMachines, 1.0)
    set gg_snd_AmbiencePortal = CreateSound("AmbiencePortal.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_AmbiencePortal, 29095)
    call SetSoundChannel(gg_snd_AmbiencePortal, 0)
    call SetSoundVolume(gg_snd_AmbiencePortal, 100)
    call SetSoundPitch(gg_snd_AmbiencePortal, 1.0)
    set gg_snd_AmbientTrees = CreateSound("AmbientTrees.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_AmbientTrees, 48431)
    call SetSoundChannel(gg_snd_AmbientTrees, 0)
    call SetSoundVolume(gg_snd_AmbientTrees, 100)
    call SetSoundPitch(gg_snd_AmbientTrees, 1.0)
    set gg_snd_HPitLordYes3 = CreateSound("Units\\Demon\\HeroPitLord\\HPitLordYes3.wav", false, true, true, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_HPitLordYes3, "HeroPitLordYes")
    call SetSoundDuration(gg_snd_HPitLordYes3, 2244)
    set gg_snd_HeroPaladinWarcry1 = CreateSound("Units\\Human\\HeroPaladin\\HeroPaladinWarcry1.wav", false, false, false, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_HeroPaladinWarcry1, "HeroPaladinWarcry")
    call SetSoundDuration(gg_snd_HeroPaladinWarcry1, 1283)
    call SetSoundVolume(gg_snd_HeroPaladinWarcry1, 100)
    set gg_snd_JainaYes1 = CreateSound("Units\\Human\\Jaina\\JainaYes1.wav", false, true, true, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_JainaYes1, "JainaYes")
    call SetSoundDuration(gg_snd_JainaYes1, 869)
    set gg_snd_Ambientvault = CreateSound("Ambientvault.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_Ambientvault, 38531)
    call SetSoundChannel(gg_snd_Ambientvault, 0)
    call SetSoundVolume(gg_snd_Ambientvault, 90)
    call SetSoundPitch(gg_snd_Ambientvault, 1.0)
    set gg_snd_TutorialSample = CreateSound("war3mapImported\\TutorialSample.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundChannel(gg_snd_TutorialSample, 0)
    call SetSoundVolume(gg_snd_TutorialSample, 70)
    call SetSoundPitch(gg_snd_TutorialSample, 1.0)
    set gg_snd_EdemiumRiser = CreateSound("war3mapImported\\EdemiumRiser.mp3", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_EdemiumRiser, 14838)
    call SetSoundChannel(gg_snd_EdemiumRiser, 0)
    call SetSoundVolume(gg_snd_EdemiumRiser, 127)
    call SetSoundPitch(gg_snd_EdemiumRiser, 1.0)
    set gg_snd_EdemiumHit = CreateSound("war3mapImported\\EdemiumHit.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_EdemiumHit, 7445)
    call SetSoundChannel(gg_snd_EdemiumHit, 0)
    call SetSoundVolume(gg_snd_EdemiumHit, 127)
    call SetSoundPitch(gg_snd_EdemiumHit, 1.0)
    set gg_snd_HeroPaladinYesAttack2 = CreateSound("Units\\Human\\HeroPaladin\\HeroPaladinYesAttack2.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_HeroPaladinYesAttack2, "HeroPaladinYesAttack")
    call SetSoundDuration(gg_snd_HeroPaladinYesAttack2, 1637)
    call SetSoundVolume(gg_snd_HeroPaladinYesAttack2, 100)
    set gg_snd_JainaWhat1 = CreateSound("Units\\Human\\Jaina\\JainaWhat1.wav", false, true, true, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_JainaWhat1, "JainaWhat")
    call SetSoundDuration(gg_snd_JainaWhat1, 800)
    set gg_snd_CatapultDeath1 = CreateSound("Units\\Orc\\Catapult\\CatapultDeath1.wav", false, false, false, 10, 10, "")
    call SetSoundParamsFromLabel(gg_snd_CatapultDeath1, "CatapultDeath")
    call SetSoundDuration(gg_snd_CatapultDeath1, 1612)
    call SetSoundChannel(gg_snd_CatapultDeath1, 0)
    set gg_snd_KelThuzadYesAttack1 = CreateSound("Units\\Undead\\KelThuzadLich\\KelThuzadYesAttack1.wav", false, true, true, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_KelThuzadYesAttack1, "KelThuzadLichYesAttack")
    call SetSoundDuration(gg_snd_KelThuzadYesAttack1, 1545)
    set gg_snd_CentaurArcherDeath = CreateSound("Units\\Creeps\\CentaurArcher\\CentaurArcherDeath.wav", false, true, true, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_CentaurArcherDeath, "CentaurArcherDeath")
    call SetSoundDuration(gg_snd_CentaurArcherDeath, 1546)
    set gg_snd_AmbientNight = CreateSound("AmbientNight.mp3", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_AmbientNight, 25208)
    call SetSoundChannel(gg_snd_AmbientNight, 0)
    call SetSoundVolume(gg_snd_AmbientNight, 127)
    call SetSoundPitch(gg_snd_AmbientNight, 1.0)
    set gg_snd_3F = CreateSound("3F.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_3F, 7445)
    call SetSoundChannel(gg_snd_3F, 0)
    call SetSoundVolume(gg_snd_3F, 127)
    call SetSoundPitch(gg_snd_3F, 1.0)
    set gg_snd_1F = CreateSound("1F.mp3", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_1F, 3997)
    call SetSoundChannel(gg_snd_1F, 0)
    call SetSoundVolume(gg_snd_1F, 127)
    call SetSoundPitch(gg_snd_1F, 1.0)
    set gg_snd_2F = CreateSound("2F.mp3", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_2F, 7497)
    call SetSoundChannel(gg_snd_2F, 0)
    call SetSoundVolume(gg_snd_2F, 127)
    call SetSoundPitch(gg_snd_2F, 1.0)
    set gg_snd_4BF = CreateSound("4BF.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_4BF, 1332)
    call SetSoundChannel(gg_snd_4BF, 0)
    call SetSoundVolume(gg_snd_4BF, 100)
    call SetSoundPitch(gg_snd_4BF, 1.0)
    set gg_snd_4F = CreateSound("4F.mp3", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_4F, 5590)
    call SetSoundChannel(gg_snd_4F, 0)
    call SetSoundVolume(gg_snd_4F, 127)
    call SetSoundPitch(gg_snd_4F, 1.0)
    set gg_snd_6F = CreateSound("6F.mp3", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_6F, 9900)
    call SetSoundChannel(gg_snd_6F, 0)
    call SetSoundVolume(gg_snd_6F, 127)
    call SetSoundPitch(gg_snd_6F, 1.0)
    set gg_snd_5F = CreateSound("5F.mp3", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_5F, 6661)
    call SetSoundChannel(gg_snd_5F, 0)
    call SetSoundVolume(gg_snd_5F, 127)
    call SetSoundPitch(gg_snd_5F, 1.0)
    set gg_snd_7F = CreateSound("7F.mp3", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_7F, 6922)
    call SetSoundChannel(gg_snd_7F, 0)
    call SetSoundVolume(gg_snd_7F, 127)
    call SetSoundPitch(gg_snd_7F, 1.0)
    set gg_snd_8F = CreateSound("8F.mp3", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_8F, 8986)
    call SetSoundChannel(gg_snd_8F, 0)
    call SetSoundVolume(gg_snd_8F, 127)
    call SetSoundPitch(gg_snd_8F, 1.0)
    set gg_snd_9F = CreateSound("9F.mp3", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_9F, 7027)
    call SetSoundChannel(gg_snd_9F, 0)
    call SetSoundVolume(gg_snd_9F, 127)
    call SetSoundPitch(gg_snd_9F, 1.0)
    set gg_snd_10F = CreateSound("10F.mp3", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_10F, 5355)
    call SetSoundChannel(gg_snd_10F, 0)
    call SetSoundVolume(gg_snd_10F, 127)
    call SetSoundPitch(gg_snd_10F, 1.0)
    set gg_snd_12F = CreateSound("12F.mp3", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_12F, 810)
    call SetSoundChannel(gg_snd_12F, 0)
    call SetSoundVolume(gg_snd_12F, 127)
    call SetSoundPitch(gg_snd_12F, 1.0)
    set gg_snd_11F = CreateSound("11F.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_11F, 1829)
    call SetSoundChannel(gg_snd_11F, 0)
    call SetSoundVolume(gg_snd_11F, 100)
    call SetSoundPitch(gg_snd_11F, 1.0)
    set gg_snd_O04Mannoroth38 = CreateSound("Sound\\Dialogue\\OrcCampaign\\Orc04Interlude\\O04Mannoroth38.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_O04Mannoroth38, "O04Mannoroth38")
    call SetSoundDuration(gg_snd_O04Mannoroth38, 12617)
    call SetSoundVolume(gg_snd_O04Mannoroth38, 127)
    set gg_snd_HPitLordYesAttack2 = CreateSound("Units\\Demon\\HeroPitLord\\HPitLordYesAttack2.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_HPitLordYesAttack2, "HeroPitLordYesAttack")
    call SetSoundDuration(gg_snd_HPitLordYesAttack2, 2503)
    call SetSoundChannel(gg_snd_HPitLordYesAttack2, 0)
    call SetSoundVolume(gg_snd_HPitLordYesAttack2, 100)
    set gg_snd_PitLordYesAttack1 = CreateSound("Units\\Demon\\Pitlord\\PitLordYesAttack1.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_PitLordYesAttack1, "PitLordYesAttack")
    call SetSoundDuration(gg_snd_PitLordYesAttack1, 2663)
    call SetSoundChannel(gg_snd_PitLordYesAttack1, 0)
    call SetSoundVolume(gg_snd_PitLordYesAttack1, 100)
    set gg_snd_PitLordWhat1 = CreateSound("Units\\Demon\\Pitlord\\PitLordWhat1.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_PitLordWhat1, "PitLordWhat")
    call SetSoundDuration(gg_snd_PitLordWhat1, 3430)
    call SetSoundChannel(gg_snd_PitLordWhat1, 0)
    call SetSoundVolume(gg_snd_PitLordWhat1, 100)
    set gg_snd_GoblinZeppelinYes4 = CreateSound("Units\\Creeps\\GoblinZeppelin\\GoblinZeppelinYes4.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_GoblinZeppelinYes4, "GoblinZeppelinYes")
    call SetSoundDuration(gg_snd_GoblinZeppelinYes4, 1816)
    call SetSoundChannel(gg_snd_GoblinZeppelinYes4, 0)
    call SetSoundVolume(gg_snd_GoblinZeppelinYes4, 80)
    set gg_snd_GoblinZeppelinYes3 = CreateSound("Units\\Creeps\\GoblinZeppelin\\GoblinZeppelinYes3.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_GoblinZeppelinYes3, "GoblinZeppelinYes")
    call SetSoundDuration(gg_snd_GoblinZeppelinYes3, 2499)
    call SetSoundChannel(gg_snd_GoblinZeppelinYes3, 0)
    call SetSoundVolume(gg_snd_GoblinZeppelinYes3, 80)
    set gg_snd_HeroAlchemistWhat4 = CreateSound("Units\\Creeps\\HEROGoblinALCHEMIST\\HeroAlchemistWhat4.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_HeroAlchemistWhat4, "HEROGoblinALCHEMISTWhat")
    call SetSoundDuration(gg_snd_HeroAlchemistWhat4, 1890)
    call SetSoundChannel(gg_snd_HeroAlchemistWhat4, 0)
    set gg_snd_HeroAlchemistYesAttack1 = CreateSound("Units\\Creeps\\HEROGoblinALCHEMIST\\HeroAlchemistYesAttack1.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_HeroAlchemistYesAttack1, "HEROGoblinALCHEMISTYesAttack")
    call SetSoundDuration(gg_snd_HeroAlchemistYesAttack1, 2370)
    call SetSoundChannel(gg_snd_HeroAlchemistYesAttack1, 0)
    set gg_snd_HeroAlchemistYesAttack2 = CreateSound("Units\\Creeps\\HEROGoblinALCHEMIST\\HeroAlchemistYesAttack2.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_HeroAlchemistYesAttack2, "HEROGoblinALCHEMISTYesAttack")
    call SetSoundDuration(gg_snd_HeroAlchemistYesAttack2, 1110)
    call SetSoundChannel(gg_snd_HeroAlchemistYesAttack2, 0)
    set gg_snd_HeroAlchemistYes2 = CreateSound("Units\\Creeps\\HEROGoblinALCHEMIST\\HeroAlchemistYes2.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_HeroAlchemistYes2, "HEROGoblinALCHEMISTYes")
    call SetSoundDuration(gg_snd_HeroAlchemistYes2, 2088)
    call SetSoundChannel(gg_snd_HeroAlchemistYes2, 0)
    set gg_snd_FrogWhat1 = CreateSound("Units\\Critters\\Frog\\FrogWhat1.wav", false, false, true, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_FrogWhat1, "FrogWhat")
    call SetSoundDuration(gg_snd_FrogWhat1, 1874)
    call SetSoundChannel(gg_snd_FrogWhat1, 8)
    set gg_snd_ScourgeGlueScreen = CreateSound("Sound\\Ambient\\ScourgeGlueScreen.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_ScourgeGlueScreen, "ExpansionUndeadGlueScreenLoop")
    call SetSoundDuration(gg_snd_ScourgeGlueScreen, 10000)
    set gg_snd_AbominationYesAttack3 = CreateSound("Units\\Undead\\Abomination\\AbominationYesAttack3.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_AbominationYesAttack3, "AbominationYesAttack")
    call SetSoundDuration(gg_snd_AbominationYesAttack3, 2979)
    call SetSoundVolume(gg_snd_AbominationYesAttack3, 110)
    set gg_snd_TyrandeWarcry1 = CreateSound("Units\\NightElf\\Tyrande\\TyrandeWarcry1.wav", false, false, false, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_TyrandeWarcry1, "TyrandeWarcry")
    call SetSoundDuration(gg_snd_TyrandeWarcry1, 1494)
    call SetSoundVolume(gg_snd_TyrandeWarcry1, 100)
    set gg_snd_TyrandePissed1 = CreateSound("Units\\NightElf\\Tyrande\\TyrandePissed1.wav", false, false, false, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_TyrandePissed1, "TyrandePissed")
    call SetSoundDuration(gg_snd_TyrandePissed1, 3031)
    call SetSoundVolume(gg_snd_TyrandePissed1, 100)
    set gg_snd_TyrandePissed4 = CreateSound("Units\\NightElf\\Tyrande\\TyrandePissed4.wav", false, false, false, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_TyrandePissed4, "TyrandePissed")
    call SetSoundDuration(gg_snd_TyrandePissed4, 1826)
    call SetSoundVolume(gg_snd_TyrandePissed4, 100)
    set gg_snd_TyrandeYes4 = CreateSound("Units\\NightElf\\Tyrande\\TyrandeYes4.wav", false, false, false, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_TyrandeYes4, "TyrandeYes")
    call SetSoundDuration(gg_snd_TyrandeYes4, 1392)
    call SetSoundVolume(gg_snd_TyrandeYes4, 100)
    set gg_snd_ArcherYesAttack4 = CreateSound("Units\\NightElf\\Archer\\ArcherYesAttack4.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_ArcherYesAttack4, "ArcherYesAttack")
    call SetSoundDuration(gg_snd_ArcherYesAttack4, 1052)
    call SetSoundVolume(gg_snd_ArcherYesAttack4, 100)
    set gg_snd_HeroWardenYesAttack2 = CreateSound("Units\\NightElf\\HeroWarden\\HeroWardenYesAttack2.wav", false, false, false, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_HeroWardenYesAttack2, "HeroWardenYesAttack")
    call SetSoundDuration(gg_snd_HeroWardenYesAttack2, 1764)
    call SetSoundVolume(gg_snd_HeroWardenYesAttack2, 100)
    set gg_snd_HeroWardenYesAttack1 = CreateSound("Units\\NightElf\\HeroWarden\\HeroWardenYesAttack1.wav", false, false, false, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_HeroWardenYesAttack1, "HeroWardenYesAttack")
    call SetSoundDuration(gg_snd_HeroWardenYesAttack1, 1800)
    call SetSoundVolume(gg_snd_HeroWardenYesAttack1, 100)
    set gg_snd_AbominationYesAttack1 = CreateSound("Units\\Undead\\Abomination\\AbominationYesAttack1.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_AbominationYesAttack1, "AbominationYesAttack")
    call SetSoundDuration(gg_snd_AbominationYesAttack1, 1609)
    call SetSoundVolume(gg_snd_AbominationYesAttack1, 110)
    set gg_snd_AbominationYesAttack2 = CreateSound("Units\\Undead\\Abomination\\AbominationYesAttack2.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_AbominationYesAttack2, "AbominationYesAttack")
    call SetSoundDuration(gg_snd_AbominationYesAttack2, 2103)
    call SetSoundVolume(gg_snd_AbominationYesAttack2, 110)
    set gg_snd_Edemor1 = CreateSound("Edemor1.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_Edemor1, 3814)
    call SetSoundChannel(gg_snd_Edemor1, 0)
    call SetSoundVolume(gg_snd_Edemor1, 110)
    call SetSoundPitch(gg_snd_Edemor1, 1.0)
    set gg_snd_Edemor2 = CreateSound("Edemor2.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_Edemor2, 20036)
    call SetSoundChannel(gg_snd_Edemor2, 0)
    call SetSoundVolume(gg_snd_Edemor2, 110)
    call SetSoundPitch(gg_snd_Edemor2, 1.0)
    set gg_snd_Edemor3 = CreateSound("Edemor3.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_Edemor3, 15125)
    call SetSoundChannel(gg_snd_Edemor3, 0)
    call SetSoundVolume(gg_snd_Edemor3, 110)
    call SetSoundPitch(gg_snd_Edemor3, 1.0)
    set gg_snd_Edemor4 = CreateSound("Edemor4.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_Edemor4, 3161)
    call SetSoundChannel(gg_snd_Edemor4, 0)
    call SetSoundVolume(gg_snd_Edemor4, 110)
    call SetSoundPitch(gg_snd_Edemor4, 1.0)
    set gg_snd_Edemor5 = CreateSound("Edemor5.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_Edemor5, 16875)
    call SetSoundChannel(gg_snd_Edemor5, 0)
    call SetSoundVolume(gg_snd_Edemor5, 110)
    call SetSoundPitch(gg_snd_Edemor5, 1.0)
    set gg_snd_Edemor6 = CreateSound("Edemor6.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_Edemor6, 2717)
    call SetSoundChannel(gg_snd_Edemor6, 0)
    call SetSoundVolume(gg_snd_Edemor6, 110)
    call SetSoundPitch(gg_snd_Edemor6, 1.0)
    set gg_snd_HeroPaladinYesAttack201 = CreateSound("Units\\Human\\HeroPaladin\\HeroPaladinYesAttack2.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_HeroPaladinYesAttack201, "HeroPaladinYesAttack")
    call SetSoundDuration(gg_snd_HeroPaladinYesAttack201, 1637)
    call SetSoundVolume(gg_snd_HeroPaladinYesAttack201, 100)
    set gg_snd_HeroPaladinYesAttack3 = CreateSound("Units\\Human\\HeroPaladin\\HeroPaladinYesAttack3.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_HeroPaladinYesAttack3, "HeroPaladinYesAttack")
    call SetSoundDuration(gg_snd_HeroPaladinYesAttack3, 1718)
    call SetSoundVolume(gg_snd_HeroPaladinYesAttack3, 100)
    set gg_snd_HeroPaladinYesAttack1 = CreateSound("Units\\Human\\HeroPaladin\\HeroPaladinYesAttack1.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_HeroPaladinYesAttack1, "HeroPaladinYesAttack")
    call SetSoundDuration(gg_snd_HeroPaladinYesAttack1, 1980)
    call SetSoundVolume(gg_snd_HeroPaladinYesAttack1, 100)
    set gg_snd_ArthasWhat1 = CreateSound("Units\\Human\\Arthas\\ArthasWhat1.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_ArthasWhat1, "ArthasWhat")
    call SetSoundDuration(gg_snd_ArthasWhat1, 1772)
    call SetSoundChannel(gg_snd_ArthasWhat1, 2)
    call SetSoundVolume(gg_snd_ArthasWhat1, 100)
    set gg_snd_PriestYesAttack3 = CreateSound("Units\\Human\\Priest\\PriestYesAttack3.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_PriestYesAttack3, "PriestYesAttack")
    call SetSoundDuration(gg_snd_PriestYesAttack3, 2246)
    call SetSoundVolume(gg_snd_PriestYesAttack3, 100)
    set gg_snd_FootmanYesAttack3 = CreateSound("Units\\Human\\Footman\\FootmanYesAttack3.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_FootmanYesAttack3, "FootmanYesAttack")
    call SetSoundDuration(gg_snd_FootmanYesAttack3, 851)
    call SetSoundVolume(gg_snd_FootmanYesAttack3, 100)
    set gg_snd_NewQuest = CreateSound("QuestComplete.mp3", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_NewQuest, 2160)
    call SetSoundChannel(gg_snd_NewQuest, 2)
    call SetSoundVolume(gg_snd_NewQuest, 100)
    call SetSoundPitch(gg_snd_NewQuest, 1.0)
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
    call SetHeroStr(gg_unit_H000_0004, 10, true)
    call SetHeroAgi(gg_unit_H000_0004, 10, true)
    call SetHeroInt(gg_unit_H000_0004, 10, true)
    call SetUnitState(gg_unit_H000_0004, UNIT_STATE_MANA, 50)
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


function CreateRegionsOld takes nothing returns nothing
    local weathereffect we
    set gg_rct_Ambient_Machines = Rect(13056.0, - 224.0, 15008.0, 2048.0)
    call SetSoundPosition(gg_snd_AmbientMachines, 14032.0, 912.0, 118.0)
    call RegisterStackedSound(gg_snd_AmbientMachines, true, 1952.0, 2272.0)
    set gg_rct_Ambient_Portal_Room = Rect(10816.0, 736.0, 11904.0, 2592.0)
    call SetSoundPosition(gg_snd_AmbiencePortal, 11360.0, 1664.0, 118.0)
    call RegisterStackedSound(gg_snd_AmbiencePortal, true, 1088.0, 1856.0)
    set gg_rct_Ambient_Vault = Rect(13856.0, - 3392.0, 15072.0, - 2272.0)
    call SetSoundPosition(gg_snd_Ambientvault, 14464.0, - 2832.0, 118.0)
    call RegisterStackedSound(gg_snd_Ambientvault, true, 1216.0, 1120.0)
    set gg_rct_Arena_Enter = Rect(- 1440.0, - 2496.0, - 1248.0, - 2304.0)
    set gg_rct_Arena_Pick = Rect(- 2304.0, - 2624.0, - 384.0, - 960.0)
    set gg_rct_Arena_Spawn = Rect(- 1856.0, - 2240.0, - 832.0, - 1312.0)
    call SetSoundPosition(gg_snd_AmbientTrees, - 1344.0, - 1776.0, 118.0)
    call RegisterStackedSound(gg_snd_AmbientTrees, true, 1024.0, 928.0)
    set gg_rct_Artefactorium_Enter = Rect(10304.0, - 864.0, 10560.0, - 736.0)
    set gg_rct_Artefactorium_Enter_2 = Rect(14784.0, - 2944.0, 14912.0, - 2688.0)
    set gg_rct_Artefactorium_Pick = Rect(9536.0, - 2080.0, 11328.0, - 384.0)
    set gg_rct_Artefactorium_Spawn = Rect(10016.0, - 1632.0, 10848.0, - 832.0)
    call SetSoundPosition(gg_snd_Ambientvault, 10432.0, - 1232.0, 118.0)
    call RegisterStackedSound(gg_snd_Ambientvault, true, 832.0, 800.0)
    set gg_rct_Artefatorium_Leave = Rect(10304.0, - 608.0, 10560.0, - 448.0)
    set gg_rct_Artefatorium_Leave_2 = Rect(15136.0, - 2912.0, 15328.0, - 2720.0)
    set gg_rct_Dungeon = Rect(- 1760.0, - 19872.0, 13984.0, - 4160.0)
    set we = AddWeatherEffect(gg_rct_Dungeon, 0x4644676C)
    call EnableWeatherEffect(we, true)
    set gg_rct_Dungeon_Center = Rect(6240.0, - 11936.0, 6816.0, - 11360.0)
    set gg_rct_Dungeon_Exit = Rect(4128.0, 1376.0, 4320.0, 1568.0)
    set gg_rct_Edemium_Leave = Rect(11328.0, 2240.0, 11456.0, 2368.0)
    set gg_rct_Enchanting_Room_Enter = Rect(- 288.0, 1408.0, - 96.0, 1600.0)
    call SetSoundPosition(gg_snd_AmbientNight, - 192.0, 1504.0, 118.1)
    call RegisterStackedSound(gg_snd_AmbientNight, true, 192.0, 192.0)
    set gg_rct_Item_Drop = Rect(14304.0, - 2944.0, 14624.0, - 2656.0)
    set gg_rct_Onkie_Room_Enter = Rect(- 1952.0, 672.0, - 1760.0, 864.0)
    call SetSoundPosition(gg_snd_Ambientvault, - 1856.0, 768.0, 118.0)
    call RegisterStackedSound(gg_snd_Ambientvault, true, 192.0, 192.0)
    set gg_rct_Room_Portal_Enter = Rect(10944.0, 1088.0, 11104.0, 1280.0)
    set gg_rct_Room_Portal_Enter_2 = Rect(13792.0, 256.0, 14048.0, 384.0)
    set gg_rct_Room_Portal_Leave = Rect(10752.0, 1088.0, 10912.0, 1312.0)
    set gg_rct_Room_Portal_Leave_2 = Rect(13792.0, 96.0, 14048.0, 224.0)
    set gg_rct_Room_Workshop_Enter = Rect(14304.0, - 32.0, 14464.0, 160.0)
    set gg_rct_Room_Workshop_Leave = Rect(14816.0, - 64.0, 15072.0, 160.0)
    set gg_rct_Stop_Unit = Rect(4064.0, 2016.0, 4256.0, 2208.0)
    set gg_rct_Tier_1 = Rect(2464.0, - 128.0, 3168.0, 576.0)
    set gg_rct_Tier_1_Camera = Rect(2496.0, - 128.0, 3136.0, 576.0)
    set gg_rct_Tier_2 = Rect(2464.0, 576.0, 3168.0, 1344.0)
    set gg_rct_Tier_2_Camera = Rect(2496.0, - 128.0, 3136.0, 1344.0)
    set gg_rct_Tier_3 = Rect(2464.0, 1344.0, 3168.0, 2528.0)
    set gg_rct_Tier_3_Camera = Rect(2496.0, - 128.0, 3136.0, 2496.0)
    call SetSoundPosition(gg_snd_Ambient, 2816.0, 1184.0, 118.0)
    call RegisterStackedSound(gg_snd_Ambient, true, 640.0, 2624.0)
    set gg_rct_Training = Rect(10848.0, 1408.0, 11072.0, 1696.0)
    set gg_rct_Trees_Leave = Rect(11296.0, 1312.0, 11488.0, 1504.0)
    set gg_rct_Vault_Enter = Rect(14336.0, - 3136.0, 14592.0, - 2976.0)
    set gg_rct_Vault_Leave = Rect(14368.0, - 3360.0, 14592.0, - 3200.0)
    set gg_rct_Vault_Machinery = Rect(13344.0, 992.0, 13920.0, 2464.0)
    set gg_rct_Vault_Machinery_Enter = Rect(13536.0, 1984.0, 13728.0, 2144.0)
    set gg_rct_Vault_Machinery_Leave = Rect(13472.0, 2240.0, 13824.0, 2464.0)
    set gg_rct_WhosYourDaddy = Rect(12096.0, - 2624.0, 12352.0, - 2368.0)
    set gg_rct_Workshop_Machinery = Rect(13344.0, 832.0, 13920.0, 960.0)
    set gg_rct_Workshop_Core = Rect(14112.0, 544.0, 14688.0, 1120.0)
    set gg_rct_Core_Create = Rect(13984.0, 1088.0, 14496.0, 1600.0)
    set gg_rct_Cell3_Delete_1 = Rect(12928.0, - 19808.0, 13920.0, - 18816.0)
    set gg_rct_Cell3_Delete_2 = Rect(- 1632.0, - 19808.0, - 672.0, - 18848.0)
    set gg_rct_Secrets = Rect(14592.0, 224.0, 14816.0, 992.0)
    set gg_rct_Dungeon_Camera = Rect(- 1408.0, - 19584.0, 13664.0, - 4512.0)
    call SetSoundPosition(gg_snd_Ambient, 6128.0, - 12048.0, 118.0)
    call RegisterStackedSound(gg_snd_Ambient, true, 15072.0, 15072.0)
    set gg_rct_Portal = Rect(10976.0, 2016.0, 11840.0, 2624.0)
    set gg_rct_Pick_Zone = Rect(- 1184.0, - 3424.0, 1632.0, - 2816.0)
    set gg_rct_Boss_Zone_1 = Rect(2080.0, - 2720.0, 3424.0, - 1376.0)
    call SetSoundPosition(gg_snd_Ambient, 2752.0, - 2048.0, 118.0)
    call RegisterStackedSound(gg_snd_Ambient, true, 1344.0, 1344.0)
    set gg_rct_Boss_Room_Enter = Rect(2656.0, - 2464.0, 2848.0, - 2304.0)
    set gg_rct_Boss_Spawn = Rect(2656.0, - 1824.0, 2848.0, - 1664.0)
    set gg_rct_Boss_Creep_Spawn_1 = Rect(2112.0, - 1536.0, 2304.0, - 1376.0)
    set gg_rct_Boss_Creep_Spawn_2 = Rect(3264.0, - 1760.0, 3424.0, - 1568.0)
    set gg_rct_Boss_Creep_Spawn_3 = Rect(2048.0, - 2528.0, 2208.0, - 2336.0)
    set gg_rct_Abilities = Rect(6656.0, 704.0, 7936.0, 1664.0)
    call SetSoundPosition(gg_snd_AmbientTrees, 7296.0, 1184.0, 118.0)
    call RegisterStackedSound(gg_snd_AmbientTrees, true, 1280.0, 960.0)
    set gg_rct_Edemium = Rect(11296.0, 2432.0, 11488.0, 2624.0)
    set gg_rct_Boss_2_Room_Enter = Rect(6080.0, - 2656.0, 6240.0, - 2496.0)
    set gg_rct_Boss_2_Spawn = Rect(5984.0, - 1888.0, 6112.0, - 1760.0)
    set gg_rct_Boss_3_Spawn = Rect(- 1600.0, - 26688.0, - 1216.0, - 26432.0)
    set gg_rct_Boss_3_Zone = Rect(- 2656.0, - 27744.0, - 160.0, - 26144.0)
    set gg_rct_Boss_3_Area_Left = Rect(- 2432.0, - 27552.0, - 1728.0, - 26464.0)
    set gg_rct_Boss_3_Area_Center = Rect(- 1728.0, - 27552.0, - 1088.0, - 26816.0)
    call SetSoundPosition(gg_snd_ScourgeGlueScreen, - 1408.0, - 27184.0, 118.0)
    call RegisterStackedSound(gg_snd_ScourgeGlueScreen, true, 640.0, 736.0)
    set gg_rct_Boss_3_Area_Right = Rect(- 1088.0, - 27552.0, - 352.0, - 26464.0)
    set gg_rct_Boss_3_Room_Enter = Rect(- 1504.0, - 27488.0, - 1312.0, - 27328.0)
    set gg_rct_Boss_Zone = Rect(1888.0, - 2944.0, 3648.0, - 1184.0)
    set gg_rct_Camera_Bound_Portal = Rect(11296.0, 2368.0, 11328.0, 2400.0)
    set gg_rct_Camera_Bounds_Workshop = Rect(14048.0, 320.0, 14080.0, 352.0)
    set gg_rct_Camera_Bound_Meditate = Rect(11104.0, 1312.0, 11136.0, 1344.0)
    set gg_rct_Camera_Bounds_Workshop_2 = Rect(13696.0, 800.0, 13728.0, 832.0)
    set gg_rct_Camera_Bounds_Workshop_1 = Rect(13984.0, 544.0, 14016.0, 576.0)
    set gg_rct_Camera_Bounds_Artefactorium = Rect(10432.0, - 1120.0, 10464.0, - 1088.0)
    set gg_rct_Camera_Bounds_Cavern = Rect(64.0, 1856.0, 96.0, 1888.0)
    set gg_rct_Camera_Bounds_Onkie = Rect(- 2112.0, 864.0, - 2080.0, 896.0)
    set gg_rct_Camera_Bound_Gate = Rect(11424.0, 2528.0, 11456.0, 2560.0)
    set gg_rct_Camera_Bound_Portal_2 = Rect(11104.0, 1536.0, 11136.0, 1568.0)
    set gg_rct_Boss_2_Zone = Rect(5280.0, - 3072.0, 7072.0, - 1280.0)
    set gg_rct_Boss_2_Spawn_3 = Rect(5504.0, - 2368.0, 5632.0, - 2240.0)
    set gg_rct_Boss_2_Spawn_2 = Rect(6688.0, - 2176.0, 6816.0, - 2048.0)
    set gg_rct_Camera_Bound_Loading = Rect(11808.0, 928.0, 11840.0, 960.0)
    set gg_rct_Coliseum_Enter = Rect(- 1408.0, - 22912.0, - 1248.0, - 22752.0)
    set gg_rct_Coliseum = Rect(- 2464.0, - 23648.0, - 256.0, - 22272.0)
    call SetSoundPosition(gg_snd_ScourgeGlueScreen, - 1360.0, - 22960.0, 118.0)
    call RegisterStackedSound(gg_snd_ScourgeGlueScreen, true, 2208.0, 1376.0)
    set gg_rct_Coliseum_Spawn = Rect(- 2304.0, - 23424.0, - 416.0, - 22592.0)
    set we = null
endfunction


function CreateCamerasOld takes nothing returns nothing
    set gg_cam_Abilities_Tree = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Abilities_Tree, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Abilities_Tree, CAMERA_FIELD_ROTATION, 90.0, 0.0)
    call CameraSetupSetField(gg_cam_Abilities_Tree, CAMERA_FIELD_ANGLE_OF_ATTACK, 270.0, 0.0)
    call CameraSetupSetField(gg_cam_Abilities_Tree, CAMERA_FIELD_TARGET_DISTANCE, 1400.0, 0.0)
    call CameraSetupSetField(gg_cam_Abilities_Tree, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Abilities_Tree, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Abilities_Tree, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Abilities_Tree, 7296.6, 1211.0, 0.0)
    set gg_cam_Camera_Workshop = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Camera_Workshop, CAMERA_FIELD_ZOFFSET, 225.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop, CAMERA_FIELD_ROTATION, 46.4, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop, CAMERA_FIELD_ANGLE_OF_ATTACK, 343.8, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop, CAMERA_FIELD_TARGET_DISTANCE, 1186.7, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Camera_Workshop, 14037.2, 331.3, 0.0)
    set gg_cam_Camera_Portal_Room = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Camera_Portal_Room, CAMERA_FIELD_ZOFFSET, 75.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Portal_Room, CAMERA_FIELD_ROTATION, 96.4, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Portal_Room, CAMERA_FIELD_ANGLE_OF_ATTACK, 356.1, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Portal_Room, CAMERA_FIELD_TARGET_DISTANCE, 2293.8, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Portal_Room, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Portal_Room, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Portal_Room, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Camera_Portal_Room, 11296.4, 2373.5, 0.0)
    set gg_cam_Camera_Abilities = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Camera_Abilities, CAMERA_FIELD_ZOFFSET, 155.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Abilities, CAMERA_FIELD_ROTATION, 116.4, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Abilities, CAMERA_FIELD_ANGLE_OF_ATTACK, 345.8, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Abilities, CAMERA_FIELD_TARGET_DISTANCE, 525.7, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Abilities, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Abilities, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Abilities, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Camera_Abilities, 11117.3, 1340.5, 0.0)
    set gg_cam_Camera_Talents = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Camera_Talents, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Talents, CAMERA_FIELD_ROTATION, 70.6, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Talents, CAMERA_FIELD_ANGLE_OF_ATTACK, 346.1, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Talents, CAMERA_FIELD_TARGET_DISTANCE, 1127.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Talents, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Talents, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Talents, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Camera_Talents, 11885.5, 1417.9, 0.0)
    set gg_cam_Camera_Workshop_2 = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Camera_Workshop_2, CAMERA_FIELD_ZOFFSET, 205.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop_2, CAMERA_FIELD_ROTATION, 65.6, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop_2, CAMERA_FIELD_ANGLE_OF_ATTACK, 345.9, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop_2, CAMERA_FIELD_TARGET_DISTANCE, 798.1, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop_2, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop_2, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop_2, CAMERA_FIELD_FARZ, 9090.9, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Camera_Workshop_2, 13704.7, 827.7, 0.0)
    set gg_cam_Camera_Artefactorium = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Camera_Artefactorium, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Artefactorium, CAMERA_FIELD_ROTATION, 89.9, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Artefactorium, CAMERA_FIELD_ANGLE_OF_ATTACK, 303.7, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Artefactorium, CAMERA_FIELD_TARGET_DISTANCE, 1643.3, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Artefactorium, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Artefactorium, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Artefactorium, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Camera_Artefactorium, 10433.8, - 1109.7, 0.0)
    set gg_cam_Camera_Vault = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Camera_Vault, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Vault, CAMERA_FIELD_ROTATION, 340.2, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Vault, CAMERA_FIELD_ANGLE_OF_ATTACK, 339.9, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Vault, CAMERA_FIELD_TARGET_DISTANCE, 1617.3, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Vault, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Vault, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Vault, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Camera_Vault, 14874.0, - 3042.7, 0.0)
    set gg_cam_Camera02 = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Camera02, CAMERA_FIELD_ZOFFSET, 205.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera02, CAMERA_FIELD_ROTATION, 89.6, 0.0)
    call CameraSetupSetField(gg_cam_Camera02, CAMERA_FIELD_ANGLE_OF_ATTACK, 359.5, 0.0)
    call CameraSetupSetField(gg_cam_Camera02, CAMERA_FIELD_TARGET_DISTANCE, 613.5, 0.0)
    call CameraSetupSetField(gg_cam_Camera02, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera02, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera02, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Camera02, 11396.4, 2261.3, 0.0)
    set gg_cam_Camera01 = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Camera01, CAMERA_FIELD_ZOFFSET, 255.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera01, CAMERA_FIELD_ROTATION, 90.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera01, CAMERA_FIELD_ANGLE_OF_ATTACK, 8.3, 0.0)
    call CameraSetupSetField(gg_cam_Camera01, CAMERA_FIELD_TARGET_DISTANCE, 1471.7, 0.0)
    call CameraSetupSetField(gg_cam_Camera01, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera01, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera01, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Camera01, 11388.8, 2181.3, 0.0)
    set gg_cam_Camera03 = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Camera03, CAMERA_FIELD_ZOFFSET, 100.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera03, CAMERA_FIELD_ROTATION, 70.8, 0.0)
    call CameraSetupSetField(gg_cam_Camera03, CAMERA_FIELD_ANGLE_OF_ATTACK, 9.1, 0.0)
    call CameraSetupSetField(gg_cam_Camera03, CAMERA_FIELD_TARGET_DISTANCE, 469.4, 0.0)
    call CameraSetupSetField(gg_cam_Camera03, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera03, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera03, CAMERA_FIELD_FARZ, 5000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Camera03, 11117.3, 1544.0, 0.0)
    set gg_cam_Camera04 = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Camera04, CAMERA_FIELD_ZOFFSET, 180.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera04, CAMERA_FIELD_ROTATION, 89.7, 0.0)
    call CameraSetupSetField(gg_cam_Camera04, CAMERA_FIELD_ANGLE_OF_ATTACK, 352.5, 0.0)
    call CameraSetupSetField(gg_cam_Camera04, CAMERA_FIELD_TARGET_DISTANCE, 428.2, 0.0)
    call CameraSetupSetField(gg_cam_Camera04, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera04, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera04, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Camera04, 11392.3, 2535.9, 0.0)
    set gg_cam_Camera05 = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Camera05, CAMERA_FIELD_ZOFFSET, 180.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera05, CAMERA_FIELD_ROTATION, 269.8, 0.0)
    call CameraSetupSetField(gg_cam_Camera05, CAMERA_FIELD_ANGLE_OF_ATTACK, 277.2, 0.0)
    call CameraSetupSetField(gg_cam_Camera05, CAMERA_FIELD_TARGET_DISTANCE, 391.8, 0.0)
    call CameraSetupSetField(gg_cam_Camera05, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera05, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera05, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Camera05, 11384.8, 2535.8, 0.0)
    set gg_cam_Dungeon_Camera = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Dungeon_Camera, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Dungeon_Camera, CAMERA_FIELD_ROTATION, 90.0, 0.0)
    call CameraSetupSetField(gg_cam_Dungeon_Camera, CAMERA_FIELD_ANGLE_OF_ATTACK, 275.0, 0.0)
    call CameraSetupSetField(gg_cam_Dungeon_Camera, CAMERA_FIELD_TARGET_DISTANCE, 1150.0, 0.0)
    call CameraSetupSetField(gg_cam_Dungeon_Camera, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Dungeon_Camera, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Dungeon_Camera, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Dungeon_Camera, 2817.2, - 66.6, 0.0)
    set gg_cam_Enchanting_Cavern = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Enchanting_Cavern, CAMERA_FIELD_ZOFFSET, 150.0, 0.0)
    call CameraSetupSetField(gg_cam_Enchanting_Cavern, CAMERA_FIELD_ROTATION, 128.0, 0.0)
    call CameraSetupSetField(gg_cam_Enchanting_Cavern, CAMERA_FIELD_ANGLE_OF_ATTACK, 341.1, 0.0)
    call CameraSetupSetField(gg_cam_Enchanting_Cavern, CAMERA_FIELD_TARGET_DISTANCE, 1037.4, 0.0)
    call CameraSetupSetField(gg_cam_Enchanting_Cavern, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Enchanting_Cavern, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Enchanting_Cavern, CAMERA_FIELD_FARZ, 5000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Enchanting_Cavern, 65.6, 1889.2, 0.0)
    set gg_cam_Onkie_Room = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Onkie_Room, CAMERA_FIELD_ZOFFSET, 120.0, 0.0)
    call CameraSetupSetField(gg_cam_Onkie_Room, CAMERA_FIELD_ROTATION, 211.7, 0.0)
    call CameraSetupSetField(gg_cam_Onkie_Room, CAMERA_FIELD_ANGLE_OF_ATTACK, 335.5, 0.0)
    call CameraSetupSetField(gg_cam_Onkie_Room, CAMERA_FIELD_TARGET_DISTANCE, 790.4, 0.0)
    call CameraSetupSetField(gg_cam_Onkie_Room, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Onkie_Room, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Onkie_Room, CAMERA_FIELD_FARZ, 5000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Onkie_Room, - 2095.4, 887.7, 0.0)
    set gg_cam_Camera_Workshop_1 = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Camera_Workshop_1, CAMERA_FIELD_ZOFFSET, 185.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop_1, CAMERA_FIELD_ROTATION, 44.4, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop_1, CAMERA_FIELD_ANGLE_OF_ATTACK, 348.2, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop_1, CAMERA_FIELD_TARGET_DISTANCE, 756.1, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop_1, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop_1, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Workshop_1, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Camera_Workshop_1, 13995.7, 485.9, 0.0)
    set gg_cam_Center = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Center, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Center, CAMERA_FIELD_ROTATION, 90.0, 0.0)
    call CameraSetupSetField(gg_cam_Center, CAMERA_FIELD_ANGLE_OF_ATTACK, 304.0, 0.0)
    call CameraSetupSetField(gg_cam_Center, CAMERA_FIELD_TARGET_DISTANCE, 2650.0, 0.0)
    call CameraSetupSetField(gg_cam_Center, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Center, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Center, CAMERA_FIELD_FARZ, 5000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Center, 6544.4, - 11649.4, 0.0)
    set gg_cam_Default = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Default, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Default, CAMERA_FIELD_ROTATION, 90.0, 0.0)
    call CameraSetupSetField(gg_cam_Default, CAMERA_FIELD_ANGLE_OF_ATTACK, 304.0, 0.0)
    call CameraSetupSetField(gg_cam_Default, CAMERA_FIELD_TARGET_DISTANCE, 1650.0, 0.0)
    call CameraSetupSetField(gg_cam_Default, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Default, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Default, CAMERA_FIELD_FARZ, 5000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Default, 11381.9, 1537.4, 0.0)
    set gg_cam_Boss_Room = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Boss_Room, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Boss_Room, CAMERA_FIELD_ROTATION, 90.0, 0.0)
    call CameraSetupSetField(gg_cam_Boss_Room, CAMERA_FIELD_ANGLE_OF_ATTACK, 300.0, 0.0)
    call CameraSetupSetField(gg_cam_Boss_Room, CAMERA_FIELD_TARGET_DISTANCE, 1700.0, 0.0)
    call CameraSetupSetField(gg_cam_Boss_Room, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Boss_Room, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Boss_Room, CAMERA_FIELD_FARZ, 5000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Boss_Room, 2752.4, - 2051.6, 0.0)
    set gg_cam_Camera_Portal = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Camera_Portal, CAMERA_FIELD_ZOFFSET, 150.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Portal, CAMERA_FIELD_ROTATION, 89.4, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Portal, CAMERA_FIELD_ANGLE_OF_ATTACK, 357.1, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Portal, CAMERA_FIELD_TARGET_DISTANCE, 1756.2, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Portal, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Portal, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Camera_Portal, CAMERA_FIELD_FARZ, 10000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Camera_Portal, 11419.2, 2539.6, 0.0)
    set gg_cam_Screencam = CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Screencam, CAMERA_FIELD_ZOFFSET, 150.0, 0.0)
    call CameraSetupSetField(gg_cam_Screencam, CAMERA_FIELD_ROTATION, 90.0, 0.0)
    call CameraSetupSetField(gg_cam_Screencam, CAMERA_FIELD_ANGLE_OF_ATTACK, 1.4, 0.0)
    call CameraSetupSetField(gg_cam_Screencam, CAMERA_FIELD_TARGET_DISTANCE, 699.8, 0.0)
    call CameraSetupSetField(gg_cam_Screencam, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Screencam, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Screencam, CAMERA_FIELD_FARZ, 1762.4, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Screencam, 11733.6, - 26459.9, 0.0)
endfunction

