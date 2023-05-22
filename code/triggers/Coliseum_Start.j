function Trig_Coliseum_Start_Actions takes nothing returns nothing
    set udg_CS_Reward = 5
    set udg_CS_RewardReal = 5.00
    set udg_CS_TargetPower = 0
    set udg_CS_Round = 1
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
    call SetPlayerHandicapBJ(Player(11), (100.00 * I2R(udg_Difficulty)))
    call SetPlayerAbilityAvailableBJ(true, 0x41303138, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303537, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303530, Player(0))
    call EnablePreSelect(true, true)
    call LeaderboardDisplayBJ(true, udg_CO_ComboBoard)
    set udg_Point = GetRectCenter(gg_rct_Artefactorium_Spawn)
    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
    call UnitAddAbilityBJ(udg_DifficultyDamage[udg_Difficulty], GetLastCreatedUnit())
    call UnitAddAbilityBJ(udg_DifficultySpeed[udg_Difficulty], GetLastCreatedUnit())
    call RemoveLocation(udg_Point)
    call EnableTrigger(gg_trg_Camera_Hero)
    call DisableTrigger(gg_trg_Camera_Fix)
    call EnableTrigger(gg_trg_Camera_Angle_Increase)
    call EnableTrigger(gg_trg_Camera_Angle_Decrease)
    call EnableTrigger(gg_trg_Camera_Increase)
    call EnableTrigger(gg_trg_Camera_Decrease)
    call EnableTrigger(gg_trg_Edemium_Hero_Dies)
    call EnableTrigger(gg_trg_Armor_Use)
    call EnableTrigger(gg_trg_Talisman_Use)
    call UnitRemoveAbilityBJ(0x41303644, gg_unit_n006_0028)
    call UnitAddAbilityBJ(0x41303643, gg_unit_n006_0028)
    call ShowUnitHide(gg_unit_n006_0028)
    call StartTimerBJ(udg_CS_Timer, false, 3.00)
    call CameraSetSmoothingFactorBJ(1.00)
    set udg_CS_KeeperBool = false
    set udg_CameraDistance = 1400
    set udg_CameraAngle = 300
    set udg_CameraTurn = 130.00
endfunction
function InitTrig_Coliseum_Start takes nothing returns nothing
    set gg_trg_Coliseum_Start = CreateTrigger()
    call TriggerAddAction(gg_trg_Coliseum_Start, function Trig_Coliseum_Start_Actions)
endfunction