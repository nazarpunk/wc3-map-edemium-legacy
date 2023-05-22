function Trig_Edemor_Exit_Func004C takes nothing returns boolean
    if(not(udg_AS_Effect2 == true))then
        return false
    endif
    return true
endfunction
function Trig_Edemor_Exit_Func005C takes nothing returns boolean
    if(not(udg_AS_Effect11 == true))then
        return false
    endif
    return true
endfunction
function Trig_Edemor_Exit_Func006Func013002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Edemor_Exit_Func006C takes nothing returns boolean
    if(not(udg_Dead == true))then
        return false
    endif
    return true
endfunction
function Trig_Edemor_Exit_Func020002 takes nothing returns nothing
    call RemoveItem(GetEnumItem())
endfunction
function Trig_Edemor_Exit_Func048002 takes nothing returns nothing
    call RemoveUnit(GetEnumUnit())
endfunction
function Trig_Edemor_Exit_Actions takes nothing returns nothing
    call DisableTrigger(gg_trg_Keeper_Look)
    call RemoveUnit(udg_AS_Effect10Unit)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 2
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        call RemoveUnit(udg_AntiCheatUnit[bj_forLoopAIndex])
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    if(Trig_Edemor_Exit_Func004C())then
        set udg_AS_Effect2 = false
        set udg_ChanceCrit = (udg_ChanceCrit - 10.00)
    else
    endif
    if(Trig_Edemor_Exit_Func005C())then
        set udg_AS_Effect11 = false
        set udg_ChanceBlock = (udg_ChanceBlock - 20.00)
        call DestroyEffectBJ(udg_AS_Effect11SE)
        call SetUnitVertexColorBJ(udg_Arct, 100.00, 100.00, 100, 0)
    else
    endif
    if(Trig_Edemor_Exit_Func006C())then
        set udg_Dead = false
        set udg_Point = GetRectCenter(gg_rct_Edemium_Leave)
        call SetUnitPositionLoc(udg_Arct, udg_Point)
        call ReviveHeroLoc(udg_Arct, udg_Point, false)
        call RemoveLocation(udg_Point)
        set udg_Camera = gg_cam_Camera_Portal_Room
        call SetDayNightModels("DNCLordaeronTerrain.mdx", "DNCLordaeronUnit.mdx")
        call DisableTrigger(gg_trg_Camera_Tree)
        call EnableTrigger(gg_trg_Camera_Fix)
        call CameraSetupApplyForPlayer(true, udg_Camera, Player(0), 0)
        call SelectUnitSingle(udg_Arct)
        set udg_UnitGroup = GetUnitsInRectOfPlayer(gg_rct_Arena_Pick, Player(11))
        call ForGroupBJ(udg_UnitGroup, function Trig_Edemor_Exit_Func006Func013002)
        call DestroyGroup(udg_UnitGroup)
        call CreateItemLoc(0x4930304C, udg_Point)
        call UnitAddItemSwapped(GetLastCreatedItem(), udg_Arct)
    else
    endif
    call SetUnitLifePercentBJ(udg_Arct, 100)
    call SetUnitManaPercentBJ(udg_Arct, 100)
    call UnitRemoveBuffsBJ(bj_REMOVEBUFFS_ALL, udg_Arct)
    call DisableTrigger(gg_trg_Edemium_Hero_Dies)
    call SetPlayerAbilityAvailableBJ(false, 0x41303138, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303537, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303530, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303147, Player(0))
    call SetPlayerAbilityAvailableBJ(false, 0x41303555, Player(0))
    call DisableTrigger(gg_trg_Combo_Ability_Use)
    call LeaderboardDisplayBJ(false, udg_CO_ComboBoard)
    call EnumItemsInRectBJ(gg_rct_Arena_Pick, function Trig_Edemor_Exit_Func020002)
    call DisableTrigger(gg_trg_Creep_Kill)
    call DisableTrigger(gg_trg_Armor_Use)
    call DisableTrigger(gg_trg_Talisman_Use)
    call EnableTrigger(gg_trg_Artefactorium_Creep_Kill)
    call EnableTrigger(gg_trg_Artefactorium_Damage)
    call ConditionalTriggerExecute(gg_trg_Music_Castle)
    call SetCameraBoundsToRect(gg_rct_Camera_Bound_Portal)
    set udg_Camera = gg_cam_Camera_Portal_Room
    call DisableTrigger(gg_trg_Camera_Hero)
    call DisableTrigger(gg_trg_Effect_6_Periodic)
    call DestroyEffectBJ(udg_CO_Effect6Sweep[1])
    call DestroyEffectBJ(udg_CO_Effect6Sweep[2])
    set udg_CO_Effect6Power = 0
    call UnitRemoveAbilityBJ(0x4130334B, udg_Arct)
    set udg_Point = GetUnitLoc(gg_unit_h00V_0063)
    call SetTerrainTypeBJ(udg_Point, 0x56737470, - 1, 10, 1)
    call RemoveLocation(udg_Point)
    call EnablePreSelect(false, false)
    call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_SUB, udg_AS_Effect9Count2)
    call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_SUB, udg_AS_Effect9Count2)
    call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_SUB, udg_AS_Effect9Count2)
    set udg_AS_Effect9Count2 = 0
    set udg_ARTInteger[4] = 0
    set udg_EM_EncounterChance = 0
    call DisableTrigger(gg_trg_Follower_Movement)
    call ForGroupBJ(udg_FollowersGroup, function Trig_Edemor_Exit_Func048002)
    call GroupClear(udg_FollowersGroup)
    set bj_forLoopAIndex = 1
    set bj_forLoopAIndexEnd = 4
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        set udg_ER_Creeps[bj_forLoopAIndex] = 0
        set bj_forLoopAIndex = bj_forLoopAIndex + 1
    endloop
    set udg_AS_Effect10 = false
    set udg_ER_Reward = 0
endfunction
function InitTrig_Edemor_Exit takes nothing returns nothing
    set gg_trg_Edemor_Exit = CreateTrigger()
    call TriggerAddAction(gg_trg_Edemor_Exit, function Trig_Edemor_Exit_Actions)
endfunction