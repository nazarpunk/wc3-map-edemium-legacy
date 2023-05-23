
function Trig_Talisman_Use_Func001C takes nothing returns boolean
    if((GetSpellAbilityId() == 0x41303532))then
        return true
    endif
    if((GetSpellAbilityId() == 0x41303347))then
        return true
    endif
    return false
endfunction

function Trig_Talisman_Use_Conditions takes nothing returns boolean
    if(not Trig_Talisman_Use_Func001C())then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func001Func002C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[2] == 9))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func003Func007Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func003Func007A takes nothing returns nothing
    if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func003Func007Func001C())then
        call IssueTargetOrderBJ(GetEnumUnit(), "attack", GetLastCreatedUnit())
    endif
endfunction

function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[2] == 8))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[2] == 7))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func003Func002C takes nothing returns boolean
    if(not(GetUnitAbilityLevelSwapped(0x41303345, GetSpellTargetUnit()) == 1))then
        return false
    endif
    if(not(GetUnitStateSwap(UNIT_STATE_LIFE, GetSpellTargetUnit()) < I2R(udg_RandomNumber)))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[2] == 6))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func001Func001Func003Func001C takes nothing returns boolean
    if(not(GetUnitAbilityLevelSwapped(0x41303345, GetSpellTargetUnit()) == 1))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func001Func001Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[2] == 5))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func001Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[2] == 4))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func003Func013Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(11)))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001Func003Func013A takes nothing returns nothing
    if(Trig_Talisman_Use_Func002Func001Func003Func013Func001C())then
        call UnitDamageTargetBJ(udg_Arct, GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
    endif
endfunction

function Trig_Talisman_Use_Func002Func001Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func001C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[2] == 3))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func003Func002C takes nothing returns boolean
    if(not(udg_SB_Skip == 0))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002Func003C takes nothing returns boolean
    if(not(GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) > udg_AbilityPower))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Func002C takes nothing returns boolean
    if(not(udg_IG_ItemEnchant[2] == 2))then
        return false
    endif
    return true
endfunction

