function Trig_Effect_4_Vampirism_Conditions takes nothing returns boolean
    return not udg_DamageEventOverride and udg_DamageEventSource == ArctUnit
endfunction

function Trig_Effect_4_Vampirism_Actions takes nothing returns nothing
    set udg_AbilityPower = (udg_DamageEventAmount * 0.30)
    set udg_AbilityPower = (udg_AbilityPower + I2R(udg_CO_Combo))
    if udg_AbilityPower > 1.00 then
        call SetUnitLifeBJ(ArctUnit, (GetUnitStateSwap(UNIT_STATE_LIFE, ArctUnit) + udg_AbilityPower))
        call CreateTextTagUnitBJ(("+" + I2S(R2I(udg_AbilityPower))), ArctUnit, 0, 7.50, 0.00, 100.00, 0.00, 0)
        call SetTextTagVelocityBJ(GetLastCreatedTextTag(), 90.00, GetRandomReal(80.00, 100.00))
        call SetTextTagPermanentBJ(GetLastCreatedTextTag(), false)
        call SetTextTagLifespanBJ(GetLastCreatedTextTag(), 0.70)
        call SetTextTagFadepointBJ(GetLastCreatedTextTag(), 0.40)
    endif
endfunction

function InitTrig_Effect_4_Vampirism takes nothing returns nothing
    set gg_trg_Effect_4_Vampirism = CreateTrigger()
    call DisableTrigger(gg_trg_Effect_4_Vampirism)
    call TriggerRegisterVariableEvent(gg_trg_Effect_4_Vampirism, "udg_DamageModifierEvent", EQUAL, 1.00)
    call TriggerAddCondition(gg_trg_Effect_4_Vampirism, Condition(function Trig_Effect_4_Vampirism_Conditions))
    call TriggerAddAction(gg_trg_Effect_4_Vampirism, function Trig_Effect_4_Vampirism_Actions)
endfunction
