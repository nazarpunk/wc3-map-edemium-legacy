
function Trig_Armor_Use_Conditions takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x4130334D))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func002C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false)
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_FLYING) == false)
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002001 takes nothing returns boolean
    return(IsUnitDeadBJ(GetFilterUnit()) == false)
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002001 takes nothing returns boolean
    return(IsUnitAlly(GetFilterUnit(), GetOwningPlayer(udg_Arct)) == false)
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002002001 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_MECHANICAL) == false)
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002002002 takes nothing returns boolean
    return(IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false)
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002002001(), Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002002002())
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002001(), Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002002())
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002001(), Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002002())
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002 takes nothing returns boolean
    return GetBooleanAnd(Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002001(), Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002002())
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003 takes nothing returns boolean
    return GetBooleanAnd(Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003001(), Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003002())
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func009Func002C takes nothing returns boolean
    if(not(udg_KB_Skip == 0))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001Func002Func009A takes nothing returns nothing
    call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_SB_Damage[1], ATTACK_TYPE_NORMAL, DAMAGE_TYPE_FORCE)
    if(Trig_Armor_Use_Func002Func003Func001Func001Func002Func009Func002C())then
        call EnableTrigger(gg_trg_Knockback_System)
    else
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
function Trig_Armor_Use_Func002Func003Func001Func001Func002C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[1] == 5))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003Func001Func003Func004Func001C takes nothing returns boolean
    if(not(udg_RandomNumber == 2))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003Func001Func003Func004C takes nothing returns boolean
    if(not(udg_RandomNumber == 1))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003Func001Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[1] == 4))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002Func003C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[1] == 3))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Func002C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[1] == 2))then
        return false
    endif
    return true
endfunction
function Trig_Armor_Use_Actions takes nothing returns nothing
    if(Trig_Armor_Use_Func002C())then
        set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_Arct) * 20.00) / 100.00)
        if(Trig_Armor_Use_Func002Func002C())then
            call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) - udg_AbilityPower))
            set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 10.00) / 100.00)
            call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) + udg_AbilityPower))
            call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "war3mapImported\\Mana Burn Red.mdx")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
        else
        endif
    else
        if(Trig_Armor_Use_Func002Func003C())then
            set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
            if(Trig_Armor_Use_Func002Func003Func003C())then
                call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_Arct) * 20.00) / 100.00)
                call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
                call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "war3mapImported\\Mana Burn.mdx")
                call DestroyEffectBJ(GetLastCreatedEffectBJ())
            else
            endif
        else
            if(Trig_Armor_Use_Func002Func003Func001C())then
                set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 50.00) / 100.00)
                if(Trig_Armor_Use_Func002Func003Func001Func003C())then
                    call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                    set udg_Point = GetUnitLoc(udg_Arct)
                    set udg_RandomNumber = GetRandomInt(1, 3)
                    if(Trig_Armor_Use_Func002Func003Func001Func003Func004C())then
                        call CreateItemLoc(0x49303131, udg_Point)
                    else
                        if(Trig_Armor_Use_Func002Func003Func001Func003Func004Func001C())then
                            call CreateItemLoc(0x49303055, udg_Point)
                        else
                            call CreateItemLoc(0x49303143, udg_Point)
                        endif
                    endif
                    call PlaySoundAtPointBJ(gg_snd_FrogWhat1, 100.00, udg_Point, 150.00)
                    call RemoveLocation(udg_Point)
                    call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "war3mapImported\\Holy_Heal_Small.mdx")
                    call DestroyEffectBJ(GetLastCreatedEffectBJ())
                else
                endif
            else
                if(Trig_Armor_Use_Func002Func003Func001Func001C())then
                    set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
                    if(Trig_Armor_Use_Func002Func003Func001Func001Func002C())then
                        call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                        set udg_SB_Damage[1] = (30.00 + (I2R(GetHeroStatBJ(bj_HEROSTAT_STR, udg_Arct, true)) + I2R(GetHeroStatBJ(bj_HEROSTAT_AGI, udg_Arct, true))))
                        set udg_KB_Point[3] = GetUnitLoc(udg_Arct)
                        call AddSpecialEffectTargetUnitBJ("chest", udg_Arct, "war3mapImported\\ArcaneExplosion.mdx")
                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                        set udg_KB_Point[0] = udg_KB_Point[3]
                        set udg_SB_Group[1] = GetUnitsInRangeOfLocMatching(300.00, udg_KB_Point[3], Condition(function Trig_Armor_Use_Func002Func003Func001Func001Func002Func008002003))
                        call ForGroupBJ(udg_SB_Group[1], function Trig_Armor_Use_Func002Func003Func001Func001Func002Func009A)
                        call DestroyGroup(udg_SB_Group[1])
                        call RemoveLocation(udg_KB_Point[0])
                        call RemoveLocation(udg_KB_Point[3])
                    else
                    endif
                else
                endif
            endif
        endif
    endif
endfunction
function InitTrig_Armor_Use takes nothing returns nothing
    set gg_trg_Armor_Use = CreateTrigger()
    call DisableTrigger(gg_trg_Armor_Use)
    call TriggerRegisterUnitEvent(gg_trg_Armor_Use, gg_unit_H000_0004, EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Armor_Use, Condition(function Trig_Armor_Use_Conditions))
    call TriggerAddAction(gg_trg_Armor_Use, function Trig_Armor_Use_Actions)
endfunction