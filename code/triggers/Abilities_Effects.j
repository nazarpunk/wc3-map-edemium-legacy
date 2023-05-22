
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 12))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func001Func003C takes nothing returns boolean
    if(not(udg_AS_Effect11 == false))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 11))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003Func006Func001Func007C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003Func006Func001Func008C takes nothing returns boolean
    if((GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return true
    endif
    if((GetOwningPlayer(GetEnumUnit()) == Player(1)))then
        return true
    endif
    return false
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003Func006Func001C takes nothing returns boolean
    if(not Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003Func006Func001Func008C())then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003Func006A takes nothing returns nothing
    if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003Func006Func001C())then
        call SetUnitLifeBJ(GetEnumUnit(), (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
        call CreateTextTagUnitBJ(I2S(R2I(udg_AbilityPower)), GetEnumUnit(), 0, 8.00, 0.00, 100.00, 0.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.70)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.40)
    else
        if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003Func006Func001Func007C())then
            call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        else
        endif
    endif
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003C takes nothing returns boolean
    if(not(udg_AS_Effect10 == false))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 10))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func015Func005C takes nothing returns boolean
    if(not(udg_Training == false))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func015C takes nothing returns boolean
    if(not(udg_AS_Effect9Count == 3))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 9))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 8))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func007Func013Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func007Func013A takes nothing returns nothing
    if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func007Func013Func001C())then
        call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
    else
    endif
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func007C takes nothing returns boolean
    if(not(udg_AbilityPowerEnergy >= udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 7))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func009C takes nothing returns boolean
    if(not(udg_CO_LeftWeapon == true))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 6))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 5))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 4))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 3))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func018C takes nothing returns boolean
    if(not(udg_AS_Effect2 == false))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009Func001Func020A takes nothing returns nothing
    set udg_AbilityPower = ((I2R(udg_CO_Power) * 1.00) + I2R(udg_CO_Combo))
    set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))
    call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
