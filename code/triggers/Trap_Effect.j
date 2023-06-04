function Trig_Trap_Effect_Conditions takes nothing returns boolean
    return GetUnitTypeId(GetTriggerUnit()) == 0x68303039 and GetSpellAbilityId() == 0x4130344C
endfunction

function Trig_Trap_Effect_Actions takes nothing returns nothing
    set udg_Point = GetUnitLoc(GetTriggerUnit())
    call AddSpecialEffectLocBJ(udg_Point, "war3mapImported\\Thunder Slam.mdx")
    call DestroyEffect(GetLastCreatedEffectBJ())
    call RemoveLocation(udg_Point)
endfunction

function InitTrig_Trap_Effect takes nothing returns nothing
    set gg_trg_Trap_Effect = CreateTrigger()
    call TriggerRegisterPlayerUnitEventSimple(gg_trg_Trap_Effect, Player(11), EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Trap_Effect, Condition(function Trig_Trap_Effect_Conditions))
    call TriggerAddAction(gg_trg_Trap_Effect, function Trig_Trap_Effect_Actions)
endfunction