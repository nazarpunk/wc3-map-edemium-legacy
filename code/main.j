//! import "globals.j"

//! import "mainInit.j"
//! import "lib/CodeGen.j"

//! import "triggers/Initialisation.j"
//! import "triggers/Initialisation_Elapsed.j"
//! import "triggers/Initialisation_Dialog.j"
//! import "triggers/Variables.j"
//! import "triggers/Game_Save.j"
//! import "triggers/Game_Save_Timer.j"
//! import "triggers/CodeGen_Init.j"
//! import "triggers/CodeGen_Save.j"
//! import "triggers/CodeGen_Save_2.j"
//! import "triggers/CodeGen_Save_3.j"
//! import "triggers/CodeGen_Save_4.j"
//! import "triggers/CodeGen_Load.j"
//! import "triggers/CodeGen_Load_2.j"
//! import "triggers/CodeGen_Load_3.j"
//! import "triggers/CodeGen_Load_4.j"
//! import "triggers/CodeGen_Other.j"
//! import "triggers/CodeGen_Abilities.j"
//! import "triggers/CodeGen_Dungeon.j"
//! import "triggers/Loading_Succes.j"
//! import "triggers/Map_Enter.j"
//! import "triggers/Map_Generate.j"
//! import "triggers/Map_Buttons.j"
//! import "triggers/Map_Boss_Button.j"
//! import "triggers/Map_Move.j"
//! import "triggers/Map_Choose.j"
//! import "triggers/Map_Events.j"
//! import "triggers/Map_Events_Buttons.j"
//! import "triggers/Edemor_Start.j"
//! import "triggers/Edemor_Process.j"
//! import "triggers/Edemor_Periodic.j"
//! import "triggers/Edemor_Transparent.j"
//! import "triggers/Edemor_Check.j"
//! import "triggers/Edemor_Exit.j"
//! import "triggers/Coliseum_Start.j"
//! import "triggers/Keeper_Appear.j"
//! import "triggers/Keeper_Transparent.j"
//! import "triggers/Keeper_Look.j"
//! import "triggers/Coliseum_Spawn.j"
//! import "triggers/Coliseum_Target_Kill.j"
//! import "triggers/Coliseum_Exit.j"
//! import "triggers/Gen_Start.j"
//! import "triggers/Gen_Cells.j"
//! import "triggers/Gen_Rooms_Timer.j"
//! import "triggers/Gen_Rooms.j"
//! import "triggers/Gen_Rooms_Walls.j"
//! import "triggers/Gen_Rooms_Doors.j"
//! import "triggers/Gen_Walls.j"
//! import "triggers/Gen_Hall_Walls.j"
//! import "triggers/Gen_Tiles.j"
//! import "triggers/Gen_Decor_Tiles.j"
//! import "triggers/Gen_Decor_Walls.j"
//! import "triggers/Gen_Decor_Rooms.j"
//! import "triggers/Gen_Creeps_List.j"
//! import "triggers/Gen_Creeps.j"
//! import "triggers/Gen_Creeps_Skills.j"
//! import "triggers/Gen_Final.j"
//! import "triggers/Gen_Events.j"
//! import "triggers/Gen_Unpause.j"
//! import "triggers/Gen_Exit.j"
//! import "triggers/Gen_Boss.j"
//! import "triggers/Pause_Off.j"
//! import "triggers/Events_Elapsed.j"
//! import "triggers/Events_Buttons.j"
//! import "triggers/Dungeon_Cold.j"
//! import "triggers/Dungeon_Cold_Hearth.j"
//! import "triggers/Dungeon_Cold_Text.j"
//! import "triggers/Dungeon_Dark.j"
//! import "triggers/Dungeon_Dark_Periodic.j"
//! import "triggers/Dungeon_Battle_Portal.j"
//! import "triggers/Dungeon_Deadly.j"
//! import "triggers/IG_Generate.j"
//! import "triggers/IG_Take.j"
//! import "triggers/IG_Drop.j"
//! import "triggers/IG_Text.j"
//! import "triggers/Core_Select.j"
//! import "triggers/Core_Secret_Select.j"
//! import "triggers/Core_Put_Ingredient.j"
//! import "triggers/Core_Recycle.j"
//! import "triggers/Core_Create.j"
//! import "triggers/Core_Start_Timer.j"
//! import "triggers/Core_Timer.j"
//! import "triggers/Core_Item_Pickup.j"
//! import "triggers/Talent_Kill.j"
//! import "triggers/Talent_Periodic.j"
//! import "triggers/Combo_Ability_Use.j"
//! import "triggers/Combo_Spawn_Creeps.j"
//! import "triggers/Combo_Spawn_Hero.j"
//! import "triggers/Combo_Spawn_Timer.j"
//! import "triggers/Combo_Spawn_Timer_Expires.j"
//! import "triggers/Combo_Spawn_Hero_Timer.j"
//! import "triggers/Combo_Disappear.j"
//! import "triggers/Combat_Start.j"
//! import "triggers/Combat_Damage.j"
//! import "triggers/Combat_Timer.j"
//! import "triggers/Combat_Timer_2.j"
//! import "triggers/Secret_Search.j"
//! import "triggers/Secret_Found.j"
//! import "triggers/Enter_Dialog.j"
//! import "triggers/Escape_Initiate.j"
//! import "triggers/Escape_Guardian_Kill.j"
//! import "triggers/Escape_Dialog_Dummy.j"
//! import "triggers/Escape_Dialog.j"
//! import "triggers/Dungeon_Room_Leave.j"
//! import "triggers/Edemium_Portals.j"
//! import "triggers/Edemium_Portals_Cooldown.j"
//! import "triggers/Edemium_Difficulty_Dialog.j"
//! import "triggers/Edemium_Difficulty_Buttons.j"
//! import "triggers/Edemium_Hero_Dies.j"
//! import "triggers/Creep_Lead_Timer.j"
//! import "triggers/Trap_Periodic_Explosion.j"
//! import "triggers/Trap_Periodic.j"
//! import "triggers/Decorations_Click.j"
//! import "triggers/Chest_Unlock.j"
//! import "triggers/Chest_Unlock_Button.j"
//! import "triggers/Chest_Reward.j"
//! import "triggers/Trap_Effect.j"
//! import "triggers/QG_Generate.j"
//! import "triggers/QG_Completion_Check.j"
//! import "triggers/QG_Change_Text.j"
//! import "triggers/Creep_Kill.j"
//! import "triggers/Creep_Exp.j"
//! import "triggers/Creep_Kill_Reward.j"
//! import "triggers/Creep_Kill_Recipes.j"
//! import "triggers/Creep_Skills_Cast.j"
//! import "triggers/Creep_Skills.j"
//! import "triggers/Creep_Attacked.j"
//! import "triggers/Creep_Attacking.j"
//! import "triggers/Creep_Fallen_End_Cast.j"
//! import "triggers/Creep_Fallen_Spawn.j"
//! import "triggers/Izurods_Damage.j"
//! import "triggers/Flying_Missile_Setings.j"
//! import "triggers/Flying_Missile_Loop.j"
//! import "triggers/Boss_Creep_Spawn.j"
//! import "triggers/Boss_Kill_Check.j"
//! import "triggers/Boss_Units_Remove.j"
//! import "triggers/Boss_Casts.j"
//! import "triggers/Boss_I_Throw.j"
//! import "triggers/Boss_II_Throw.j"
//! import "triggers/Boss_II_Phase_2_Init.j"
//! import "triggers/Boss_II_Channel_Init.j"
//! import "triggers/Boss_II_Channel_Periodic.j"
//! import "triggers/Boss_II_Channel_Timer.j"
//! import "triggers/Boss_III_Creep_Spawn.j"
//! import "triggers/Boss_III_Portal_Spawn.j"
//! import "triggers/Boss_III_Portal_Use.j"
//! import "triggers/Boss_III_Portal_Abort.j"
//! import "triggers/Boss_III_Portal_Timer.j"
//! import "triggers/Boss_III_Portal_Damage.j"
//! import "triggers/Boss_III_Attacks.j"
//! import "triggers/Boss_III_Puke_Rain_Init.j"
//! import "triggers/Boss_III_Phase_2_Init.j"
//! import "triggers/Boss_III_Phase_3_Init.j"
//! import "triggers/Boss_III_Puke_Rain.j"
//! import "triggers/Boss_III_Explode_Damage.j"
//! import "triggers/Boss_III_Portal_Timer_Order.j"
//! import "triggers/Meditation_Cast.j"
//! import "triggers/Meditation_Turn_Off.j"
//! import "triggers/Meditation_Heal.j"
//! import "triggers/Sprint_Cast.j"
//! import "triggers/Sprint_Timer.j"
//! import "triggers/Sprint_Energy.j"
//! import "triggers/Abilities_Info.j"
//! import "triggers/Abilities_Study.j"
//! import "triggers/Abilities_Activate.j"
//! import "triggers/Abilities_Deactivate.j"
//! import "triggers/Abilities_Remove.j"
//! import "triggers/Abilities_Effect.j"
//! import "triggers/Abilities_Effects.j"
//! import "triggers/Effect_1_Heal.j"
//! import "triggers/Effect_1_Timer.j"
//! import "triggers/Effect_2_Timer.j"
//! import "triggers/Effect_3_Use.j"
//! import "triggers/Effect_4_Vampirism.j"
//! import "triggers/Effect_4_Timer.j"
//! import "triggers/Effect_6_Periodic.j"
//! import "triggers/Effect_8_Config.j"
//! import "triggers/Effect_8_Cast.j"
//! import "triggers/Effect_8_Loop.j"
//! import "triggers/Effect_9_Periodic.j"
//! import "triggers/Effect_9_Stop.j"
//! import "triggers/Effect_11_Timer.j"
//! import "triggers/Effect_12_Periodic.j"
//! import "triggers/Damage_Effects.j"
//! import "triggers/Unit_Indexer.j"
//! import "triggers/Damage_Engine.j"
//! import "triggers/Crit_Specialeffect.j"
//! import "triggers/Augment_Info.j"
//! import "triggers/Augment_Buy.j"
//! import "triggers/WhosYourDaddy.j"
//! import "triggers/GreedIsGood.j"
//! import "triggers/ISeeDeadPeople.j"
//! import "triggers/Camera_Hero.j"
//! import "triggers/Camera_Tree.j"
//! import "triggers/Camera_Fix.j"
//! import "triggers/Camera_Boss.j"
//! import "triggers/Camera_Angle_Increase.j"
//! import "triggers/Camera_Angle_Decrease.j"
//! import "triggers/Camera_Increase.j"
//! import "triggers/Camera_Decrease.j"
//! import "triggers/Trees_Camera_Off.j"
//! import "triggers/Trees_Choose_ESC.j"
//! import "triggers/Enter_Regions.j"
//! import "triggers/Leave_Hero_Regions.j"
//! import "triggers/Leave_Core.j"
//! import "triggers/Core_Autosave.j"
//! import "triggers/Attributes_Multiboard.j"
//! import "triggers/Hero_Levelup.j"
//! import "triggers/Dummy_Remove.j"
//! import "triggers/Music_Edemium.j"
//! import "triggers/Music_Castle.j"
//! import "triggers/Trees_Specialeffects.j"
//! import "triggers/Tile_Damage.j"
//! import "triggers/Fade_Loop.j"
//! import "triggers/Edemium_Transparent.j"
//! import "triggers/Follower_Movement.j"
//! import "triggers/Follower_Dies.j"
//! import "triggers/Item_Disperse.j"
//! import "triggers/Item_Pickup.j"
//! import "triggers/Item_Type_System.j"
//! import "triggers/Onkie_Sells.j"
//! import "triggers/Onkie_List.j"
//! import "triggers/Poison_Damage.j"
//! import "triggers/Poison_Timer.j"
//! import "triggers/Magic_Timer.j"
//! import "triggers/Scroll_Pickup.j"
//! import "triggers/Scroll_Timer.j"
//! import "triggers/Scroll_Periodic.j"
//! import "triggers/Scroll_Use.j"
//! import "triggers/Armor_Use.j"
//! import "triggers/Talisman_Use.j"
//! import "triggers/Lightspeed_Loop.j"
//! import "triggers/Knockback_System.j"
//! import "triggers/Tutorial01.j"
//! import "triggers/Tutorial02.j"
//! import "triggers/Tutorial_Initialisation.j"
//! import "triggers/Artefactorium_Damage.j"
//! import "triggers/Artefactorium_Creep_Kill.j"
//! import "triggers/Artefactorium_Spawn.j"
//! import "triggers/Tutorial_Cinematic.j"
//! import "triggers/Cinematic_Transparent.j"
//! import "triggers/Orbs_Spawn.j"
//! import "triggers/Orb_Arc.j"
//! import "triggers/Orbs_System_1.j"
//! import "triggers/Orbs_System_2.j"
//! import "triggers/Item_Pickup_JASS.j"
//! import "triggers/Quest_Progress.j"
//! import "triggers/Level.j"
//! import "triggers/Scrolls.j"
//! import "triggers/Suicide.j"
//! import "triggers/Unlock_Difficulties.j"
//! import "triggers/Talent_Level.j"
//! import "triggers/Camera_Disable.j"
//! import "triggers/Set_Ingredients.j"
//! import "triggers/Unhide_Recipes.j"
//! import "triggers/God_Mode.j"
//! import "triggers/Item_Generate.j"
//! import "triggers/Item_Clear.j"
//! import "triggers/Ability_Points.j"
//! import "triggers/Item_Max_Lvl.j"
//! import "triggers/Heal.j"
//! import "triggers/Ending_Init.j"
//! import "triggers/Ending_Dialogue_1.j"
//! import "triggers/Ending_Dialogue_2.j"
//! import "triggers/Ending_Dialogue_3.j"
//! import "triggers/Bad_Ending_Good_Job.j"
//! import "triggers/Edemor_Transparent_2.j"

