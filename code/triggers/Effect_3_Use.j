function Trig_Effect_3_Use_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x4130334B
endfunction

function Trig_Effect_3_Use_Actions takes nothing returns nothing
    call UnitRemoveAbilityBJ(0x4130334B, ArctUnit)
    set udg_Point = GetUnitLoc(ArctUnit)
    call CreateNUnitsAtLoc(1, 0x68303039, Player(0), udg_Point, bj_UNIT_FACING)
    call RemoveLocation(udg_Point)
    call UnitAddAbilityBJ(0x41303338, GetLastCreatedUnit())
    call SetUnitAbilityLevelSwapped(0x41303338, GetLastCreatedUnit(), udg_AS_AbilityLVL[3])
    call UnitApplyTimedLifeBJ(1.00, 0x42544C46, GetLastCreatedUnit())
    call IssueTargetOrderBJ(GetLastCreatedUnit(), "invisibility", ArctUnit)
    call AddSpecialEffectTargetUnitBJ("chest", ArctUnit, "Abilities\\Spells\\Human\\Polymorph\\PolyMorphTarget.mdl")
    call DestroyEffectBJ(GetLastCreatedEffectBJ())
endfunction

function InitTrig_Effect_3_Use takes nothing returns nothing
    set gg_trg_Effect_3_Use = CreateTrigger()
    call TriggerRegisterPlayerUnitEventSimple(gg_trg_Effect_3_Use, Player(0), EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Effect_3_Use, Condition(function Trig_Effect_3_Use_Conditions))
    call TriggerAddAction(gg_trg_Effect_3_Use, function Trig_Effect_3_Use_Actions)
endfunction