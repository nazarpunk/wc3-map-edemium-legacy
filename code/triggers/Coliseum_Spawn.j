function Trig_Coliseum_Spawn_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x41303643
endfunction

function Trig_Coliseum_Spawn_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ(0x41303644, GetTriggerUnit())
    call UnitRemoveAbilityBJ(GetSpellAbilityId(), GetTriggerUnit())
    call ClearTextMessagesBJ(GetPlayersAll())
    set udg_Point = GetRandomLocInRect(gg_rct_Coliseum_Spawn)
    call CreateNUnitsAtLoc(1, udg_CS_TargetUnitType[GetRandomInt(1, 5)], Player(11), udg_Point, bj_UNIT_FACING)
    set udg_RandomNumber = (udg_CS_Round * 10)
    set udg_RandomNumber = (udg_RandomNumber + 100)
    call UnitAddAbilityBJ(0x41303345, GetLastCreatedUnit())
    call SetUnitScalePercent(GetLastCreatedUnit(), I2R(udg_RandomNumber), I2R(udg_RandomNumber), I2R(udg_RandomNumber))
    call SetHeroLevelBJ(GetLastCreatedUnit(), udg_CS_Round, false)
    call ModifyHeroStat(bj_HEROSTAT_STR, GetLastCreatedUnit(), bj_MODIFYMETHOD_ADD, udg_CS_TargetPower)
    call ModifyHeroStat(bj_HEROSTAT_AGI, GetLastCreatedUnit(), bj_MODIFYMETHOD_ADD, udg_CS_TargetPower)
    call ModifyHeroStat(bj_HEROSTAT_INT, GetLastCreatedUnit(), bj_MODIFYMETHOD_ADD, udg_CS_TargetPower)
    call IssueTargetOrderBJ(GetLastCreatedUnit(), "attack", ArctUnit)
    set udg_CS_TargetUnit = GetLastCreatedUnit()
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Holy_Heal_Small.mdx")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
    call RemoveLocation(udg_Point)
    call SetUnitAnimation(gg_unit_n006_0028, "Death")
    call TriggerSleepAction(2.40)
    call ShowUnitHide(gg_unit_n006_0028)
endfunction

function InitTrig_Coliseum_Spawn takes nothing returns nothing
    set gg_trg_Coliseum_Spawn = CreateTrigger()
    call TriggerRegisterUnitEvent(gg_trg_Coliseum_Spawn, gg_unit_n006_0028, EVENT_UNIT_SPELL_FINISH)
    call TriggerAddCondition(gg_trg_Coliseum_Spawn, Condition(function Trig_Coliseum_Spawn_Conditions))
    call TriggerAddAction(gg_trg_Coliseum_Spawn, function Trig_Coliseum_Spawn_Actions)
endfunction
