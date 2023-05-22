function InitCustomTriggersOld takes nothing returns nothing
    call InitTrig_Initialisation()
    call InitTrig_Initialisation_Elapsed()
    call InitTrig_Initialisation_Dialog()
    call InitTrig_Variables()
    call InitTrig_Game_Save()
    call InitTrig_Game_Save_Timer()
    call InitTrig_CodeGen_Init()
    call InitTrig_CodeGen_Save()
    call InitTrig_CodeGen_Save_2()
    call InitTrig_CodeGen_Save_3()
    call InitTrig_CodeGen_Save_4()
    call InitTrig_CodeGen_Load()
    call InitTrig_CodeGen_Load_2()
    call InitTrig_CodeGen_Load_3()
    call InitTrig_CodeGen_Load_4()
    call InitTrig_CodeGen_Other()
    call InitTrig_CodeGen_Abilities()
    call InitTrig_CodeGen_Dungeon()
    call InitTrig_Loading_Succes()
    call InitTrig_Map_Enter()
    call InitTrig_Map_Generate()
    call InitTrig_Map_Buttons()
    call InitTrig_Map_Boss_Button()
    call InitTrig_Map_Move()
    call InitTrig_Map_Choose()
    call InitTrig_Map_Events()
    call InitTrig_Map_Events_Buttons()
    call InitTrig_Edemor_Start()
    call InitTrig_Edemor_Process()
    call InitTrig_Edemor_Periodic()
    call InitTrig_Edemor_Transparent()
    call InitTrig_Edemor_Check()
    call InitTrig_Edemor_Exit()
    call InitTrig_Coliseum_Start()
    call InitTrig_Keeper_Appear()
    call InitTrig_Keeper_Transparent()
    call InitTrig_Keeper_Look()
    call InitTrig_Coliseum_Spawn()
    call InitTrig_Coliseum_Target_Kill()
    call InitTrig_Coliseum_Exit()
    call InitTrig_Gen_Start()
    call InitTrig_Gen_Cells()
    call InitTrig_Gen_Rooms_Timer()
    call InitTrig_Gen_Rooms()
    call InitTrig_Gen_Rooms_Walls()
    call InitTrig_Gen_Rooms_Doors()
    call InitTrig_Gen_Walls()
    call InitTrig_Gen_Hall_Walls()
    call InitTrig_Gen_Tiles()
    call InitTrig_Gen_Decor_Tiles()
    call InitTrig_Gen_Decor_Walls()
    call InitTrig_Gen_Decor_Rooms()
    call InitTrig_Gen_Creeps_List()
    call InitTrig_Gen_Creeps()
    call InitTrig_Gen_Creeps_Skills()
    call InitTrig_Gen_Final()
    call InitTrig_Gen_Events()
    call InitTrig_Gen_Unpause()
    call InitTrig_Gen_Exit()
    call InitTrig_Gen_Boss()
    call InitTrig_Pause_Off()
    call InitTrig_Events_Elapsed()
    call InitTrig_Events_Buttons()
    call InitTrig_Dungeon_Cold()
    call InitTrig_Dungeon_Cold_Hearth()
    call InitTrig_Dungeon_Cold_Text()
    call InitTrig_Dungeon_Dark()
    call InitTrig_Dungeon_Dark_Periodic()
    call InitTrig_Dungeon_Battle_Portal()
    call InitTrig_Dungeon_Deadly()
    call InitTrig_IG_Generate()
    call InitTrig_IG_Take()
    call InitTrig_IG_Drop()
    call InitTrig_IG_Text()
    call InitTrig_Core_Select()
    call InitTrig_Core_Secret_Select()
    call InitTrig_Core_Put_Ingredient()
    call InitTrig_Core_Recycle()
    call InitTrig_Core_Create()
    call InitTrig_Core_Start_Timer()
    call InitTrig_Core_Timer()
    call InitTrig_Core_Item_Pickup()
    call InitTrig_Talent_Kill()
    call InitTrig_Talent_Periodic()
    call InitTrig_Combo_Ability_Use()
    call InitTrig_Combo_Spawn_Creeps()
    call InitTrig_Combo_Spawn_Hero()
    call InitTrig_Combo_Spawn_Timer()
    call InitTrig_Combo_Spawn_Timer_Expires()
    call InitTrig_Combo_Spawn_Hero_Timer()
    call InitTrig_Combo_Disappear()
    call InitTrig_Combat_Start()
    call InitTrig_Combat_Damage()
    call InitTrig_Combat_Timer()
    call InitTrig_Combat_Timer_2()
    call InitTrig_Secret_Search()
    call InitTrig_Secret_Found()
    call InitTrig_Enter_Dialog()
    call InitTrig_Escape_Initiate()
    call InitTrig_Escape_Guardian_Kill()
    call InitTrig_Escape_Dialog_Dummy()
    call InitTrig_Escape_Dialog()
    call InitTrig_Dungeon_Room_Leave()
    call InitTrig_Edemium_Portals()
    call InitTrig_Edemium_Portals_Cooldown()
    call InitTrig_Edemium_Difficulty_Dialog()
    call InitTrig_Edemium_Difficulty_Buttons()
    call InitTrig_Edemium_Hero_Dies()
    call InitTrig_Creep_Lead_Timer()
    call InitTrig_Trap_Periodic_Explosion()
    call InitTrig_Trap_Periodic()
    call InitTrig_Decorations_Click()
    call InitTrig_Chest_Unlock()
    call InitTrig_Chest_Unlock_Button()
    call InitTrig_Chest_Reward()
    call InitTrig_Trap_Effect()
    call InitTrig_QG_Generate()
    call InitTrig_QG_Completion_Check()
    call InitTrig_QG_Change_Text()
    call InitTrig_Creep_Kill()
    call InitTrig_Creep_Exp()
    call InitTrig_Creep_Kill_Reward()
    call InitTrig_Creep_Kill_Recipes()
    call InitTrig_Creep_Skills_Cast()
    call InitTrig_Creep_Skills()
    call InitTrig_Creep_Attacked()
    call InitTrig_Creep_Attacking()
    call InitTrig_Creep_Fallen_End_Cast()
    call InitTrig_Creep_Fallen_Spawn()
    call InitTrig_Izurods_Damage()
    call InitTrig_Flying_Missile_Setings()
    call InitTrig_Flying_Missile_Loop()
    call InitTrig_Boss_Creep_Spawn()
    call InitTrig_Boss_Kill_Check()
    call InitTrig_Boss_Units_Remove()
    call InitTrig_Boss_Casts()
    call InitTrig_Boss_I_Throw()
    call InitTrig_Boss_II_Throw()
    call InitTrig_Boss_II_Phase_2_Init()
    call InitTrig_Boss_II_Channel_Init()
    call InitTrig_Boss_II_Channel_Periodic()
    call InitTrig_Boss_II_Channel_Timer()
    call InitTrig_Boss_III_Creep_Spawn()
    call InitTrig_Boss_III_Portal_Spawn()
    call InitTrig_Boss_III_Portal_Use()
    call InitTrig_Boss_III_Portal_Abort()
    call InitTrig_Boss_III_Portal_Timer()
    call InitTrig_Boss_III_Portal_Damage()
    call InitTrig_Boss_III_Attacks()
    call InitTrig_Boss_III_Puke_Rain_Init()
    call InitTrig_Boss_III_Phase_2_Init()
    call InitTrig_Boss_III_Phase_3_Init()
    call InitTrig_Boss_III_Puke_Rain()
    call InitTrig_Boss_III_Explode_Damage()
    call InitTrig_Boss_III_Portal_Timer_Order()
    call InitTrig_Meditation_Cast()
    call InitTrig_Meditation_Turn_Off()
    call InitTrig_Meditation_Heal()
    call InitTrig_Sprint_Cast()
    call InitTrig_Sprint_Timer()
    call InitTrig_Sprint_Energy()
    call InitTrig_Abilities_Info()
    call InitTrig_Abilities_Study()
    call InitTrig_Abilities_Activate()
    call InitTrig_Abilities_Deactivate()
    call InitTrig_Abilities_Remove()
    call InitTrig_Abilities_Effect()
    call InitTrig_Abilities_Effects()
    call InitTrig_Effect_1_Heal()
    call InitTrig_Effect_1_Timer()
    call InitTrig_Effect_2_Timer()
    call InitTrig_Effect_3_Use()
    call InitTrig_Effect_4_Vampirism()
    call InitTrig_Effect_4_Timer()
    call InitTrig_Effect_6_Periodic()
    call InitTrig_Effect_8_Config()
    call InitTrig_Effect_8_Cast()
    call InitTrig_Effect_8_Loop()
    call InitTrig_Effect_9_Periodic()
    call InitTrig_Effect_9_Stop()
    call InitTrig_Effect_11_Timer()
    call InitTrig_Effect_12_Periodic()
    call InitTrig_Damage_Effects()
    call InitTrig_Unit_Indexer()
    call InitTrig_Damage_Engine()
    call InitTrig_Crit_Specialeffect()
    call InitTrig_Augment_Info()
    call InitTrig_Augment_Buy()
    call InitTrig_WhosYourDaddy()
    call InitTrig_GreedIsGood()
    call InitTrig_ISeeDeadPeople()
    call InitTrig_Camera_Hero()
    call InitTrig_Camera_Tree()
    call InitTrig_Camera_Fix()
    call InitTrig_Camera_Boss()
    call InitTrig_Camera_Angle_Increase()
    call InitTrig_Camera_Angle_Decrease()
    call InitTrig_Camera_Increase()
    call InitTrig_Camera_Decrease()
    call InitTrig_Trees_Camera_Off()
    call InitTrig_Trees_Choose_ESC()
    call InitTrig_Enter_Regions()
    call InitTrig_Leave_Hero_Regions()
    call InitTrig_Leave_Core()
    call InitTrig_Core_Autosave()
    call InitTrig_Attributes_Multiboard()
    call InitTrig_Hero_Levelup()
    call InitTrig_Dummy_Remove()
    call InitTrig_Music_Edemium()
    call InitTrig_Music_Castle()
    call InitTrig_Trees_Specialeffects()
    call InitTrig_Tile_Damage()
    call InitTrig_Fade_Loop()
    call InitTrig_Edemium_Transparent()
    call InitTrig_Follower_Movement()
    call InitTrig_Follower_Dies()
    call InitTrig_Item_Disperse()
    call InitTrig_Item_Pickup()
    call InitTrig_Item_Type_System()
    call InitTrig_Onkie_Sells()
    call InitTrig_Onkie_List()
    call InitTrig_Poison_Damage()
    call InitTrig_Poison_Timer()
    call InitTrig_Magic_Timer()
    call InitTrig_Scroll_Pickup()
    call InitTrig_Scroll_Timer()
    call InitTrig_Scroll_Periodic()
    call InitTrig_Scroll_Use()
    call InitTrig_Armor_Use()
    call InitTrig_Talisman_Use()
    call InitTrig_Lightspeed_Loop()
    call InitTrig_Knockback_System()
    call InitTrig_Tutorial01()
    call InitTrig_Tutorial02()
    call InitTrig_Tutorial_Initialisation()
    call InitTrig_Artefactorium_Damage()
    call InitTrig_Artefactorium_Creep_Kill()
    call InitTrig_Artefactorium_Spawn()
    call InitTrig_Tutorial_Cinematic()
    call InitTrig_Cinematic_Transparent()
    call InitTrig_Orbs_Spawn()
    call InitTrig_Orb_Arc()
    call InitTrig_Orbs_System_1()
    call InitTrig_Orbs_System_2()
    call InitTrig_Item_Pickup_JASS()
    call InitTrig_Quest_Progress()
    call InitTrig_Exp()
    call InitTrig_Check_Lvl()
    call InitTrig_Level()
    call InitTrig_Scrolls()
    call InitTrig_Suicide()
    call InitTrig_Unlock_Difficulties()
    call InitTrig_Talent_Level()
    call InitTrig_Camera_Disable()
    call InitTrig_Set_Ingredients()
    call InitTrig_Add_Ingredients()
    call InitTrig_Unhide_Recipes()
    call InitTrig_God_Mode()
    call InitTrig_Boss()
    call InitTrig_Attributes()
    call InitTrig_Item_Generate()
    call InitTrig_Item_Clear()
    call InitTrig_Ability_Points()
    call InitTrig_Item_Max_Lvl()
    call InitTrig_Heal()
    call InitTrig_Damage()
    call InitTrig_ChanceCrit()
    call InitTrig_ChanceBlock()
    call InitTrig_Ending_Init()
    call InitTrig_Ending_Dialogue_1()
    call InitTrig_Ending_Dialogue_2()
    call InitTrig_Ending_Dialogue_3()
    call InitTrig_Bad_Ending_Good_Job()
    call InitTrig_Edemor_Transparent_2()

    call ConditionalTriggerExecute(gg_trg_Initialisation)
    call ConditionalTriggerExecute(gg_trg_Variables)
    call ConditionalTriggerExecute(gg_trg_CodeGen_Init)
    call ConditionalTriggerExecute(gg_trg_Effect_8_Config)
    call ConditionalTriggerExecute(gg_trg_Unit_Indexer)
endfunction
