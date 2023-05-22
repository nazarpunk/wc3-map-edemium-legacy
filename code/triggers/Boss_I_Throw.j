
function Trig_Boss_I_Throw_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x41303053
endfunction
function Trig_Boss_I_Throw_Func007Func002Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func007Func002Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func007Func002Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func007Func002C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func007C takes nothing returns boolean
    if(not(GetRandomInt(1, 2) == 1))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010Func001Func001Func001Func001Func008Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010Func001Func001Func001Func001Func008A takes nothing returns nothing
    if(Trig_Boss_I_Throw_Func010Func001Func001Func001Func001Func008Func001C())then
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "bloodlust", GetEnumUnit())
    else
    endif
endfunction
function Trig_Boss_I_Throw_Func010Func001Func001Func001Func001Func013Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010Func001Func001Func001Func001Func013A takes nothing returns nothing
    if(Trig_Boss_I_Throw_Func010Func001Func001Func001Func001Func013Func001C())then
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "bloodlust", GetEnumUnit())
    else
    endif
endfunction
function Trig_Boss_I_Throw_Func010Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 5))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010Func001Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 4))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010Func001Func001Func005A takes nothing returns nothing
    call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), (80.00 * I2R(udg_Difficulty)), ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL)
endfunction
function Trig_Boss_I_Throw_Func010Func001Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 3))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010Func001Func009Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010Func001Func009A takes nothing returns nothing
    if(Trig_Boss_I_Throw_Func010Func001Func009Func001C())then
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "rejuvination", GetEnumUnit())
    else
    endif
endfunction
function Trig_Boss_I_Throw_Func010Func001Func014Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010Func001Func014A takes nothing returns nothing
    if(Trig_Boss_I_Throw_Func010Func001Func014Func001C())then
        call IssueTargetOrderBJ(GetLastCreatedUnit(), "rejuvination", GetEnumUnit())
    else
    endif