function Trig_Talisman_Use_Actions takes nothing returns nothing
    if(Trig_Talisman_Use_Func002C())then
        set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 10.00) / 100.00)
        if(Trig_Talisman_Use_Func002Func003C())then
            call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
            if(Trig_Talisman_Use_Func002Func003Func002C())then
                call EnableTrigger(gg_trg_Lightspeed_Loop)
            endif
            set udg_SB_Skip = (udg_SB_Skip + 1)
            set udg_SB_Times = (udg_SB_Times + 1)
            set udg_SB_On[udg_SB_Times] = true
            set udg_SB_Hero[udg_SB_Times] = GetTriggerUnit()
            set udg_SB_Level[udg_SB_Times] = 1
            set udg_SB_Point[0] = GetUnitLoc(GetTriggerUnit())
            set udg_SB_Point[1] = GetSpellTargetLoc()
            set udg_SB_Distance[udg_SB_Times] = DistanceBetweenPoints(udg_SB_Point[0], udg_SB_Point[1])
            set udg_SB_Angle[udg_SB_Times] = AngleBetweenPoints(udg_SB_Point[0], udg_SB_Point[1])
            set udg_SB_Speed[udg_SB_Times] = 15.00
            set udg_SB_Damage[udg_SB_Times] = (30.00 + I2R(GetHeroStatBJ(bj_HEROSTAT_STR, udg_Arct, true)))
            set udg_SB_Spam[udg_SB_Times] = 0
            call PauseUnitBJ(true, GetTriggerUnit())
            call SetUnitAnimation(GetTriggerUnit(), "Attack Slam")
            call RemoveLocation(udg_SB_Point[0])
            call RemoveLocation(udg_SB_Point[1])
        endif
    else
        if(Trig_Talisman_Use_Func002Func001C())then
            set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
            if(Trig_Talisman_Use_Func002Func001Func003C())then
                call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                set udg_Point = GetUnitLoc(udg_Arct)
                set udg_PointTalisman = GetSpellTargetLoc()
                call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
                call RemoveLocation(udg_Point)
                call UnitAddAbilityBJ(0x4130364E, GetLastCreatedUnit())
                call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
                call IssuePointOrderLocBJ(GetLastCreatedUnit(), "clusterrockets", udg_PointTalisman)
                call PolledWait(0.60)
                set udg_AbilityPower = (2.00 * (I2R(GetHeroStatBJ(bj_HEROSTAT_STR, udg_Arct, true)) + I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true))))
                set udg_AbilityPower = (udg_AbilityPower + 30.00)
                set udg_UnitGroup = GetUnitsInRangeOfLocAll(300.00, udg_PointTalisman)
                call ForGroupBJ(udg_UnitGroup, function Trig_Talisman_Use_Func002Func001Func003Func013A)
                call RemoveLocation(udg_PointTalisman)
                call GroupClear(udg_UnitGroup)
                call DestroyGroup(udg_UnitGroup)
            endif
        else
            if(Trig_Talisman_Use_Func002Func001Func001C())then
                set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
                if(Trig_Talisman_Use_Func002Func001Func001Func003C())then
                    call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                    set udg_Point = GetUnitLoc(GetSpellTargetUnit())
                    call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
                    call RemoveLocation(udg_Point)
                    call UnitAddAbilityBJ(0x53303030, GetLastCreatedUnit())
                    call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
                    call IssueTargetOrderBJ(GetLastCreatedUnit(), "cripple", GetSpellTargetUnit())
                endif
            else
                if(Trig_Talisman_Use_Func002Func001Func001Func001C())then
                    set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
                    if(Trig_Talisman_Use_Func002Func001Func001Func001Func003C())then
                        if(Trig_Talisman_Use_Func002Func001Func001Func001Func003Func001C())then
                            call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                            call SetUnitOwner(GetSpellTargetUnit(), Player(1), true)
                            call GroupAddUnitSimple(GetSpellTargetUnit(), udg_FollowersGroup)
                            call UnitApplyTimedLifeBJ(I2R(GetHeroStatBJ(bj_HEROSTAT_INT, udg_Arct, true)), 0x42544C46, GetSpellTargetUnit())
                            call EnableTrigger(gg_trg_Follower_Movement)
                            call AddSpecialEffectTargetUnitBJ("origin", GetSpellTargetUnit(), "war3mapImported\\DarknessLeechTarget_Portrait.mdx")
                            call DestroyEffectBJ(GetLastCreatedEffectBJ())
                        endif
                    endif
                else
                    if(Trig_Talisman_Use_Func002Func001Func001Func001Func001C())then
                        set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
                        if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func003C())then
                            set udg_RandomNumber = ((R2I(GetUnitStateSwap(UNIT_STATE_MAX_LIFE, GetSpellTargetUnit())) * 50) / 100)
                            if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func003Func002C())then
                                call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                                call AddSpecialEffectTargetUnitBJ("origin", GetSpellTargetUnit(), "war3mapImported\\BloodEX-Special-2.mdx")
                                call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                call KillUnit(GetSpellTargetUnit())
                                set udg_RandomNumber = (GetHeroStatBJ(bj_HEROSTAT_AGI, udg_Arct, true) / 5)
                                set udg_LightOrbs[2] = (udg_LightOrbs[2] + udg_RandomNumber)
                                set udg_LightIterations = (udg_LightIterations + udg_RandomNumber)
                                call EnableTrigger(gg_trg_Orbs_Spawn)
                            endif
                        endif
                    else
                        if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001C())then
                            set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
                            if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func003C())then
                                call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                                set udg_Point = GetUnitLoc(GetSpellTargetUnit())
                                set udg_Point2 = PolarProjectionBJ(udg_Point, GetRandomReal(300.00, 450.00), GetRandomDirectionDeg())
                                call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
                                call RemoveLocation(udg_Point)
                                call UnitAddAbilityBJ(0x4130364F, GetLastCreatedUnit())
                                call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
                                call IssueTargetOrderBJ(GetLastCreatedUnit(), "hex", GetSpellTargetUnit())
                                call IssuePointOrderLocBJ(GetSpellTargetUnit(), "move", udg_Point2)
                                call RemoveLocation(udg_Point2)
                            endif
                        else
                            if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001C())then
                                set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
                                if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func003C())then
                                    call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                                    set udg_Point = GetSpellTargetLoc()
                                    call CreateNUnitsAtLoc(1, 0x68303035, Player(0), udg_Point, bj_UNIT_FACING)
                                    call UnitApplyTimedLifeBJ(5.00, 0x42544C46, GetLastCreatedUnit())
                                    set udg_CO_UnitGroup = GetUnitsInRangeOfLocAll(450.00, udg_Point)
                                    call RemoveLocation(udg_Point)
                                    call ForGroupBJ(udg_CO_UnitGroup, function Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func003Func007A)
                                    call GroupClear(udg_CO_UnitGroup)
                                    call DestroyGroup(udg_CO_UnitGroup)
                                endif
                            else
                                if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func001C())then
                                    set udg_AbilityPower = ((GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct) * 20.00) / 100.00)
                                    if(Trig_Talisman_Use_Func002Func001Func001Func001Func001Func001Func001Func001Func002C())then
                                        call SetUnitManaBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_MANA, udg_Arct) - udg_AbilityPower))
                                        set udg_AbilityPower = (I2R(GetHeroStatBJ(bj_HEROSTAT_AGI, udg_Arct, true)) * 3.00)
                                        call UnitDamageTargetBJ(udg_Arct, GetSpellTargetUnit(), udg_AbilityPower, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC)
                                        call SetUnitLifeBJ(udg_Arct, (GetUnitStateSwap(UNIT_STATE_LIFE, udg_Arct) + udg_AbilityPower))
                                        call AddSpecialEffectTargetUnitBJ("origin", GetSpellTargetUnit(), "war3mapImported\\DarknessLeechTarget.mdx")
                                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                        call AddSpecialEffectTargetUnitBJ("origin", udg_Arct, "war3mapImported\\DarknessLeechTarget_Portrait.mdx")
                                        call DestroyEffectBJ(GetLastCreatedEffectBJ())
                                    endif
                                endif
                            endif
                        endif
                    endif
                endif
            endif
        endif
    endif
endfunction

function InitTrig_Talisman_Use takes nothing returns nothing
    set gg_trg_Talisman_Use = CreateTrigger()
    call DisableTrigger(gg_trg_Talisman_Use)
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Talisman_Use, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Talisman_Use, Condition(function Trig_Talisman_Use_Conditions))
    call TriggerAddAction(gg_trg_Talisman_Use, function Trig_Talisman_Use_Actions)
endfunction
