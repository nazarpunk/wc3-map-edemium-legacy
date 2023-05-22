
function Trig_Trap_Periodic_Explosion_Conditions takes nothing returns boolean
    if(not(GetUnitTypeId(GetTriggerUnit()) == 0x68303057))then
        return false
    endif
    return true
endfunction
function Trig_Trap_Periodic_Explosion_Func002Func001Func005Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return false
    endif
    return true
endfunction
function Trig_Trap_Periodic_Explosion_Func002Func001Func005A takes nothing returns nothing
    if(Trig_Trap_Periodic_Explosion_Func002Func001Func005Func001C())then
        set udg_AbilityPower = GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_Arct)
        set udg_AbilityPower = (udg_AbilityPower / 3.00)
        call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
    else
    endif
endfunction
function Trig_Trap_Periodic_Explosion_Func002Func001C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303051))then
        return false
    endif
    return true
endfunction
function Trig_Trap_Periodic_Explosion_Func002Func006Func001C takes nothing returns boolean
    if(not(GetOwningPlayer(GetEnumUnit()) == Player(0)))then
        return false
    endif
    return true
endfunction
function Trig_Trap_Periodic_Explosion_Func002Func006A takes nothing returns nothing
    if(Trig_Trap_Periodic_Explosion_Func002Func006Func001C())then
        set udg_AbilityPower = GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct)
        set udg_AbilityPower = (udg_AbilityPower / 3.00)
        call SetUnitManaBJ(GetEnumUnit(), (GetUnitStateSwap(UNIT_STATE_MANA, GetEnumUnit()) - udg_AbilityPower))
    else
    endif
endfunction
function Trig_Trap_Periodic_Explosion_Func002C takes nothing returns boolean
    if(not(GetSpellAbilityId() == 0x41303052))then
        return false
    endif
    return true
endfunction
function Trig_Trap_Periodic_Explosion_Actions takes nothing returns nothing
    if(Trig_Trap_Periodic_Explosion_Func002C())then
        set udg_Point = GetUnitLoc(GetTriggerUnit())
        set udg_UnitGroup = GetUnitsInRangeOfLocAll(380.00, udg_Point)
        call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Ground Slam Blue.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call ForGroupBJ(udg_UnitGroup, function Trig_Trap_Periodic_Explosion_Func002Func006A)
        call DestroyGroup(udg_UnitGroup)
        call RemoveLocation(udg_Point)
    else
        if(Trig_Trap_Periodic_Explosion_Func002Func001C())then
            set udg_Point = GetUnitLoc(GetTriggerUnit())
            set udg_UnitGroup = GetUnitsInRangeOfLocAll(380.00, udg_Point)
            call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Ground Slam Fire.mdx")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
            call ForGroupBJ(udg_UnitGroup, function Trig_Trap_Periodic_Explosion_Func002Func001Func005A)
            call DestroyGroup(udg_UnitGroup)
            call RemoveLocation(udg_Point)
        else
        endif
    endif
endfunction
function InitTrig_Trap_Periodic_Explosion takes nothing returns nothing
    set gg_trg_Trap_Periodic_Explosion = CreateTrigger()
    call TriggerRegisterPlayerUnitEventSimple(gg_trg_Trap_Periodic_Explosion, Player(1), EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Trap_Periodic_Explosion, Condition(function Trig_Trap_Periodic_Explosion_Conditions))
    call TriggerAddAction(gg_trg_Trap_Periodic_Explosion, function Trig_Trap_Periodic_Explosion_Actions)
endfunction