endfunction
function Trig_Boss_I_Throw_Func010Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Func010C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Boss_I_Throw_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetTriggerUnit())
    call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Point, bj_UNIT_FACING)
    call UnitAddAbilityBJ(0x4130305A, GetLastCreatedUnit())
    call SetUnitAbilityLevelSwapped(0x4130305A, GetLastCreatedUnit(), 1)
    call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "clusterrockets", udg_Boss_Ability_Point)
    if(Trig_Boss_I_Throw_Func007C())then
        set udg_RandomNumber = GetRandomInt(1, 5)
        if(Trig_Boss_I_Throw_Func007Func002C())then
            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Сумасшедший", gg_snd_HeroAlchemistYesAttack1, "Всего один эликсир! *злобно хихикает*", bj_TIMETYPE_ADD, 0, false)
        else
            if(Trig_Boss_I_Throw_Func007Func002Func001C())then
                call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Сумасшедший", gg_snd_HeroAlchemistYesAttack2, "Взрываю!", bj_TIMETYPE_ADD, 0, false)
            else
                if(Trig_Boss_I_Throw_Func007Func002Func001Func001C())then
                    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Сумасшедший", gg_snd_HeroAlchemistWhat4, "Попробуем новый состав...", bj_TIMETYPE_ADD, 0, false)
                else
                    if(Trig_Boss_I_Throw_Func007Func002Func001Func001Func001C())then
                        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Сумасшедший", gg_snd_GoblinZeppelinYes4, "*радостное исступление*", bj_TIMETYPE_ADD, 0, false)
                    else
                        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_EM_BossUnit, "Сумасшедший", gg_snd_GoblinZeppelinYes3, "*нездоровый смех*", bj_TIMETYPE_ADD, 0, false)
                    endif
                endif
            endif
        endif
    else
    endif
    call TriggerSleepAction(0.60)
    set udg_RandomNumber = GetRandomInt(1, 5)
    if(Trig_Boss_I_Throw_Func010C())then
        call SetTerrainTypeBJ(udg_Boss_Ability_Point, 0x43706F73, - 1, 3, 0)
        call AddSpecialEffectLocBJ(udg_Boss_Ability_Point, "war3mapImported\\GreatElderHydraAcidSpewV.153.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
    else
        if(Trig_Boss_I_Throw_Func010Func001C())then
            call AddSpecialEffectLocBJ(udg_Boss_Ability_Point, "war3mapImported\\HolyAwakening.mdx")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
            set udg_UnitGroup = GetUnitsInRangeOfLocAll(400.00, udg_Boss_Ability_Point)
            call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Boss_Ability_Point, bj_UNIT_FACING)
            call UnitAddAbilityBJ(0x41303131, GetLastCreatedUnit())
            call SetUnitAbilityLevelSwapped(0x4130305A, GetLastCreatedUnit(), 1)
            call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
            call ForGroupBJ(udg_UnitGroup, function Trig_Boss_I_Throw_Func010Func001Func009A)
            call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Boss_Ability_Point, bj_UNIT_FACING)
            call UnitAddAbilityBJ(0x41303131, GetLastCreatedUnit())
            call SetUnitAbilityLevelSwapped(0x4130305A, GetLastCreatedUnit(), 1)
            call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
            call ForGroupBJ(udg_UnitGroup, function Trig_Boss_I_Throw_Func010Func001Func014A)
            call DestroyGroup(udg_UnitGroup)
        else
            if(Trig_Boss_I_Throw_Func010Func001Func001C())then
                call AddSpecialEffectLocBJ(udg_Boss_Ability_Point, "war3mapImported\\Holy_Fire_Slam.mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                set udg_UnitGroup = GetUnitsInRangeOfLocAll(350.00, udg_Boss_Ability_Point)
                call ForGroupBJ(udg_UnitGroup, function Trig_Boss_I_Throw_Func010Func001Func001Func005A)
            else
                if(Trig_Boss_I_Throw_Func010Func001Func001Func001C())then
                    call AddSpecialEffectLocBJ(udg_Boss_Ability_Point, "war3mapImported\\Arcane Nova.mdx")
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                    call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 3)], Player(11), udg_Boss_Ability_Point, GetRandomReal(0, 360.00))
                    call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(4, 6)], Player(11), udg_Boss_Ability_Point, GetRandomReal(0, 360.00))
                    call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(10, 10)], Player(11), udg_Boss_Ability_Point, GetRandomReal(0, 360.00))
                else
                    if(Trig_Boss_I_Throw_Func010Func001Func001Func001Func001C())then
                        call AddSpecialEffectLocBJ(udg_Boss_Ability_Point, "war3mapImported\\BloodEX-Special-2.mdx")
                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                        set udg_UnitGroup = GetUnitsInRangeOfLocAll(400.00, udg_Boss_Ability_Point)
                        call CreateNUnitsAtLoc(1, 0x68303039, Player(11), udg_Boss_Ability_Point, bj_UNIT_FACING)
                        call UnitAddAbilityBJ(0x41303132, GetLastCreatedUnit())
                        call SetUnitAbilityLevelSwapped(0x41303132, GetLastCreatedUnit(), 1)
                        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
                        call ForGroupBJ(udg_UnitGroup, function Trig_Boss_I_Throw_Func010Func001Func001Func001Func001Func008A)
                        call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Boss_Ability_Point, bj_UNIT_FACING)
                        call UnitAddAbilityBJ(0x41303132, GetLastCreatedUnit())
                        call SetUnitAbilityLevelSwapped(0x41303132, GetLastCreatedUnit(), 1)
                        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
                        call ForGroupBJ(udg_UnitGroup, function Trig_Boss_I_Throw_Func010Func001Func001Func001Func001Func013A)
                        call DestroyGroup(udg_UnitGroup)
                    else
                    endif
                endif
            endif
        endif
    endif
    call RemoveLocation(udg_Boss_Ability_Point)
    call RemoveLocation(udg_Point)
endfunction
function InitTrig_Boss_I_Throw takes nothing returns nothing
    set gg_trg_Boss_I_Throw = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Boss_I_Throw, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Boss_I_Throw, Condition(function Trig_Boss_I_Throw_Conditions))
    call TriggerAddAction(gg_trg_Boss_I_Throw, function Trig_Boss_I_Throw_Actions)
endfunction