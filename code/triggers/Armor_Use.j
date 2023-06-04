function Trig_Armor_Use_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x4130334D
endfunction

function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003 takes nothing returns boolean
    if IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) then
        return false
    endif
    if IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING) then
        return false
    endif
    if IsUnitType(GetFilterUnit(), UNIT_TYPE_MECHANICAL) then
        return false
    endif
    if IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) then
        return false
    endif
    if not UnitAlive(GetFilterUnit()) then
        return false
    endif
    if IsUnitAlly(GetFilterUnit(), GetOwningPlayer(ArctUnit)) then
        return false
    endif
    return true
endfunction

function Trig_Armor_Use_Func002Func003Func001Func001Func002Func009A takes nothing returns nothing
    call UnitDamageTargetBJ(ArctUnit, GetEnumUnit(), udg_SB_Damage[1], ATTACK_TYPE_NORMAL, DAMAGE_TYPE_FORCE)
    if udg_KB_Skip == 0 then
        call EnableTrigger(gg_trg_Knockback_System)
    endif
    set udg_KB_Skip = (udg_KB_Skip + 1)
    set udg_KB_Times = (udg_KB_Times + 1)
    set udg_KB_Off[udg_KB_Times] = true
    set udg_KB_Target[udg_KB_Times] = GetEnumUnit()
    call PauseUnitBJ(true, udg_KB_Target[udg_KB_Times])
    call DestroyEffectBJ(udg_CreepCastEffect[GetUnitUserData(udg_KB_Target[udg_KB_Times])])
    set udg_KB_Point[1] = GetUnitLoc(udg_KB_Target[udg_KB_Times])
    set udg_KB_Angle[udg_KB_Times] = AngleBetweenPoints(udg_KB_Point[0], udg_KB_Point[1])
    set udg_KB_Distance[udg_KB_Times] = 200.00
    set udg_KB_Speed[udg_KB_Times] = (udg_KB_Distance[udg_KB_Times] / 25.00)
    set udg_KB_Spam[udg_KB_Times] = 10
    call RemoveLocation(udg_KB_Point[1])
endfunction

function Trig_Armor_Use_Actions takes nothing returns nothing
    if udg_IG_ItemEnchant[1] == 2 then
        set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_LIFE, ArctUnit) * 20.00) / 100.00)
        if GetUnitStateSwap(UNIT_STATE_LIFE, ArctUnit) > udg_AbilityPower then
            call SetUnitLifeBJ(ArctUnit, (GetUnitStateSwap(UNIT_STATE_LIFE, ArctUnit) - udg_AbilityPower))
            set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, ArctUnit) * 10.00) / 100.00)
            call SetUnitManaBJ(ArctUnit, (GetUnitStateSwap(UNIT_STATE_MANA, ArctUnit) + udg_AbilityPower))
            call AddSpecialEffectTargetUnitBJ("origin", ArctUnit, "war3mapImported\\Mana Burn Red.mdx")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
        endif
    else
        if udg_IG_ItemEnchant[1] == 3 then
            set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, ArctUnit) * 20.00) / 100.00)
            if GetUnitStateSwap(UNIT_STATE_MANA, ArctUnit) > udg_AbilityPower then
                call SetUnitManaBJ(ArctUnit, (GetUnitStateSwap(UNIT_STATE_MANA, ArctUnit) - udg_AbilityPower))
                set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_LIFE, ArctUnit) * 20.00) / 100.00)
                call SetUnitLifeBJ(ArctUnit, (GetUnitStateSwap(UNIT_STATE_LIFE, ArctUnit) + udg_AbilityPower))
                call AddSpecialEffectTargetUnitBJ("origin", ArctUnit, "war3mapImported\\Mana Burn.mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
            endif
        else
            if udg_IG_ItemEnchant[1] == 4 then
                set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, ArctUnit) * 50.00) / 100.00)
                if GetUnitStateSwap(UNIT_STATE_MANA, ArctUnit) > udg_AbilityPower then
                    call SetUnitManaBJ(ArctUnit, (GetUnitStateSwap(UNIT_STATE_MANA, ArctUnit) - udg_AbilityPower))
                    set udg_Point = GetUnitLoc(ArctUnit)
                    set udg_RandomNumber = GetRandomInt(1, 3)
                    if udg_RandomNumber == 1 then
                        call CreateItemLoc(0x49303131, udg_Point)
                    else
                        if udg_RandomNumber == 2 then
                            call CreateItemLoc(0x49303055, udg_Point)
                        else
                            call CreateItemLoc(0x49303143, udg_Point)
                        endif
                    endif
                    call PlaySoundAtPointBJ(gg_snd_FrogWhat1, 100.00, udg_Point, 150.00)
                    call RemoveLocation(udg_Point)
                    call AddSpecialEffectTargetUnitBJ("chest", ArctUnit, "war3mapImported\\Holy_Heal_Small.mdx")
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                endif
            else
                if udg_IG_ItemEnchant[1] == 5 then
                    set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, ArctUnit) * 20.00) / 100.00)
                    if GetUnitStateSwap(UNIT_STATE_MANA, ArctUnit) > udg_AbilityPower then
                        call SetUnitManaBJ(ArctUnit, (GetUnitStateSwap(UNIT_STATE_MANA, ArctUnit) - udg_AbilityPower))
                        set udg_SB_Damage[1] = (30.00 + (I2R(GetHeroStatBJ(bj_HEROSTAT_STR, ArctUnit, true)) + I2R(GetHeroStatBJ(bj_HEROSTAT_AGI, ArctUnit, true))))
                        set udg_KB_Point[3] = GetUnitLoc(ArctUnit)
                        call AddSpecialEffectTargetUnitBJ("chest", ArctUnit, "war3mapImported\\ArcaneExplosion.mdx")
                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                        set udg_KB_Point[0] = udg_KB_Point[3]
                        set udg_SB_Group[1] = GetUnitsInRangeOfLocMatching(300.00, udg_KB_Point[3], Condition(function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003))
                        call ForGroupBJ(udg_SB_Group[1], function Trig_Armor_Use_Func002Func003Func001Func001Func002Func009A)
                        call DestroyGroup(udg_SB_Group[1])
                        call RemoveLocation(udg_KB_Point[0])
                        call RemoveLocation(udg_KB_Point[3])
                    endif
                endif
            endif
        endif
    endif
endfunction

function InitTrig_Armor_Use takes nothing returns nothing
    set gg_trg_Armor_Use = CreateTrigger()
    call DisableTrigger(gg_trg_Armor_Use)
    call TriggerRegisterUnitEvent(gg_trg_Armor_Use, ArctUnit, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Armor_Use, Condition(function Trig_Armor_Use_Conditions))
    call TriggerAddAction(gg_trg_Armor_Use, function Trig_Armor_Use_Actions)
endfunction
