function Trig_Damage_Effects_Conditions takes nothing returns boolean
    return not udg_DamageEventOverride and GetUnitTypeId(udg_DamageEventSource) != 0x68666F6F and GetUnitTypeId(udg_DamageEventTarget) != 0x686B6E69
endfunction

function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func018Func017A takes nothing returns nothing
    if GetOwningPlayer(GetEnumUnit()) != Player(11) then
        call GroupRemoveUnitSimple(GetEnumUnit(), udg_PoisonGroup)
    endif
endfunction

function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func022Func008A takes nothing returns nothing
    if GetOwningPlayer(GetEnumUnit()) == Player(11) then
        call UnitDamageTargetBJ(GetLastCreatedUnit(), GetEnumUnit(), udg_DamageEventAmount, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
    endif
endfunction

function Trig_Damage_Effects_Actions takes nothing returns nothing
    if udg_DamageEventTarget == udg_Arct and GetRandomInt(1, 100) <= R2I(udg_ChanceBlock) then
        if udg_AS_Effect11 then
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
        endif
        set udg_DamageEventAmount = 0.00
        call AddSpecialEffectTargetUnitBJ("chest", udg_DamageEventTarget, "Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        if udg_ART[15] > 0 then
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
        endif
    else
        if udg_DamageEventTarget == udg_Arct and UnitHasBuffBJ(udg_Arct, 0x4230304A) then
            set udg_DamageEventAmount = 0.05
        endif
        if udg_DamageEventTarget == udg_Arct and (GetUnitTypeId(udg_DamageEventSource) == 0x6E303059 or GetUnitTypeId(udg_DamageEventSource) == 0x55303031) then
            set udg_Point = GetUnitLoc(udg_DamageEventTarget)
            call SetTerrainTypeBJ(udg_Point, 0x446C6176, - 1, 1, 0)
            call RemoveLocation(udg_Point)
        else
            if GetOwningPlayer(udg_DamageEventTarget) == Player(11) and udg_CO_Effect6Power > 0 then
                set udg_CO_Effect6Power = (udg_CO_Effect6Power - 1)
                set udg_AbilityPower = (I2R(udg_CO_Power) + I2R(udg_CO_Combo))
                call UnitDamageTargetBJ(udg_Arct, udg_DamageEventTarget, udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
                call AddSpecialEffectTargetUnitBJ("chest", udg_DamageEventTarget, "Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                if udg_CO_Effect6Power == 0 then
                    call DestroyEffectBJ(udg_CO_Effect6Sweep[1])
                    call DestroyEffectBJ(udg_CO_Effect6Sweep[2])
                endif
            else
                if GetOwningPlayer(udg_DamageEventTarget) == Player(11) and GetRandomInt(1, 100) <= 10 then
                    set udg_DamageEventAmount = 0.00
                    call AddSpecialEffectTargetUnitBJ("chest", GetTriggerUnit(), "Abilities\\Spells\\Human\\Defend\\DefendCaster.mdl")
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                else
                    if GetOwningPlayer(udg_DamageEventTarget) == Player(11) then
                        if udg_DamageEventSource == udg_Arct and UnitHasBuffBJ(udg_Arct, 0x42303048) then
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
                            if udg_DamageEventSource == udg_Arct and GetRandomInt(1, 100) <= R2I(udg_ChanceCrit) and GetUnitCurrentOrder(udg_DamageEventSource) != String2OrderIdBJ("blizzard") and GetUnitTypeId(udg_DamageEventSource) != 0x68303045 then
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
                                if udg_ART[17] > 0 then
                                    call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) + (1 * I2R(udg_ART[17]))))
                                endif
                                if udg_ART[21] > 0 then
                                    if GetRandomInt(1, 100) <= (3 * udg_ART[21]) then
                                        set udg_AS_SeriesNumber = 4
                                        call ConditionalTriggerExecute(gg_trg_Abilities_Effects)
                                    endif
                                endif
                                if udg_IG_ItemEnchantInt[2] > 0 then
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
                                endif
                                if udg_IG_ItemEnchantInt[3] > 0 then
                                    set udg_Point = GetUnitLoc(udg_Arct)
                                    call CreateNUnitsAtLoc(1, 0x68303045, Player(0), udg_Point, bj_UNIT_FACING)
                                    call UnitApplyTimedLifeBJ(0.20, 0x42544C46, GetLastCreatedUnit())
                                    call RemoveLocation(udg_Point)
                                    call UnitAddAbilityBJ(0x41303441, GetLastCreatedUnit())
                                    call IssueTargetOrderBJ(GetLastCreatedUnit(), "slow", udg_DamageEventTarget)
                                    call SetUnitManaBJ(udg_DamageEventTarget, (GetUnitStateSwap(UNIT_STATE_MANA, udg_DamageEventTarget) - 10.00))
                                    call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) + (I2R(udg_CO_Power) / 3.00)))
                                endif
                                if udg_IG_ItemEnchantInt[4] > 0 then
                                    set udg_Point = GetUnitLoc(udg_Arct)
                                    call CreateNUnitsAtLoc(1, 0x68303045, Player(0), udg_Point, bj_UNIT_FACING)
                                    call UnitApplyTimedLifeBJ(0.20, 0x42544C46, GetLastCreatedUnit())
                                    call RemoveLocation(udg_Point)
                                    call UnitAddAbilityBJ(0x41303439, GetLastCreatedUnit())
                                    call IssueTargetOrderBJ(GetLastCreatedUnit(), "faeriefire", udg_DamageEventTarget)
                                    call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + (udg_DamageEventAmount / 2.00)))
                                endif
                                if udg_IG_ItemEnchantInt[5] > 0 then
                                    set udg_Point = GetUnitLoc(udg_Arct)
                                    call CreateNUnitsAtLoc(1, 0x68303045, Player(0), udg_Point, bj_UNIT_FACING)
                                    call UnitApplyTimedLifeBJ(0.20, 0x42544C46, GetLastCreatedUnit())
                                    call RemoveLocation(udg_Point)
                                    call UnitAddAbilityBJ(0x41303446, GetLastCreatedUnit())
                                    call IssueTargetOrderBJ(GetLastCreatedUnit(), "thunderbolt", udg_DamageEventTarget)
                                    if not udg_EnchantCritBool then
                                        set udg_EnchantCritBool = true
                                        set udg_ChanceCrit = (udg_ChanceCrit + 5.00)
                                        call StartTimerBJ(udg_EnchantCritTimer, false, 5.00)
                                        call MultiboardSetItemValueBJ(udg_AttributesBoard, 1, 3, ("Шанс разгрома: " + (I2S(R2I(udg_ChanceCrit)) + "%")))
                                    endif
                                endif
                                if udg_IG_ItemEnchantInt[6] > 0 then
                                    set udg_Point = GetUnitLoc(udg_DamageEventTarget)
                                    set udg_UnitGroup = GetUnitsInRangeOfLocAll(300.00, udg_Point)
                                    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Arcane Nova.mdx")
                                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                    call RemoveLocation(udg_Point)
                                    call GroupRemoveUnitSimple(udg_DamageEventTarget, udg_UnitGroup)
                                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                    call ForGroupBJ(udg_UnitGroup, function Trig_Damage_Effects_Func001Func002Func006Func002Func001Func001Func015Func022Func008A)
                                    call DestroyGroup(udg_UnitGroup)
                                endif
                            else
                                if udg_DamageEventSource == udg_Arct and UnitHasBuffBJ(udg_DamageEventTarget, 0x42303046) then
                                    call UnitDamageTargetBJ(udg_DamageEventTarget, udg_DamageEventSource, udg_DamageEventAmount, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
                                endif
                            endif
                        endif
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
