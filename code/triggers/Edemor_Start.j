function Trig_Edemor_Start_Actions takes nothing returns nothing
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 24
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_AS_AbilityEXP_Base[bj_forLoopAIndex] = udg_AS_AbilityEXP[bj_forLoopAIndex]
        set udg_AS_AbilityLVL_Base[bj_forLoopAIndex] = udg_AS_AbilityLVL[bj_forLoopAIndex]
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_AS_AbilityCountLVL_Base = udg_AS_AbilityCountLVL
    set udg_AS_Points_Base = udg_AS_Points
    set udg_EX_Level_Base = GetHeroLevel(udg_Arct)
    set udg_EX_Exp_Base = GetHeroXP(udg_Arct)
    call SetCameraBoundsToRect(bj_mapInitialPlayableArea)
    call AddItemToStockBJ(0x49303158, gg_unit_h00V_0063, 0, 1)
    call AddItemToStockBJ(0x49303159, gg_unit_h00V_0063, 0, 1)
    call AddItemToStockBJ(0x4930315A, gg_unit_h00V_0063, 0, 1)
    call AddItemToStockBJ(0x49303230, gg_unit_h00V_0063, 0, 1)
    set udg_Point = GetRectCenter(gg_rct_Arena_Enter)
    call SetUnitPositionLoc(udg_Arct, udg_Point)
    call RemoveLocation(udg_Point)
    set udg_Point = GetRectCenter(gg_rct_Artefactorium_Spawn)
    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
    call UnitAddAbilityBJ(udg_DifficultyDamage[udg_Difficulty], GetLastCreatedUnit())
    call UnitAddAbilityBJ(udg_DifficultySpeed[udg_Difficulty], GetLastCreatedUnit())
    call RemoveLocation(udg_Point)
    call ShowUnitShow(gg_unit_h00V_0063)
    call SetUnitVertexColorBJ(gg_unit_h00V_0063, 100, 100, 100, 0.00)
    call QueueUnitAnimationBJ(gg_unit_h00V_0063, "stand")
    set udg_Point = GetUnitLoc(gg_unit_h00V_0063)
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\StompRed.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call RemoveLocation(udg_Point)
    call EnableTrigger(gg_trg_Creep_Kill)
    call EnableTrigger(gg_trg_Armor_Use)
    call EnableTrigger(gg_trg_Talisman_Use)
    call DisableTrigger(gg_trg_Artefactorium_Creep_Kill)
    call SetPlayerHandicapBJ(Player(11), (100.00 * I2R(udg_Difficulty)))
    call ClearTextMessagesBJ(GetPlayersAll())
    call SetPlayerAbilityAvailableBJ(true, 0x41303138, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303537, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303530, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303147, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303555, Player(0))
    call LeaderboardDisplayBJ(true, udg_CO_ComboBoard)
    call EnablePreSelect(true, true)
    set udg_Point = GetRectCenter(gg_rct_WhosYourDaddy)
    call CreateNUnitsAtLoc(1, 0x68666F6F, Player(0), udg_Point, bj_UNIT_FACING)
    set udg_AntiCheatUnit[1] = GetLastCreatedUnit()
    call CreateNUnitsAtLoc(1, 0x686B6E69, Player(10), udg_Point, bj_UNIT_FACING)
    set udg_AntiCheatUnit[2] = GetLastCreatedUnit()
    call RemoveLocation(udg_Point)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 2.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
endfunction

function InitTrig_Edemor_Start takes nothing returns nothing
    set gg_trg_Edemor_Start = CreateTrigger()
    call TriggerAddAction(gg_trg_Edemor_Start, function Trig_Edemor_Start_Actions)
endfunction