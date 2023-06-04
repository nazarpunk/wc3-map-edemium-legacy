function Trig_Gen_Boss_Actions takes nothing returns nothing
    set udg_Training = false
    call SetPlayerHandicapBJ(Player(11), (100.00 * I2R(udg_Difficulty)))
    call SetUnitLifePercentBJ(ArctUnit, 100)
    call SetUnitManaPercentBJ(ArctUnit, 100)
    call EnableTrigger(gg_trg_Edemium_Hero_Dies)
    call EnableTrigger(gg_trg_Creep_Kill)
    call DisableTrigger(gg_trg_Artefactorium_Creep_Kill)
    call DisableTrigger(gg_trg_Artefactorium_Damage)
    call EnableTrigger(gg_trg_Camera_Angle_Increase)
    call EnableTrigger(gg_trg_Camera_Angle_Decrease)
    call EnableTrigger(gg_trg_Camera_Increase)
    call EnableTrigger(gg_trg_Camera_Decrease)
    call EnableTrigger(gg_trg_Armor_Use)
    call EnableTrigger(gg_trg_Talisman_Use)
    set udg_CustomValues = 1
    call LeaderboardDisplayBJ(true, udg_CO_ComboBoard)
    call ClearTextMessagesBJ(GetPlayersAll())
    call SetPlayerAbilityAvailableBJ(true, 0x41303138, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303537, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303530, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303147, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303555, Player(0))
    set udg_Point = GetRectCenter(gg_rct_WhosYourDaddy)
    call CreateNUnitsAtLoc(1, 0x68666F6F, Player(0), udg_Point, bj_UNIT_FACING)
    set udg_AntiCheatUnit[1] = GetLastCreatedUnit()
    call CreateNUnitsAtLoc(1, 0x686B6E69, Player(10), udg_Point, bj_UNIT_FACING)
    set udg_AntiCheatUnit[2] = GetLastCreatedUnit()
    call RemoveLocation(udg_Point)
    set udg_Point = GetRectCenter(gg_rct_Artefactorium_Spawn)
    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
    call UnitAddAbilityBJ(udg_DifficultyDamage[udg_Difficulty], GetLastCreatedUnit())
    call UnitAddAbilityBJ(udg_DifficultySpeed[udg_Difficulty], GetLastCreatedUnit())
    call RemoveLocation(udg_Point)
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
    set udg_D_Point1 = GetRectCenter(gg_rct_Boss_Spawn)
    if udg_EM_BossCreate[1] then
        set udg_EM_BossCreate[1] = false
        call CreateNUnitsAtLoc(1, 0x6E30304C, Player(11), udg_D_Point1, bj_UNIT_FACING)
        call SetUnitUserData(GetLastCreatedUnit(), 111)
        call PlayMusic((("/Edemium/MusicBoss1.mp3")))
        call EnableTrigger(gg_trg_Boss_Creep_Spawn)
    else
        if udg_EM_BossCreate[2] then
            set udg_EM_BossCreate[2] = false
            call RemoveLocation(udg_D_Point1)
            set udg_D_Point1 = GetRectCenter(gg_rct_Boss_2_Spawn)
            call CreateNUnitsAtLoc(1, 0x6E303047, Player(11), udg_D_Point1, bj_UNIT_FACING)
            call SetUnitUserData(GetLastCreatedUnit(), 222)
            call PlayMusic((("/Edemium/MusicBoss2.mp3")))
            call EnableTrigger(gg_trg_Boss_Creep_Spawn)
            call DisableTrigger(gg_trg_Boss_II_Channel_Periodic)
            call DisableTrigger(gg_trg_Boss_II_Channel_Init)
        else
            if udg_EM_BossCreate[3] then
                set udg_EM_BossCreate[3] = false
                call RemoveLocation(udg_D_Point1)
                set udg_D_Point1 = GetRectCenter(gg_rct_Boss_3_Spawn)
                call CreateNUnitsAtLoc(1, 0x6E303038, Player(11), udg_D_Point1, bj_UNIT_FACING)
                call SetUnitUserData(GetLastCreatedUnit(), 333)
                call SetUnitFlyHeightBJ(GetLastCreatedUnit(), - 220.00, 1.00)
                call PlayMusic((("/Edemium/MusicBoss3.mp3")))
            endif
        endif
    endif
    call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", ArctUnit)
    call RemoveLocation(udg_D_Point1)
    set udg_EM_BossUnit = GetLastCreatedUnit()
    call CameraSetSmoothingFactorBJ(10.00)
    set udg_CameraDistance = 1400
    call PauseAllUnitsBJ(true)
    call EnablePreSelect(true, true)
    call StartTimerBJ(udg_D_TimerFinal, false, 0.30)
endfunction

function InitTrig_Gen_Boss takes nothing returns nothing
    set gg_trg_Gen_Boss = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Boss, function Trig_Gen_Boss_Actions)
endfunction