globals
    integer udg_CameraDistance = 0
    dialog udg_TeleportDialog = null
    button array udg_DialogButton
    integer udg_UDex = 0
    integer array udg_UnitIndexLock
    integer array udg_UDexPrev
    integer array udg_UDexNext
    real udg_UnitIndexEvent = 0
    unit array udg_UDexUnits
    integer udg_UDexRecycle = 0
    boolean udg_UnitIndexerEnabled = false
    integer udg_UDexWasted = 0
    integer udg_UDexGen = 0
    integer udg_DamageBlockingAbility = 0
    integer udg_DamageTypeSpell = 0
    integer udg_DamageTypeDOT = 0
    integer udg_DamageTypeRanged = 0
    unit udg_TempUnit = null
    integer udg_DmgEvN = 0
    unit array udg_DmgEvStack
    real udg_DamageEventAmount = 0
    unit udg_DamageEventSource = null
    unit udg_DamageEventTarget = null
    real udg_DamageEventPrevAmt = 0
    boolean udg_DamageEventExplodesUnit = false
    boolean udg_DamageEventOverride = false
    real udg_DamageModifierEvent = 0
    real udg_DamageEvent = 0
    real udg_DmgEvLife = 0
    trigger udg_DamageEventTrigger = null
    integer udg_DmgTypPrev = 0
    integer udg_DamageEventType = 0
    boolean array udg_UnitDamageRegistered
    integer udg_DamageEventsWasted = 0
    timer udg_DmgEvTimer = null
    real udg_ChanceCrit = 0
    real udg_ChanceBlock = 0
    integer udg_CameraMax = 0
    integer udg_CameraMin = 0
    integer udg_ItemInt = 0
    integer udg_Slot_Integer = 0
    real udg_AbilityPower = 0
    integer udg_RandomNumber = 0
    location udg_Point = null
    unit udg_Target = null
    group udg_UnitGroup = null
    integer udg_AbilityEnergyRegen = 0
    integer udg_D_CreepsTotal = 0
    dialog udg_LeaveDialog = null
    button udg_LeaveButton = null
    boolean udg_Dead = false
    group udg_FadeSystemGroup = null
    boolean udg_TempBool = false
    integer udg_FadeUnitKey = 0
    hashtable udg_FadeSystemHash = null
    integer udg_CameraAngle = 0
    camerasetup udg_Camera = null
    destructable array udg_MagneticField
    integer array udg_ER_Creeps
    boolean array udg_AbilityLogic
    unit array udg_ChestKeyOwner
    effect array udg_ChestKeyEffect
    integer udg_ChestDust = 0
    integer array udg_BackpackScrolls
    real udg_RewardDustReal = 0
    real array udg_Offset
    integer array udg_BackpackPotions
    location udg_Point2 = null
    integer udg_Difficulty = 0
    dialog udg_DifficultyDialog = null
    integer array udg_DifficultyDamage
    real udg_Transparent = 0
    group udg_UnitGroupPlayer = null
    timer udg_PauseTimer = null
    unit udg_Arct = null
    integer array udg_AugmentCost
    multiboard udg_AttributesBoard = null
    real udg_ChanceCritBase = 0
    real udg_ChanceBlockBase = 0
    timer udg_TimerPilgrim = null
    lightning udg_Lead = null
    timer udg_TimerLead = null
    texttag array udg_GiftText
    location udg_D_Point1 = null
    group udg_D_Pick = null
    unit udg_D_Cell = null
    integer udg_D_Rooms = 0
    integer udg_D_Portals = 0
    boolean array udg_D_PortalLogic
    group udg_D_Pick2 = null
    unit udg_D_CellPrevious = null
    unit array udg_D_CellNumber
    location udg_D_Point2 = null
    location udg_D_PointOffset = null
    timer udg_D_Timer = null
    integer udg_D_WallType = 0
    integer array udg_D_CreepType
    integer udg_D_Walls = 0
    timer udg_D_TimerPortals = null
    unit udg_D_Exit = null
    real udg_CameraTurn = 0
    effect udg_Starfall = null
    region udg_Region1 = null
    region udg_Region2 = null
    region udg_Region3 = null
    region udg_Region4 = null
    region udg_Region5 = null
    location udg_CO_Point = null
    location udg_CO_Point2 = null
    unit array udg_CO_AttackingUnit
    unit array udg_CO_OpportunityUnit
    group udg_CO_UnitGroup = null
    integer udg_CO_Ability = 0
    group udg_CO_UnitGroup2 = null
    integer udg_CO_Combo = 0
    integer array udg_CO_ComboSeries
    timer udg_CO_CombatTimer = null
    integer udg_CO_CustomValue = 0
    timer udg_CO_CombatTimer2 = null
    integer udg_D_Torches = 0
    integer udg_CO_Power = 0
    integer udg_D_ChestType = 0
    unit array udg_AntiCheatUnit
    integer udg_MeditationPower = 0
    effect udg_MeditationEffect = null
    real udg_CO_Time = 0
    integer array udg_DifficultySpeed
    integer udg_D_Chests = 0
    location udg_D_PointChest = null
    integer udg_D_ChestsMax = 0
    texttag array udg_AS_TextNumber
    boolean array udg_AS_Logic
    integer array udg_AS_Value
    integer array udg_AS_Effect
    integer udg_AS_SeriesNumber = 0
    unit udg_AS_EnemyTarget = null
    boolean udg_CO_Damage = false
    integer array udg_AS_AbilityLVL
    integer array udg_AS_AbilityEXP
    integer array udg_AS_AbilityLVL_Base
    integer array udg_AS_AbilityEXP_Base
    timer udg_CO_Timer = null
    boolean udg_SprintLogic = false
    integer udg_AS_EffectNumber = 0
    integer udg_AS_AbilityCountLVL = 0
    integer udg_AS_AbilityCountLVL_Base = 0
    integer udg_AS_Points_Base = 0
    timer udg_AS_TimerEffect1 = null
    dialog udg_ChestDialog = null
    button udg_ChestButtonEnergy = null
    unit udg_Chest = null
    integer udg_ChestEnergy = 0
    string array udg_AS_Name
    unit udg_D_Guardian = null
    integer array udg_IG_ItemType
    integer array udg_IG_ItemAT_ATK_L
    integer array udg_IG_ItemAT_ATK_R
    integer array udg_IG_ItemAT_DEF
    integer udg_IG_RandomNumber = 0
    location udg_IG_Point = null
    string array udg_IG_ItemAtt
    string udg_IG_ItemCode
    integer array udg_IG_ItemValue
    integer array udg_IG_ItemAT_HP_A
    integer array udg_IG_ItemAT_HP_T
    integer array udg_IG_ItemAT_MP
    integer array udg_IG_ItemAT_REG
    integer array udg_IG_ItemAT_SPD
    integer udg_IG_ItemQuality = 0
    timer udg_SprintTimer = null
    integer array udg_IG_ItemModelW_R
    integer array udg_IG_ItemModelW_L
    integer array udg_IG_ItemModelA
    region udg_Region6 = null
    region udg_Region7 = null
    effect udg_AR_SealEffect = null
    unit udg_D_CellLast = null
    unit udg_EM_Target = null
    destructable udg_EM_Effect = null
    boolean udg_EM_Bool = false
    integer udg_EM_Cost = 0
    integer udg_EM_Generate = 0
    unit udg_EM_BossLevel = null
    integer array udg_ART
    integer array udg_AugmentLevel
    integer udg_AugmentPrice = 0
    integer udg_AugmentValue = 0
    unit udg_IG_Monster = null
    integer udg_EM_EncounterChance = 0
    button udg_LeaveButton2 = null
    boolean udg_EnchantingRoom = false
    timer udg_AS_TimerEffect4 = null
    group udg_AS_Effect8Group = null
    timer udg_AS_TimerEffect8 = null
    integer udg_AS_Effect9Count = 0
    integer udg_AS_Effect9Count2 = 0
    boolean udg_AS_Effect10 = false
    unit udg_AS_Effect10Unit = null
    boolean udg_AS_Effect2 = false
    timer udg_AS_TimerEffect2 = null
    boolean udg_AS_Effect11 = false
    effect udg_AS_Effect11SE = null
    timer udg_AS_TimerEffect11 = null
    boolean udg_OnkieRoom = false
    boolean udg_ER_Logic = false
    integer udg_ER_Reward = 0
    integer udg_ER_Count = 0
    real udg_ER_RewardReal = 0
    boolean array udg_Tutorial
    unit udg_TutorialCreep = null
    boolean udg_Training = false
    item udg_IG_InfoItem = null
    boolean udg_IG_InfoBool = false
    dialog udg_EndingDialog = null
    integer udg_DamageEventAmountINT = 0
    boolean array udg_EM_BossDead
    unit udg_EM_BossUnit = null
    location udg_CinematicPosition = null
    location udg_Boss_Ability_Point = null
    effect array udg_CO_SweapEffect
    boolean udg_CO_LeftWeapon = false
    timer udg_TrapTimer = null
    integer udg_CO_Effect6Power = 0
    effect array udg_CO_Effect6Sweep
    real udg_AbilityPowerEnergy = 0
    effect array udg_CreepCastEffect
    integer udg_IG_ItemEffect_Helmet = 0
    integer udg_IG_ItemEffect_Pauldrons = 0
    boolean array udg_EM_Boss
    leaderboard udg_HandleBoard = null
    boolean array udg_TutorialHint
    boolean udg_TutorialHintsOn = false
    boolean array udg_Difficulty_Unlocked
    unit array udg_Secrets_Rune
    string array udg_IG_ItemEnchantName
    effect array udg_IG_ItemEnchantEffect
    integer array udg_IG_ItemEnchantInt
    timer udg_LoadTimer = null
    button udg_ChestButtonKey = null
    group udg_PoisonGroup = null
    timer udg_PoisonTimer = null
    boolean udg_EnchantCritBool = false
    timer udg_EnchantCritTimer = null
    region udg_Region8 = null
    region udg_Region9 = null
    region udg_Region10 = null
    region udg_Region11 = null
    integer array udg_CC_Ingredient
    integer array udg_CC_IngredientItem
    integer udg_CC_ItemLevel = 0
    integer array udg_CC_IngredientAdded
    string array udg_CC_IngredientName
    timer udg_CC_Timer = null
    effect udg_CC_Effect = null
    leaderboard udg_CO_ComboBoard = null
    boolean udg_Artefactorium = false
    timer udg_D_Timer2 = null
    group udg_D_Pick3 = null
    timer udg_D_Timer3 = null
    location udg_D_PointOffsetDoors = null
    timer udg_D_TimerFinal = null
    integer udg_CC_IngredientDrop = 0
    timer udg_AS_TimerEffect9 = null
    group udg_AS_Effect9Group = null
    button array udg_EventButton
    location udg_TargetPoint = null
    group udg_EM_EventGroup = null
    integer udg_EventAttribute = 0
    integer udg_EventLux = 0
    boolean array udg_CC_SecretUnlocked
    integer array udg_SecretsList
    integer udg_CC_SecretNumber = 0
    boolean udg_MeditationLogic = false
    integer udg_LightIterations = 0
    unit udg_ItemPickup__Unit = null
    real udg_ItemPickup__Radius = 0
    boolean udg_ItemPickup__AddUnit = false
    integer array udg_JD_Integers
    location array udg_JD_TempPoint
    unit udg_JDA_Unit = null
    real array udg_JD_Distances
    location udg_JDA_TargetPoint = null
    real array udg_JD_ReachedDistance
    real array udg_JD_SpeedUnits
    real udg_JDA_Speed = 0
    unit array udg_JD_Unit
    real array udg_JD_Angle
    string array udg_JD_Animations
    string udg_JDA_Animation
    boolean udg_JDA_DestroyTrees_Dash = false
    real array udg_JD_HighSettings
    real udg_JDA_JumpHigh_Distance = 0
    real udg_JDA_AnimationSpeed = 0
    group udg_JD_Group = null
    real array udg_JD_RealTimer
    string array udg_JD_Effect
    real array udg_JD_JumpHigh
    boolean udg_JDA_Collusion = false
    integer udg_ItemPickup_Index = 0
    integer udg_ItemPickup_Max = 0
    rect array udg_ItemPickup_Rect
    unit array udg_ItemPickup_Unit
    timer udg_ItemPickup_Timer = null
    dialog udg_EventDialog = null
    dialog udg_EdemEventDialog = null
    button array udg_EdemEventButton
    integer udg_EdemEventType = 0
    integer udg_CreepSpellType = 0
    integer array udg_CreepSkillGiant
    location array udg_Creep_Cast_Point
    location array udg_Creep_Strike_Point
    integer udg_BL_Skip = 0
    integer udg_BL_Times = 0
    boolean array udg_BL_Off
    unit array udg_BL_Hero
    location array udg_BL_Point
    real array udg_BL_Angle
    real array udg_BL_Distance
    real array udg_BL_Speed
    real array udg_BL_Dmg
    real array udg_BL_AoE
    real array udg_BL_Collision
    real udg_BL_Scale = 0
    unit array udg_BL_Missile
    effect array udg_BL_Effect1
    effect array udg_BL_Effect2
    integer udg_BL = 0
    group udg_BL_Group = null
    boolean udg_BL_Idol = false
    integer udg_BE_DummyType = 0
    string udg_BE_Model
    integer array udg_BE_Bounces
    real array udg_BE_SearchAoE
    real array udg_BE_CDamage
    real array udg_BE_CHeal
    real array udg_BE_DamageAddition
    real array udg_BE_HealAddition
    real array udg_BE_Speed
    real array udg_BE_Height
    real udg_BE_CSizeIncrement = 0
    string udg_BE_PosSpecialEffect
    string udg_BE_NegSpecialEffect
    damagetype udg_BE_DamageType = null
    attacktype udg_BE_AttackType = null
    location udg_BE_TempPoint = null
    unit udg_BE_PreloadUnit = null
    integer udg_BE_MaxIndex = 0
    unit array udg_BE_Caster
    unit array udg_BE_Target
    integer array udg_BE_AbilityIndex
    real array udg_BE_DistanceTravelled
    real array udg_BE_Damage
    real array udg_BE_Heal
    real array udg_BE_SizeIncrement
    integer array udg_BE_CurrentBounces
    player array udg_BE_Player
    location udg_BE_TempPoint2 = null
    location udg_BE_TempPoint3 = null
    real array udg_BE_Angle
    unit array udg_BE_Dummy
    effect array udg_BE_FX
    integer udg_BE_TempIndex = 0
    real array udg_BE_Distance
    real udg_BE_TotalDistance = 0
    group udg_BE_Group = null
    unit udg_BE_PickedUnits = null
    group udg_FallenGroup = null
    boolean udg_Combat = false
    texttag array udg_CC_SecretLevel
    unit array udg_CC_SecretUnit
    integer array udg_ARTInteger
    group udg_SecretGroup = null
    group udg_FollowersGroup = null
    real udg_DifficultyRate = 0
    integer udg_CustomValues = 0
    timer udg_Boss2Timer = null
    boolean udg_EM_BossRoom = false
    integer udg_D_DungeonTier = 0
    integer array udg_D_WallTierType
    integer array udg_D_WallTierTypeRoom
    integer udg_D_TextureType = 0
    boolean udg_SaveLoad_SaveToDisk = false
    string udg_SaveLoad_Directory
    string udg_SaveLoad_Alphabet
    boolean udg_SaveLoad_CheckName = false
    boolean udg_SaveLoad_Security = false
    integer udg_SaveLoad_HyphenSpace = 0
    string udg_SaveLoad_SeperationChar
    string udg_SaveLoad_Lower
    string udg_SaveLoad_Number
    string udg_SaveLoad_Upper
    integer udg_SaveLoad_MaxValue = 0
    integer array udg_SaveLoad_Hero
    integer udg_SaveLoad_HeroCount = 0
    integer udg_SaveLoad_AbilityCount = 0
    integer array udg_SaveLoad_Item
    integer udg_SaveLoad_ItemCount = 0
    string udg_SaveLoad_Full
    string udg_SaveLoad_Error
    integer udg_SaveLoad_Base = 0
    string array udg_SaveLoad_Char
    integer array udg_Load
    integer udg_LoadCount = 0
    integer udg_SaveCount = 0
    unit udg_Hero = null
    integer array udg_Save
    string udg_SaveLoad_Filename
    string udg_Code
    boolean udg_SaveLoad_Valid = false
    item udg_Item = null
    item array udg_LoadedItem
    integer array udg_AS_AbilityStudied
    integer udg_TierUnlocked = 0
    integer array udg_SecretUnlocked
    integer array udg_D_WallTierTypeDoor
    dialog udg_InitDialog = null
    boolean array udg_EM_BossCreate
    integer array udg_LightOrbs
    timer udg_Boss3Timer = null
    unit udg_Boss3Portal = null
    lightning udg_Boss3PortalEffect = null
    integer udg_Boss3PortalCounter = 0
    timer udg_Boss3TimerOrder = null
    integer udg_IG_ItemLVL_Max = 0
    integer udg_Boss3Pukes = 0
    string udg_ImportCode1
    string udg_ImportCode2
    timer udg_LoadingTimer = null
    boolean udg_LoadSucces = false
    boolean udg_EM_Encounter = false
    integer array udg_D_RoomDecorType
    real array udg_D_RoomDecorScale
    boolean udg_CS_Bool = false
    timer udg_CS_Timer = null
    boolean udg_CS_KeeperBool = false
    unit udg_CS_TargetUnit = null
    integer array udg_CS_TargetUnitType
    integer udg_CS_Reward = 0
    integer udg_CS_TargetPower = 0
    integer udg_CS_Round = 0
    timer udg_ScrollTimer = null
    timer udg_CinematicTimer = null
    integer array udg_EM_LevelCV
    string udg_ImportCode3
    integer array udg_EM_LevelDiscovered
    string udg_ImportCode4
    dialog udg_MapBossDialog = null
    button array udg_MapBossButton
    integer udg_EM_BossEnterDialog = 0
    integer udg_EM_TargetCV = 0
    integer udg_AS_Points = 0
    timer udg_SaveTimer2 = null
    timer udg_SaveTimer = null
    timer udg_SaveTimer3 = null
    timer udg_SaveTimer4 = null
    timer udg_SaveTimer5 = null
    timer udg_ComboSpawnTimer = null
    boolean udg_ComboSpawnAllowed = false
    boolean array udg_EdemEventBool
    timer udg_DungeonColdTimer = null
    integer udg_DungeonColdLevel = 0
    texttag udg_DungeonColdText = null
    timer udg_DungeonDarkTimer = null
    timerdialog udg_DungeonDarkTimerWindow = null
    integer udg_Autosave = 0
    boolean udg_AutosaveBool = false
    integer array udg_QG_Count
    integer array udg_QG_ObjectiveStateMax
    integer array udg_QG_ObjectiveState
    integer array udg_QG_CountMax
    string array udg_QG_ObjectiveName
    string array udg_QG_Objective
    boolean udg_EventSucces = false
    integer udg_EX_Level_Base = 0
    integer udg_EX_Exp_Base = 0
    integer udg_EX_LevelUp = 0
    questitem array udg_QG_Requirement
    real udg_EX_Rate = 0
    integer udg_QG_QuestCompleted = 0
    real udg_CS_RewardReal = 0
    location udg_PointCleansing = null
    integer udg_DungeonDeadlyCleansing = 0
    integer array udg_IG_ItemEnchant
    integer udg_SB_Skip = 0
    integer udg_SB_Times = 0
    boolean array udg_SB_On
    unit array udg_SB_Hero
    integer array udg_SB_Level
    location array udg_SB_Point
    real array udg_SB_Distance
    real array udg_SB_Angle
    real array udg_SB_Speed
    real array udg_SB_Damage
    integer array udg_SB_Spam
    integer udg_SB = 0
    group array udg_SB_Group
    location array udg_KB_Point
    integer udg_KB_Skip = 0
    integer udg_KB_Times = 0
    boolean array udg_KB_Off
    unit array udg_KB_Target
    real array udg_KB_Angle
    real array udg_KB_Distance
    real array udg_KB_Speed
    integer array udg_KB_Spam
    integer udg_KB = 0
    effect udg_SB_Effect = null
    boolean udg_KB_Bool = false
    integer udg_IG_ItemRandom = 0
    location udg_PointTalisman = null
    trigger gg_trg_Initialisation = null
    trigger gg_trg_Initialisation_Elapsed = null
    trigger gg_trg_Initialisation_Dialog = null
    trigger gg_trg_Variables = null
    trigger gg_trg_Game_Save = null
    trigger gg_trg_Game_Save_Timer = null
    trigger gg_trg_CodeGen_Init = null
    trigger gg_trg_CodeGen_Save = null
    trigger gg_trg_CodeGen_Save_2 = null
    trigger gg_trg_CodeGen_Save_3 = null
    trigger gg_trg_CodeGen_Save_4 = null
    trigger gg_trg_CodeGen_Load = null
    trigger gg_trg_CodeGen_Load_2 = null
    trigger gg_trg_CodeGen_Load_3 = null
    trigger gg_trg_CodeGen_Load_4 = null
    trigger gg_trg_CodeGen_Other = null
    trigger gg_trg_CodeGen_Abilities = null
    trigger gg_trg_CodeGen_Dungeon = null
    trigger gg_trg_Loading_Succes = null
    trigger gg_trg_Map_Enter = null
    trigger gg_trg_Map_Generate = null
    trigger gg_trg_Map_Buttons = null
    trigger gg_trg_Map_Boss_Button = null
    trigger gg_trg_Map_Move = null
    trigger gg_trg_Map_Choose = null
    trigger gg_trg_Map_Events = null
    trigger gg_trg_Map_Events_Buttons = null
    trigger gg_trg_Edemor_Start = null
    trigger gg_trg_Edemor_Process = null
    trigger gg_trg_Edemor_Periodic = null
    trigger gg_trg_Edemor_Transparent = null
    trigger gg_trg_Edemor_Check = null
    trigger gg_trg_Edemor_Exit = null
    trigger gg_trg_Coliseum_Start = null
    trigger gg_trg_Keeper_Appear = null
    trigger gg_trg_Keeper_Transparent = null
    trigger gg_trg_Keeper_Look = null
    trigger gg_trg_Coliseum_Spawn = null
    trigger gg_trg_Coliseum_Target_Kill = null
    trigger gg_trg_Coliseum_Exit = null
    trigger gg_trg_Gen_Start = null
    trigger gg_trg_Gen_Cells = null
    trigger gg_trg_Gen_Rooms_Timer = null
    trigger gg_trg_Gen_Rooms = null
    trigger gg_trg_Gen_Rooms_Walls = null
    trigger gg_trg_Gen_Rooms_Doors = null
    trigger gg_trg_Gen_Walls = null
    trigger gg_trg_Gen_Hall_Walls = null
    trigger gg_trg_Gen_Tiles = null
    trigger gg_trg_Gen_Decor_Tiles = null
    trigger gg_trg_Gen_Decor_Walls = null
    trigger gg_trg_Gen_Decor_Rooms = null
    trigger gg_trg_Gen_Creeps_List = null
    trigger gg_trg_Gen_Creeps = null
    trigger gg_trg_Gen_Creeps_Skills = null
    trigger gg_trg_Gen_Final = null
    trigger gg_trg_Gen_Events = null
    trigger gg_trg_Gen_Unpause = null
    trigger gg_trg_Gen_Exit = null
    trigger gg_trg_Gen_Boss = null
    trigger gg_trg_Pause_Off = null
    trigger gg_trg_Events_Elapsed = null
    trigger gg_trg_Events_Buttons = null
    trigger gg_trg_Dungeon_Cold = null
    trigger gg_trg_Dungeon_Cold_Hearth = null
    trigger gg_trg_Dungeon_Cold_Text = null
    trigger gg_trg_Dungeon_Dark = null
    trigger gg_trg_Dungeon_Dark_Periodic = null
    trigger gg_trg_Dungeon_Battle_Portal = null
    trigger gg_trg_Dungeon_Deadly = null
    trigger gg_trg_IG_Generate = null
    trigger gg_trg_IG_Take = null
    trigger gg_trg_IG_Drop = null
    trigger gg_trg_IG_Text = null
    trigger gg_trg_Core_Select = null
    trigger gg_trg_Core_Secret_Select = null
    trigger gg_trg_Core_Put_Ingredient = null
    trigger gg_trg_Core_Recycle = null
    trigger gg_trg_Core_Create = null
    trigger gg_trg_Core_Start_Timer = null
    trigger gg_trg_Core_Timer = null
    trigger gg_trg_Core_Item_Pickup = null
    trigger gg_trg_Talent_Kill = null
    trigger gg_trg_Talent_Periodic = null
    trigger gg_trg_Combo_Ability_Use = null
    trigger gg_trg_Combo_Spawn_Creeps = null
    trigger gg_trg_Combo_Spawn_Hero = null
    trigger gg_trg_Combo_Spawn_Timer = null
    trigger gg_trg_Combo_Spawn_Timer_Expires = null
    trigger gg_trg_Combo_Spawn_Hero_Timer = null
    trigger gg_trg_Combo_Disappear = null
    trigger gg_trg_Combat_Start = null
    trigger gg_trg_Combat_Damage = null
    trigger gg_trg_Combat_Timer = null
    trigger gg_trg_Combat_Timer_2 = null
    trigger gg_trg_Secret_Search = null
    trigger gg_trg_Secret_Found = null
    trigger gg_trg_Enter_Dialog = null
    trigger gg_trg_Escape_Initiate = null
    trigger gg_trg_Escape_Guardian_Kill = null
    trigger gg_trg_Escape_Dialog_Dummy = null
    trigger gg_trg_Escape_Dialog = null
    trigger gg_trg_Dungeon_Room_Leave = null
    trigger gg_trg_Edemium_Portals = null
    trigger gg_trg_Edemium_Portals_Cooldown = null
    trigger gg_trg_Edemium_Difficulty_Dialog = null
    trigger gg_trg_Edemium_Difficulty_Buttons = null
    trigger gg_trg_Edemium_Hero_Dies = null
    trigger gg_trg_Creep_Lead_Timer = null
    trigger gg_trg_Trap_Periodic_Explosion = null
    trigger gg_trg_Trap_Periodic = null
    trigger gg_trg_Decorations_Click = null
    trigger gg_trg_Chest_Unlock = null
    trigger gg_trg_Chest_Unlock_Button = null
    trigger gg_trg_Chest_Reward = null
    trigger gg_trg_Trap_Effect = null
    trigger gg_trg_QG_Generate = null
    trigger gg_trg_QG_Completion_Check = null
    trigger gg_trg_QG_Change_Text = null
    trigger gg_trg_Creep_Kill = null
    trigger gg_trg_Creep_Exp = null
    trigger gg_trg_Creep_Kill_Reward = null
    trigger gg_trg_Creep_Kill_Recipes = null
    trigger gg_trg_Creep_Skills_Cast = null
    trigger gg_trg_Creep_Skills = null
    trigger gg_trg_Creep_Attacked = null
    trigger gg_trg_Creep_Attacking = null
    trigger gg_trg_Creep_Fallen_End_Cast = null
    trigger gg_trg_Creep_Fallen_Spawn = null
    trigger gg_trg_Izurods_Damage = null
    trigger gg_trg_Flying_Missile_Setings = null
    trigger gg_trg_Flying_Missile_Loop = null
    trigger gg_trg_Boss_Creep_Spawn = null
    trigger gg_trg_Boss_Kill_Check = null
    trigger gg_trg_Boss_Units_Remove = null
    trigger gg_trg_Boss_Casts = null
    trigger gg_trg_Boss_I_Throw = null
    trigger gg_trg_Boss_II_Throw = null
    trigger gg_trg_Boss_II_Phase_2_Init = null
    trigger gg_trg_Boss_II_Channel_Init = null
    trigger gg_trg_Boss_II_Channel_Periodic = null
    trigger gg_trg_Boss_II_Channel_Timer = null
    trigger gg_trg_Boss_III_Creep_Spawn = null
    trigger gg_trg_Boss_III_Portal_Spawn = null
    trigger gg_trg_Boss_III_Portal_Use = null
    trigger gg_trg_Boss_III_Portal_Abort = null
    trigger gg_trg_Boss_III_Portal_Timer = null
    trigger gg_trg_Boss_III_Portal_Damage = null
    trigger gg_trg_Boss_III_Attacks = null
    trigger gg_trg_Boss_III_Puke_Rain_Init = null
    trigger gg_trg_Boss_III_Phase_2_Init = null
    trigger gg_trg_Boss_III_Phase_3_Init = null
    trigger gg_trg_Boss_III_Puke_Rain = null
    trigger gg_trg_Boss_III_Explode_Damage = null
    trigger gg_trg_Boss_III_Portal_Timer_Order = null
    trigger gg_trg_Meditation_Cast = null
    trigger gg_trg_Meditation_Turn_Off = null
    trigger gg_trg_Meditation_Heal = null
    trigger gg_trg_Sprint_Cast = null
    trigger gg_trg_Sprint_Timer = null
    trigger gg_trg_Sprint_Energy = null
    trigger gg_trg_Abilities_Info = null
    trigger gg_trg_Abilities_Study = null
    trigger gg_trg_Abilities_Activate = null
    trigger gg_trg_Abilities_Deactivate = null
    trigger gg_trg_Abilities_Remove = null
    trigger gg_trg_Abilities_Effect = null
    trigger gg_trg_Abilities_Effects = null
    trigger gg_trg_Effect_1_Heal = null
    trigger gg_trg_Effect_1_Timer = null
    trigger gg_trg_Effect_2_Timer = null
    trigger gg_trg_Effect_3_Use = null
    trigger gg_trg_Effect_4_Vampirism = null
    trigger gg_trg_Effect_4_Timer = null
    trigger gg_trg_Effect_6_Periodic = null
    trigger gg_trg_Effect_8_Config = null
    trigger gg_trg_Effect_8_Cast = null
    trigger gg_trg_Effect_8_Loop = null
    trigger gg_trg_Effect_9_Periodic = null
    trigger gg_trg_Effect_9_Stop = null
    trigger gg_trg_Effect_11_Timer = null
    trigger gg_trg_Effect_12_Periodic = null
    trigger gg_trg_Damage_Effects = null
    trigger gg_trg_Unit_Indexer = null
    trigger gg_trg_Damage_Engine = null
    trigger gg_trg_Crit_Specialeffect = null
    trigger gg_trg_Augment_Info = null
    trigger gg_trg_Augment_Buy = null
    trigger gg_trg_WhosYourDaddy = null
    trigger gg_trg_GreedIsGood = null
    trigger gg_trg_ISeeDeadPeople = null
    trigger gg_trg_Camera_Hero = null
    trigger gg_trg_Camera_Tree = null
    trigger gg_trg_Camera_Fix = null
    trigger gg_trg_Camera_Boss = null
    trigger gg_trg_Camera_Angle_Increase = null
    trigger gg_trg_Camera_Angle_Decrease = null
    trigger gg_trg_Camera_Increase = null
    trigger gg_trg_Camera_Decrease = null
    trigger gg_trg_Trees_Camera_Off = null
    trigger gg_trg_Trees_Choose_ESC = null
    trigger gg_trg_Enter_Regions = null
    trigger gg_trg_Leave_Hero_Regions = null
    trigger gg_trg_Leave_Core = null
    trigger gg_trg_Core_Autosave = null
    trigger gg_trg_Attributes_Multiboard = null
    trigger gg_trg_Hero_Levelup = null
    trigger gg_trg_Dummy_Remove = null
    trigger gg_trg_Music_Edemium = null
    trigger gg_trg_Music_Castle = null
    trigger gg_trg_Trees_Specialeffects = null
    trigger gg_trg_Tile_Damage = null
    trigger gg_trg_Fade_Loop = null
    trigger gg_trg_Edemium_Transparent = null
    trigger gg_trg_Follower_Movement = null
    trigger gg_trg_Follower_Dies = null
    trigger gg_trg_Item_Disperse = null
    trigger gg_trg_Item_Pickup = null
    trigger gg_trg_Item_Type_System = null
    trigger gg_trg_Onkie_Sells = null
    trigger gg_trg_Onkie_List = null
    trigger gg_trg_Poison_Damage = null
    trigger gg_trg_Poison_Timer = null
    trigger gg_trg_Magic_Timer = null
    trigger gg_trg_Scroll_Pickup = null
    trigger gg_trg_Scroll_Timer = null
    trigger gg_trg_Scroll_Periodic = null
    trigger gg_trg_Scroll_Use = null
    trigger gg_trg_Armor_Use = null
    trigger gg_trg_Talisman_Use = null
    trigger gg_trg_Lightspeed_Loop = null
    trigger gg_trg_Knockback_System = null
    trigger gg_trg_Tutorial01 = null
    trigger gg_trg_Tutorial02 = null
    trigger gg_trg_Tutorial_Initialisation = null
    trigger gg_trg_Artefactorium_Damage = null
    trigger gg_trg_Artefactorium_Creep_Kill = null
    trigger gg_trg_Artefactorium_Spawn = null
    trigger gg_trg_Tutorial_Cinematic = null
    trigger gg_trg_Cinematic_Transparent = null
    trigger gg_trg_Orbs_Spawn = null
    trigger gg_trg_Orb_Arc = null
    trigger gg_trg_Orbs_System_1 = null
    trigger gg_trg_Orbs_System_2 = null
    trigger gg_trg_Item_Pickup_JASS = null
    trigger gg_trg_Quest_Progress = null
    trigger gg_trg_Exp = null
    trigger gg_trg_Check_Lvl = null
    trigger gg_trg_Level = null
    trigger gg_trg_Scrolls = null
    trigger gg_trg_Suicide = null
    trigger gg_trg_Unlock_Difficulties = null
    trigger gg_trg_Talent_Level = null
    trigger gg_trg_Camera_Disable = null
    trigger gg_trg_Set_Ingredients = null
    trigger gg_trg_Add_Ingredients = null
    trigger gg_trg_Unhide_Recipes = null
    trigger gg_trg_God_Mode = null
    trigger gg_trg_Boss = null
    trigger gg_trg_Attributes = null
    trigger gg_trg_Item_Generate = null
    trigger gg_trg_Item_Clear = null
    trigger gg_trg_Ability_Points = null
    trigger gg_trg_Item_Max_Lvl = null
    trigger gg_trg_Heal = null
    trigger gg_trg_Damage = null
    trigger gg_trg_ChanceCrit = null
    trigger gg_trg_ChanceBlock = null
    trigger gg_trg_Ending_Init = null
    trigger gg_trg_Ending_Dialogue_1 = null
    trigger gg_trg_Ending_Dialogue_2 = null
    trigger gg_trg_Ending_Dialogue_3 = null
    trigger gg_trg_Bad_Ending_Good_Job = null
    trigger gg_trg_Edemor_Transparent_2 = null
    unit gg_unit_h006_0035 = null
    unit gg_unit_H000_0004 = null
    unit gg_unit_h00K_0142 = null
    unit gg_unit_h00K_0141 = null
    unit gg_unit_h00K_0140 = null
    unit gg_unit_h007_0065 = null
    unit gg_unit_h00K_0139 = null
    unit gg_unit_h00K_0138 = null
    unit gg_unit_h00K_0136 = null
    unit gg_unit_h00K_0135 = null
    unit gg_unit_h00K_0134 = null
    unit gg_unit_h00K_0133 = null
    unit gg_unit_h00K_0132 = null
    unit gg_unit_h00K_0131 = null
    unit gg_unit_h00F_0003 = null
    unit gg_unit_h00K_0130 = null
    unit gg_unit_h00K_0129 = null
    unit gg_unit_h00K_0128 = null
    unit gg_unit_h00K_0127 = null
    unit gg_unit_h00K_0126 = null
    unit gg_unit_h00K_0125 = null
    unit gg_unit_h00K_0124 = null
    unit gg_unit_h00K_0123 = null
    unit gg_unit_h00K_0122 = null
    unit gg_unit_h00K_0121 = null
    unit gg_unit_h00K_0120 = null
    unit gg_unit_h00K_0119 = null
    unit gg_unit_h00K_0118 = null
    unit gg_unit_h00K_0117 = null
    unit gg_unit_h00K_0116 = null
    unit gg_unit_h00K_0115 = null
    unit gg_unit_h00K_0114 = null
    unit gg_unit_h00K_0113 = null
    unit gg_unit_h00K_0112 = null
    unit gg_unit_hrif_0000 = null
    unit gg_unit_h00K_0110 = null
    unit gg_unit_h00K_0109 = null
    unit gg_unit_h00K_0108 = null
    unit gg_unit_h00K_0107 = null
    unit gg_unit_h00N_0045 = null
    unit gg_unit_h00K_0105 = null
    unit gg_unit_h00K_0104 = null
    unit gg_unit_h00K_0103 = null
    unit gg_unit_h006_0082 = null
    unit gg_unit_h006_0081 = null
    unit gg_unit_h006_0080 = null
    unit gg_unit_h006_0079 = null
    unit gg_unit_h006_0078 = null
    unit gg_unit_h006_0077 = null
    unit gg_unit_h006_0076 = null
    unit gg_unit_h006_0075 = null
    unit gg_unit_h00K_0102 = null
    unit gg_unit_h006_0073 = null
    unit gg_unit_h00K_0101 = null
    unit gg_unit_h006_0071 = null
    unit gg_unit_n006_0028 = null
    unit gg_unit_h006_0069 = null
    unit gg_unit_h00K_0099 = null
    unit gg_unit_h006_0067 = null
    unit gg_unit_n009_0061 = null
    unit gg_unit_h00K_0098 = null
    unit gg_unit_h011_0009 = null
    unit gg_unit_h00K_0097 = null
    unit gg_unit_h012_0011 = null
    unit gg_unit_h00K_0096 = null
    unit gg_unit_h012_0012 = null
    unit gg_unit_h001_0037 = null
    unit gg_unit_h009_0006 = null
    unit gg_unit_h00Z_0007 = null
    unit gg_unit_h012_0013 = null
    unit gg_unit_h00K_0143 = null
    unit gg_unit_h00K_0111 = null
    unit gg_unit_h00H_0002 = null
    unit gg_unit_h00V_0063 = null
    unit gg_unit_h00V_0029 = null
    unit gg_unit_h00K_0095 = null
    unit gg_unit_h010_0008 = null
    unit gg_unit_h00K_0155 = null
    unit gg_unit_h00K_0154 = null
    unit gg_unit_h00K_0153 = null
    unit gg_unit_h00K_0152 = null
    unit gg_unit_h00K_0151 = null
    unit gg_unit_h00K_0150 = null
    unit gg_unit_h00K_0149 = null
    unit gg_unit_h00K_0148 = null
    unit gg_unit_h00K_0147 = null
    unit gg_unit_h00K_0146 = null
    unit gg_unit_h00K_0145 = null
    unit gg_unit_h00K_0144 = null
    unit gg_unit_h00Y_0005 = null
    unit gg_unit_h002_0010 = null
    unit gg_unit_h003_0014 = null
    unit gg_unit_h00U_0015 = null
    unit gg_unit_h015_0016 = null
    unit gg_unit_h016_0017 = null
    unit gg_unit_h017_0018 = null
    unit gg_unit_h018_0019 = null
    unit gg_unit_h019_0020 = null
    unit gg_unit_h01A_0021 = null
    unit gg_unit_h01B_0022 = null
    unit gg_unit_h01C_0023 = null
    unit gg_unit_h01D_0024 = null
    unit gg_unit_h01E_0025 = null
    unit gg_unit_h01F_0026 = null
    unit gg_unit_h01G_0027 = null
    unit gg_unit_h00K_0100 = null
    unit gg_unit_h00K_0106 = null
    destructable gg_dest_B003_2942 = null
    destructable gg_dest_B003_2941 = null
    destructable gg_dest_B003_2940 = null
    destructable gg_dest_B003_2939 = null
    destructable gg_dest_B003_2938 = null
    destructable gg_dest_B003_2937 = null
    destructable gg_dest_B003_2936 = null
    destructable gg_dest_B003_2935 = null
    destructable gg_dest_B003_2932 = null
    destructable gg_dest_B003_2930 = null
    destructable gg_dest_B003_2929 = null
    destructable gg_dest_B003_2928 = null
    destructable gg_dest_B00B_1390 = null
    destructable gg_dest_B00B_1389 = null
    destructable gg_dest_B00B_1367 = null
    destructable gg_dest_B00B_1366 = null
    destructable gg_dest_B00B_1362 = null
    destructable gg_dest_B00B_1361 = null
    destructable gg_dest_B00B_1360 = null
    destructable gg_dest_B00B_1359 = null
    destructable gg_dest_B00B_1357 = null
    destructable gg_dest_B00B_1356 = null
    destructable gg_dest_B00B_1355 = null
    destructable gg_dest_B00B_1354 = null
endglobals
native MergeUnits takes integer qty, integer a, integer b, integer make returns boolean
native IgnoredUnits takes integer unitid returns integer