//! import "triggers/chat/Add_Ingredients.j"
//! import "triggers/chat/Attributes.j"
//! import "triggers/chat/Boss.j"
//! import "triggers/chat/ChanceBlock.j"
//! import "triggers/chat/ChanceCrit.j"
//! import "triggers/chat/Check_Lvl.j"
//! import "triggers/chat/Damage.j"
//! import "triggers/chat/Exp.j"

//! import "InitCustomTriggers.j"

//! zinc
//! import "zinc/Init.zn"
//! endzinc

//! inject main
    call SetCameraBounds(- 3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 28160.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 15616.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 3328.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 3072.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 15616.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 28160.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCDalaran\\DNCDalaranTerrain\\DNCDalaranTerrain.mdl", "Environment\\DNC\\DNCDalaran\\DNCDalaranUnit\\DNCDalaranUnit.mdl")
    call SetTerrainFogEx(0, 1000.0, 10000.0, 0.000, 0.000, 0.502, 1.000)
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("DalaranDay")
    call SetAmbientNightSound("DalaranNight")
    call SetMapMusic("Music", true, 0)
    call InitSoundsOld()
    call CreateRegionsOld()
    call CreateCamerasOld()
    call CreateAllDestructablesOld()
    call CreateAllUnitsOld()
    call InitBlizzard()
    call InitGlobalsOld()
    
    //! dovjassinit
    call InitCustomTriggersOld()
//! endinject

//! inject config
    call SetMapName("Edemium")
    call SetMapDescription("")
    call SetPlayers(3)
    call SetTeams(3)
    call SetGamePlacement(MAP_PLACEMENT_USE_MAP_SETTINGS)
    call DefineStartLocation(0, 6528.0, - 11648.0)
    call DefineStartLocation(1, 4224.0, 2112.0)
    call DefineStartLocation(2, 4160.0, 2112.0)
    call InitCustomPlayerSlots()
    call InitCustomTeams()
//! endinject