endfunction
function Trig_Abilities_Effects_Func001Func009Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 2))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func009C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 1))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001Func010C takes nothing returns boolean
    if(not(udg_Training == false))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func001C takes nothing returns boolean
    if(not(udg_AS_Effect[udg_AS_SeriesNumber] == 0))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func003Func008C takes nothing returns boolean
    if(not(udg_AS_AbilityLVL[udg_AS_EffectNumber] < 5))then
        return false
    endif
    if(not(udg_AS_AbilityEXP[udg_AS_EffectNumber] == 70))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func003C takes nothing returns boolean
    if(not Trig_Abilities_Effects_Func003Func008C())then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Func005C takes nothing returns boolean
    if(not(udg_ART[18] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Abilities_Effects_Actions takes nothing returns nothing
    if(Trig_Abilities_Effects_Func001C())then
        set udg_CO_Power = (GetHeroStatBJ(bj_HEROSTAT_AGI, udg_Arct, true) + GetHeroStatBJ(bj_HEROSTAT_STR, udg_Arct, true) + GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true))
        set udg_CO_Power = (udg_CO_Power / 3)
        set udg_AbilityPower = (I2R(udg_CO_Power) + I2R(udg_CO_Combo))
        set udg_AbilityPower = (udg_AbilityPower + 20.00)
        call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
        set udg_AbilityPower = (udg_AbilityPower - 10.00)
        call UnitDamageTargetBJ(udg_Arct, udg_AS_EnemyTarget, udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
        call RemoveUnit(GetEnumUnit())
    else
        set udg_AbilityPower = (I2R(udg_CO_Power) + I2R(udg_CO_Combo))
        set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))
        call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
        call CreateTextTagUnitBJ(("+" + I2S(R2I(udg_AbilityPower))), udg_Arct, 0, 8.00, 0.00, 100.00, 0.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.00)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.60)
        if(Trig_Abilities_Effects_Func001Func009C())then
            set udg_AS_EffectNumber = 1
            set udg_AbilityPower = ((I2R(udg_CO_Power) * 2.00) + I2R(udg_CO_Combo))
            set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))
            call UnitDamageTargetBJ(udg_Arct, udg_AS_EnemyTarget, (10.00 + I2R(udg_CO_Combo)), ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
            call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
            call EnableTrigger(gg_trg_Effect_1_Heal)
            call StartTimerBJ(udg_AS_TimerEffect1, false, (5.00 * I2R(udg_AS_AbilityLVL[1])))
            set udg_Point = GetUnitLoc(udg_Arct)
            call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
            call RemoveLocation(udg_Point)
            call UnitAddAbilityBJ(0x41303543, GetLastCreatedUnit())
            call SetUnitAbilityLevelSwapped(0x41303543, GetLastCreatedUnit(), udg_AS_AbilityLVL[1])
            call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
            call IssueTargetOrderBJ(GetLastCreatedUnit(), "innerfire", udg_Arct)
        else
            if(Trig_Abilities_Effects_Func001Func009Func001C())then
                set udg_AS_EffectNumber = 2
                call GroupClear(udg_CO_UnitGroup)
                call GroupClear(udg_CO_UnitGroup2)
                call DestroyGroup(udg_CO_UnitGroup)
                call DestroyGroup(udg_CO_UnitGroup2)
                set udg_CO_Point = GetUnitLoc(udg_Arct)
                set udg_CO_UnitGroup = GetUnitsInRangeOfLocAll(300.00, udg_CO_Point)
                call RemoveLocation(udg_CO_Point)
                set udg_CO_UnitGroup2 = GetUnitsOfPlayerAll(Player(0))
                call GroupRemoveGroup(udg_CO_UnitGroup2, udg_CO_UnitGroup)
                set udg_CO_UnitGroup2 = GetUnitsOfPlayerAll(Player(PLAYER_NEUTRAL_PASSIVE))
                call GroupRemoveGroup(udg_CO_UnitGroup2, udg_CO_UnitGroup)
                call ResetUnitAnimation(udg_Arct)
                call SetUnitAnimation(udg_Arct, "attack slam")
                call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "war3mapImported\\insWhirl(sound).mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                if(Trig_Abilities_Effects_Func001Func009Func001Func018C())then
                    set udg_AS_Effect2 = true
                    set udg_ChanceCrit = (udg_ChanceCrit + 10.00)
                    call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
                else
                endif
                call StartTimerBJ(udg_AS_TimerEffect2, false, (4.00 * I2R(udg_AS_AbilityLVL[2])))
                call ForGroupBJ(udg_CO_UnitGroup, function Trig_Abilities_Effects_Func001Func009Func001Func020A)
            else
                if(Trig_Abilities_Effects_Func001Func009Func001Func001C())then
                    set udg_AS_EffectNumber = 3
                    call UnitRemoveAbilityBJ(0x4130334B, udg_Arct)
                    call UnitAddAbilityBJ(0x4130334B, udg_Arct)
                else
                    if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001C())then
                        set udg_AS_EffectNumber = 4
                        set udg_Point = GetUnitLoc(udg_Arct)
                        call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
                        call RemoveLocation(udg_Point)
                        call UnitAddAbilityBJ(0x41303547, GetLastCreatedUnit())
                        call SetUnitAbilityLevelSwapped(0x41303547, GetLastCreatedUnit(), udg_AS_AbilityLVL[4])
                        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
                        call IssueTargetOrderBJ(GetLastCreatedUnit(), "bloodlust", udg_Arct)
                        call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "war3mapImported\\StompRed.mdx")
                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                        call EnableTrigger(gg_trg_Effect_4_Vampirism)
                        call StartTimerBJ(udg_AS_TimerEffect4, false, (3.00 * I2R(udg_AS_AbilityLVL[4])))
                    else
                        if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001C())then
                            set udg_AS_EffectNumber = 5
                            set udg_CO_Point = GetUnitLoc(udg_Arct)
                            call CreateNUnitsAtLoc(1, udg_D_CreepType[GetRandomInt(1, 5)], Player(0), udg_CO_Point, GetRandomReal(0, 360.00))
                            call UnitApplyTimedLifeBJ((5.00 + (2.00 * I2R(udg_AS_AbilityLVL[5]))), 0x42544C46, GetLastCreatedUnit())
                            call UnitAddAbilityBJ(0x416C6F63, GetLastCreatedUnit())
                            call AddSpecialEffectTargetUnitBJ("origin", GetLastCreatedUnit(), "Abilities\\Spells\\Demon\\DemonBoltImpact\\DemonBoltImpact.mdl")
                            call DestroyEffectBJ(GetLastCreatedEffectBJ())
                            call SetUnitVertexColorBJ(GetLastCreatedUnit(), 100.00, 100, 100, 50.00)
                            call RemoveLocation(udg_CO_Point)
                        else
                            if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001C())then
                                set udg_AS_EffectNumber = 6
                                set udg_CO_Effect6Power = (1 * udg_AS_AbilityLVL[6])
                                call EnableTrigger(gg_trg_Effect_6_Periodic)
                                call DestroyEffectBJ(udg_CO_Effect6Sweep[1])
                                call DestroyEffectBJ(udg_CO_Effect6Sweep[2])
                                call AddSpecialEffectTargetUnitBJ("weapon", udg_Arct, "war3mapImported\\Sweep_Lightning_Large.mdx")
                                set udg_CO_Effect6Sweep[1] = GetLastCreatedEffectBJ()
                                if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func009C())then
                                    call AddSpecialEffectTargetUnitBJ("foot, left", udg_Arct, "war3mapImported\\Sweep_Lightning_Large.mdx")
                                    set udg_CO_Effect6Sweep[2] = GetLastCreatedEffectBJ()
                                else
                                endif
                            else
                                if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001C())then
                                    set udg_AS_EffectNumber = 7
                                    set udg_AbilityPowerEnergy = GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct)
                                    call SetUnitManaPercentBJ(udg_Arct, 100)
                                    set udg_AbilityPower = (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) * 0.90)
                                    call SetUnitManaBJ(udg_Arct, udg_AbilityPowerEnergy)
                                    if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func007C())then
                                        set udg_Point = GetUnitLoc(udg_Arct)
                                        set udg_UnitGroup = GetUnitsInRangeOfLocAll(400.00, udg_Point)
                                        call RemoveLocation(udg_Point)
                                        set udg_AbilityPower = (I2R(udg_CO_Power) + I2R(udg_CO_Combo))
                                        set udg_AbilityPower = (udg_AbilityPower + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)))
                                        set udg_AbilityPower = (udg_AbilityPower + GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct))
                                        set udg_AbilityPower = (udg_AbilityPower / 2.00)
                                        call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "war3mapImported\\Thunder Slam.mdx")
                                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                        call ForGroupBJ(udg_UnitGroup, function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func007Func013A)
                                        call DestroyGroup(udg_UnitGroup)
                                    else
                                        call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) + (2.00 + I2R(udg_AS_AbilityLVL[7]))))
                                        call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Items\\AIma\\AImaTarget.mdl")
                                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                    endif
                                else
                                    if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001C())then
                                        set udg_AS_EffectNumber = 8
                                        call ConditionalTriggerExecute(gg_trg_Effect_8_Cast)
                                    else
                                        if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001C())then
                                            set udg_Point = GetUnitLoc(udg_Arct)
                                            set udg_Point2 = OffsetLocation(udg_Point, GetRandomReal(0, 200.00), GetRandomReal(0, 200.00))
                                            call CreateNUnitsAtLoc(1, 0x68303058, Player(0), udg_Point2, GetRandomDirectionDeg())
                                            call UnitApplyTimedLifeBJ((2.00 * I2R(udg_AS_AbilityLVL[9])), 0x42544C46, GetLastCreatedUnit())
                                            call GroupAddUnitSimple(GetLastCreatedUnit(), udg_AS_Effect9Group)
                                            call StartTimerBJ(udg_AS_TimerEffect9, false, (2.00 * I2R(udg_AS_AbilityLVL[9])))
                                            call EnableTrigger(gg_trg_Effect_9_Periodic)
                                            call AddSpecialEffectLocBJ(udg_Point2, "Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl")
                                            call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                            call RemoveLocation(udg_Point)
                                            call RemoveLocation(udg_Point2)
                                            set udg_AS_EffectNumber = 9
                                            set udg_AS_Effect9Count = (udg_AS_Effect9Count + 1)
                                            if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func015C())then
                                                call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "Abilities\\Spells\\Items\\AIma\\AImaTarget.mdl")
                                                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                                set udg_AS_Effect9Count = 0
                                                set udg_AS_Effect9Count2 = (udg_AS_Effect9Count2 + 1)
                                                if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func015Func005C())then
                                                    call ModifyHeroStat(bj_HEROSTAT_STR, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                                                    call ModifyHeroStat(bj_HEROSTAT_AGI, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                                                    call ModifyHeroStat(bj_HEROSTAT_INT, udg_Arct, bj_MODIFYMETHOD_ADD, 1)
                                                else
                                                endif
                                            else
                                            endif
                                        else
                                            if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003C())then
                                                set udg_AS_EffectNumber = 10
                                                if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003C())then
                                                    set udg_AS_Effect10 = true
                                                    set udg_Point = GetUnitLoc(udg_Arct)
                                                    call CreateNUnitsAtLoc(1, 0x48303053, Player(1), udg_Point, bj_UNIT_FACING)
                                                    call UnitAddAbilityBJ(0x416C6F63, GetLastCreatedUnit())
                                                    call SetHeroLevelBJ(GetLastCreatedUnit(), udg_AS_AbilityLVL[10], false)
                                                    call SuspendHeroXPBJ(false, GetLastCreatedUnit())
                                                    set udg_AS_Effect10Unit = GetLastCreatedUnit()
                                                    call IssuePointOrderLocBJ(udg_AS_Effect10Unit, "attack", udg_Point)
                                                    call AddSpecialEffectTargetUnitBJ("origin", GetLastCreatedUnit(), "war3mapImported\\Flash.mdx")
                                                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                                    call SetUnitVertexColorBJ(GetLastCreatedUnit(), 100, 100, 100, 40.00)
                                                    call RemoveLocation(udg_Point)
                                                    call GroupAddUnitSimple(GetLastCreatedUnit(), udg_FollowersGroup)
                                                    call EnableTrigger(gg_trg_Follower_Movement)
                                                else
                                                    call AddSpecialEffectTargetUnitBJ("origin", udg_AS_Effect10Unit, "war3mapImported\\Holy-Nova.mdx")
                                                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                                    set udg_Point = GetUnitLoc(udg_AS_Effect10Unit)
                                                    set udg_UnitGroup = GetUnitsInRangeOfLocAll(400.00, udg_Point)
                                                    set udg_AbilityPower = (I2R(udg_CO_Power) + (I2R(udg_CO_Combo) + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true))))
                                                    call ForGroupBJ(udg_UnitGroup, function Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func003Func006A)
                                                    call RemoveLocation(udg_Point)
                                                    call DestroyGroup(udg_UnitGroup)
                                                endif
                                            else
                                                if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func001C())then
                                                    set udg_AS_EffectNumber = 11
                                                    if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func001Func003C())then
                                                        set udg_AS_Effect11 = true
                                                        set udg_ChanceBlock = (udg_ChanceBlock + 20.00)
                                                        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 2, ("Шанс блока: " + (I2S(R2I(udg_ChanceBlock)) + "%")))
                                                        call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "war3mapImported\\FrozenShell.MDX")
                                                        call SetUnitVertexColorBJ(udg_Arct, 30.00, 80.00, 100, 0)
                                                        set udg_AS_Effect11SE = GetLastCreatedEffectBJ()
                                                        call StartTimerBJ(udg_AS_TimerEffect11, false, (4.00 * I2R(udg_AS_AbilityLVL[11])))
                                                    else
                                                    endif
                                                else
                                                    if(Trig_Abilities_Effects_Func001Func009Func001Func001Func001Func001Func001Func001Func001Func001Func003Func001Func001C())then
                                                        set udg_AS_EffectNumber = 12
                                                        set udg_Point = GetUnitLoc(udg_Arct)
                                                        call SetTerrainTypeBJ(udg_Point, 0x446C7663, - 1, 2, 0)
                                                        call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
                                                        call UnitAddAbilityBJ(0x4130334C, GetLastCreatedUnit())
                                                        call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
                                                        call SetUnitAbilityLevelSwapped(0x4130334C, GetLastCreatedUnit(), udg_AS_AbilityLVL[12])
                                                        call IssueTargetOrderBJ(GetLastCreatedUnit(), "innerfire", udg_Arct)
                                                        call RemoveLocation(udg_Point)
                                                    else
                                                    endif
                                                endif
                                            endif
                                        endif
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
        if(Trig_Abilities_Effects_Func001Func010C())then
            set udg_QG_Count[7] = (udg_QG_Count[7] + 1)
            call ConditionalTriggerExecute(gg_trg_QG_Change_Text)
            set udg_AS_AbilityEXP[udg_AS_EffectNumber] = (udg_AS_AbilityEXP[udg_AS_EffectNumber] + 1)
            set udg_AS_Points = (udg_AS_Points + 1)
            call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 1, ("Очки навыков: " + I2S(udg_AS_Points)))
        else
        endif
    endif
    if(Trig_Abilities_Effects_Func003C())then
        set udg_AS_AbilityEXP[udg_AS_EffectNumber] = 0
        set udg_AS_AbilityLVL[udg_AS_EffectNumber] = (udg_AS_AbilityLVL[udg_AS_EffectNumber] + 1)
        set udg_AS_AbilityCountLVL = (udg_AS_AbilityCountLVL + 1)
        call ClearTextMessagesBJ(GetPlayersAll())
        call DisplayTimedTextToPlayer(GetLocalPlayer(), 0.9, 1.0, 2.5, ("Навык улучшен: |cFF00CD00" + (udg_AS_Name[udg_AS_EffectNumber] + (" |r(" + (I2S(udg_AS_AbilityLVL[udg_AS_EffectNumber]) + ")")))))
        call AddSpecialEffectTargetUnitBJ("chest", gg_unit_H000_0004, "war3mapImported\\SoundEffect3.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
    else
    endif
    if(Trig_Abilities_Effects_Func005C())then
        set udg_CO_Combo = (udg_CO_Combo + (1 * udg_ART[18]))
    else
    endif
endfunction
function InitTrig_Abilities_Effects takes nothing returns nothing
    set gg_trg_Abilities_Effects = CreateTrigger()
    call TriggerAddAction(gg_trg_Abilities_Effects, function Trig_Abilities_Effects_Actions)
endfunction