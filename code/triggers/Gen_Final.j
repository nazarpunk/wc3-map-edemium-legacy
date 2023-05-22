
function Trig_Gen_Final_Func003Func001A takes nothing returns nothing
    set udg_ChestKeyOwner[GetForLoopIndexB()] = GetEnumUnit()
    call AddSpecialEffectTargetUnitBJ("chest", GetEnumUnit(), "war3mapImported\\LootEFFECT.mdx")
    set udg_ChestKeyEffect[GetForLoopIndexB()] = GetLastCreatedEffectBJ()
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_D_Pick)
endfunction

function Trig_Gen_Final_Func007Func001A takes nothing returns nothing
    set udg_D_Point1 = GetUnitLoc(GetEnumUnit())
    set udg_D_Point2 = OffsetLocation(udg_D_Point1, GetRandomReal(0, 150.00), GetRandomReal(0, 150.00))
    call CreateNUnitsAtLoc(1, 0x68303044, Player(0), udg_D_Point2, bj_UNIT_FACING)
    set udg_Secrets_Rune[bj_forLoopAIndex] = GetLastCreatedUnit()
    call RemoveLocation(udg_D_Point1)
    call RemoveLocation(udg_D_Point2)
    call GroupRemoveUnitSimple(GetEnumUnit(), udg_D_Pick)
endfunction

function Trig_Gen_Final_Func011Func001Func001C takes nothing returns boolean
    if((GetDestructableTypeId(GetEnumDestructable()) != 0x42303156))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) != 0x42303053))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) != 0x4230314B))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) != 0x4230314C))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) != 0x4230315A))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) != 0x42303159))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) != 0x42303231))then
        return true
    endif
    return false
endfunction

function Trig_Gen_Final_Func011Func001Func003C takes nothing returns boolean
    if(not(GetDestructableTypeId(GetEnumDestructable()) == 0x42303134))then
        return false
    endif
    return true
endfunction

function Trig_Gen_Final_Func011Func001C takes nothing returns boolean
    if(not Trig_Gen_Final_Func011Func001Func001C())then
        return false
    endif
    return true
endfunction

function Trig_Gen_Final_Func011A takes nothing returns nothing
    if(Trig_Gen_Final_Func011Func001C())then
        call SetDestructableInvulnerableBJ(GetEnumDestructable(), true)
        if(Trig_Gen_Final_Func011Func001Func003C())then
            set udg_D_Point1 = GetDestructableLoc(GetEnumDestructable())
            call RemoveDestructable(GetEnumDestructable())
            call CreateNUnitsAtLoc(1, 0x6E303049, Player(PLAYER_NEUTRAL_PASSIVE), udg_D_Point1, bj_UNIT_FACING)
            call RemoveLocation(udg_D_Point1)
        else
        endif
    else
    endif
endfunction

function Trig_Gen_Final_Func012Func001Func001C takes nothing returns boolean
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303156))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303053))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x4230314B))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x4230314C))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x4230315A))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303159))then
        return true
    endif
    if((GetDestructableTypeId(GetEnumDestructable()) == 0x42303231))then
        return true
    endif
    return false
endfunction

function Trig_Gen_Final_Func012Func001C takes nothing returns boolean
    if(not Trig_Gen_Final_Func012Func001Func001C())then
        return false
    endif
    return true
endfunction

function Trig_Gen_Final_Func012A takes nothing returns nothing
    if(Trig_Gen_Final_Func012Func001C())then
        call SetDestructableInvulnerableBJ(GetEnumDestructable(), false)
    else
    endif
endfunction

function Trig_Gen_Final_Func018002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Gen_Final_Func021002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction

