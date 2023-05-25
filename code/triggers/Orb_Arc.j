function Trig_Orb_Arc_Conditions takes nothing returns boolean
    return GetSpellAbilityId() == 0x4130334A
endfunction

function Trig_Orb_Arc_Actions takes nothing returns nothing
    set udg_JDA_JumpHigh_Distance = 0.60
    set udg_JDA_Collusion = true
    set udg_JDA_TargetPoint = GetSpellTargetLoc()
    set udg_JDA_Unit = GetTriggerUnit()
    set udg_JDA_Speed = 9.00
    set udg_JDA_Animation = "walk"
    set udg_JDA_AnimationSpeed = 0.60
    call ConditionalTriggerExecute(gg_trg_Orbs_System_1)
endfunction

function InitTrig_Orb_Arc takes nothing returns nothing
    set gg_trg_Orb_Arc = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Orb_Arc, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(gg_trg_Orb_Arc, Condition(function Trig_Orb_Arc_Conditions))
    call TriggerAddAction(gg_trg_Orb_Arc, function Trig_Orb_Arc_Actions)
endfunction