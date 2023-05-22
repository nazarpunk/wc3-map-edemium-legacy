
function Trig_Damage_Effects_Func002C takes nothing returns boolean
    if(not(udg_DamageEventOverride == false))then
        return false
    endif
    if(not(GetUnitTypeId(udg_DamageEventSource) != 0x68666F6F))then
        return false
    endif
    if(not(GetUnitTypeId(udg_DamageEventTarget) != 0x686B6E69))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Conditions takes nothing returns boolean
    if(not Trig_Damage_Effects_Func002C())then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func001C takes nothing returns boolean
    if(not(udg_DamageEventTarget == udg_Arct))then
        return false
    endif
    if(not(UnitHasBuffBJ(udg_Arct, 0x4230304A) == true))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func005C takes nothing returns boolean
    if((GetUnitTypeId(udg_DamageEventSource) == 0x6E303059))then
        return true
    endif
    if((GetUnitTypeId(udg_DamageEventSource) == 0x55303031))then
        return true
    endif
    return false
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(udg_DamageEventTarget) == Player(11)))then
        return false
    endif
    if(not(udg_CO_Effect6Power > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func002C takes nothing returns boolean
    if(not(udg_DamageEventSource == udg_Arct))then
        return false
    endif
    if(not(UnitHasBuffBJ(udg_DamageEventTarget, 0x42303046) == true))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func003C takes nothing returns boolean
    if(not(udg_DamageEventSource == udg_Arct))then
        return false
    endif
    if(not(GetRandomInt(1, 100) <= R2I(udg_ChanceCrit)))then
        return false
    endif
    if(not(GetUnitCurrentOrder(udg_DamageEventSource) != String2OrderIdBJ("blizzard")))then
        return false
    endif
    if(not(GetUnitTypeId(udg_DamageEventSource) != 0x68303045))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func016C takes nothing returns boolean
    if(not(udg_ART[17] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func017Func001C takes nothing returns boolean
    if(not(GetRandomInt(1, 100) <= (3 * udg_ART[21])))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func017C takes nothing returns boolean
    if(not(udg_ART[21] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func018Func017Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) != Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func018Func017A takes nothing returns nothing
    if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func018Func017Func001C())then
        call GroupRemoveUnitSimple(GetEnumUnit(), udg_PoisonGroup)
    else
    endif
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func018C takes nothing returns boolean
    if(not(udg_IG_ItemEnchantInt[2] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func019C takes nothing returns boolean
    if(not(udg_IG_ItemEnchantInt[3] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func020C takes nothing returns boolean
    if(not(udg_IG_ItemEnchantInt[4] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func021Func008C takes nothing returns boolean
    if(not(udg_EnchantCritBool == false))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func021C takes nothing returns boolean
    if(not(udg_IG_ItemEnchantInt[5] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func022Func008Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func022Func008A takes nothing returns nothing
    if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func022Func008Func001C())then
        call UnitDamageTargetBJ(GetLastCreatedUnit(), GetEnumUnit(), udg_DamageEventAmount, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
    else
    endif
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func022C takes nothing returns boolean
    if(not(udg_IG_ItemEnchantInt[6] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015C takes nothing returns boolean
    if(not Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func003C())then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001C takes nothing returns boolean
    if(not(udg_DamageEventSource == udg_Arct))then
        return false
    endif
    if(not(UnitHasBuffBJ(udg_Arct, 0x42303048) == true))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(udg_DamageEventTarget) == Player(11)))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func002C takes nothing returns boolean
    if(not(GetOwningPlayer(udg_DamageEventTarget) == Player(11)))then
        return false
    endif
    if(not(GetRandomInt(1, 100) <= 10))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006Func008C takes nothing returns boolean
    if(not(udg_CO_Effect6Power == 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002Func006C takes nothing returns boolean
    if(not Trig_Damage_Effects_Func001Func002Func006Func001C())then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func002C takes nothing returns boolean
    if(not(udg_DamageEventTarget == udg_Arct))then
        return false
    endif
    if(not Trig_Damage_Effects_Func001Func002Func005C())then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func003C takes nothing returns boolean
    if(not(udg_DamageEventTarget == udg_Arct))then
        return false
    endif
    if(not(GetRandomInt(1, 100) <= R2I(udg_ChanceBlock)))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func004C takes nothing returns boolean
    if(not(udg_AS_Effect11 == true))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001Func008C takes nothing returns boolean
    if(not(udg_ART[15] > 0))then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Func001C takes nothing returns boolean
    if(not Trig_Damage_Effects_Func001Func003C())then
        return false
    endif
    return true
endfunction
function Trig_Damage_Effects_Actions takes nothing returns nothing
    if(Trig_Damage_Effects_Func001C())then
        if(Trig_Damage_Effects_Func001Func004C())then
            set udg_AbilityPower = (I2R(udg_CO_Power) + (I2R(udg_CO_Combo) + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true))))
            call UnitDamageTargetBJ(udg_Arct, udg_DamageEventSource, udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
            call AddSpecialEffectTargetUnitBJ("origin", udg_DamageEventSource, "Abilities\\Weapons\\FrostWyrmMissile\\FrostWyrmMissile.mdl")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
            call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
            call CreateTextTagUnitBJ(("+" + I2S(R2I(udg_AbilityPower))), udg_Arct, 0, 8.00, 0.00, 100.00, 0.00, 0)
            call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
            call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
            call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.70)
            call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.35)
        else
        endif
        set udg_DamageEventAmount = 0.00
        call AddSpecialEffectTargetUnitBJ("chest", udg_DamageEventTarget, "Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        if(Trig_Damage_Effects_Func001Func008C())then
            set udg_Point = GetUnitLoc(udg_Arct)
            set udg_Point2 = PolarProjectionBJ(udg_Point, 200.00, GetRandomDirectionDeg())
            call CreateNUnitsAtLoc(1, 0x48303030, Player(1), udg_Point2, bj_UNIT_FACING)
            call RemoveLocation(udg_Point)
            call RemoveLocation(udg_Point2)
            call SuspendHeroXPBJ(false, GetLastCreatedUnit())
            call UnitApplyTimedLifeBJ(10.00, 0x42544C46, GetLastCreatedUnit())
            call SetUnitLifeBJ(GetLastCreatedUnit(), GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct))
            call UnitAddAbilityBJ(0x416C6F63, GetLastCreatedUnit())
            call UnitRemoveAbilityBJ(0x41303459, GetLastCreatedUnit())
            call ModifyHeroStat(bj_HEROSTAT_STR, GetLastCreatedUnit(), bj_MODIFYMETHOD_ADD, (10 * udg_ART[15]))
            call ModifyHeroStat(bj_HEROSTAT_AGI, GetLastCreatedUnit(), bj_MODIFYMETHOD_ADD, (10 * udg_ART[15]))
            call ModifyHeroStat(bj_HEROSTAT_INT, GetLastCreatedUnit(), bj_MODIFYMETHOD_ADD, (10 * udg_ART[15]))
            call UnitAddItemByIdSwapped(0x4930304C, GetLastCreatedUnit())
            call SetUnitVertexColorBJ(GetLastCreatedUnit(), 50.00, 50.00, 100, 20.00)
        else
        endif
    else
        if(Trig_Damage_Effects_Func001Func001C())then
            set udg_DamageEventAmount = 0.05
        else
        endif
        if(Trig_Damage_Effects_Func001Func002C())then
            set udg_Point = GetUnitLoc(udg_DamageEventTarget)
            call SetTerrainTypeBJ(udg_Point, 0x446C6176, - 1, 1, 0)
            call RemoveLocation(udg_Point)
        else
            if(Trig_Damage_Effects_Func001Func002Func006C())then
                set udg_CO_Effect6Power = (udg_CO_Effect6Power - 1)
                set udg_AbilityPower = (I2R(udg_CO_Power) + I2R(udg_CO_Combo))
                call UnitDamageTargetBJ(udg_Arct, udg_DamageEventTarget, udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
                call AddSpecialEffectTargetUnitBJ("chest", udg_DamageEventTarget, "Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                if(Trig_Damage_Effects_Func001Func002Func006Func008C())then
                    call DestroyEffectBJ(udg_CO_Effect6Sweep[1])
                    call DestroyEffectBJ(udg_CO_Effect6Sweep[2])
                else
                endif
            else
                if(Trig_Damage_Effects_Func001Func002Func006Func002C())then
                    set udg_DamageEventAmount = 0.00
                    call AddSpecialEffectTargetUnitBJ("chest", GetAttackedUnitBJ(), "Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl")
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                else
                    if(Trig_Damage_Effects_Func001Func002Func006Func002Func001C())then
                        if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001C())then
                            set udg_DamageEventAmount = (udg_DamageEventAmount * 3.00)
                            set udg_DamageEventAmountINT = R2I(udg_DamageEventAmount)
                            call TriggerExecute(gg_trg_Crit_Specialeffect)
                            set udg_Point = GetUnitLoc(udg_DamageEventTarget)
                            call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\BloodEX-Small.mdx")
                            call DestroyEffectBJ(GetLastCreatedEffectBJ())
                            call RemoveLocation(udg_Point)
                            call CreateTextTagUnitBJ((I2S(udg_DamageEventAmountINT) + "!"), udg_DamageEventTarget, 0, 12.00, 100.00, 100.00, 0.00, 0.00)
                            call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 125.00, 90.00)
                            call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                            call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.50)
                            call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.00)
                        else
                            if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015C())then
                                set udg_DamageEventAmount = (udg_DamageEventAmount * 3.00)
                                set udg_DamageEventAmountINT = R2I(udg_DamageEventAmount)
                                call TriggerExecute(gg_trg_Crit_Specialeffect)
                                set udg_Point = GetUnitLoc(udg_DamageEventTarget)
                                call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\BloodEX-Small.mdx")
                                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                call RemoveLocation(udg_Point)
                                call CreateTextTagUnitBJ((I2S(udg_DamageEventAmountINT) + "!"), udg_DamageEventTarget, 0, 12.00, 100.00, 100.00, 0.00, 0.00)
                                call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 125.00, 90.00)
                                call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
                                call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 1.50)
                                call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 1.00)
                                if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func016C())then
                                    call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) + (1 * I2R(udg_ART[17]))))
                                else
                                endif
                                if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func017C())then
                                    if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func017Func001C())then
                                        set udg_AS_SeriesNumber = 4
                                        call ConditionalTriggerExecute(gg_trg_Abilities_Effects)
                                    else
                                    endif
                                else
                                endif
                                if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func018C())then
                                    set udg_Point = GetUnitLoc(udg_Arct)
                                    call CreateNUnitsAtLoc(1, 0x68303045, Player(0), udg_Point, bj_UNIT_FACING)
                                    call UnitApplyTimedLifeBJ(0.20, 0x42544C46, GetLastCreatedUnit())
                                    call RemoveLocation(udg_Point)
                                    call UnitAddAbilityBJ(0x41303442, GetLastCreatedUnit())
                                    set udg_Point = GetUnitLoc(udg_DamageEventTarget)
                                    call IssuePointOrderLocBJ(GetLastCreatedUnit(), "breathoffrost", udg_Point)
                                    call RemoveLocation(udg_Point)
                                    set udg_Point = GetUnitLoc(udg_Arct)
                                    set udg_Point2 = PolarProjectionBJ(udg_Point, 200.00, GetUnitFacing(udg_Arct))
                                    call RemoveLocation(udg_Point)
                                    set udg_UnitGroup = GetUnitsInRangeOfLocAll(400.00, udg_Point2)
                                    call RemoveLocation(udg_Point2)
                                    call GroupAddGroup(udg_UnitGroup, udg_PoisonGroup)
                                    call DestroyGroup(udg_UnitGroup)
                                    call ForGroupBJ(udg_PoisonGroup, function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func018Func017A)
                                else
                                endif
                                if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func019C())then
                                    set udg_Point = GetUnitLoc(udg_Arct)
                                    call CreateNUnitsAtLoc(1, 0x68303045, Player(0), udg_Point, bj_UNIT_FACING)
                                    call UnitApplyTimedLifeBJ(0.20, 0x42544C46, GetLastCreatedUnit())
                                    call RemoveLocation(udg_Point)
                                    call UnitAddAbilityBJ(0x41303441, GetLastCreatedUnit())
                                    call IssueTargetOrderBJ(GetLastCreatedUnit(), "slow", udg_DamageEventTarget)
                                    call SetUnitManaBJ(udg_DamageEventTarget, (GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventTarget) - 10.00))
                                    call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) + (I2R(udg_CO_Power) / 3.00)))
                                else
                                endif
                                if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func020C())then
                                    set udg_Point = GetUnitLoc(udg_Arct)
                                    call CreateNUnitsAtLoc(1, 0x68303045, Player(0), udg_Point, bj_UNIT_FACING)
                                    call UnitApplyTimedLifeBJ(0.20, 0x42544C46, GetLastCreatedUnit())
                                    call RemoveLocation(udg_Point)
                                    call UnitAddAbilityBJ(0x41303439, GetLastCreatedUnit())
                                    call IssueTargetOrderBJ(GetLastCreatedUnit(), "faeriefire", udg_DamageEventTarget)
                                    call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + (udg_DamageEventAmount / 2.00)))
                                else
                                endif
                                if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func021C())then
                                    set udg_Point = GetUnitLoc(udg_Arct)
                                    call CreateNUnitsAtLoc(1, 0x68303045, Player(0), udg_Point, bj_UNIT_FACING)
                                    call UnitApplyTimedLifeBJ(0.20, 0x42544C46, GetLastCreatedUnit())
                                    call RemoveLocation(udg_Point)
                                    call UnitAddAbilityBJ(0x41303446, GetLastCreatedUnit())
                                    call IssueTargetOrderBJ(GetLastCreatedUnit(), "thunderbolt", udg_DamageEventTarget)
                                    if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func021Func008C())then
                                        set udg_EnchantCritBool = true
                                        set udg_ChanceCrit = (udg_ChanceCrit + 5.00)
                                        call StartTimerBJ(udg_EnchantCritTimer, false, 5.00)
                                        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
                                    else
                                    endif
                                else
                                endif
                                if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func022C())then
                                    set udg_Point = GetUnitLoc(udg_DamageEventTarget)
                                    set udg_UnitGroup = GetUnitsInRangeOfLocAll(300.00, udg_Point)
                                    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Arcane Nova.mdx")
                                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                    call RemoveLocation(udg_Point)
                                    call GroupRemoveUnitSimple(udg_DamageEventTarget, udg_UnitGroup)
                                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                    call ForGroupBJ(udg_UnitGroup, function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func022Func008A)
                                    call DestroyGroup(udg_UnitGroup)
                                else
                                endif
                            else
                                if(Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func002C())then
                                    call UnitDamageTargetBJ(udg_DamageEventTarget, udg_DamageEventSource, udg_DamageEventAmount, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
                                else
                                endif
                            endif
                        endif
                    else
                    endif
                endif
            endif
        endif
    endif
endfunction
function InitTrig_Damage_Effects takes nothing returns nothing
    set gg_trg_Damage_Effects = CreateTrigger()
    call TriggerRegisterVariableEvent(gg_trg_Damage_Effects, "udg_DamageModifierEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Damage_Effects, Condition(function Trig_Damage_Effects_Conditions))
    call TriggerAddAction(gg_trg_Damage_Effects, function Trig_Damage_Effects_Actions)
endfunction