function Trig_Gen_Final_Actions takes nothing returns nothing
    set udg_D_Pick = GetUnitsInRectOfPlayer(gg_rct_Dungeon, Player(11))
    set bj_forLoopBIndex = 1
    set bj_forLoopBIndexEnd = (udg_D_Chests + 2)
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        call ForGroupBJ(GetRandomSubGroup(1, udg_D_Pick), function Trig_Gen_Final_Func003Func001A)
        set bj_forLoopBIndex = bj_forLoopBIndex + 1
    endloop
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304D)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = GetRandomInt(1, (2 + (1 * udg_ART[17])))
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call ForGroupBJ(GetRandomSubGroup(1, udg_D_Pick), function Trig_Gen_Final_Func007Func001A)
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    call DestroyGroup(udg_D_Pick)
    call EnableTrigger(gg_trg_Secret_Search)
    call EnumDestructablesInRectAll(gg_rct_Dungeon, function Trig_Gen_Final_Func011A)
    call EnumDestructablesInRectAll(gg_rct_Dungeon, function Trig_Gen_Final_Func012A)
    set udg_D_Point1 = GetUnitLoc(udg_D_CellNumber[0])
    call SetUnitPositionLoc(udg_Arct, udg_D_Point1)
    call RemoveLocation(udg_D_Point1)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x6830304D)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Final_Func018002)
    call DestroyGroup(udg_D_Pick)
    set udg_D_Pick = GetUnitsOfTypeIdAll(0x68303054)
    call ForGroupBJ(udg_D_Pick, function Trig_Gen_Final_Func021002)
    call DestroyGroup(udg_D_Pick)
    set udg_CameraDistance = 1400
    call EnableTrigger(gg_trg_Camera_Hero)
    call EnableTrigger(gg_trg_Camera_Angle_Increase)
    call EnableTrigger(gg_trg_Camera_Angle_Decrease)
    call EnableTrigger(gg_trg_Camera_Increase)
    call EnableTrigger(gg_trg_Camera_Decrease)
    call EnableTrigger(gg_trg_Escape_Initiate)
    call ConditionalTriggerExecute(gg_trg_Music_Edemium)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 0.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
    set udg_CO_CustomValue = (udg_CO_CustomValue + 1)
    set udg_Training = false
    call SetPlayerHandicapBJ(Player(11), (100.00 * I2R(udg_Difficulty)))
    call SetUnitLifePercentBJ(udg_Arct, 100)
    call SetUnitManaPercentBJ(udg_Arct, 100)
    call EnableTrigger(gg_trg_Edemium_Hero_Dies)
    call EnableTrigger(gg_trg_Creep_Kill)
    call EnableTrigger(gg_trg_Armor_Use)
    call EnableTrigger(gg_trg_Talisman_Use)
    call EnableTrigger(gg_trg_Chest_Unlock)
    call DisableTrigger(gg_trg_Artefactorium_Creep_Kill)
    call DisableTrigger(gg_trg_Artefactorium_Damage)
    call ConditionalTriggerExecute(gg_trg_Gen_Creeps_Skills)
    call EnableTrigger(gg_trg_ISeeDeadPeople)
    call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
    call DestroyFogModifier(GetLastCreatedFogModifier())
    call FogEnableOn()
    call FogMaskEnableOn()
    call CreateFogModifierRectBJ(false, Player(0), FOG_OF_WAR_MASKED, gg_rct_Dungeon)
    call LeaderboardDisplayBJ(true, udg_CO_ComboBoard)
    call ClearTextMessagesBJ(GetPlayersAll())
    call SetPlayerAbilityAvailableBJ(true, 0x41303138, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303537, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303530, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303147, Player(0))
    call SetPlayerAbilityAvailableBJ(true, 0x41303555, Player(0))
    call EnableTrigger(gg_trg_Meditation_Cast)
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
    set udg_EX_Level_Base = GetHeroLevel(udg_Arct)
    set udg_EX_Exp_Base = GetHeroXP(udg_Arct)
    call ConditionalTriggerExecute(gg_trg_Gen_Events)
    call SetCameraBoundsToRect(gg_rct_Dungeon_Camera)
    call CameraSetSmoothingFactor(10.00)
    call PauseAllUnitsBJ(true)
    call EnablePreSelect(true, true)
    call StartTimerBJ(udg_D_TimerFinal, false, 2.50)
endfunction

function InitTrig_Gen_Final takes nothing returns nothing
    set gg_trg_Gen_Final = CreateTrigger()
    call TriggerAddAction(gg_trg_Gen_Final, function Trig_Gen_Final_Actions)
endfunction
