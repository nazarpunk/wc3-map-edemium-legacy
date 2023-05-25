function Trig_Trap_Periodic_Explosion_Conditions takes nothing returns boolean
    return GetUnitTypeId(GetTriggerUnit()) == 0x68303057
endfunction

function Trig_Trap_Periodic_Explosion_Func002Func001Func005A takes nothing returns nothing
    if GetOwningPlayer(GetEnumUnit()) == Player(0) then
        set udg_AbilityPower = GetUnitStateSwap(UNIT_STATE_MAX_LIFE, udg_Arct)
        set udg_AbilityPower = (udg_AbilityPower / 3.00)
        call UnitDamageTargetBJ(GetTriggerUnit(), GetEnumUnit(), udg_AbilityPower, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL)
    endif
endfunction

function Trig_Trap_Periodic_Explosion_Func002Func006A takes nothing returns nothing
    if GetOwningPlayer(GetEnumUnit()) == Player(0) then
        set udg_AbilityPower = GetUnitStateSwap(UNIT_STATE_MAX_MANA, udg_Arct)
        set udg_AbilityPower = (udg_AbilityPower / 3.00)
        call SetUnitManaBJ(GetEnumUnit(), (GetUnitStateSwap(UNIT_STATE_MANA, GetEnumUnit()) - udg_AbilityPower))
    endif
endfunction

function Trig_Trap_Periodic_Explosion_Actions takes nothing returns nothing
    if GetSpellAbilityId() == 0x41303052 then
        set udg_Point = GetUnitLoc(GetTriggerUnit())
        set udg_UnitGroup = GetUnitsInRangeOfLocAll(380.00, udg_Point)
        call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Ground Slam Blue.mdx")
        call DestroyEffectBJ(GetLastCreatedEffectBJ())
        call ForGroupBJ(udg_UnitGroup, function Trig_Trap_Periodic_Explosion_Func002Func006A)
        call DestroyGroup(udg_UnitGroup)
        call RemoveLocation(udg_Point)
    else
        if GetSpellAbilityId() == 0x41303051 then
            set udg_Point = GetUnitLoc(GetTriggerUnit())
            set udg_UnitGroup = GetUnitsInRangeOfLocAll(380.00, udg_Point)
            call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Ground Slam Fire.mdx")
            call DestroyEffectBJ(GetLastCreatedEffectBJ())
            call ForGroupBJ(udg_UnitGroup, function Trig_Trap_Periodic_Explosion_Func002Func001Func005A)
            call DestroyGroup(udg_UnitGroup)
            call RemoveLocation(udg_Point)
        endif
    endif
endfunction

function InitTrig_Trap_Periodic_Explosion takes nothing returns nothing
    set gg_trg_Trap_Periodic_Explosion = CreateTrigger()
    call TriggerRegisterPlayerUnitEventSimple(gg_trg_Trap_Periodic_Explosion, Player(1), EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Trap_Periodic_Explosion, Condition(function Trig_Trap_Periodic_Explosion_Conditions))
    call TriggerAddAction(gg_trg_Trap_Periodic_Explosion, function Trig_Trap_Periodic_Explosion_Actions)
endfunction
